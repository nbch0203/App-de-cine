using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
using Cine_app.Modelos;
using Cine_app.Services;
using Cine_app.Servicios;

namespace Cine_app.Views
{
    public partial class PerfilUsuarioWindow : Window
    {
        private readonly ServicioBaseDeDatos _dbService;
        private Usuario? _usuario;

        public PerfilUsuarioWindow()
        {
            InitializeComponent();
            _dbService = new ServicioBaseDeDatos();
            
            _usuario = ServicioSesion.Instance.UsuarioActual;
            
            if (_usuario != null)
            {
                CargarInformacionUsuario();
            }
        }

        private void CargarInformacionUsuario()
        {
            if (_usuario == null) return;

            txtNombreUsuarioMenu.Text = _usuario.NombreCompleto;
            txtNombre.Text = _usuario.Nombre;
            txtApellidos.Text = _usuario.Apellidos;
            txtEmail.Text = _usuario.Email;
            txtTelefono.Text = string.IsNullOrEmpty(_usuario.Telefono) ? "No especificado" : _usuario.Telefono;
            
            if (string.IsNullOrEmpty(_usuario.Telefono))
            {
                txtTelefono.Foreground = new SolidColorBrush(Color.FromRgb(0x99, 0x99, 0x99));
            }
            else
            {
                txtTelefono.Foreground = new SolidColorBrush(Color.FromRgb(0x00, 0x00, 0x00));
            }
        }

        private void BtnMenuInformacion_Click(object sender, RoutedEventArgs e)
        {
            // Cambiar visibilidad de paneles
            panelInformacion.Visibility = Visibility.Visible;
            panelReservas.Visibility = Visibility.Collapsed;

            // Actualizar estilos de botones
            btnMenuInformacion.Style = (Style)FindResource("MenuButtonActiveStyle");
            btnMenuReservas.Style = (Style)FindResource("MenuButtonStyle");
        }

        private async void BtnMenuReservas_Click(object sender, RoutedEventArgs e)
        {
            // Cambiar visibilidad de paneles
            panelInformacion.Visibility = Visibility.Collapsed;
            panelReservas.Visibility = Visibility.Visible;

            // Actualizar estilos de botones
            btnMenuInformacion.Style = (Style)FindResource("MenuButtonStyle");
            btnMenuReservas.Style = (Style)FindResource("MenuButtonActiveStyle");

            // Cargar reservas
            await CargarReservas();
        }

        private async Task CargarReservas()
        {
            if (_usuario == null)
            {
                MessageBox.Show("Usuario no autenticado", "Error", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            try
            {
                pnlLoadingReservas.Visibility = Visibility.Visible;
                itemsReservas.Visibility = Visibility.Collapsed;
                pnlSinReservas.Visibility = Visibility.Collapsed;

                List<Reserva> reservas = null;
                
                try
                {
                    reservas = await _dbService.ObtenerReservasPorUsuarioAsync(_usuario.Id);
                }
                catch (Exception dbEx)
                {
                    throw new Exception($"Error al obtener reservas de la base de datos: {dbEx.Message}", dbEx);
                }

                if (reservas == null)
                {
                    pnlSinReservas.Visibility = Visibility.Visible;
                    return;
                }

                if (!reservas.Any())
                {
                    pnlSinReservas.Visibility = Visibility.Visible;
                    return;
                }

                // Crear una lista con información formateada usando la clase ReservaViewModel
                var reservasFormateadas = new List<ReservaViewModel>();
                
                foreach (var r in reservas)
                {
                    try
                    {
                        if (r == null)
                        {
                            continue;
                        }

                        if (r.Sesion == null)
                        {
                            MessageBox.Show($"Reserva {r.Id} no tiene sesión asociada", "Advertencia", MessageBoxButton.OK, MessageBoxImage.Warning);
                            continue;
                        }

                        if (r.Sesion.Pelicula == null)
                        {
                            MessageBox.Show($"Sesión {r.Sesion.Id} no tiene película asociada", "Advertencia", MessageBoxButton.OK, MessageBoxImage.Warning);
                            continue;
                        }

                        if (r.Sesion.Sala == null)
                        {
                            MessageBox.Show($"Sesión {r.Sesion.Id} no tiene sala asociada", "Advertencia", MessageBoxButton.OK, MessageBoxImage.Warning);
                            continue;
                        }

                        string butacasTexto = "N/A";
                        
                        if (r.Butacas != null && r.Butacas.Any())
                        {
                            var butacasValidas = r.Butacas.Where(b => b?.Butaca != null).ToList();
                            
                            if (butacasValidas.Any())
                            {
                                butacasTexto = string.Join(", ", butacasValidas
                                    .OrderBy(b => b.Butaca.Fila)
                                    .ThenBy(b => b.Butaca.Columna)
                                    .Select(b => $"{(char)('A' + b.Butaca.Fila - 1)}{b.Butaca.Columna}"));
                            }
                        }

                        reservasFormateadas.Add(new ReservaViewModel
                        {
                            Sesion = r.Sesion,
                            Total = r.Total,
                            CodigoReserva = r.CodigoReserva ?? "N/A",
                            Butacas = butacasTexto
                        });
                    }
                    catch (Exception formatEx)
                    {
                        MessageBox.Show($"Error al formatear reserva: {formatEx.Message}", "Error", MessageBoxButton.OK, MessageBoxImage.Warning);
                    }
                }

                if (reservasFormateadas.Any())
                {
                    itemsReservas.ItemsSource = reservasFormateadas;
                    itemsReservas.Visibility = Visibility.Visible;
                }
                else
                {
                    pnlSinReservas.Visibility = Visibility.Visible;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(
                    $"Error al cargar las reservas:\n\n{ex.Message}\n\n" +
                    $"Tipo: {ex.GetType().Name}\n\n" +
                    $"Stack Trace:\n{ex.StackTrace}\n\n" +
                    $"{(ex.InnerException != null ? $"Inner Exception:\n{ex.InnerException.Message}\n{ex.InnerException.StackTrace}" : "")}",
                    "Error",
                    MessageBoxButton.OK,
                    MessageBoxImage.Error);
                pnlSinReservas.Visibility = Visibility.Visible;
            }
            finally
            {
                pnlLoadingReservas.Visibility = Visibility.Collapsed;
            }
        }

        private async void BtnCambiarPassword_Click(object sender, RoutedEventArgs e)
        {
            if (_usuario == null) return;

            // Ocultar mensaje previo
            txtMensajePassword.Visibility = Visibility.Collapsed;

            // Validar campos
            if (string.IsNullOrWhiteSpace(txtPasswordActual.Password))
            {
                MostrarMensajePassword("Por favor, ingrese su contraseña actual", true);
                txtPasswordActual.Focus();
                return;
            }

            if (string.IsNullOrWhiteSpace(txtNuevaPassword.Password))
            {
                MostrarMensajePassword("Por favor, ingrese la nueva contraseña", true);
                txtNuevaPassword.Focus();
                return;
            }

            if (txtNuevaPassword.Password.Length < 6)
            {
                MostrarMensajePassword("La nueva contraseña debe tener al menos 6 caracteres", true);
                txtNuevaPassword.Focus();
                return;
            }

            if (string.IsNullOrWhiteSpace(txtConfirmarPassword.Password))
            {
                MostrarMensajePassword("Por favor, confirme la nueva contraseña", true);
                txtConfirmarPassword.Focus();
                return;
            }

            if (txtNuevaPassword.Password != txtConfirmarPassword.Password)
            {
                MostrarMensajePassword("Las contraseñas no coinciden", true);
                txtConfirmarPassword.Focus();
                return;
            }

            // Verificar contraseña actual
            if (txtPasswordActual.Password != _usuario.Password)
            {
                MostrarMensajePassword("La contraseña actual es incorrecta", true);
                txtPasswordActual.Focus();
                return;
            }

            // Deshabilitar botón durante el proceso
            btnCambiarPassword.IsEnabled = false;
            btnCambiarPassword.Content = "Cambiando...";

            try
            {
                // Actualizar contraseña en la base de datos
                bool actualizado = await _dbService.ActualizarPasswordAsync(_usuario.Id, txtNuevaPassword.Password);

                if (actualizado)
                {
                    // Actualizar en memoria
                    _usuario.Password = txtNuevaPassword.Password;
                    
                    MostrarMensajePassword("? Contraseña cambiada exitosamente", false);
                    
                    // Limpiar campos
                    txtPasswordActual.Password = "";
                    txtNuevaPassword.Password = "";
                    txtConfirmarPassword.Password = "";
                }
                else
                {
                    MostrarMensajePassword("Error al actualizar la contraseña. Intente nuevamente.", true);
                }
            }
            catch (Exception ex)
            {
                MostrarMensajePassword($"Error: {ex.Message}", true);
            }
            finally
            {
                btnCambiarPassword.IsEnabled = true;
                btnCambiarPassword.Content = "Cambiar Contraseña";
            }
        }

        private void MostrarMensajePassword(string mensaje, bool esError)
        {
            txtMensajePassword.Text = mensaje;
            txtMensajePassword.Foreground = esError ? 
                new SolidColorBrush(Color.FromRgb(0xe9, 0x45, 0x60)) : 
                new SolidColorBrush(Color.FromRgb(0x4C, 0xAF, 0x50));
            txtMensajePassword.Visibility = Visibility.Visible;
        }

        private void BtnVolver_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}

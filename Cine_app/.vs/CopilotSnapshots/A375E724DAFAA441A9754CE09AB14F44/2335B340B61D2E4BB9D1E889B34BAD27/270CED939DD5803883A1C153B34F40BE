using System.Windows;
using System.Windows.Input;
using Cine_app.Models;
using Cine_app.Services;
using Cine_app.Servicios;

namespace Cine_app.Views
{
    public partial class CarteleraWindow : Window
    {
        private readonly ServicioBaseDeDatos _dbService;

        public CarteleraWindow()
        {
            InitializeComponent();
            _dbService = new ServicioBaseDeDatos();

            Loaded += CarteleraWindow_Loaded;
            ActualizarEstadoUsuario();
        }

        private async void CarteleraWindow_Loaded(object sender, RoutedEventArgs e)
        {
            await CargarPeliculas();
        }

        private void ActualizarEstadoUsuario()
        {
            if (ServicioSesion.Instance.EstaAutenticado)
            {
                var usuario = ServicioSesion.Instance.UsuarioActual;
                txtUsuario.Text = $"👤 {usuario?.Nombre}";
                btnCuentaAccion.Content = "Cerrar Sesión";
            }
            else
            {
                txtUsuario.Text = "👤 Invitado";
                btnCuentaAccion.Content = "Iniciar Sesión";
            }
        }

        private async Task CargarPeliculas()
        {
            try
            {
                pnlLoading.Visibility = Visibility.Visible;
                scrollPeliculas.Visibility = Visibility.Collapsed;
                pnlSinPeliculas.Visibility = Visibility.Collapsed;

                var peliculas = await _dbService.ObtenerPeliculasActivasAsync();

                if (peliculas.Any())
                {
                    itemsPeliculas.ItemsSource = peliculas;
                    scrollPeliculas.Visibility = Visibility.Visible;
                }
                else
                {
                    pnlSinPeliculas.Visibility = Visibility.Visible;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error al cargar películas: {ex.Message}",
                              "Error",
                              MessageBoxButton.OK,
                              MessageBoxImage.Error);
                pnlSinPeliculas.Visibility = Visibility.Visible;
            }
            finally
            {
                pnlLoading.Visibility = Visibility.Collapsed;
            }
        }

        private void Pelicula_Click(object sender, MouseButtonEventArgs e)
        {
            if (sender is FrameworkElement element && element.Tag is int peliculaId)
            {
                AbrirReserva(peliculaId);
            }
        }

        private void BtnVerHorarios_Click(object sender, RoutedEventArgs e)
        {
            if (sender is FrameworkElement element && element.Tag is int peliculaId)
            {
                AbrirReserva(peliculaId);
            }
        }

        private void AbrirReserva(int peliculaId)
        {
            // Verificar si el usuario está autenticado
            if (!ServicioSesion.Instance.EstaAutenticado)
            {
                var result = MessageBox.Show(
                    "Debes iniciar sesión para poder reservar entradas.\n\n¿Deseas iniciar sesión ahora?",
                    "Iniciar Sesión Requerido",
                    MessageBoxButton.YesNo,
                    MessageBoxImage.Information);

                if (result == MessageBoxResult.Yes)
                {
                    var loginWindow = new LoginWindow();
                    loginWindow.ShowDialog();

                    // Si después del login el usuario está autenticado, continuar
                    if (ServicioSesion.Instance.EstaAutenticado)
                    {
                        ActualizarEstadoUsuario();
                        AbrirVentanaSeleccionSesion(peliculaId);
                    }
                }
                return;
            }

            // Usuario autenticado, abrir ventana de selección de sesión
            AbrirVentanaSeleccionSesion(peliculaId);
        }

        private void AbrirVentanaSeleccionSesion(int peliculaId)
        {
            // Obtener la película seleccionada
            var pelicula = (itemsPeliculas.ItemsSource as List<Pelicula>)?.FirstOrDefault(p => p.Id == peliculaId);

            if (pelicula != null)
            {
                var seleccionSesionWindow = new SeleccionSesionWindow(pelicula);
                seleccionSesionWindow.ShowDialog();
            }
        }

        private void BtnCuentaAccion_Click(object sender, RoutedEventArgs e)
        {
            if (ServicioSesion.Instance.EstaAutenticado)
            {
                // Cerrar sesión
                var result = MessageBox.Show(
                    "¿Estás seguro de que deseas cerrar sesión?",
                    "Cerrar Sesión",
                    MessageBoxButton.YesNo,
                    MessageBoxImage.Question);

                if (result == MessageBoxResult.Yes)
                {
                    ServicioSesion.Instance.CerrarSesion();
                    ActualizarEstadoUsuario();
                    MessageBox.Show("Sesión cerrada correctamente", "Cerrar Sesión", MessageBoxButton.OK, MessageBoxImage.Information);
                }
            }
            else
            {
                // Iniciar sesión
                var loginWindow = new LoginWindow();
                loginWindow.ShowDialog();
                ActualizarEstadoUsuario();
            }
        }


    }
}
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
using Cine_app.Modelos;
using Cine_app.Models;
using Cine_app.Services;
using Cine_app.Servicios;

namespace Cine_app.Views
{
    public partial class SeleccionButacasWindow : Window
    {
        private readonly ServicioBaseDeDatos _dbService;
        private readonly Sesion _sesion;
        private readonly Pelicula _pelicula;
        private List<Butaca> _todasLasButacas = new();
        private List<int> _butacasOcupadas = new();
        private List<Butaca> _butacasSeleccionadas = new();

        public SeleccionButacasWindow(Sesion sesion, Pelicula pelicula)
        {
            InitializeComponent();
            _dbService = new ServicioBaseDeDatos();
            _sesion = sesion;
            _pelicula = pelicula;

            CargarInformacion();
            Loaded += async (s, e) => await CargarButacas();
        }

        private void CargarInformacion()
        {
            txtTituloPelicula.Text = _pelicula.Titulo;
            txtInfoSesion.Text = $"{_sesion.FechaHora:dddd, dd MMMM yyyy - HH:mm} • {_sesion.Sala?.Nombre} • €{_sesion.Precio:F2}";
            txtPrecioUnitario.Text = $"€{_sesion.Precio:F2}";
        }

        private async Task CargarButacas()
        {
            try
            {
                pnlLoading.Visibility = Visibility.Visible;
                itemsButacas.Visibility = Visibility.Collapsed;

                // Cargar butacas de la sala
                _todasLasButacas = await _dbService.ObtenerButacasPorSalaAsync(_sesion.SalaId);
                
                // Cargar butacas ya reservadas para esta sesión
                _butacasOcupadas = await _dbService.ObtenerButacasReservadasAsync(_sesion.Id);

                // Crear visualización de butacas
                CrearVisualizacionButacas();

                itemsButacas.Visibility = Visibility.Visible;
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error al cargar las butacas: {ex.Message}",
                              "Error",
                              MessageBoxButton.OK,
                              MessageBoxImage.Error);
                this.Close();
            }
            finally
            {
                pnlLoading.Visibility = Visibility.Collapsed;
            }
        }

        private void CrearVisualizacionButacas()
        {
            if (_sesion.Sala == null) return;

            var filas = _sesion.Sala.Filas;
            var columnas = _sesion.Sala.ColumnasPerFila;

            var panelPrincipal = new StackPanel();

            for (int fila = 1; fila <= filas; fila++)
            {
                var panelFila = new StackPanel
                {
                    Orientation = Orientation.Horizontal,
                    HorizontalAlignment = HorizontalAlignment.Center,
                    Margin = new Thickness(0, 2, 0, 2)
                };

                // Etiqueta de fila
                var lblFila = new TextBlock
                {
                    Text = $"{(char)('A' + fila - 1)}",
                    Width = 30,
                    FontWeight = FontWeights.Bold,
                    VerticalAlignment = VerticalAlignment.Center,
                    HorizontalAlignment = HorizontalAlignment.Center,
                    Foreground = new SolidColorBrush(Color.FromRgb(0x66, 0x66, 0x66))
                };
                panelFila.Children.Add(lblFila);

                for (int columna = 1; columna <= columnas; columna++)
                {
                    var butaca = _todasLasButacas.FirstOrDefault(b => b.Fila == fila && b.Columna == columna);

                    if (butaca != null)
                    {
                        var btnButaca = CrearBotonButaca(butaca);
                        panelFila.Children.Add(btnButaca);
                    }
                }

                panelPrincipal.Children.Add(panelFila);
            }

            itemsButacas.ItemsSource = new[] { panelPrincipal };
        }

        private Button CrearBotonButaca(Butaca butaca)
        {
            var btn = new Button
            {
                Content = butaca.Columna.ToString(),
                Tag = butaca,
                Width = 45,
                Height = 45,
                Margin = new Thickness(3),
                FontWeight = FontWeights.Bold,
                FontSize = 12
            };

            // Verificar si la butaca está ocupada
            bool estaOcupada = _butacasOcupadas.Contains(butaca.Id);

            if (estaOcupada)
            {
                btn.Style = (Style)FindResource("ButacaOcupadaStyle");
            }
            else
            {
                // Asignar estilo según el tipo de butaca
                switch (butaca.Tipo)
                {
                    case "VIP":
                        btn.Style = (Style)FindResource("ButacaVIPStyle");
                        break;
                    case "Discapacitado":
                        btn.Style = (Style)FindResource("ButacaDiscapacitadoStyle");
                        break;
                    default:
                        btn.Style = (Style)FindResource("ButacaNormalStyle");
                        break;
                }

                btn.Click += BtnButaca_Click;
            }

            return btn;
        }

        private void BtnButaca_Click(object sender, RoutedEventArgs e)
        {
            if (sender is Button btn && btn.Tag is Butaca butaca)
            {
                if (_butacasSeleccionadas.Contains(butaca))
                {
                    // Deseleccionar
                    _butacasSeleccionadas.Remove(butaca);
                    
                    // Restaurar estilo original
                    switch (butaca.Tipo)
                    {
                        case "VIP":
                            btn.Style = (Style)FindResource("ButacaVIPStyle");
                            break;
                        case "Discapacitado":
                            btn.Style = (Style)FindResource("ButacaDiscapacitadoStyle");
                            break;
                        default:
                            btn.Style = (Style)FindResource("ButacaNormalStyle");
                            break;
                    }
                }
                else
                {
                    // Seleccionar
                    _butacasSeleccionadas.Add(butaca);
                    btn.Style = (Style)FindResource("ButacaSeleccionadaStyle");
                }

                ActualizarResumen();
            }
        }

        private void ActualizarResumen()
        {
            if (_butacasSeleccionadas.Count == 0)
            {
                txtButacasSeleccionadas.Text = "Ninguna";
                txtCantidad.Text = "0 butacas";
                txtTotal.Text = "€0.00";
                btnConfirmarReserva.IsEnabled = false;
            }
            else
            {
                // Lista de butacas seleccionadas
                var butacasTexto = string.Join(", ", _butacasSeleccionadas
                    .OrderBy(b => b.Fila)
                    .ThenBy(b => b.Columna)
                    .Select(b => b.Identificador));
                txtButacasSeleccionadas.Text = butacasTexto;

                // Cantidad
                txtCantidad.Text = $"{_butacasSeleccionadas.Count} butaca{(_butacasSeleccionadas.Count > 1 ? "s" : "")}";

                // Total
                decimal total = _butacasSeleccionadas.Count * _sesion.Precio;
                txtTotal.Text = $"€{total:F2}";

                btnConfirmarReserva.IsEnabled = true;
            }
        }

        private async void BtnConfirmarReserva_Click(object sender, RoutedEventArgs e)
        {
            if (_butacasSeleccionadas.Count == 0)
            {
                MessageBox.Show("Por favor, seleccione al menos una butaca.",
                              "Selección requerida",
                              MessageBoxButton.OK,
                              MessageBoxImage.Warning);
                return;
            }

            // Verificar autenticación
            if (!ServicioSesion.Instance.EstaAutenticado)
            {
                MessageBox.Show("Debe iniciar sesión para completar la reserva.",
                              "Sesión requerida",
                              MessageBoxButton.OK,
                              MessageBoxImage.Warning);
                return;
            }

            var resultado = MessageBox.Show(
                $"¿Confirmar reserva de {_butacasSeleccionadas.Count} butaca{(_butacasSeleccionadas.Count > 1 ? "s" : "")}?\n\n" +
                $"Butacas: {txtButacasSeleccionadas.Text}\n" +
                $"Total: {txtTotal.Text}\n\n" +
                $"Esta acción simulará el pago y guardará la reserva.",
                "Confirmar Reserva",
                MessageBoxButton.YesNo,
                MessageBoxImage.Question);

            if (resultado == MessageBoxResult.Yes)
            {
                await ProcesarReserva();
            }
        }

        private async Task ProcesarReserva()
        {
            try
            {
                btnConfirmarReserva.IsEnabled = false;
                btnConfirmarReserva.Content = "Procesando...";

                // Calcular total
                decimal total = _butacasSeleccionadas.Count * _sesion.Precio;

                // Crear reserva
                var reserva = new Reserva
                {
                    UsuarioId = ServicioSesion.Instance.UsuarioActual!.Id,
                    SesionId = _sesion.Id,
                    Total = total,
                    FechaReserva = DateTime.Now,
                    Estado = "Confirmada"
                };

                // Obtener IDs de butacas seleccionadas
                var butacaIds = _butacasSeleccionadas.Select(b => b.Id).ToList();

                // Guardar en base de datos
                int reservaId = await _dbService.CrearReservaAsync(reserva, butacaIds);

                MessageBox.Show(
                    $"¡Reserva confirmada exitosamente!\n\n" +
                    $"Película: {_pelicula.Titulo}\n" +
                    $"Fecha/Hora: {_sesion.FechaHora:dd/MM/yyyy HH:mm}\n" +
                    $"Sala: {_sesion.Sala?.Nombre}\n" +
                    $"Butacas: {txtButacasSeleccionadas.Text}\n" +
                    $"Total: {txtTotal.Text}\n\n" +
                    $"Disfrute de la función!",
                    "Reserva Confirmada",
                    MessageBoxButton.OK,
                    MessageBoxImage.Information);

                this.DialogResult = true;
                this.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(
                    $"Error al procesar la reserva:\n{ex.Message}\n\n" +
                    $"Por favor, intente nuevamente.",
                    "Error",
                    MessageBoxButton.OK,
                    MessageBoxImage.Error);

                btnConfirmarReserva.IsEnabled = true;
                btnConfirmarReserva.Content = "Confirmar Reserva";
            }
        }

        private void BtnCerrar_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
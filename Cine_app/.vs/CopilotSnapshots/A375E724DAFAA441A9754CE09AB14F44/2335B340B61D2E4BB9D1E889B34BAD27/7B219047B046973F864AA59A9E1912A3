using Cine_app.Modelos;
using Cine_app.Models;
using Cine_app.Services;
using System.Windows;

namespace Cine_app.Views
{
    public partial class SeleccionSesionWindow : Window
    {
        private readonly ServicioBaseDeDatos _dbService;
        private readonly Pelicula _pelicula;

        public SeleccionSesionWindow(Pelicula pelicula)
        {
            InitializeComponent();
            _dbService = new ServicioBaseDeDatos();
            _pelicula = pelicula;

            CargarInfoPelicula();
            calendario.DisplayDateStart = DateTime.Today;
            calendario.SelectedDate = DateTime.Today;
        }

        private void CargarInfoPelicula()
        {
            txtTitulo.Text = _pelicula.Titulo;

            var info = $"{_pelicula.Genero}";
            if (_pelicula.Duracion.HasValue)
                info += $" • {_pelicula.Duracion} min";
            if (!string.IsNullOrEmpty(_pelicula.Director))
                info += $" • {_pelicula.Director}";

            txtInfo.Text = info;

            if (!string.IsNullOrEmpty(_pelicula.ImagenUrl))
            {
                imgPelicula.Source = new System.Windows.Media.Imaging.BitmapImage(
                    new Uri(_pelicula.ImagenUrl, UriKind.RelativeOrAbsolute));
            }
        }

        private async void Calendario_SelectedDatesChanged(object sender, System.Windows.Controls.SelectionChangedEventArgs e)
        {
            if (calendario.SelectedDate.HasValue)
            {
                await CargarSesiones(calendario.SelectedDate.Value);
            }
        }

        private async Task CargarSesiones(DateTime fecha)
        {
            try
            {
                pnlLoadingSesiones.Visibility = Visibility.Visible;
                scrollSesiones.Visibility = Visibility.Collapsed;
                pnlSinSesiones.Visibility = Visibility.Collapsed;

                var sesiones = await _dbService.ObtenerSesionesPorPeliculaAsync(_pelicula.Id, fecha);

                if (sesiones.Any())
                {
                    itemsSesiones.ItemsSource = sesiones;
                    scrollSesiones.Visibility = Visibility.Visible;
                }
                else
                {
                    pnlSinSesiones.Visibility = Visibility.Visible;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error al cargar sesiones: {ex.Message}",
                              "Error",
                              MessageBoxButton.OK,
                              MessageBoxImage.Error);
                pnlSinSesiones.Visibility = Visibility.Visible;
            }
            finally
            {
                pnlLoadingSesiones.Visibility = Visibility.Collapsed;
            }
        }

        private void BtnSeleccionarSesion_Click(object sender, RoutedEventArgs e)
        {
            if (sender is FrameworkElement element && element.Tag is Sesion sesion)
            {
                // Abrir ventana de selección de butacas
                var seleccionButacasWindow = new SeleccionButacasWindow(sesion, _pelicula);
                seleccionButacasWindow.ShowDialog();

                // Si completó la reserva, cerrar esta ventana
                if (seleccionButacasWindow.DialogResult == true)
                {
                    this.Close();
                }
            }
        }

        private void BtnCerrar_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
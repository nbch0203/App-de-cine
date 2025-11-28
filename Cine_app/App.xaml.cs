using System.Windows;
using System.Globalization;
using System.Threading;
using Cine_app.Views;
using Cine_app.Modelos;

namespace Cine_app
{
    public partial class App : Application
    {
        public static Usuario? UsuarioActual { get; set; }

        public App()
        {
            // Manejar excepciones no controladas
            this.DispatcherUnhandledException += App_DispatcherUnhandledException;
            AppDomain.CurrentDomain.UnhandledException += CurrentDomain_UnhandledException;
        }

        private void Application_Startup(object sender, StartupEventArgs e)
        {
            // Establecer cultura española (España) para formato de moneda en euros
            var cultureInfo = new CultureInfo("es-ES");
            Thread.CurrentThread.CurrentCulture = cultureInfo;
            Thread.CurrentThread.CurrentUICulture = cultureInfo;
            CultureInfo.DefaultThreadCurrentCulture = cultureInfo;
            CultureInfo.DefaultThreadCurrentUICulture = cultureInfo;

            // Abrir directamente la ventana de cartelera
            var carteleraWindow = new CarteleraWindow();
            carteleraWindow.Show();
        }

        private void App_DispatcherUnhandledException(object sender, System.Windows.Threading.DispatcherUnhandledExceptionEventArgs e)
        {
            MessageBox.Show(
                $"Error no controlado:\n\n{e.Exception.Message}\n\nStack Trace:\n{e.Exception.StackTrace}",
                "Error Crítico",
                MessageBoxButton.OK,
                MessageBoxImage.Error);
            
            e.Handled = true;
        }

        private void CurrentDomain_UnhandledException(object sender, UnhandledExceptionEventArgs e)
        {
            if (e.ExceptionObject is Exception ex)
            {
                MessageBox.Show(
                    $"Error fatal:\n\n{ex.Message}\n\nStack Trace:\n{ex.StackTrace}",
                    "Error Fatal",
                    MessageBoxButton.OK,
                    MessageBoxImage.Error);
            }
        }
    }
}
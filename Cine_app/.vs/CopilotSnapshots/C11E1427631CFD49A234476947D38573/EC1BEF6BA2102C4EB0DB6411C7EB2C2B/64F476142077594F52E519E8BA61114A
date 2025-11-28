using System.Windows;
using Cine_app.Modelos;
using Cine_app.Models;
using Cine_app.Services;
using Cine_app.Servicios;

namespace Cine_app.Views
{
    public partial class LoginWindow : Window
    {
        private readonly ServicioBaseDeDatos _dbService;
        public Usuario? UsuarioAutenticado { get; private set; }

        public LoginWindow()
        {
            InitializeComponent();
            _dbService = new ServicioBaseDeDatos();
        }

        private async void BtnLogin_Click(object sender, RoutedEventArgs e)
        {
            // Ocultar mensaje de error previo
            txtError.Visibility = Visibility.Collapsed;
            txtError.Text = "";

            // Validar campos vacíos
            if (string.IsNullOrWhiteSpace(txtEmail.Text))
            {
                MostrarError("Por favor, ingrese su email");
                txtEmail.Focus();
                return;
            }

            if (string.IsNullOrWhiteSpace(txtPassword.Password))
            {
                MostrarError("Por favor, ingrese su contraseña");
                txtPassword.Focus();
                return;
            }

            // Deshabilitar botón mientras se valida
            btnLogin.IsEnabled = false;
            btnLogin.Content = "Validando...";

            try
            {
                // Validar usuario
                UsuarioAutenticado = await _dbService.ValidarUsuarioAsync(
                    txtEmail.Text.Trim(), 
                    txtPassword.Password
                );

                if (UsuarioAutenticado != null)
                {
                    // Login exitoso - guardar en el servicio de sesión
                    ServicioSesion.Instance.IniciarSesion(UsuarioAutenticado);
                    this.DialogResult = true;
                    this.Close();
                }
                else
                {
                    // Credenciales incorrectas
                    MostrarError("Email o contraseña incorrectos");
                    txtPassword.Password = "";
                    txtPassword.Focus();
                }
            }
            catch (Exception ex)
            {
                MostrarError($"Error al conectar con la base de datos: {ex.Message}");
            }
            finally
            {
                // Rehabilitar botón
                btnLogin.IsEnabled = true;
                btnLogin.Content = "Iniciar Sesión";
            }
        }

        private void BtnRegistro_Click(object sender, RoutedEventArgs e)
        {
            // Abrir ventana de registro
            var registroWindow = new RegistroWindow();
            bool? resultado = registroWindow.ShowDialog();

            // Si el registro fue exitoso, mostrar mensaje
            if (resultado == true)
            {
                txtError.Text = "✓ Registro completado. Por favor, inicie sesión con sus credenciales.";
                txtError.Foreground = System.Windows.Media.Brushes.Green;
                txtError.Visibility = Visibility.Visible;
                
                // Limpiar campos
                txtEmail.Text = "";
                txtPassword.Password = "";
                txtEmail.Focus();
            }
        }

        private void BtnInvitado_Click(object sender, RoutedEventArgs e)
        {
            // Cerrar sin autenticar
            this.DialogResult = false;
            this.Close();
        }

        private void MostrarError(string mensaje)
        {
            txtError.Text = mensaje;
            txtError.Visibility = Visibility.Visible;
        }

        // Permitir login con Enter
        private void TxtPassword_KeyDown(object sender, System.Windows.Input.KeyEventArgs e)
        {
            if (e.Key == System.Windows.Input.Key.Enter)
            {
                BtnLogin_Click(sender, e);
            }
        }
    }
}
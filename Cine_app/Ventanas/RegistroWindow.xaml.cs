using System.Windows;
using System.Text.RegularExpressions;
using Cine_app.Modelos;
using Cine_app.Services;

namespace Cine_app.Views
{
    public partial class RegistroWindow : Window
    {
        private readonly ServicioBaseDeDatos _dbService;

        public RegistroWindow()
        {
            InitializeComponent();
            _dbService = new ServicioBaseDeDatos();
        }

        private async void BtnRegistrar_Click(object sender, RoutedEventArgs e)
        {
            // Ocultar mensaje previo
            txtMensaje.Visibility = Visibility.Collapsed;

            // Validar campos
            if (!ValidarCampos())
            {
                return;
            }

            // Deshabilitar botón mientras se procesa
            btnRegistrar.IsEnabled = false;
            btnRegistrar.Content = "Registrando...";

            try
            {
                // Verificar si el email ya existe
                bool emailExiste = await _dbService.ExisteUsuarioAsync(txtEmail.Text.Trim());

                if (emailExiste)
                {
                    MostrarError("Este email ya está registrado. Por favor, use otro o inicie sesión.");
                    txtEmail.Focus();
                    return;
                }

                // Crear objeto Usuario
                var nuevoUsuario = new Usuario
                {
                    Nombre = txtNombre.Text.Trim(),
                    Apellidos = txtApellidos.Text.Trim(),
                    Email = txtEmail.Text.Trim(),
                    Password = txtPassword.Password, // ?? En producción debería usar hash
                    Telefono = string.IsNullOrWhiteSpace(txtTelefono.Text) ? null : txtTelefono.Text.Trim(),
                    FechaRegistro = DateTime.Now,
                    Activo = true
                };

                // Registrar en la base de datos
                bool registroExitoso = await _dbService.RegistrarUsuarioAsync(nuevoUsuario);

                if (registroExitoso)
                {
                    MostrarExito("¡Registro exitoso! Redirigiendo al inicio de sesión...");
                    
                    // Esperar un momento para que el usuario vea el mensaje
                    await Task.Delay(1500);
                    
                    // Cerrar ventana con resultado exitoso
                    this.DialogResult = true;
                    this.Close();
                }
                else
                {
                    MostrarError("Error al registrar el usuario. Por favor, intente nuevamente.");
                }
            }
            catch (Exception ex)
            {
                MostrarError($"Error al conectar con la base de datos: {ex.Message}");
            }
            finally
            {
                // Rehabilitar botón
                btnRegistrar.IsEnabled = true;
                btnRegistrar.Content = "Registrarse";
            }
        }

        private bool ValidarCampos()
        {
            // Validar nombre
            if (string.IsNullOrWhiteSpace(txtNombre.Text))
            {
                MostrarError("Por favor, ingrese su nombre");
                txtNombre.Focus();
                return false;
            }

            if (txtNombre.Text.Trim().Length < 2)
            {
                MostrarError("El nombre debe tener al menos 2 caracteres");
                txtNombre.Focus();
                return false;
            }

            // Validar apellidos
            if (string.IsNullOrWhiteSpace(txtApellidos.Text))
            {
                MostrarError("Por favor, ingrese sus apellidos");
                txtApellidos.Focus();
                return false;
            }

            if (txtApellidos.Text.Trim().Length < 2)
            {
                MostrarError("Los apellidos deben tener al menos 2 caracteres");
                txtApellidos.Focus();
                return false;
            }

            // Validar email
            if (string.IsNullOrWhiteSpace(txtEmail.Text))
            {
                MostrarError("Por favor, ingrese su email");
                txtEmail.Focus();
                return false;
            }

            if (!EsEmailValido(txtEmail.Text.Trim()))
            {
                MostrarError("Por favor, ingrese un email válido");
                txtEmail.Focus();
                return false;
            }

            // Validar teléfono (opcional pero si se ingresa debe ser válido)
            if (!string.IsNullOrWhiteSpace(txtTelefono.Text))
            {
                string telefono = txtTelefono.Text.Trim();
                if (telefono.Length < 9 || !telefono.All(c => char.IsDigit(c) || c == '+' || c == ' ' || c == '-'))
                {
                    MostrarError("Por favor, ingrese un número de teléfono válido");
                    txtTelefono.Focus();
                    return false;
                }
            }

            // Validar contraseña
            if (string.IsNullOrWhiteSpace(txtPassword.Password))
            {
                MostrarError("Por favor, ingrese una contraseña");
                txtPassword.Focus();
                return false;
            }

            if (txtPassword.Password.Length < 6)
            {
                MostrarError("La contraseña debe tener al menos 6 caracteres");
                txtPassword.Focus();
                return false;
            }

            // Validar confirmación de contraseña
            if (string.IsNullOrWhiteSpace(txtConfirmarPassword.Password))
            {
                MostrarError("Por favor, confirme su contraseña");
                txtConfirmarPassword.Focus();
                return false;
            }

            if (txtPassword.Password != txtConfirmarPassword.Password)
            {
                MostrarError("Las contraseñas no coinciden");
                txtConfirmarPassword.Focus();
                return false;
            }

            return true;
        }

        private bool EsEmailValido(string email)
        {
            // Patrón regex para validar email
            string patron = @"^[^@\s]+@[^@\s]+\.[^@\s]+$";
            return Regex.IsMatch(email, patron);
        }

        private void MostrarError(string mensaje)
        {
            txtMensaje.Text = mensaje;
            txtMensaje.Foreground = System.Windows.Media.Brushes.Red;
            txtMensaje.Visibility = Visibility.Visible;
        }

        private void MostrarExito(string mensaje)
        {
            txtMensaje.Text = mensaje;
            txtMensaje.Foreground = System.Windows.Media.Brushes.Green;
            txtMensaje.Visibility = Visibility.Visible;
        }

        private void BtnCancelar_Click(object sender, RoutedEventArgs e)
        {
            this.DialogResult = false;
            this.Close();
        }
    }
}

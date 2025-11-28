# 🎓 GUÍA PASO A PASO PARTE 4: Perfil, Configuración Final y Pruebas

> 📌 Esta es la continuación final de `GUIA_PASO_A_PASO_PARTE_3.md`

---

## 🎨 Última Ventana: Perfil de Usuario

### Paso 5.6: Ventana de Perfil de Usuario

Esta ventana permite al usuario ver su información, cambiar su contraseña y consultar su historial de reservas.

#### Paso 5.6.1: Crear PerfilUsuarioWindow.xaml

1. Click derecho en **Ventanas**
2. **Agregar > Ventana (WPF)**
3. Nombre: `PerfilUsuarioWindow.xaml`

```xml
<Window x:Class="Cine_app.Ventanas.PerfilUsuarioWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="Mi Perfil" 
        Height="700" Width="900"
        WindowStartupLocation="CenterScreen"
        Background="#1a1a1a"
        ResizeMode="NoResize">

    <Grid>
        <Grid.ColumnDefinitions>
            <ColumnDefinition Width="200"/>
            <ColumnDefinition Width="*"/>
        </Grid.ColumnDefinitions>

        <!-- MENÚ LATERAL -->
        <Border Grid.Column="0" Background="#2d2d2d" BorderBrush="#ff6b35" BorderThickness="0,0,1,0">
            <StackPanel Margin="0,20,0,0">
                <TextBlock Text="👤 MI PERFIL" 
                           FontSize="20" 
                           FontWeight="Bold" 
                           Foreground="#ff6b35"
                           HorizontalAlignment="Center"
                           Margin="0,0,0,30"/>

                <Button x:Name="BtnMenuInformacion"
                        Content="ℹ️ Información"
                        Height="50"
                        Background="#ff6b35"
                        Foreground="White"
                        FontSize="16"
                        BorderThickness="0"
                        Cursor="Hand"
                        Click="BtnMenuInformacion_Click"
                        Margin="0,0,0,5"/>

                <Button x:Name="BtnMenuReservas"
                        Content="🎟️ Mis Reservas"
                        Height="50"
                        Background="Transparent"
                        Foreground="White"
                        FontSize="16"
                        BorderThickness="0"
                        Cursor="Hand"
                        Click="BtnMenuReservas_Click"
                        Margin="0,0,0,5"/>

                <Button Content="◄ Volver"
                        Height="50"
                        Background="Transparent"
                        Foreground="#aaa"
                        FontSize="14"
                        BorderThickness="0"
                        Cursor="Hand"
                        Click="BtnVolver_Click"
                        VerticalAlignment="Bottom"
                        Margin="0,350,0,0"/>
            </StackPanel>
        </Border>

        <!-- CONTENIDO PRINCIPAL -->
        <Grid Grid.Column="1" Margin="30,20">
            
            <!-- PANEL INFORMACIÓN PERSONAL -->
            <StackPanel x:Name="PanelInformacion" Visibility="Visible">
                <TextBlock Text="Información Personal" 
                           FontSize="28" 
                           FontWeight="Bold" 
                           Foreground="White"
                           Margin="0,0,0,20"/>

                <Border Background="#2d2d2d" 
                        CornerRadius="10" 
                        Padding="25"
                        Margin="0,0,0,20">
                    <StackPanel>
                        <TextBlock Text="📋 Datos de Usuario" 
                                   FontSize="20" 
                                   FontWeight="Bold" 
                                   Foreground="#ff6b35"
                                   Margin="0,0,0,15"/>

                        <!-- Nombre -->
                        <Grid Margin="0,0,0,10">
                            <Grid.ColumnDefinitions>
                                <ColumnDefinition Width="150"/>
                                <ColumnDefinition Width="*"/>
                            </Grid.ColumnDefinitions>
                            <TextBlock Text="Nombre completo:" 
                                       FontSize="16" 
                                       Foreground="#aaa"/>
                            <TextBlock x:Name="TxtNombreCompleto" 
                                       Grid.Column="1"
                                       Text="---" 
                                       FontSize="16" 
                                       FontWeight="Bold"
                                       Foreground="White"/>
                        </Grid>

                        <!-- Email -->
                        <Grid Margin="0,0,0,10">
                            <Grid.ColumnDefinitions>
                                <ColumnDefinition Width="150"/>
                                <ColumnDefinition Width="*"/>
                            </Grid.ColumnDefinitions>
                            <TextBlock Text="Email:" 
                                       FontSize="16" 
                                       Foreground="#aaa"/>
                            <TextBlock x:Name="TxtEmail" 
                                       Grid.Column="1"
                                       Text="---" 
                                       FontSize="16" 
                                       Foreground="White"/>
                        </Grid>

                        <!-- Teléfono -->
                        <Grid Margin="0,0,0,10">
                            <Grid.ColumnDefinitions>
                                <ColumnDefinition Width="150"/>
                                <ColumnDefinition Width="*"/>
                            </Grid.ColumnDefinitions>
                            <TextBlock Text="Teléfono:" 
                                       FontSize="16" 
                                       Foreground="#aaa"/>
                            <TextBlock x:Name="TxtTelefono" 
                                       Grid.Column="1"
                                       Text="---" 
                                       FontSize="16" 
                                       Foreground="White"/>
                        </Grid>

                        <!-- Fecha de registro -->
                        <Grid>
                            <Grid.ColumnDefinitions>
                                <ColumnDefinition Width="150"/>
                                <ColumnDefinition Width="*"/>
                            </Grid.ColumnDefinitions>
                            <TextBlock Text="Miembro desde:" 
                                       FontSize="16" 
                                       Foreground="#aaa"/>
                            <TextBlock x:Name="TxtFechaRegistro" 
                                       Grid.Column="1"
                                       Text="---" 
                                       FontSize="16" 
                                       Foreground="White"/>
                        </Grid>
                    </StackPanel>
                </Border>

                <!-- CAMBIAR CONTRASEÑA -->
                <Border Background="#2d2d2d" 
                        CornerRadius="10" 
                        Padding="25">
                    <StackPanel>
                        <TextBlock Text="🔒 Cambiar Contraseña" 
                                   FontSize="20" 
                                   FontWeight="Bold" 
                                   Foreground="#ff6b35"
                                   Margin="0,0,0,15"/>

                        <!-- Contraseña actual -->
                        <TextBlock Text="Contraseña actual" 
                                   Foreground="White" 
                                   FontSize="14" 
                                   Margin="0,0,0,5"/>
                        <PasswordBox x:Name="TxtPasswordActual"
                                    Height="35"
                                    Padding="10,0"
                                    FontSize="14"
                                    Margin="0,0,0,10"
                                    Background="#1a1a1a"
                                    Foreground="White"
                                    BorderBrush="#555"/>

                        <!-- Nueva contraseña -->
                        <TextBlock Text="Nueva contraseña" 
                                   Foreground="White" 
                                   FontSize="14" 
                                   Margin="0,0,0,5"/>
                        <PasswordBox x:Name="TxtPasswordNueva"
                                    Height="35"
                                    Padding="10,0"
                                    FontSize="14"
                                    Margin="0,0,0,10"
                                    Background="#1a1a1a"
                                    Foreground="White"
                                    BorderBrush="#555"/>

                        <!-- Confirmar contraseña -->
                        <TextBlock Text="Confirmar nueva contraseña" 
                                   Foreground="White" 
                                   FontSize="14" 
                                   Margin="0,0,0,5"/>
                        <PasswordBox x:Name="TxtPasswordConfirmar"
                                    Height="35"
                                    Padding="10,0"
                                    FontSize="14"
                                    Margin="0,0,0,15"
                                    Background="#1a1a1a"
                                    Foreground="White"
                                    BorderBrush="#555"/>

                        <!-- Mensaje -->
                        <Border x:Name="PanelMensajePassword" 
                                Padding="10" 
                                Margin="0,0,0,15"
                                CornerRadius="5"
                                Visibility="Collapsed">
                            <TextBlock x:Name="TxtMensajePassword" 
                                       Text="" 
                                       Foreground="White" 
                                       TextWrapping="Wrap"/>
                        </Border>

                        <!-- Botón -->
                        <Button Content="Cambiar Contraseña"
                                Height="40"
                                Background="#ff6b35"
                                Foreground="White"
                                FontSize="16"
                                FontWeight="Bold"
                                BorderThickness="0"
                                Cursor="Hand"
                                Click="BtnCambiarPassword_Click">
                            <Button.Style>
                                <Style TargetType="Button">
                                    <Setter Property="Template">
                                        <Setter.Value>
                                            <ControlTemplate TargetType="Button">
                                                <Border Background="{TemplateBinding Background}" 
                                                        CornerRadius="5">
                                                    <ContentPresenter HorizontalAlignment="Center" 
                                                                      VerticalAlignment="Center"/>
                                                </Border>
                                            </ControlTemplate>
                                        </Setter.Value>
                                    </Setter>
                                    <Style.Triggers>
                                        <Trigger Property="IsMouseOver" Value="True">
                                            <Setter Property="Background" Value="#ff8555"/>
                                        </Trigger>
                                    </Style.Triggers>
                                </Style>
                            </Button.Style>
                        </Button>
                    </StackPanel>
                </Border>
            </StackPanel>

            <!-- PANEL MIS RESERVAS -->
            <StackPanel x:Name="PanelReservas" Visibility="Collapsed">
                <TextBlock Text="Mis Reservas" 
                           FontSize="28" 
                           FontWeight="Bold" 
                           Foreground="White"
                           Margin="0,0,0,20"/>

                <ScrollViewer VerticalScrollBarVisibility="Auto" MaxHeight="550">
                    <ItemsControl x:Name="ListaReservas">
                        <ItemsControl.ItemTemplate>
                            <DataTemplate>
                                <Border Background="#2d2d2d" 
                                        CornerRadius="10" 
                                        Padding="20"
                                        Margin="0,0,0,15">
                                    <Grid>
                                        <Grid.RowDefinitions>
                                            <RowDefinition Height="Auto"/>
                                            <RowDefinition Height="Auto"/>
                                        </Grid.RowDefinitions>

                                        <!-- Código de reserva -->
                                        <TextBlock Grid.Row="0"
                                                   FontSize="18" 
                                                   FontWeight="Bold" 
                                                   Foreground="#ff6b35"
                                                   Margin="0,0,0,10">
                                            <Run Text="🎟️ Reserva: "/>
                                            <Run Text="{Binding CodigoReserva}"/>
                                        </TextBlock>

                                        <!-- Detalles -->
                                        <StackPanel Grid.Row="1">
                                            <TextBlock FontSize="16" 
                                                       Foreground="White"
                                                       Margin="0,0,0,5">
                                                <Run Text="🎬 Película: " FontWeight="Bold"/>
                                                <Run Text="{Binding Sesion.Pelicula.Titulo}"/>
                                            </TextBlock>

                                            <TextBlock FontSize="14" 
                                                       Foreground="#aaa"
                                                       Margin="0,0,0,5">
                                                <Run Text="📅 "/>
                                                <Run Text="{Binding Sesion.FechaHoraFormateada}"/>
                                                <Run Text=" - Sala "/>
                                                <Run Text="{Binding Sesion.Sala.Nombre}"/>
                                            </TextBlock>

                                            <TextBlock FontSize="14" 
                                                       Foreground="#aaa"
                                                       Margin="0,0,0,5">
                                                <Run Text="💺 Butacas: "/>
                                                <Run Text="{Binding Butacas}"/>
                                            </TextBlock>

                                            <TextBlock FontSize="16" 
                                                       Foreground="#4CAF50"
                                                       FontWeight="Bold">
                                                <Run Text="💰 Total: €"/>
                                                <Run Text="{Binding Total}"/>
                                            </TextBlock>
                                        </StackPanel>
                                    </Grid>
                                </Border>
                            </DataTemplate>
                        </ItemsControl.ItemTemplate>
                    </ItemsControl>
                </ScrollViewer>

                <!-- Mensaje si no hay reservas -->
                <TextBlock x:Name="TxtSinReservas"
                           Text="No tienes reservas activas."
                           FontSize="18"
                           Foreground="#aaa"
                           HorizontalAlignment="Center"
                           VerticalAlignment="Center"
                           Margin="0,100,0,0"
                           Visibility="Collapsed"/>
            </StackPanel>
        </Grid>
    </Grid>
</Window>
```

#### Paso 5.6.2: Código C# (PerfilUsuarioWindow.xaml.cs)

```csharp
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Media;
using Cine_app.Modelos;
using Cine_app.Servicios;

namespace Cine_app.Ventanas
{
    public partial class PerfilUsuarioWindow : Window
    {
        private readonly Usuario usuarioActual;
        private readonly ServicioBaseDeDatos servicioBD;

        public PerfilUsuarioWindow()
        {
            InitializeComponent();

            // Obtener usuario actual
            usuarioActual = ServicioSesion.Instance.UsuarioActual!;
            servicioBD = new ServicioBaseDeDatos();

            // Cargar información
            CargarInformacionUsuario();
        }

        /// <summary>
        /// Carga la información del usuario en los controles
        /// </summary>
        private void CargarInformacionUsuario()
        {
            TxtNombreCompleto.Text = usuarioActual.NombreCompleto;
            TxtEmail.Text = usuarioActual.Email;
            TxtTelefono.Text = string.IsNullOrEmpty(usuarioActual.Telefono) 
                ? "No especificado" 
                : usuarioActual.Telefono;
            TxtFechaRegistro.Text = usuarioActual.FechaRegistro.ToString("dd/MM/yyyy");
        }

        /// <summary>
        /// Muestra el panel de información personal
        /// </summary>
        private void BtnMenuInformacion_Click(object sender, RoutedEventArgs e)
        {
            PanelInformacion.Visibility = Visibility.Visible;
            PanelReservas.Visibility = Visibility.Collapsed;

            BtnMenuInformacion.Background = new SolidColorBrush(Color.FromRgb(255, 107, 53));
            BtnMenuReservas.Background = Brushes.Transparent;
        }

        /// <summary>
        /// Muestra el panel de reservas
        /// </summary>
        private void BtnMenuReservas_Click(object sender, RoutedEventArgs e)
        {
            PanelInformacion.Visibility = Visibility.Collapsed;
            PanelReservas.Visibility = Visibility.Visible;

            BtnMenuInformacion.Background = Brushes.Transparent;
            BtnMenuReservas.Background = new SolidColorBrush(Color.FromRgb(255, 107, 53));

            // Cargar reservas
            CargarReservas();
        }

        /// <summary>
        /// Carga las reservas del usuario
        /// </summary>
        private async void CargarReservas()
        {
            try
            {
                var reservas = await servicioBD.ObtenerReservasPorUsuarioAsync(usuarioActual.Id);

                if (reservas.Count > 0)
                {
                    // Crear ViewModels para binding
                    var reservasVM = reservas.Select(r => new ReservaViewModel
                    {
                        Sesion = r.Sesion!,
                        Total = r.Total,
                        CodigoReserva = r.CodigoReserva ?? "N/A",
                        Butacas = string.Join(", ", r.Butacas.Select(rb => rb.Butaca?.Identificador ?? "?"))
                    }).ToList();

                    ListaReservas.ItemsSource = reservasVM;
                    TxtSinReservas.Visibility = Visibility.Collapsed;
                }
                else
                {
                    ListaReservas.ItemsSource = null;
                    TxtSinReservas.Visibility = Visibility.Visible;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error al cargar reservas: {ex.Message}", 
                    "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        /// <summary>
        /// Cambia la contraseña del usuario
        /// </summary>
        private async void BtnCambiarPassword_Click(object sender, RoutedEventArgs e)
        {
            // Validar campos vacíos
            if (string.IsNullOrWhiteSpace(TxtPasswordActual.Password) ||
                string.IsNullOrWhiteSpace(TxtPasswordNueva.Password) ||
                string.IsNullOrWhiteSpace(TxtPasswordConfirmar.Password))
            {
                MostrarMensajePassword("Por favor, completa todos los campos.", true);
                return;
            }

            // Validar contraseña actual
            if (TxtPasswordActual.Password != usuarioActual.Password)
            {
                MostrarMensajePassword("La contraseña actual no es correcta.", true);
                return;
            }

            // Validar longitud de nueva contraseña
            if (TxtPasswordNueva.Password.Length < 6)
            {
                MostrarMensajePassword("La nueva contraseña debe tener al menos 6 caracteres.", true);
                return;
            }

            // Validar que las contraseñas nuevas coincidan
            if (TxtPasswordNueva.Password != TxtPasswordConfirmar.Password)
            {
                MostrarMensajePassword("Las contraseñas nuevas no coinciden.", true);
                return;
            }

            try
            {
                // Actualizar en la base de datos
                bool exito = await servicioBD.ActualizarPasswordAsync(
                    usuarioActual.Id, 
                    TxtPasswordNueva.Password);

                if (exito)
                {
                    MostrarMensajePassword("¡Contraseña actualizada exitosamente!", false);

                    // Actualizar en el objeto actual
                    usuarioActual.Password = TxtPasswordNueva.Password;

                    // Limpiar campos
                    TxtPasswordActual.Clear();
                    TxtPasswordNueva.Clear();
                    TxtPasswordConfirmar.Clear();
                }
                else
                {
                    MostrarMensajePassword("Error al cambiar la contraseña.", true);
                }
            }
            catch (Exception ex)
            {
                MostrarMensajePassword($"Error: {ex.Message}", true);
            }
        }

        /// <summary>
        /// Muestra un mensaje de éxito o error
        /// </summary>
        private void MostrarMensajePassword(string mensaje, bool esError)
        {
            TxtMensajePassword.Text = mensaje;
            PanelMensajePassword.Background = esError
                ? new SolidColorBrush(Color.FromRgb(255, 68, 68))
                : new SolidColorBrush(Color.FromRgb(76, 175, 80));
            PanelMensajePassword.Visibility = Visibility.Visible;
        }

        /// <summary>
        /// Cierra la ventana
        /// </summary>
        private void BtnVolver_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }
    }
}
```

---

## ⚙️ FASE 6: Configuración Final

### Paso 6.1: Modificar App.xaml

Necesitamos configurar que la aplicación inicie con CarteleraWindow.

Abre `App.xaml` y reemplaza su contenido:

```xml
<Application x:Class="Cine_app.App"
             xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
             xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
             StartupUri="Ventanas/CarteleraWindow.xaml">
    <Application.Resources>
        <!-- Recursos globales de la aplicación -->
    </Application.Resources>
</Application>
```

**📝 Explicación:**
- `StartupUri`: Le dice a la aplicación qué ventana abrir al iniciar
- Si no funciona, asegúrate de que la ruta sea correcta

---

### Paso 6.2: Verificar el archivo .csproj

Tu archivo `Cine_app.csproj` debe verse así:

```xml
<Project Sdk="Microsoft.NET.Sdk">

  <PropertyGroup>
    <OutputType>WinExe</OutputType>
    <TargetFramework>net10.0-windows</TargetFramework>
    <Nullable>enable</Nullable>
    <ImplicitUsings>enable</ImplicitUsings>
    <UseWPF>true</UseWPF>
  </PropertyGroup>

  <ItemGroup>
    <PackageReference Include="DotNetEnv" Version="3.1.1" />
    <PackageReference Include="mysql.data" Version="9.5.0" />
  </ItemGroup>

  <ItemGroup>
    <Page Include="App.xaml" />
  </ItemGroup>

  <ItemGroup>
    <None Update=".env">
      <CopyToOutputDirectory>Always</CopyToOutputDirectory>
    </None>
  </ItemGroup>

</Project>
```

---

## 🧪 FASE 7: Pruebas y Ejecución

### Paso 7.1: Compilar el Proyecto

1. En Visual Studio, presiona **Ctrl + Shift + B** para compilar
2. Revisa la ventana "Lista de errores" (abajo)
3. Si hay errores, léelos cuidadosamente:
   - **Errores de sintaxis**: Revisa el código
   - **Errores de namespace**: Verifica los `using` al inicio de cada archivo
   - **Errores de referencias**: Asegúrate de que los paquetes NuGet estén instalados

**Errores comunes:**

| Error | Solución |
|-------|----------|
| `'MySqlConnection' no existe` | Instala el paquete MySql.Data |
| `'DotNetEnv' no existe` | Instala el paquete DotNetEnv |
| `No se puede encontrar el archivo .env` | Verifica que el archivo .env tenga "Copiar siempre" |
| `Error de conexión a MySQL` | Verifica que MySQL esté ejecutándose y la contraseña sea correcta |

---

### Paso 7.2: Ejecutar la Aplicación

1. Presiona **F5** o click en el botón ▶️ "Iniciar"
2. Debe abrirse la ventana de Cartelera

**Si la aplicación no inicia:**
- Verifica que MySQL esté ejecutándose
- Revisa el archivo `.env` (contraseña correcta)
- Verifica que la base de datos `cinema_db` exista
- Revisa que haya datos de prueba en las tablas

---

### Paso 7.3: Probar Funcionalidades

#### Test 1: Ver Cartelera
- ✅ Se muestran las películas
- ✅ Las imágenes cargan correctamente
- ✅ El botón "Ver Horarios" funciona

#### Test 2: Registro
1. Click en "Iniciar Sesión"
2. Click en "Regístrate aquí"
3. Completa el formulario
4. Verifica que se registre correctamente

#### Test 3: Login
1. Usa el email y contraseña del usuario de prueba:
   - Email: `juan@test.com`
   - Password: `123456`
2. Debe iniciar sesión y mostrar "Bienvenido, Juan"

#### Test 4: Reservar Butacas
1. Inicia sesión
2. Selecciona una película
3. Elige una fecha y horario
4. Selecciona butacas
5. Confirma la reserva
6. Verifica que se genere el código de reserva

#### Test 5: Ver Perfil
1. Click en "Mi Perfil"
2. Verifica que se muestren los datos
3. Ve a "Mis Reservas"
4. Debe aparecer la reserva que hiciste

#### Test 6: Cambiar Contraseña
1. En el perfil, intenta cambiar la contraseña
2. Verifica que funcione
3. Cierra sesión e inicia con la nueva contraseña

---

## 🐛 FASE 8: Solución de Problemas Comunes

### Problema 1: "No se puede conectar a MySQL"

**Síntomas:**
- Error al iniciar la aplicación
- Mensaje: "Unable to connect to any of the specified MySQL hosts"

**Soluciones:**
1. Verifica que MySQL esté ejecutándose:
   ```
   - Windows: Busca "Servicios" → MySQL80 debe estar "En ejecución"
   ```
2. Revisa el archivo `.env`:
   - Usuario correcto (generalmente `root`)
   - Contraseña correcta
   - Puerto correcto (por defecto `3306`)

---

### Problema 2: "La tabla no existe"

**Síntomas:**
- Error: "Table 'cinema_db.Peliculas' doesn't exist"

**Soluciones:**
1. Abre MySQL Workbench
2. Ejecuta el script `cinema_database_mysql.sql` completo
3. Verifica que todas las tablas se hayan creado:
   ```sql
   USE cinema_db;
   SHOW TABLES;
   ```
4. Debe mostrar: `Usuarios, Peliculas, Salas, Sesiones, Butacas, Reservas, ReservasButacas`

---

### Problema 3: "Las imágenes no cargan"

**Síntomas:**
- Los posters de películas aparecen en blanco

**Soluciones:**
1. Verifica tu conexión a internet (las URLs son de internet)
2. Las URLs en la base de datos deben ser válidas
3. Puedes usar URLs de prueba como:
   ```
   https://image.tmdb.org/t/p/w500/CODIGO_IMAGEN.jpg
   ```

---

### Problema 4: "No se ven las butacas"

**Síntomas:**
- La sala aparece vacía

**Soluciones:**
1. Verifica que existan butacas en la base de datos:
   ```sql
   SELECT COUNT(*) FROM Butacas WHERE SalaId = 1;
   ```
2. Debe retornar 80 (si es sala de 8x10)
3. Si no hay butacas, ejecuta el INSERT de butacas del script

---

### Problema 5: "Error al reservar"

**Síntomas:**
- El botón de confirmar reserva no funciona
- Error al procesar reserva

**Soluciones:**
1. Verifica que estés logueado
2. Asegúrate de que la sesión esté activa
3. Revisa que las butacas no estén ya reservadas
4. Verifica la integridad de las foreign keys en la BD

---

## 📚 FASE 9: Mejoras Futuras (Opcional)

Una vez que tu aplicación funcione, puedes agregar estas mejoras:

### Mejora 1: Seguridad de Contraseñas
Actualmente las contraseñas se guardan en texto plano (inseguro).

**Cómo mejorar:**
```csharp
// Instalar paquete: BCrypt.Net-Next
using BCrypt.Net;

// Al registrar:
string hashedPassword = BCrypt.HashPassword(usuario.Password);

// Al validar:
bool esValida = BCrypt.Verify(passwordIngresado, passwordHasheado);
```

### Mejora 2: Validación de Email
Enviar un email de confirmación al registrarse.

### Mejora 3: Cancelar Reservas
Permitir que los usuarios cancelen sus reservas.

```csharp
public async Task<bool> CancelarReservaAsync(int reservaId)
{
    // Actualizar estado a "Cancelada"
    // Liberar butacas
}
```

### Mejora 4: Búsqueda de Películas
Agregar un cuadro de búsqueda en la cartelera.

### Mejora 5: Filtros
Filtrar por género, calificación, etc.

### Mejora 6: Descuentos
Aplicar descuentos a ciertos usuarios o días.

### Mejora 7: Pagos
Integrar una pasarela de pago real (Stripe, PayPal).

### Mejora 8: Notificaciones
Enviar recordatorios de reservas por email.

---

## 🎓 FASE 10: Conceptos Aprendidos

### Conceptos de Programación
- ✅ **Programación Orientada a Objetos**: Clases, propiedades, métodos
- ✅ **CRUD**: Create, Read, Update, Delete en base de datos
- ✅ **Async/Await**: Programación asíncrona
- ✅ **Eventos**: Manejo de eventos de UI
- ✅ **Patrón Singleton**: Para gestión de sesión
- ✅ **Data Binding**: Enlace de datos XAML-C#
- ✅ **Validación de Datos**: Verificación de entradas del usuario
- ✅ **Transacciones**: Operaciones atómicas en BD

### Tecnologías
- ✅ **WPF**: Windows Presentation Foundation
- ✅ **XAML**: Lenguaje de marcado para interfaces
- ✅ **C#**: Lenguaje de programación
- ✅ **MySQL**: Base de datos relacional
- ✅ **ADO.NET**: Acceso a datos
- ✅ **Git**: Control de versiones (si usaste)

---

## 📝 CHECKLIST FINAL

Antes de considerar el proyecto terminado, verifica:

### Base de Datos
- [ ] MySQL instalado y ejecutándose
- [ ] Base de datos `cinema_db` creada
- [ ] Todas las tablas creadas
- [ ] Datos de prueba insertados
- [ ] Foreign keys configuradas

### Código
- [ ] Todos los modelos creados (Usuario, Pelicula, Sesion, Butaca)
- [ ] ServicioBaseDeDatos completo
- [ ] ServicioSesion implementado
- [ ] Todas las ventanas creadas
- [ ] Archivo .env configurado
- [ ] App.xaml con StartupUri correcto

### Funcionalidades
- [ ] Cartelera muestra películas
- [ ] Registro de usuarios funciona
- [ ] Login funciona
- [ ] Selección de sesiones funciona
- [ ] Selección de butacas con 3D funciona
- [ ] Reservas se guardan correctamente
- [ ] Perfil de usuario funciona
- [ ] Cambio de contraseña funciona
- [ ] Historial de reservas funciona

### Extras
- [ ] Sin errores de compilación
- [ ] Sin errores en tiempo de ejecución
- [ ] Interfaz se ve bien
- [ ] Colores y estilos consistentes

---

## 🎉 ¡FELICITACIONES!

Si has llegado hasta aquí y todo funciona, ¡FELICIDADES! 🎊

Has creado una aplicación completa y funcional que incluye:
- ✅ Interfaz gráfica moderna
- ✅ Base de datos MySQL
- ✅ Sistema de usuarios
- ✅ Reservas con transacciones
- ✅ Visualización 3D de butacas
- ✅ Y mucho más...

---

## 📚 Recursos Adicionales

### Para seguir aprendiendo:

**C# y .NET:**
- [Microsoft Learn - C#](https://learn.microsoft.com/es-es/dotnet/csharp/)
- [Documentación oficial de .NET](https://learn.microsoft.com/es-es/dotnet/)

**WPF:**
- [Tutorial de WPF](https://learn.microsoft.com/es-es/dotnet/desktop/wpf/)
- [WPF Tutorial en YouTube](https://www.youtube.com/results?search_query=wpf+tutorial+español)

**MySQL:**
- [MySQL Tutorial](https://www.mysqltutorial.org/)
- [Documentación MySQL](https://dev.mysql.com/doc/)

---

## 💡 Tips Finales

1. **Practica debugging**: Aprende a usar breakpoints (F9) para entender el flujo del código
2. **Lee los errores**: Los mensajes de error te dicen exactamente qué está mal
3. **Comenta tu código**: Ayuda a entenderlo después
4. **Usa Git**: Guarda versiones de tu código
5. **Prueba todo**: No asumas que funciona, pruébalo
6. **Busca ayuda**: Stack Overflow, foros, comunidades

---

## 🤝 Siguientes Pasos

1. **Mejora el proyecto**: Agrega las mejoras sugeridas
2. **Compártelo**: Súbelo a GitHub
3. **Documéntalo**: Crea un README.md
4. **Muéstralo**: Añádelo a tu portafolio
5. **Aprende más**: Investiga sobre arquitecturas (MVVM, Clean Architecture)

---

**¡Éxito en tu proyecto!** 🎬🍿
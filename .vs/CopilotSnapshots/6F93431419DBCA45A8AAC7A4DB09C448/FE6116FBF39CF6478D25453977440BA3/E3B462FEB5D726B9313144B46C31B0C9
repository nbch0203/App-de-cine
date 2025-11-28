# 🎓 GUÍA PASO A PASO PARTE 3: Ventanas Avanzadas y Configuración Final

> 📌 Esta es la continuación de `GUIA_PASO_A_PASO_PARTE_2.md`

---

## 🎨 Ventanas Avanzadas

### Paso 5.4: Ventana de Selección de Sesión

Esta ventana muestra los horarios disponibles de una película con un calendario interactivo.

#### Paso 5.4.1: Crear SeleccionSesionWindow.xaml

1. Click derecho en **Ventanas**
2. **Agregar > Ventana (WPF)**
3. Nombre: `SeleccionSesionWindow.xaml`

```xml
<Window x:Class="Cine_app.Ventanas.SeleccionSesionWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="Seleccionar Horario" 
        Height="700" Width="1000"
        WindowStartupLocation="CenterScreen"
        Background="#1a1a1a"
        ResizeMode="NoResize">

    <Grid>
        <Grid.RowDefinitions>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="*"/>
        </Grid.RowDefinitions>

        <!-- Cabecera -->
        <Border Grid.Row="0" Background="#2d2d2d" BorderBrush="#ff6b35" BorderThickness="0,0,0,3">
            <Grid Margin="20">
                <TextBlock Text="Seleccionar Horario" 
                           FontSize="24" 
                           FontWeight="Bold" 
                           Foreground="White"
                           VerticalAlignment="Center"/>
                <Button Content="✖ Cerrar"
                        HorizontalAlignment="Right"
                        VerticalAlignment="Center"
                        Background="#4a4a4a"
                        Foreground="White"
                        Padding="15,8"
                        BorderThickness="0"
                        Cursor="Hand"
                        Click="BtnCerrar_Click"/>
            </Grid>
        </Border>

        <!-- Contenido -->
        <Grid Grid.Row="1" Margin="30,20">
            <Grid.ColumnDefinitions>
                <ColumnDefinition Width="300"/>
                <ColumnDefinition Width="*"/>
            </Grid.ColumnDefinitions>

            <!-- COLUMNA IZQUIERDA: Info de Película -->
            <Border Grid.Column="0" 
                    Background="#2d2d2d" 
                    CornerRadius="10" 
                    Padding="20"
                    Margin="0,0,20,0">
                <StackPanel>
                    <TextBlock Text="Película" 
                               FontSize="18" 
                               FontWeight="Bold" 
                               Foreground="#ff6b35"
                               Margin="0,0,0,15"/>

                    <!-- Imagen -->
                    <Image x:Name="ImgPelicula" 
                           Height="350" 
                           Stretch="UniformToFill"
                           Margin="0,0,0,15"/>

                    <!-- Título -->
                    <TextBlock x:Name="TxtTitulo" 
                               Text="Título" 
                               FontSize="20" 
                               FontWeight="Bold" 
                               Foreground="White"
                               TextWrapping="Wrap"
                               Margin="0,0,0,10"/>

                    <!-- Director -->
                    <StackPanel Orientation="Horizontal" Margin="0,0,0,5">
                        <TextBlock Text="Director: " 
                                   FontSize="14" 
                                   Foreground="#aaa"/>
                        <TextBlock x:Name="TxtDirector" 
                                   Text="N/A" 
                                   FontSize="14" 
                                   Foreground="White"/>
                    </StackPanel>

                    <!-- Duración -->
                    <StackPanel Orientation="Horizontal" Margin="0,0,0,5">
                        <TextBlock Text="Duración: " 
                                   FontSize="14" 
                                   Foreground="#aaa"/>
                        <TextBlock x:Name="TxtDuracion" 
                                   Text="N/A" 
                                   FontSize="14" 
                                   Foreground="White"/>
                    </StackPanel>

                    <!-- Género -->
                    <StackPanel Orientation="Horizontal" Margin="0,0,0,5">
                        <TextBlock Text="Género: " 
                                   FontSize="14" 
                                   Foreground="#aaa"/>
                        <TextBlock x:Name="TxtGenero" 
                                   Text="N/A" 
                                   FontSize="14" 
                                   Foreground="White"/>
                    </StackPanel>

                    <!-- Calificación -->
                    <StackPanel Orientation="Horizontal" Margin="0,0,0,5">
                        <TextBlock Text="⭐ " 
                                   FontSize="14"/>
                        <TextBlock x:Name="TxtCalificacion" 
                                   Text="N/A" 
                                   FontSize="14" 
                                   Foreground="#FFD700"/>
                    </StackPanel>
                </StackPanel>
            </Border>

            <!-- COLUMNA DERECHA: Calendario y Sesiones -->
            <Grid Grid.Column="1">
                <Grid.RowDefinitions>
                    <RowDefinition Height="Auto"/>
                    <RowDefinition Height="*"/>
                </Grid.RowDefinitions>

                <!-- Calendario -->
                <Border Grid.Row="0" 
                        Background="#2d2d2d" 
                        CornerRadius="10" 
                        Padding="20"
                        Margin="0,0,0,20">
                    <StackPanel>
                        <TextBlock Text="📅 Selecciona una Fecha" 
                                   FontSize="18" 
                                   FontWeight="Bold" 
                                   Foreground="#ff6b35"
                                   Margin="0,0,0,15"/>

                        <Calendar x:Name="Calendario"
                                  HorizontalAlignment="Center"
                                  SelectedDatesChanged="Calendario_SelectedDatesChanged"
                                  Background="#1a1a1a"
                                  Foreground="White"
                                  BorderBrush="#555"/>
                    </StackPanel>
                </Border>

                <!-- Lista de Sesiones -->
                <Border Grid.Row="1" 
                        Background="#2d2d2d" 
                        CornerRadius="10" 
                        Padding="20">
                    <StackPanel>
                        <TextBlock Text="🕒 Horarios Disponibles" 
                                   FontSize="18" 
                                   FontWeight="Bold" 
                                   Foreground="#ff6b35"
                                   Margin="0,0,0,15"/>

                        <ScrollViewer VerticalScrollBarVisibility="Auto" MaxHeight="300">
                            <ItemsControl x:Name="ListaSesiones">
                                <ItemsControl.ItemTemplate>
                                    <DataTemplate>
                                        <Border Background="#1a1a1a" 
                                                CornerRadius="5" 
                                                Padding="15"
                                                Margin="0,0,0,10">
                                            <Grid>
                                                <Grid.ColumnDefinitions>
                                                    <ColumnDefinition Width="*"/>
                                                    <ColumnDefinition Width="Auto"/>
                                                </Grid.ColumnDefinitions>

                                                <StackPanel Grid.Column="0">
                                                    <TextBlock Text="{Binding FechaHoraFormateada}" 
                                                               FontSize="16" 
                                                               FontWeight="Bold" 
                                                               Foreground="White"/>
                                                    <TextBlock FontSize="14" 
                                                               Foreground="#aaa"
                                                               Margin="0,5,0,0">
                                                        <Run Text="Sala: "/>
                                                        <Run Text="{Binding Sala.Nombre}"/>
                                                    </TextBlock>
                                                    <TextBlock FontSize="14" 
                                                               Foreground="#4CAF50">
                                                        <Run Text="Precio: €"/>
                                                        <Run Text="{Binding Precio}"/>
                                                    </TextBlock>
                                                </StackPanel>

                                                <Button Grid.Column="1"
                                                        Content="Seleccionar"
                                                        Background="#ff6b35"
                                                        Foreground="White"
                                                        Padding="20,10"
                                                        BorderThickness="0"
                                                        Cursor="Hand"
                                                        Tag="{Binding}"
                                                        Click="BtnSeleccionarSesion_Click">
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
                                            </Grid>
                                        </Border>
                                    </DataTemplate>
                                </ItemsControl.ItemTemplate>
                            </ItemsControl>
                        </ScrollViewer>

                        <!-- Mensaje si no hay sesiones -->
                        <TextBlock x:Name="TxtSinSesiones"
                                   Text="No hay sesiones disponibles para esta fecha."
                                   FontSize="16"
                                   Foreground="#aaa"
                                   HorizontalAlignment="Center"
                                   Margin="0,30,0,0"
                                   Visibility="Collapsed"/>
                    </StackPanel>
                </Border>
            </Grid>
        </Grid>
    </Grid>
</Window>
```

#### Paso 5.4.2: Código C# (SeleccionSesionWindow.xaml.cs)

```csharp
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Media.Imaging;
using Cine_app.Modelos;
using Cine_app.Servicios;

namespace Cine_app.Ventanas
{
    public partial class SeleccionSesionWindow : Window
    {
        private readonly Pelicula peliculaActual;
        private readonly ServicioBaseDeDatos servicioBD;

        public SeleccionSesionWindow(Pelicula pelicula)
        {
            InitializeComponent();
            peliculaActual = pelicula;
            servicioBD = new ServicioBaseDeDatos();

            CargarInfoPelicula();

            // Configurar calendario: solo fechas futuras
            Calendario.DisplayDateStart = DateTime.Today;
            Calendario.DisplayDateEnd = DateTime.Today.AddMonths(2);
            Calendario.SelectedDate = DateTime.Today;
        }

        /// <summary>
        /// Carga la información de la película en la interfaz
        /// </summary>
        private void CargarInfoPelicula()
        {
            TxtTitulo.Text = peliculaActual.Titulo;
            TxtDirector.Text = peliculaActual.Director ?? "N/A";
            TxtDuracion.Text = peliculaActual.Duracion.HasValue ? $"{peliculaActual.Duracion} min" : "N/A";
            TxtGenero.Text = peliculaActual.Genero ?? "N/A";
            TxtCalificacion.Text = peliculaActual.Calificacion.HasValue ? $"{peliculaActual.Calificacion:0.0}/10" : "N/A";

            // Cargar imagen
            try
            {
                if (!string.IsNullOrEmpty(peliculaActual.ImagenUrl))
                {
                    ImgPelicula.Source = new BitmapImage(new Uri(peliculaActual.ImagenUrl));
                }
            }
            catch
            {
                // Si falla la imagen, dejarla en blanco
            }
        }

        /// <summary>
        /// Se ejecuta cuando el usuario selecciona una fecha en el calendario
        /// </summary>
        private void Calendario_SelectedDatesChanged(object sender, System.Windows.Controls.SelectionChangedEventArgs e)
        {
            if (Calendario.SelectedDate.HasValue)
            {
                CargarSesiones(Calendario.SelectedDate.Value);
            }
        }

        /// <summary>
        /// Carga las sesiones disponibles para la fecha seleccionada
        /// </summary>
        private async void CargarSesiones(DateTime fecha)
        {
            try
            {
                // Obtener sesiones de la BD
                var todasLasSesiones = await servicioBD.ObtenerSesionesPorPeliculaAsync(
                    peliculaActual.Id, 
                    fecha);

                if (todasLasSesiones.Count > 0)
                {
                    // Mostrar sesiones
                    ListaSesiones.ItemsSource = todasLasSesiones;
                    TxtSinSesiones.Visibility = Visibility.Collapsed;
                }
                else
                {
                    // No hay sesiones
                    ListaSesiones.ItemsSource = null;
                    TxtSinSesiones.Visibility = Visibility.Visible;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error al cargar sesiones: {ex.Message}", 
                    "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        /// <summary>
        /// Abre la ventana de selección de butacas
        /// </summary>
        private void BtnSeleccionarSesion_Click(object sender, RoutedEventArgs e)
        {
            var boton = (System.Windows.Controls.Button)sender;
            var sesion = (Sesion)boton.Tag;

            // Verificar autenticación
            if (!ServicioSesion.Instance.EstaAutenticado)
            {
                var resultado = MessageBox.Show(
                    "Debes iniciar sesión para reservar butacas.\n¿Deseas iniciar sesión ahora?",
                    "Autenticación Requerida",
                    MessageBoxButton.YesNo,
                    MessageBoxImage.Information);

                if (resultado == MessageBoxResult.Yes)
                {
                    var loginWindow = new LoginWindow();
                    if (loginWindow.ShowDialog() != true)
                    {
                        // Si no inició sesión, no continuar
                        return;
                    }
                }
                else
                {
                    return;
                }
            }

            // Abrir ventana de selección de butacas
            AbrirSeleccionButacas(sesion);
        }

        /// <summary>
        /// Abre la ventana de selección de butacas
        /// </summary>
        private void AbrirSeleccionButacas(Sesion sesion)
        {
            var ventana = new SeleccionButacasWindow(sesion);
            ventana.ShowDialog();

            // Recargar sesiones después de cerrar (por si se hizo una reserva)
            if (Calendario.SelectedDate.HasValue)
            {
                CargarSesiones(Calendario.SelectedDate.Value);
            }
        }

        /// <summary>
        /// Cierra la ventana
        /// </summary>
        private void BtnCerrar_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }
    }
}
```

**📝 Conceptos nuevos:**
- **`Calendar`**: Control de WPF para seleccionar fechas
- **`ItemsControl.ItemTemplate`**: Define cómo se ve cada elemento de una lista
- **`DataBinding {Binding}`**: Conecta datos del C# con el XAML automáticamente
- **`DisplayDateStart/End`**: Limita las fechas seleccionables

---

### Paso 5.5: Ventana de Selección de Butacas (LA MÁS COMPLEJA)

Esta es la ventana más avanzada: muestra la sala en 3D con efecto de perspectiva.

#### Paso 5.5.1: Crear SeleccionButacasWindow.xaml

```xml
<Window x:Class="Cine_app.Ventanas.SeleccionButacasWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="Seleccionar Butacas" 
        Height="800" Width="1200"
        WindowStartupLocation="CenterScreen"
        Background="#1a1a1a"
        ResizeMode="NoResize">

    <Grid>
        <Grid.RowDefinitions>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="*"/>
            <RowDefinition Height="Auto"/>
        </Grid.RowDefinitions>

        <!-- CABECERA -->
        <Border Grid.Row="0" Background="#2d2d2d" BorderBrush="#ff6b35" BorderThickness="0,0,0,3">
            <Grid Margin="20">
                <StackPanel Orientation="Horizontal" VerticalAlignment="Center">
                    <TextBlock Text="🎟️ " FontSize="24"/>
                    <TextBlock x:Name="TxtInfoSesion" 
                               Text="Información de sesión" 
                               FontSize="18" 
                               Foreground="White"
                               VerticalAlignment="Center"/>
                </StackPanel>
            </Grid>
        </Border>

        <!-- CONTENIDO: SALA DE CINE -->
        <ScrollViewer Grid.Row="1" 
                      HorizontalScrollBarVisibility="Auto" 
                      VerticalScrollBarVisibility="Auto"
                      Padding="30,20">
            <StackPanel HorizontalAlignment="Center">
                
                <!-- PANTALLA -->
                <Border Background="#2d2d2d" 
                        Height="40" 
                        Width="800" 
                        CornerRadius="20"
                        Margin="0,0,0,30"
                        BorderBrush="#ff6b35"
                        BorderThickness="3">
                    <TextBlock Text="🎬 PANTALLA" 
                               FontSize="20" 
                               FontWeight="Bold" 
                               Foreground="#ff6b35"
                               HorizontalAlignment="Center"
                               VerticalAlignment="Center"/>
                </Border>

                <!-- GRID DE BUTACAS -->
                <Grid x:Name="GridButacas" 
                      HorizontalAlignment="Center">
                    <!-- Se genera dinámicamente desde el código -->
                </Grid>

                <!-- LEYENDA -->
                <Border Background="#2d2d2d" 
                        CornerRadius="10" 
                        Padding="20"
                        Margin="0,30,0,0">
                    <StackPanel Orientation="Horizontal" HorizontalAlignment="Center">
                        <StackPanel.Resources>
                            <Style TargetType="Border">
                                <Setter Property="Width" Value="30"/>
                                <Setter Property="Height" Value="30"/>
                                <Setter Property="CornerRadius" Value="5"/>
                                <Setter Property="Margin" Value="0,0,10,0"/>
                            </Style>
                            <Style TargetType="TextBlock">
                                <Setter Property="Foreground" Value="White"/>
                                <Setter Property="VerticalAlignment" Value="Center"/>
                                <Setter Property="Margin" Value="0,0,30,0"/>
                            </Style>
                        </StackPanel.Resources>

                        <Border Background="#4CAF50"/>
                        <TextBlock Text="Disponible"/>

                        <Border Background="#2196F3"/>
                        <TextBlock Text="Seleccionada"/>

                        <Border Background="#F44336"/>
                        <TextBlock Text="Ocupada"/>

                        <Border Background="#FFC107"/>
                        <TextBlock Text="VIP"/>

                        <Border Background="#9C27B0"/>
                        <TextBlock Text="Discapacitado"/>
                    </StackPanel>
                </Border>
            </StackPanel>
        </ScrollViewer>

        <!-- PANEL INFERIOR: RESUMEN Y CONFIRMACIÓN -->
        <Border Grid.Row="2" 
                Background="#2d2d2d" 
                BorderBrush="#ff6b35" 
                BorderThickness="0,3,0,0"
                Padding="30,20">
            <Grid>
                <Grid.ColumnDefinitions>
                    <ColumnDefinition Width="*"/>
                    <ColumnDefinition Width="Auto"/>
                </Grid.ColumnDefinitions>

                <!-- RESUMEN -->
                <StackPanel Grid.Column="0">
                    <TextBlock Text="📊 Resumen de Reserva" 
                               FontSize="18" 
                               FontWeight="Bold" 
                               Foreground="#ff6b35"
                               Margin="0,0,0,10"/>

                    <TextBlock x:Name="TxtButacasSeleccionadas" 
                               Text="Butacas: Ninguna" 
                               FontSize="16" 
                               Foreground="White"
                               Margin="0,0,0,5"/>

                    <TextBlock x:Name="TxtTotal" 
                               Text="Total: €0.00" 
                               FontSize="20" 
                               FontWeight="Bold" 
                               Foreground="#4CAF50"
                               Margin="0,5,0,0"/>
                </StackPanel>

                <!-- BOTONES -->
                <StackPanel Grid.Column="1" Orientation="Horizontal">
                    <Button Content="Cancelar"
                            Width="150"
                            Height="45"
                            Background="#4a4a4a"
                            Foreground="White"
                            FontSize="16"
                            Margin="0,0,15,0"
                            Cursor="Hand"
                            Click="BtnCancelar_Click">
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
                                        <Setter Property="Background" Value="#5a5a5a"/>
                                    </Trigger>
                                </Style.Triggers>
                            </Style>
                        </Button.Style>
                    </Button>

                    <Button x:Name="BtnConfirmar"
                            Content="Confirmar Reserva"
                            Width="200"
                            Height="45"
                            Background="#ff6b35"
                            Foreground="White"
                            FontSize="16"
                            FontWeight="Bold"
                            IsEnabled="False"
                            Cursor="Hand"
                            Click="BtnConfirmarReserva_Click">
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
                                    <Trigger Property="IsEnabled" Value="False">
                                        <Setter Property="Background" Value="#666"/>
                                        <Setter Property="Foreground" Value="#999"/>
                                    </Trigger>
                                </Style.Triggers>
                            </Style>
                        </Button.Style>
                    </Button>
                </StackPanel>
            </Grid>
        </Border>
    </Grid>
</Window>
```

#### Paso 5.5.2: Código C# - PARTE 1 (SeleccionButacasWindow.xaml.cs)

```csharp
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
using Cine_app.Modelos;
using Cine_app.Servicios;

namespace Cine_app.Ventanas
{
    public partial class SeleccionButacasWindow : Window
    {
        private readonly Sesion sesionActual;
        private readonly ServicioBaseDeDatos servicioBD;
        private List<Butaca> todasLasButacas;
        private List<int> butacasOcupadas;
        private List<Butaca> butacasSeleccionadas;

        public SeleccionButacasWindow(Sesion sesion)
        {
            InitializeComponent();
            sesionActual = sesion;
            servicioBD = new ServicioBaseDeDatos();
            todasLasButacas = new List<Butaca>();
            butacasOcupadas = new List<int>();
            butacasSeleccionadas = new List<Butaca>();

            CargarInformacion();
        }

        /// <summary>
        /// Carga la información inicial de la sesión y butacas
        /// </summary>
        private async void CargarInformacion()
        {
            // Mostrar info de la sesión
            TxtInfoSesion.Text = $"{sesionActual.Pelicula?.Titulo} - " +
                                $"{sesionActual.FechaHoraFormateada} - " +
                                $"Sala {sesionActual.Sala?.Nombre} - " +
                                $"€{sesionActual.Precio}";

            await CargarButacas();
        }

        /// <summary>
        /// Carga las butacas de la sala y las que ya están reservadas
        /// </summary>
        private async System.Threading.Tasks.Task CargarButacas()
        {
            try
            {
                // Obtener todas las butacas de la sala
                todasLasButacas = await servicioBD.ObtenerButacasPorSalaAsync(sesionActual.SalaId);

                // Obtener butacas ya reservadas para esta sesión
                butacasOcupadas = await servicioBD.ObtenerButacasReservadasAsync(sesionActual.Id);

                // Crear la visualización
                CrearVisualizacionButacas();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error al cargar butacas: {ex.Message}", 
                    "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        /// <summary>
        /// Crea la visualización 3D de las butacas con efecto de perspectiva
        /// </summary>
        private void CrearVisualizacionButacas()
        {
            if (sesionActual.Sala == null) return;

            GridButacas.Children.Clear();
            GridButacas.RowDefinitions.Clear();
            GridButacas.ColumnDefinitions.Clear();

            int filas = sesionActual.Sala.Filas;
            int columnas = sesionActual.Sala.ColumnasPerFila;

            // Crear filas en el Grid
            for (int i = 0; i < filas; i++)
            {
                GridButacas.RowDefinitions.Add(new RowDefinition { Height = GridLength.Auto });
            }

            // Crear cada fila de butacas
            for (int fila = 1; fila <= filas; fila++)
            {
                // Calcular factor de escala para efecto 3D
                // Las filas de atrás son más grandes, las de adelante más pequeñas
                double scaleFactor = 1.0 - ((fila - 1) * 0.05);
                scaleFactor = Math.Max(scaleFactor, 0.6);  // Mínimo 60%

                // Tamaño base de las butacas
                double baseSize = 45;
                double buttonSize = baseSize * scaleFactor;

                // Crear panel horizontal para esta fila
                var filaPanel = new StackPanel
                {
                    Orientation = Orientation.Horizontal,
                    HorizontalAlignment = HorizontalAlignment.Center,
                    Margin = new Thickness(0, 5, 0, 5)
                };

                // Calcular espaciado lateral para efecto de cono (perspectiva)
                double maxWidth = columnas * baseSize;
                double currentWidth = columnas * buttonSize;
                double lateralSpacing = (maxWidth - currentWidth) / 2;

                filaPanel.Margin = new Thickness(lateralSpacing, 5, lateralSpacing, 5);

                // Añadir etiqueta de fila (A, B, C, etc.)
                char letraFila = (char)('A' + fila - 1);
                var lblFila = new TextBlock
                {
                    Text = letraFila.ToString(),
                    FontSize = 14 * scaleFactor,
                    FontWeight = FontWeights.Bold,
                    Foreground = Brushes.White,
                    VerticalAlignment = VerticalAlignment.Center,
                    Margin = new Thickness(0, 0, 10, 0),
                    Width = 25 * scaleFactor,
                    TextAlignment = TextAlignment.Center
                };
                filaPanel.Children.Add(lblFila);

                // Crear botones de butacas
                for (int columna = 1; columna <= columnas; columna++)
                {
                    var butaca = todasLasButacas.FirstOrDefault(
                        b => b.Fila == fila && b.Columna == columna);

                    if (butaca != null)
                    {
                        var btnButaca = CrearBotonButaca(butaca, buttonSize, fila, columna);
                        filaPanel.Children.Add(btnButaca);
                    }
                }

                Grid.SetRow(filaPanel, fila - 1);
                GridButacas.Children.Add(filaPanel);
            }
        }

        // Continúa en la siguiente parte...
    }
}
```

#### Paso 5.5.3: Código C# - PARTE 2 (continuación)

Agrega esto al mismo archivo `SeleccionButacasWindow.xaml.cs`:

```csharp
        /// <summary>
        /// Crea un botón para una butaca específica
        /// </summary>
        private Button CrearBotonButaca(Butaca butaca, double size, int fila, int columna)
        {
            bool estaOcupada = butacasOcupadas.Contains(butaca.Id);

            var button = new Button
            {
                Width = size,
                Height = size,
                Content = butaca.Identificador,
                Margin = new Thickness(2),
                FontSize = 12,
                FontWeight = FontWeights.Bold,
                Tag = butaca,
                Cursor = estaOcupada ? System.Windows.Input.Cursors.No : System.Windows.Input.Cursors.Hand,
                IsEnabled = !estaOcupada
            };

            // Establecer color según tipo y estado
            if (estaOcupada)
            {
                button.Background = new SolidColorBrush(Color.FromRgb(244, 67, 54));  // Rojo
                button.Foreground = Brushes.White;
            }
            else
            {
                // Color según tipo de butaca
                switch (butaca.Tipo)
                {
                    case "VIP":
                        button.Background = new SolidColorBrush(Color.FromRgb(255, 193, 7));  // Amarillo
                        button.Foreground = Brushes.Black;
                        break;
                    case "Discapacitado":
                        button.Background = new SolidColorBrush(Color.FromRgb(156, 39, 176));  // Morado
                        button.Foreground = Brushes.White;
                        break;
                    default:  // Normal
                        button.Background = new SolidColorBrush(Color.FromRgb(76, 175, 80));  // Verde
                        button.Foreground = Brushes.White;
                        break;
                }
            }

            // Evento click
            if (!estaOcupada)
            {
                button.Click += BtnButaca_Click;
            }

            // Estilo de bordes redondeados
            var template = new ControlTemplate(typeof(Button));
            var border = new FrameworkElementFactory(typeof(Border));
            border.SetValue(Border.CornerRadiusProperty, new CornerRadius(5));
            border.SetBinding(Border.BackgroundProperty, new System.Windows.Data.Binding("Background") { RelativeSource = new System.Windows.Data.RelativeSource(System.Windows.Data.RelativeSourceMode.TemplatedParent) });
            
            var contentPresenter = new FrameworkElementFactory(typeof(ContentPresenter));
            contentPresenter.SetValue(ContentPresenter.HorizontalAlignmentProperty, HorizontalAlignment.Center);
            contentPresenter.SetValue(ContentPresenter.VerticalAlignmentProperty, VerticalAlignment.Center);
            border.AppendChild(contentPresenter);
            
            template.VisualTree = border;
            button.Template = template;

            return button;
        }

        /// <summary>
        /// Maneja el click en una butaca (seleccionar/deseleccionar)
        /// </summary>
        private void BtnButaca_Click(object sender, RoutedEventArgs e)
        {
            var button = (Button)sender;
            var butaca = (Butaca)button.Tag;

            if (butacasSeleccionadas.Contains(butaca))
            {
                // Deseleccionar
                butacasSeleccionadas.Remove(butaca);

                // Restaurar color original
                switch (butaca.Tipo)
                {
                    case "VIP":
                        button.Background = new SolidColorBrush(Color.FromRgb(255, 193, 7));
                        button.Foreground = Brushes.Black;
                        break;
                    case "Discapacitado":
                        button.Background = new SolidColorBrush(Color.FromRgb(156, 39, 176));
                        button.Foreground = Brushes.White;
                        break;
                    default:
                        button.Background = new SolidColorBrush(Color.FromRgb(76, 175, 80));
                        button.Foreground = Brushes.White;
                        break;
                }
            }
            else
            {
                // Seleccionar
                butacasSeleccionadas.Add(butaca);
                button.Background = new SolidColorBrush(Color.FromRgb(33, 150, 243));  // Azul
                button.Foreground = Brushes.White;
            }

            ActualizarResumen();
        }

        /// <summary>
        /// Actualiza el resumen con las butacas seleccionadas y el total
        /// </summary>
        private void ActualizarResumen()
        {
            if (butacasSeleccionadas.Count == 0)
            {
                TxtButacasSeleccionadas.Text = "Butacas: Ninguna";
                TxtTotal.Text = "Total: €0.00";
                BtnConfirmar.IsEnabled = false;
            }
            else
            {
                var identificadores = butacasSeleccionadas
                    .OrderBy(b => b.Fila)
                    .ThenBy(b => b.Columna)
                    .Select(b => b.Identificador);

                TxtButacasSeleccionadas.Text = $"Butacas: {string.Join(", ", identificadores)}";
                
                decimal total = butacasSeleccionadas.Count * sesionActual.Precio;
                TxtTotal.Text = $"Total: €{total:0.00}";
                
                BtnConfirmar.IsEnabled = true;
            }
        }

        /// <summary>
        /// Confirma la reserva
        /// </summary>
        private async void BtnConfirmarReserva_Click(object sender, RoutedEventArgs e)
        {
            if (butacasSeleccionadas.Count == 0)
            {
                MessageBox.Show("Por favor, selecciona al menos una butaca.", 
                    "Aviso", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            if (!ServicioSesion.Instance.EstaAutenticado)
            {
                MessageBox.Show("Debes iniciar sesión para confirmar la reserva.", 
                    "Aviso", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            // Confirmación
            var identificadores = string.Join(", ", butacasSeleccionadas.Select(b => b.Identificador));
            var total = butacasSeleccionadas.Count * sesionActual.Precio;

            var resultado = MessageBox.Show(
                $"¿Confirmar reserva?\n\n" +
                $"Butacas: {identificadores}\n" +
                $"Total: €{total:0.00}",
                "Confirmar Reserva",
                MessageBoxButton.YesNo,
                MessageBoxImage.Question);

            if (resultado == MessageBoxResult.Yes)
            {
                await ProcesarReserva();
            }
        }

        /// <summary>
        /// Procesa y guarda la reserva en la base de datos
        /// </summary>
        private async System.Threading.Tasks.Task ProcesarReserva()
        {
            try
            {
                BtnConfirmar.IsEnabled = false;
                BtnConfirmar.Content = "Procesando...";

                var reserva = new Reserva
                {
                    UsuarioId = ServicioSesion.Instance.UsuarioActual!.Id,
                    SesionId = sesionActual.Id,
                    FechaReserva = DateTime.Now,
                    Total = butacasSeleccionadas.Count * sesionActual.Precio,
                    Estado = "Confirmada"
                };

                var butacaIds = butacasSeleccionadas.Select(b => b.Id).ToList();

                int reservaId = await servicioBD.CrearReservaAsync(reserva, butacaIds);

                if (reservaId > 0)
                {
                    // Obtener código de reserva
                    var reservas = await servicioBD.ObtenerReservasPorUsuarioAsync(reserva.UsuarioId);
                    var reservaCreada = reservas.FirstOrDefault(r => r.Id == reservaId);

                    MessageBox.Show(
                        $"¡Reserva confirmada con éxito!\n\n" +
                        $"Código de reserva: {reservaCreada?.CodigoReserva ?? "N/A"}\n" +
                        $"Butacas: {string.Join(", ", butacasSeleccionadas.Select(b => b.Identificador))}\n" +
                        $"Total: €{reserva.Total:0.00}\n\n" +
                        $"Puedes ver tus reservas en tu perfil.",
                        "Reserva Exitosa",
                        MessageBoxButton.OK,
                        MessageBoxImage.Information);

                    DialogResult = true;
                    Close();
                }
                else
                {
                    MessageBox.Show("Error al procesar la reserva. Intenta nuevamente.", 
                        "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error al procesar reserva: {ex.Message}", 
                    "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            finally
            {
                BtnConfirmar.IsEnabled = true;
                BtnConfirmar.Content = "Confirmar Reserva";
            }
        }

        /// <summary>
        /// Cancela la selección de butacas
        /// </summary>
        private void BtnCancelar_Click(object sender, RoutedEventArgs e)
        {
            var resultado = MessageBox.Show(
                "¿Seguro que deseas cancelar la selección?",
                "Cancelar",
                MessageBoxButton.YesNo,
                MessageBoxImage.Question);

            if (resultado == MessageBoxResult.Yes)
            {
                DialogResult = false;
                Close();
            }
        }
    }
}
```

**📝 Conceptos avanzados explicados:**

1. **Efecto de perspectiva 3D:**
   - `scaleFactor`: Reduce el tamaño de las filas delanteras
   - `lateralSpacing`: Añade espaciado lateral para simular profundidad

2. **Estados de botones:**
   - Verde: Disponible
   - Azul: Seleccionada
   - Rojo: Ocupada
   - Amarillo: VIP
   - Morado: Discapacitado

3. **Transacciones:**
   - Todo se guarda o nada (evita reservas incompletas)

---

**Continúa en GUIA_PASO_A_PASO_PARTE_4.md** con:
- Ventana de Perfil de Usuario
- Configuración final de App.xaml
- Pruebas y depuración
- Errores comunes y soluciones
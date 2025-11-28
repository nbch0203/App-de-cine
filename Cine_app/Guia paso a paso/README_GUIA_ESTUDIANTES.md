# 🎬 GUÍA COMPLETA - SISTEMA DE RESERVA DE CINE

## 📚 Índice de la Guía

Esta guía está dividida en **4 partes** para facilitar su lectura y seguimiento. Cada parte cubre aspectos específicos del desarrollo del proyecto.

---

## 📖 Estructura de la Guía

### 📄 [PARTE 1: Preparación y Fundamentos](GUIA_PASO_A_PASO_PARA_ESTUDIANTES.md)
**Duración estimada:** 2-3 horas

**Contenido:**
- ✅ Requisitos previos y herramientas necesarias
- ✅ Creación del proyecto en Visual Studio
- ✅ Instalación de paquetes NuGet (MySQL, DotNetEnv)
- ✅ Estructura de carpetas del proyecto
- ✅ Configuración de la base de datos MySQL
- ✅ Creación de todas las tablas
- ✅ Inserción de datos de prueba
- ✅ Configuración del archivo .env
- ✅ **MODELOS**: Creación de todas las clases (Usuario, Pelicula, Sesion, Butaca, Reserva)
- ✅ **SERVICIOS**: ServicioBaseDeDatos completo con todos los métodos
- ✅ **SERVICIOS**: ServicioSesion (patrón Singleton)

**Lo que aprenderás:**
- Configuración de proyectos WPF
- Conexión a MySQL
- Modelado de datos
- Patrón Repository
- Patrón Singleton
- Programación asíncrona

---

### 📄 [PARTE 2: Ventanas Básicas](GUIA_PASO_A_PASO_PARTE_2.md)
**Duración estimada:** 3-4 horas

**Contenido:**
- ✅ Configuración de App.xaml y App.xaml.cs
- ✅ **CarteleraWindow**: Ventana principal con grid de películas
  - Diseño XAML completo
  - Código C# con carga dinámica de películas
  - Gestión de estado de sesión
- ✅ **LoginWindow**: Ventana de inicio de sesión
  - Formulario de login
  - Validación de credenciales
  - Manejo de errores
- ✅ **RegistroWindow**: Ventana de registro de usuarios
  - Formulario completo de registro
  - Validaciones (email, contraseña, etc.)
  - Verificación de email único

**Lo que aprenderás:**
- Diseño de interfaces con XAML
- Creación de formularios
- Validación de datos de usuario
- Eventos y manejo de clicks
- Navegación entre ventanas

---

### 📄 [PARTE 3: Ventanas Avanzadas](GUIA_PASO_A_PASO_PARTE_3.md)
**Duración estimada:** 4-5 horas

**Contenido:**
- ✅ **SeleccionSesionWindow**: Selección de horarios
  - Calendario interactivo
  - Lista dinámica de sesiones
  - Data binding con ItemsControl
  - Verificación de autenticación
- ✅ **SeleccionButacasWindow**: Selección visual de butacas (¡LA MÁS COMPLEJA!)
  - Visualización 3D con efecto de perspectiva
  - Grid dinámico de butacas
  - Estados de butacas (disponible, ocupada, seleccionada)
  - Tipos de butacas (Normal, VIP, Discapacitado)
  - Cálculo en tiempo real del total
  - Transacciones en base de datos

**Lo que aprenderás:**
- Controles avanzados (Calendar, ItemsControl)
- Data binding y DataTemplates
- Creación dinámica de controles
- Efectos visuales (perspectiva 3D)
- Transacciones en BD
- Manejo de estados complejos

---

### 📄 [PARTE 4: Perfil, Configuración y Pruebas](GUIA_PASO_A_PASO_PARTE_4.md)
**Duración estimada:** 2-3 horas

**Contenido:**
- ✅ **PerfilUsuarioWindow**: Gestión de perfil
  - Panel de información personal
  - Cambio de contraseña
  - Historial de reservas
  - DataTemplates para mostrar reservas
- ✅ Configuración final de App.xaml
- ✅ Verificación del .csproj
- ✅ **Pruebas completas** de todas las funcionalidades
- ✅ **Solución de problemas comunes**:
  - Errores de conexión a MySQL
  - Problemas con tablas
  - Imágenes que no cargan
  - Errores de reserva
- ✅ **Mejoras futuras** sugeridas
- ✅ Checklist final
- ✅ Recursos adicionales para seguir aprendiendo

**Lo que aprenderás:**
- Gestión de perfiles de usuario
- Actualización de datos
- Testing de aplicaciones
- Debugging y solución de problemas
- Mejores prácticas

---

## 🎯 Flujo de Aprendizaje Recomendado

```
┌─────────────────────────────────────────────────────────────┐
│                    INICIO DEL PROYECTO                      │
└─────────────────────┬───────────────────────────────────────┘
                      │
                      ▼
┌─────────────────────────────────────────────────────────────┐
│  PARTE 1: Preparación                                       │
│  ├─ Instalar herramientas                                   │
│  ├─ Crear proyecto                                          │
│  ├─ Configurar MySQL                                        │
│  ├─ Crear modelos                                           │
│  └─ Crear servicios                                         │
└─────────────────────┬───────────────────────────────────────┘
                      │
                      ▼
┌─────────────────────────────────────────────────────────────┐
│  PARTE 2: Ventanas Básicas                                  │
│  ├─ CarteleraWindow                                         │
│  ├─ LoginWindow                                             │
│  └─ RegistroWindow                                          │
│                                                             │
│  ⚠️ PRUEBA: Verifica que login/registro funcionen          │
└─────────────────────┬───────────────────────────────────────┘
                      │
                      ▼
┌─────────────────────────────────────────────────────────────┐
│  PARTE 3: Ventanas Avanzadas                                │
│  ├─ SeleccionSesionWindow                                   │
│  └─ SeleccionButacasWindow (la más compleja)                │
│                                                             │
│  ⚠️ PRUEBA: Verifica que las reservas funcionen            │
└─────────────────────┬───────────────────────────────────────┘
                      │
                      ▼
┌─────────────────────────────────────────────────────────────┐
│  PARTE 4: Final                                             │
│  ├─ PerfilUsuarioWindow                                     │
│  ├─ Configuración final                                     │
│  ├─ Pruebas completas                                       │
│  └─ Solución de problemas                                   │
└─────────────────────┬───────────────────────────────────────┘
                      │
                      ▼
┌─────────────────────────────────────────────────────────────┐
│               ¡PROYECTO TERMINADO! 🎉                       │
└─────────────────────────────────────────────────────────────┘
```

---

## ⏱️ Tiempo Total Estimado

| Parte | Duración | Dificultad |
|-------|----------|------------|
| Parte 1 | 2-3 horas | ⭐⭐ Fácil |
| Parte 2 | 3-4 horas | ⭐⭐⭐ Media |
| Parte 3 | 4-5 horas | ⭐⭐⭐⭐ Avanzada |
| Parte 4 | 2-3 horas | ⭐⭐⭐ Media |
| **TOTAL** | **11-15 horas** | |

> 💡 **Tip:** No intentes hacerlo todo de una vez. Tómate descansos y ve paso por paso.

---

## 🎓 Nivel del Estudiante

Esta guía está diseñada para estudiantes que:

### ✅ Ya conocen:
- C# básico (variables, clases, métodos)
- Conceptos de programación orientada a objetos
- SQL básico (SELECT, INSERT, UPDATE)
- Visual Studio (lo básico)

### 📚 Van a aprender:
- WPF y XAML
- Conexión a bases de datos
- Programación asíncrona (async/await)
- Patrones de diseño (Singleton, Repository)
- Data binding
- Eventos y navegación
- Transacciones en BD
- Creación de interfaces avanzadas

---

## 📁 Estructura Final del Proyecto

Al terminar, tu proyecto tendrá esta estructura:

```
Cine_app/
│
├── 📂 Modelos/
│   ├── Usuario.cs
│   ├── Pelicula.cs
│   ├── Sesion.cs
│   └── Butaca.cs
│
├── 📂 Servicios/
│   ├── ServicioBaseDeDatos.cs
│   └── ServicioSesion.cs
│
├── 📂 Ventanas/
│   ├── CarteleraWindow.xaml / .cs
│   ├── LoginWindow.xaml / .cs
│   ├── RegistroWindow.xaml / .cs
│   ├── SeleccionSesionWindow.xaml / .cs
│   ├── SeleccionButacasWindow.xaml / .cs
│   └── PerfilUsuarioWindow.xaml / .cs
│
├── 📂 Database/
│   └── cinema_database_mysql.sql
│
├── 📄 App.xaml / .cs
├── 📄 .env
├── 📄 Cine_app.csproj
└── 📄 .gitignore
```

---

## 🎯 Funcionalidades Completas

Al finalizar la guía, tu aplicación tendrá:

### 🎬 Cartelera
- [x] Visualización de películas activas
- [x] Información detallada de cada película
- [x] Imágenes de posters
- [x] Navegación a horarios

### 👤 Usuarios
- [x] Registro de nuevos usuarios
- [x] Validación de formularios
- [x] Inicio de sesión
- [x] Cierre de sesión
- [x] Gestión de perfil
- [x] Cambio de contraseña

### 📅 Sesiones
- [x] Calendario interactivo
- [x] Lista de horarios por día
- [x] Información de sala y precio
- [x] Verificación de autenticación

### 💺 Reservas
- [x] Visualización 3D de la sala
- [x] Estados de butacas (disponible/ocupada)
- [x] Tipos de butacas (Normal/VIP/Discapacitado)
- [x] Selección múltiple de butacas
- [x] Cálculo automático del total
- [x] Generación de código de reserva
- [x] Transacciones seguras

### 📊 Historial
- [x] Ver reservas activas
- [x] Detalles de cada reserva
- [x] Códigos de reserva

---

## 🛠️ Herramientas Necesarias

Antes de empezar, asegúrate de tener:

| Herramienta | Versión | Obligatorio | Descarga |
|------------|---------|-------------|----------|
| Visual Studio | 2022+ | ✅ Sí | [Link](https://visualstudio.microsoft.com/) |
| .NET SDK | 8.0+ | ✅ Sí | Incluido en VS |
| MySQL Server | 8.0+ | ✅ Sí | [Link](https://dev.mysql.com/downloads/mysql/) |
| MySQL Workbench | 8.0+ | ⭕ Recomendado | [Link](https://dev.mysql.com/downloads/workbench/) |
| Dbeaver | Última | ⭕ La que he usado yo | [Link](https://dbeaver.io/download/) |

---

## 📝 Antes de Empezar

### Checklist Previo:
- [ ] Visual Studio instalado
- [ ] MySQL instalado y ejecutándose
- [ ] Conocimientos básicos de C#
- [ ] Ganas de aprender 😊

### Consejos:
1. **Lee primero, codifica después**: Lee cada sección completa antes de escribir código
2. **Copia el código con cuidado**: Presta atención a los detalles
3. **Prueba frecuentemente**: No esperes al final para probar
4. **Usa el debugger**: Aprende a usar breakpoints (F9)
5. **Lee los errores**: Los mensajes te dicen exactamente qué está mal

---

## 🚀 ¿Listo para Empezar?

Comienza con **[PARTE 1: Preparación y Fundamentos](GUIA_PASO_A_PASO_PARA_ESTUDIANTES.md)**

---

## 🆘 Ayuda y Soporte

### Si tienes problemas:

1. **Revisa los mensajes de error** cuidadosamente
2. **Verifica MySQL**: ¿Está ejecutándose?
3. **Revisa el .env**: ¿Contraseña correcta?
4. **Consulta la Parte 4**: Sección "Solución de Problemas Comunes"
5. **Google es tu amigo**: Busca el error específico

### Recursos útiles:
- [Stack Overflow](https://stackoverflow.com/)
- [Microsoft Learn](https://learn.microsoft.com/es-es/)
- [MySQL Documentation](https://dev.mysql.com/doc/)

---

## 📌 Documentación Adicional

Además de esta guía, el proyecto incluye:
- **DOCUMENTACION_COMPLETA_PROYECTO.md**: Documentación técnica completa del proyecto final

---

## ✨ Créditos

**Proyecto educativo:** Sistema de Reserva de Cine  
**Tecnologías:** C#, WPF, MySQL  
**Framework:** .NET 10  
**Propósito:** Aprendizaje de desarrollo de aplicaciones de escritorio

---

## 📄 Licencia

Este proyecto es educativo y de libre para aprendizaje.

---

**¡Mucha suerte con tu proyecto! 🎬🍿**
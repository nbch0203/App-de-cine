using System;
using System.Collections.Generic;
using System.Text;

namespace Cine_app.Modelos
{
    public class Usuario
    {
        public int Id { get; set; }
        public string Nombre { get; set; } = string.Empty;
        public string Apellidos { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
        public string Password { get; set; } = string.Empty;
        public string? Telefono { get; set; }
        public DateTime FechaRegistro { get; set; }
        public bool Activo { get; set; } = true;

        public string NombreCompleto => $"{Nombre} {Apellidos}";
    }
}

using System;
using System.Collections.Generic;
using System.Text;

namespace Cine_app.Models
{
    public class Pelicula
    {
        public int Id { get; set; }
        public string Titulo { get; set; } = string.Empty;
        public string? Descripcion { get; set; }
        public string? Director { get; set; }
        public int? Duracion { get; set; } // En minutos
        public string? Genero { get; set; }
        public DateTime? FechaEstreno { get; set; }
        public string? ImagenUrl { get; set; }
        public decimal? Calificacion { get; set; }
        public bool Activa { get; set; } = true;
    }
}
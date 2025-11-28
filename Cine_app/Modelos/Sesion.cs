using Cine_app.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace Cine_app.Modelos
{
    public class Sesion
    {
        public int Id { get; set; }
        public int PeliculaId { get; set; }
        public int SalaId { get; set; }
        public DateTime FechaHora { get; set; }
        public decimal Precio { get; set; }
        public bool Activa { get; set; } = true;

        // Propiedades de navegación
        public Pelicula? Pelicula { get; set; }
        public Sala? Sala { get; set; }

        public string FechaHoraFormateada => FechaHora.ToString("dd/MM/yyyy HH:mm");
    }

    public class Sala
    {
        public int Id { get; set; }
        public string Nombre { get; set; } = string.Empty;
        public int Filas { get; set; }
        public int ColumnasPerFila { get; set; }
        public int CapacidadTotal => Filas * ColumnasPerFila;
    }
}

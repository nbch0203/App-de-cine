namespace Cine_app.Modelos
{
    public class Butaca
    {
        public int Id { get; set; }
        public int SalaId { get; set; }
        public int Fila { get; set; }
        public int Columna { get; set; }
        public string Tipo { get; set; } = "Normal"; // Normal, VIP, Discapacitado
        public bool Activa { get; set; } = true;

        public string Identificador => $"{(char)('A' + Fila - 1)}{Columna}";
    }

    public class Reserva
    {
        public int Id { get; set; }
        public int UsuarioId { get; set; }
        public int SesionId { get; set; }
        public DateTime FechaReserva { get; set; }
        public decimal Total { get; set; }
        public string Estado { get; set; } = "Pendiente"; // Pendiente, Confirmada, Cancelada
        public string? CodigoReserva { get; set; }

        // Propiedades de navegación
        public Usuario? Usuario { get; set; }
        public Sesion? Sesion { get; set; }
        public List<ReservaButaca> Butacas { get; set; } = new();
    }

    public class ReservaButaca
    {
        public int Id { get; set; }
        public int ReservaId { get; set; }
        public int ButacaId { get; set; }
        public int SesionId { get; set; }

        // Propiedades de navegación
        public Butaca? Butaca { get; set; }
    }

    // Clase para el binding de reservas en la UI
    public class ReservaViewModel
    {
        public Sesion Sesion { get; set; } = new();
        public decimal Total { get; set; }
        public string CodigoReserva { get; set; } = string.Empty;
        public string Butacas { get; set; } = string.Empty;
    }
}
using Cine_app.Modelos;
using System;
using System.Collections.Generic;
using System.Text;

namespace Cine_app.Servicios
{
    public class ServicioSesion
    {
        private static ServicioSesion? _instance;
        public static ServicioSesion Instance => _instance ??= new ServicioSesion();

        public Usuario? UsuarioActual { get; private set; }
        public bool EstaAutenticado => UsuarioActual != null;

        public event EventHandler? SesionIniciada;
        public event EventHandler? SesionCerrada;

        private ServicioSesion() { }

        public void IniciarSesion(Usuario usuario)
        {
            UsuarioActual = usuario;
            SesionIniciada?.Invoke(this, EventArgs.Empty);
        }

        public void CerrarSesion()
        {
            UsuarioActual = null;
            SesionCerrada?.Invoke(this, EventArgs.Empty);
        }
    }
}

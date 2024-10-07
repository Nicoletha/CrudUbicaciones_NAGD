using System;
using System.Data;
using System.Web.UI.WebControls;
using BLL;
using DAL;

namespace CrudUbicaciones_NAGD
{
    public partial class frmUbicaciones : System.Web.UI.Page
    {
        ubicaciones_DAL oUbicacionesDAL;
        ubicaciones oUbicacionesBLL;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ListarUbicaciones();
            }
        }

        //Método encargado de listar los datos de la BD en un GridView
        public void ListarUbicaciones()
        {
            oUbicacionesDAL = new ubicaciones_DAL();
            gvUbicaciones.DataSource = oUbicacionesDAL.Listar();
            gvUbicaciones.DataBind();
        }

        //Método encargado de recolectar los datos de la interfaz
        public ubicaciones datosUbicacion()
        {
            int ID = 0;
            int.TryParse(txtID.Value, out ID);
            oUbicacionesBLL = new ubicaciones();

            //Recolectar datos de la capa presentación
            oUbicacionesBLL.ID = ID;
            oUbicacionesBLL.Ubicacion = txtUbicacion.Text;
            oUbicacionesBLL.Latitud = txtLat.Text;
            oUbicacionesBLL.Longitud = txtLong.Text;

            return oUbicacionesBLL;
        }

        protected void AgregarRegistro(object sender, EventArgs e)
        {
            oUbicacionesDAL = new ubicaciones_DAL();
            oUbicacionesDAL.Agregar(datosUbicacion());
            ListarUbicaciones(); // Para actualizar el GridView después de agregar
        }

        protected void ModificarRegistro(object sender, EventArgs e)
        {
            oUbicacionesDAL = new ubicaciones_DAL();
            oUbicacionesDAL.Modificar(datosUbicacion());
            ListarUbicaciones(); // Para actualizar el GridView después de modificar
        }

        protected void gvUbicaciones_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "btnSeleccionar")
            {
                int indice = Convert.ToInt32(e.CommandArgument);
                GridViewRow filaSeleccion = gvUbicaciones.Rows[indice];

                string idUbicacion = filaSeleccion.Cells[1].Text;
                string ubicacion = filaSeleccion.Cells[2].Text;
                string latitud = filaSeleccion.Cells[3].Text;
                string longitud = filaSeleccion.Cells[4].Text;

                txtID.Value = idUbicacion;
                txtUbicacion.Text = ubicacion;
                txtLat.Text = latitud;
                txtLong.Text = longitud;
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            oUbicacionesDAL = new ubicaciones_DAL();

            // Pasar solo el ID para eliminar el registro
            int ubicacionID = datosUbicacion().ID;

            oUbicacionesDAL.Eliminar(ubicacionID);
            ListarUbicaciones(); // Para actualizar el GridView después de eliminar
        }

    }
}

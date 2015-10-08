using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ExamenBLL;
using ExamenDAL;

namespace Examen.Subastas
{
    public partial class Subasta_i : CdisPage
    {
        #region Eventos
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            SubastaBLL bl = new SubastaBLL();
            DateTime fechaActual = DateTime.Now;
            DateTime fechaInicio = Convert.ToDateTime(txtInicio.Text);
            DateTime fechaFin = Convert.ToDateTime(txtFin.Text);
            List<Auction> lstSubastas = new List<Auction>();
            User User = (User)Session["User"];
            int id = User.UserId;
            int conteo = 0;
            lstSubastas = bl.ConteoDeSubastas(id);
            foreach(Auction subasta in lstSubastas){
                if (subasta.StartDate < Convert.ToDateTime(txtInicio.Text) && subasta.EndDate > Convert.ToDateTime(txtInicio.Text))
                {
                    conteo++;
                }
            }
            if (conteo >= 3) {
                ClientScript.RegisterStartupScript(this.GetType(), "alerta", "alert('No se pueden tener mas de 3 subastas activas sumultaneamente')", true);
            }
            else
            {
                if (fechaInicio >= fechaActual && fechaFin > fechaInicio)
                {
                    Auction subasta = new Auction();
                    subasta.ProductName = txtNombre.Text;
                    subasta.Description = txtDescripcion.Text;
                    subasta.StartDate = Convert.ToDateTime(txtInicio.Text);
                    subasta.EndDate = Convert.ToDateTime(txtFin.Text);
                    subasta.UserId = id;
                    subasta.HighestBid = 0;
                    bl.AgregarNuevaSubasta(subasta);
                    ClientScript.RegisterStartupScript(this.GetType(), "alerta", "alert('Subasta Agregada Exitosamente')", true);
                }
                else {
                    ClientScript.RegisterStartupScript(this.GetType(), "alerta", "alert('La fecha de incio de la subasta debe ser despues de hoy y la final despues de la de inicio')", true);
                }
            }
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Subastas/Subasta_s.aspx");
        }

        #endregion

        #region Metodos

        #endregion
    }
}
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
    public partial class Subasta_s : CdisPage
    {
        #region Eventos
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                cargarSubastas();
            }
        }

        protected void grdSubasta_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Historial")
            {
                Response.Redirect("~/Subastas/Subasta_h.aspx?pId=" + e.CommandArgument);    //?pId es el nombre de Tuple argumento
            }
            else {
                if (e.CommandName == "Nombre") {
                    Response.Redirect("~/Subastas/Subasta_m.aspx?pId=" + e.CommandArgument);
                }
            }
        }

        #endregion

        #region Metodos

        public void cargarSubastas() {

            SubastaBLL bl = new SubastaBLL();

            List<Auction> lstsubasta = new List<Auction>();

            lstsubasta = bl.cargarSubastas();

            grdSubasta.DataSource = lstsubasta;
            grdSubasta.DataBind();

        }

        public void cargarFiltro() 
        {
            SubastaBLL bl = new SubastaBLL();

            List<Auction> lstsubasta = new List<Auction>();
        }

        #endregion

        
    }
}
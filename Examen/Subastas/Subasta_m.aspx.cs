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
    public partial class Subasta_m : CdisPage
    {
        #region Eventos
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
               cargarSubasta(Convert.ToInt32(Request.QueryString["pId"]));
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            decimal ofertaAcutual = Convert.ToDecimal(txtOfertaActual.Text);
            decimal oferta = Convert.ToDecimal(txtOfertar.Text);
            DateTime fechaInicio;
            DateTime fechaFinal;
            DateTime FechaActual;
            FechaActual= DateTime.Now;
            fechaInicio = Convert.ToDateTime(txtInicio.Text);
            fechaFinal = Convert.ToDateTime(txtFin.Text);
            if (fechaInicio <= FechaActual && fechaFinal >= FechaActual)
            {
                if (ofertaAcutual < oferta)
                {
                    SubastaBLL bl = new SubastaBLL();
                    Auction subasta = new Auction();
                    AuctionRecord record = new AuctionRecord();
                    subasta.AuctionId = Convert.ToInt32(txtNumSubasta.Text);
                    subasta.ProductName = txtNombre.Text;
                    subasta.Description = txtDescripcion.Text;
                    subasta.StartDate = Convert.ToDateTime(txtInicio.Text);
                    subasta.EndDate = Convert.ToDateTime(txtFin.Text);
                    subasta.HighestBid = Convert.ToDecimal(txtOfertar.Text);
                    User user = new User();
                    user = (User)Session["User"];
                    subasta.Winner = user.UserId;
                    bl.UpdateSubasta(subasta);
                    record.AuctionId = Convert.ToInt32(txtNumSubasta.Text);
                    record.UserId = user.UserId;
                    record.Amount = Convert.ToDecimal(txtOfertar.Text);
                    record.BidDate = Convert.ToDateTime(FechaActual);
                    bl.AgregarAuctionRecord(record);
                    ClientScript.RegisterStartupScript(this.GetType(), "alerta", "alert('La oferta se realizo corretamente')", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alerta", "alert('La oferta debe ser mayor a la actual')", true);
                }
            }
            else {
                ClientScript.RegisterStartupScript(this.GetType(), "alerta", "alert('Error, La subasta Estara disponible en las fechas marcadas')", true);
            }


        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Subastas/Subasta_s.aspx");
        }
        #endregion

        #region Metodos

        public void cargarSubasta(int id) {
            SubastaBLL bl = new SubastaBLL();
            Auction subasta = new Auction();
            subasta = bl.cargarSubastaEspecifico(id);
            int? IdUser = subasta.Winner;
            if (IdUser != null)
            {
                User usuario = new User();
                usuario = bl.cargarNombreUsuario(IdUser);
                txtUsuarioOferta.Text = usuario.Name;
            }
            else
            {
                txtUsuarioOferta.Text = subasta.Winner.ToString();
            }
            txtNumSubasta.Text = subasta.AuctionId.ToString();
            txtNombre.Text = subasta.ProductName.ToString();
            txtDescripcion.Text = subasta.Description.ToString();
            txtInicio.Text = subasta.StartDate.ToShortDateString();
            txtFin.Text = subasta.EndDate.ToShortDateString();
            txtOfertaActual.Text = subasta.HighestBid.ToString();
            User user = new User();
            user = (User)Session["User"];
        }
        #endregion

        

    }
}
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
    public partial class Subasta_h : CdisPage
    {
        #region Eventos
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int id = (Convert.ToInt32(Request.QueryString["pId"]));
                cargarHistorial(Convert.ToInt32(Request.QueryString["pId"]));
                cargarDdlUsuario();
                ViewState["AuctionID"] = Convert.ToInt32(Request.QueryString["pId"]);
                suma();
            }
        }

        protected void ddlUsuario_SelectedIndexChanged(object sender, EventArgs e)
        {
            int AuctionId = (int)ViewState["AuctionID"];
            SubastaBLL bl = new SubastaBLL();
            int opcion = Convert.ToInt32(ddlUsuario.SelectedValue);
            if (opcion == 0)
            {
                List<AuctionRecord> lstRecord = new List<AuctionRecord>();
                lstRecord = bl.cargarAuctionrecord(AuctionId);
                ViewState["lstRecord"] = lstRecord;
                grdHistorial.DataSource = lstRecord;
                grdHistorial.DataBind();
                suma();
            }
            else
            {
                opcion = Convert.ToInt32(ddlUsuario.SelectedValue);
                List<AuctionRecord> lstRecord = new List<AuctionRecord>();
                lstRecord = bl.CargarDDLGRID(AuctionId, opcion);
                ViewState["lstRecord"] = lstRecord;
                grdHistorial.DataSource = lstRecord;
                grdHistorial.DataBind();
                suma();
            }
        }



        #endregion

        #region Metodos



        public void cargarHistorial(int AuctionID)
        {
                SubastaBLL bl = new SubastaBLL();
                Auction subasta = new Auction();
                subasta = bl.cargarSubastaHistorial(AuctionID);
                txtProducto.Text = subasta.ProductName;
                txtDescripcion.Text = subasta.Description;
                List<AuctionRecord> lstRecord = new List<AuctionRecord>();
                lstRecord = bl.cargarAuctionrecord(AuctionID);
                ViewState["lstRecord"] = lstRecord;
                grdHistorial.DataSource = lstRecord;
                grdHistorial.DataBind();
                ScriptManager.RegisterStartupScript(this, typeof(Page), "calculateTotal", "calculateTotal()", true);
            }

        public void cargarDdlUsuario()
        {
            SubastaBLL bl = new SubastaBLL();
            List<AuctionRecord> lstRecord = new List<AuctionRecord>();
            lstRecord = (List<AuctionRecord>)ViewState["lstRecord"];
            List<User> lstUser = new List<User>();
            
            foreach (AuctionRecord rec in lstRecord)
            {
                User usuario = new User();
                usuario = rec.User;
                User prod = lstUser.Find(p => p.UserName == usuario.UserName);
                if(prod != null){
                }else{
                lstUser.Add(usuario);
                }
            }
            ddlUsuario.DataTextField = "UserName";
            ddlUsuario.DataValueField = "UserId";
            ddlUsuario.DataSource = lstUser;
            ddlUsuario.DataBind();
            ddlUsuario.Items.Insert(0, new ListItem("Seleccione ..", "0"));

        }

       

        public void suma()
        {
            ScriptManager.RegisterStartupScript(this, typeof(Page), "calculateTotal", "calculateTotal()", true);
            AuctionRecord record = new AuctionRecord();
            List<AuctionRecord> lstRecord = new List<AuctionRecord>();
            lstRecord = (List<AuctionRecord>)ViewState["lstRecord"];
            decimal suma = 0;
            foreach (AuctionRecord rec in lstRecord)
            {
                suma = suma + rec.Amount;
            }
            txtSuma.Text = suma.ToString();
        }
        #endregion


    }
}
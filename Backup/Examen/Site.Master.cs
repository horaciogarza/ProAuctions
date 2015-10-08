using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ExamenDAL;

namespace Examen
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }
            else
            {
                User user = (User)Session["User"]; // manera 2 asiganrlo y usarlo despues
                lblTitulo.Text = user.Name; // aqui se utliza en metodo 2
                //lblTitulo.Text = ((AlumnoData)Session["usuario"]).ToString(); //manera 1 ya castearlo directo
            }
        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            //Session["usuario"] = null;    Se vacia un parametro en especifico
            Session.Clear();  //se vacia toda la sesion completa
            Response.Redirect("~/Login.aspx");
        }
    }
}

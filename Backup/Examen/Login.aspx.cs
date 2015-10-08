using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ExamenBLL;
using ExamenDAL;

namespace Examen
{
    public partial class Login : System.Web.UI.Page
    {
        #region Eventos
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            try
            {
                LoginBLL bl = new LoginBLL();
                string username;
                string password;
                username = txtUsuario.Text;
                password = txtPassword.Text;

                bl.consultarUserPorUsername(username, password);

                User user = new User();
                user = bl.consultarUserPorUsername(username, password).First();
                Session["User"] = user;
                Response.Redirect("~/Users/User_s.aspx");

            }
            catch (Exception ex)
            {

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + ex.Message + "')", true);
                //Session["User"] = null;

            }
        }
        #endregion

        #region Metodos
        
        protected void btnRegistro_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/NuevoR/NuevoRegistro.aspx");
        }



        #endregion
    }
}
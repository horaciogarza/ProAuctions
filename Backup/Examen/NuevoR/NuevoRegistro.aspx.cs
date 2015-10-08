using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ExamenBLL;
using ExamenDAL;

namespace Examen.NuevoRegistro
{
    public partial class NuevoRegistro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAgergar_Click(object sender, EventArgs e)
        {
            LoginBLL bl = new LoginBLL();
            User usuario = new User();
            usuario.UserName = txtUserName.Text;
            usuario.Password = txtPassword.Text;
            usuario.Name = txtUserName.Text;
            usuario.Email = txtEmail.Text;
            string correo = txtEmail.Text;
            string username = txtUserName.Text;
            if (bl.validarUsuarioUnico(username))
            {
                if (bl.validarCorreoUnico(correo))
                {
                    if (txtPassword.Text == txtConfirmPassword.Text)
                    {
                        bl.nuevoRegistro(usuario);
                        ClientScript.RegisterStartupScript(this.GetType(), "alerta", "alert('Registro Agregado Exitosamente')", true);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alerta", "alert('Las contraseñas no coinciden')", true);
                        txtConfirmPassword.Text = "";
                        txtPassword.Text = "";
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alerta", "alert('Este correo ya se utilizo')", true);
                }
            }
            else {
                ClientScript.RegisterStartupScript(this.GetType(), "alerta", "alert('El userName ya se utilizo')", true);
            }
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }
    }
}
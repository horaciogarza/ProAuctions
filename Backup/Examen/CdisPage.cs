using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ExamenDAL;

namespace Examen
{
    public class CdisPage : System.Web.UI.Page
    {
        protected void page_PreInit(object sender, EventArgs e)
        {
            User usuario = (User)Session["User"];
            if (usuario.Name == null)
            {
                Page.Theme = "Theme1";
                Page.MasterPageFile = "/Site.Master";
            }
            else
            {
                if (usuario.Name == "Abraham Barcenas")
                {
                    Page.Theme = "Theme2";
                    Page.MasterPageFile = "/Site.Master";
                }
                else
                {
                    Page.Theme = "Theme1";
                    Page.MasterPageFile = "/Site.Master";
                }
            }
        }
    }
}
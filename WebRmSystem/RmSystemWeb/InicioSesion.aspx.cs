using CapaAccesoDatos;
using CapaEntidades;
using CapaPresentacion.Custom;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RmSystemWeb
{
    public partial class InicioSesion : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            User objUser = UserDAO.getInstance().Login(txtEmail.Text, txtPassword.Text);
            if (objUser != null)
            {
                llenarSession(objUser);
                //Response.Redirect("GraficosAdmin.aspx");
                if (objUser.IS_ADMIN)
                {
                    Response.Redirect("AdminReportes.aspx");
                }
                else
                {
                    Response.Redirect("GeneralReportes.aspx");
                }
            }
            else
            {
                Response.Write("<script>alert('USUARIO INCORRECTO.')</script>");
            }
        }
        private void llenarSession(User objUser)
        {
            SessionManager = new SessionManager(Session);
            SessionManager.UserSession = objUser.USER_ID.ToString();
            SessionManager.UserNameSession = objUser.FIRST_NAME + ' ' + objUser.LAST_NAME;
            SessionManager.UserEmailSession = objUser.EMAIL;
        }
    }
}
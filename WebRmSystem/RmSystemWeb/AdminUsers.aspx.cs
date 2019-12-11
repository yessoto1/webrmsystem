using CapaAccesoDatos;
using CapaEntidades;
using CapaPresentacion.Custom;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RmSystemWeb
{
    public partial class AdminUsers : BasePage
    {
        private static string userId;
        protected void Page_Load(object sender, EventArgs e)
        {
            SessionManager = new SessionManager(Session);
            lblUserName.Text = SessionManager.UserNameSession;
            userId = SessionManager.UserSession;
        }
        [WebMethod]
        public static List<User> ListUsers()
        {
            List<User> List = null;
            try
            {
                List = UserDAO.getInstance().ListUsers();
            }
            catch (Exception ex)
            {
                List = new List<User>();
            }
            return List;
        }

        [WebMethod]
        public static bool SaveUser(string firstName, string lastName, string email, string password)
        {
            bool response = UserDAO.getInstance().SaveUser(firstName, lastName, email, password);
            if (response)
            {
                SendEmail(email);
            }
            return response;
        }

        [WebMethod]
        public static bool DeleteUser(int userId)
        {
            bool response = UserDAO.getInstance().DeleteUser(userId);
            return response;
        }

        [WebMethod]
        public static User GetUserById(int userId)
        {
            User user = new User();
            try
            {
                user = UserDAO.getInstance().GetUserById(userId);
            }
            catch (Exception ex)
            {
                user = new User();
            }
            return user;
        }

        [WebMethod]
        public static bool UpdateUser(int userId, string firstName, string lastName, string password)
        {
            bool response = UserDAO.getInstance().UpdateUser(userId, firstName, lastName, password);
            return response;
        }

        protected static void SendEmail(string email)
        {
            System.Net.Mail.MailMessage correo = new System.Net.Mail.MailMessage();
            correo.From = new System.Net.Mail.MailAddress("rmsystemapp@gmail.com");
            correo.To.Add(email);
            correo.To.Add("rmsystemapp@gmail.com");
            correo.Subject = "Alerta de registro de nuevo usuario";

            correo.Body = getBodyHtml(email).ToString();

            //correo.Body = "Se registró el proyecto: "+projectName;

            correo.IsBodyHtml = true;
            correo.Priority = System.Net.Mail.MailPriority.Normal;
            System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient();
            smtp.Host = "smtp.gmail.com";// 'para gmail
                                         //smtp.Host = "smtp.live.com"; //para hotmail
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("rmsystemapp@gmail.com", "Contanet123+");
            smtp.EnableSsl = true;
            try
            {
                smtp.Send(correo);
                //this.Response.Write("<script language='JavaScript'>window.alert('Se envió correo.')</script>");
            }
            catch (Exception ex)
            {
                throw new Exception("Error: (" + ex.Message + ")");
            }
        }
        private static string getBodyHtml(string email)
        {
            return
                "<!DOCTYPE html> " +
"<html lang = \"en\" xmlns = \"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\" urn:schemas-microsoft-com:office:office\" > " +
"   <head> " +
"      <meta charset = \"utf-8\" > " +
"      <meta name = \"viewport\" content = \"width =device-width\" > " +
"      <meta http-equiv= \"X-UA-Compatible\" content = \"IE=edge\" > " +
"      <meta name = \"x-apple-disable-message-reformatting\" > " +
"      <title></title> " +
"      <link href=\"https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i\" rel = \"stylesheet\" > " +
"   </head> " +
"   <body width=\"100%\" style =\"margin: 0; padding: 0 !important; mso-line-height-rule: exactly; font-family: 'Montserrat', sans-serif; font-weight: 400; " +
"   font-size: 15px; line-height: 1.8; color: rgba(0, 0, 0, .4);\"> " +
"      <center style = \"width: 100%; background-color: white;\" > " +
"         <div style = \"max-width: 600px; margin: 0 auto;\" class=\"email-container\"> " +
"            <table align = \"center\" role=\"presentation\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" width=\"100%\" style=\"margin: auto; \"> " +
"               <tr> " +
"                  <td class=\"bg_white logo\" style=\"padding: 1em 2.5em; text-align: center; background: #ffffff; background-color: #00B25A;\"> " +
"                     <h1 style=\"font-family: 'Playfair Display', serif; color: #000000; margin-top: 0; margin: 0;\"> " +
"                        <a style=\"color: #000; font-size: 20px; font-weight: 700; text-transform: uppercase; font-family: 'Montserrat', sans-serif;\" > PRONET SYSTEM</a> " +
"                     </h1> " +
"                  </td> " +
"               </tr> " +
"               <tr> " +
"                  <td class=\"bg_white\" style=\"background: #ffffff;\" > " +
"                     <table role = \"presentation\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" width=\"100%\"> " +
"                        <tr> " +
"                           <td class=\"bg_dark email-section\" style=\"text-align:center; background-color: #f1f1f1; padding: 2.5em;\"> " +
"                              <div class=\"heading-section heading-section-white\" style=\"color: rgba(255, 255, 255, .8);\"> " +
"                                 <p style=\"color:gray;\">Se registró de manera correcta el correo:</p> " +
"                                 <p style=\"color:black;\">" + email + "</p> " +
"                              </div> " +
"                              <div class=\"heading-section heading-section-white\" style=\"color: rgba(255, 255, 255, .8);\"> " +
"                                 <p style=\"color:gray;\">Para iniciar sesión seguir el siguiente enlace:</p> " +
"                                 <p style=\"color:black;\">" + "https://webrmsystem.azurewebsites.net/" + "</p> " +
"                              </div> " +
"                           </td> " +
"                     </table> " +
"                  </td> " +
"               </tr> " +
"            </table> " +
"         </div> " +
"      </center> " +
"   </body> " +
"</html> ";
        }
    }
}
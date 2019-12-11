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
    public partial class GeneralManagement : BasePage
    {
        private static string userId;
        private static string userEmail;
        protected void Page_Load(object sender, EventArgs e)
        {
            SessionManager = new SessionManager(Session);
            lblUserName.Text = SessionManager.UserNameSession;
            userId = SessionManager.UserSession;
            userEmail = SessionManager.UserEmailSession;
        }

        [WebMethod]
        public static List<Project> ListProjects()
        {
            List<Project> List = null;
            try
            {
                List = ProjectDAO.getInstance().ListProjects();
            }
            catch (Exception ex)
            {
                List = new List<Project>();
            }
            return List;
        }

        [WebMethod]
        public static bool SaveProject(String name)
        {
            int userCode = Convert.ToInt32(userId);
            bool response = ProjectDAO.getInstance().SaveProject(name, userCode);
            if (response)
            {
                SendEmailProject(name);
            }
            return response;
        }
        [WebMethod]
        public static bool UpdateProject(int projectId, string projectName)
        {
            bool response = ProjectDAO.getInstance().UpdateProject(projectId, projectName);
            return response;
        }
        [WebMethod]
        public static bool DeleteProject(int projectId)
        {
            bool response = ProjectDAO.getInstance().DeleteProject(projectId);
            return response;
        }

        [WebMethod]
        public static List<Risk> ListRisks(int projectId)
        {
            List<Risk> List = null;
            try
            {
                List = RiskDAO.getInstance().ListRisks(projectId);
            }
            catch (Exception ex)
            {
                List = new List<Risk>();
            }
            return List;
        }

        [WebMethod]
        public static bool CloseRisk(int riskId)
        {
            bool ok = RiskDAO.getInstance().CloseRisk(riskId);
            return ok;
        }

        [WebMethod]
        public static bool SaveRisk(String riskName, int riskType, int projectId)
        {
            bool response = RiskDAO.getInstance().SaveRisk(riskName, riskType, projectId, Convert.ToInt32(userId));
            return response;
        }

        [WebMethod]
        public static bool UpdateRisk(int riskId, string riskName, int riskType)
        {
            bool response = RiskDAO.getInstance().UpdateRisk(riskId, riskName, riskType);
            return response;
        }

        [WebMethod]
        public static bool DeleteRisk(int riskId)
        {
            bool response = RiskDAO.getInstance().DeleteRisk(riskId);
            return response;
        }

        [WebMethod]
        public static List<Cause> ListCauses(int riskId)
        {
            List<Cause> List = null;
            try
            {
                List = CauseDAO.getInstance().ListCauses(riskId);
            }
            catch (Exception ex)
            {
                List = new List<Cause>();
            }
            return List;
        }

        [WebMethod]
        public static bool SaveCause(String descripcion, int porcentaje, int tipoCausa, int riskId)
        {
            bool response = CauseDAO.getInstance().SaveCause(descripcion, porcentaje, tipoCausa, riskId, Convert.ToInt32(userId));
            return response;
        }

        [WebMethod]
        public static bool DeleteCause(int causeId)
        {
            bool response = CauseDAO.getInstance().DeleteCause(causeId);
            return response;
        }

        [WebMethod]
        public static bool UpdateCause(int causeId, string description, int percent, int causeType)
        {
            bool response = CauseDAO.getInstance().UpdateCause(causeId, description, percent, causeType);
            return response;
        }

        [WebMethod]
        public static List<Effect> ListEffects(int causeId)
        {
            List<Effect> List = null;
            try
            {
                List = EffectDAO.getInstance().ListEffects(causeId);
            }
            catch (Exception ex)
            {
                List = new List<Effect>();
            }
            return List;
        }

        [WebMethod]
        public static bool SaveEffect(string description, int effectType, int causeId)
        {
            bool response = EffectDAO.getInstance().SaveEffect(description, effectType, causeId, Convert.ToInt32(userId));
            return response;
        }

        [WebMethod]
        public static bool UpdateEffect(string description, int effectId)
        {
            bool response = EffectDAO.getInstance().UpdateEffect(description, effectId);
            return response;
        }

        [WebMethod]
        public static bool DeleteEffect(int effectId)
        {
            bool response = EffectDAO.getInstance().DeleteEffect(effectId);
            return response;
        }

        [WebMethod]
        public static AnalysisDetail GetAnalysisDetail(int riskId)
        {
            AnalysisDetail analysisDetail = new AnalysisDetail();
            try
            {
                analysisDetail = AnalysisDetailDAO.getInstance().GetAnalysisDetail(riskId);
            }
            catch (Exception ex)
            {
                analysisDetail = new AnalysisDetail();
            }
            return analysisDetail;
        }

        [WebMethod]
        public static bool SaveAnalysisDetail(int impact, int probability, int riskId, string riskType)
        {
            bool response = AnalysisDetailDAO.getInstance().SaveAnalysisDetail(impact, probability, riskId, riskType, Convert.ToInt32(userId));
            return response;
        }

        [WebMethod]
        public static Treatment GetTreatment(int riskId)
        {
            Treatment treatment = new Treatment();
            try
            {
                treatment = TreatmentDAO.getInstance().GetTreatment(riskId);

                User user = UserDAO.getInstance().GetUserById(treatment.PERSON_IN_CHARGE);

                treatment.PERSON_IN_CHARGE_NAME = user.FULL_NAME;
            }
            catch (Exception ex)
            {
                treatment = new Treatment();
            }
            return treatment;
        }

        [WebMethod]
        public static bool SaveTreatment(string description, int riskResponse, int riskId, string controlName, string personInCharge)
        {
            bool response = TreatmentDAO.getInstance().SaveTreatment(description, riskResponse, riskId, Convert.ToInt32(userId),
                controlName, personInCharge);
            return response;
        }

        [WebMethod]
        public static string ToPdf(int projectId) //Este se acerca más
        {
            #region html
            Project project = ProjectDAO.getInstance().GetProjectByCode(projectId);
            List<Risk> listRisk = RiskDAO.getInstance().ListRisks(projectId);
            string htmlString = "<table style=\"width: 100%; border: groove;\">" +
                "<tr style=\"height: 100px;\">" +
                "  <th>" +
                    "<img src=\"imgPronet/logo.png\" style=\"width:200px;\"/>" +
                       "</th>" +
                       "<th>SISTEMA DE GESTIÓN DE RIESGOS DE PROYECTO</th>" +
                          "<th>Código: PRT - SGRP - 2017 </th>" +
                "</tr> " +
                "</table>";
            htmlString +=
                "<h2 align=\"center\">Proyecto " + project.PROCESS_NAME + "</h2>" +
                "<h3>Riesgos:</h3>" +
                "<form style=\"padding: 10px; \">"
                ;
            foreach (Risk risk in listRisk)
            {
                htmlString += "<ul>" +
                "           <li>";
                htmlString += "<label>" + risk.RISK_NAME + "</label></br>";
                htmlString += "<label>" + "Tipo: " + risk.RISK_TYPE_NAME + "</label></br>";
                htmlString += "<label>" + "Estado: " + risk.STATUS_DESCRIPTION + "</label></br>";

                htmlString += "<div style=\"border-style:groove; padding: 10px\">";
                List<Cause> listCauses = CauseDAO.getInstance().ListCauses(risk.RISK_ID);

                if (listCauses.Count > 0)
                {

                    htmlString +=
                "<label>Identificar: </label>" +
                    "<div style=\"border-style:groove; padding: 10px;\">" +
                "<label>Causas: </label>" +
                "<ul>";

                    foreach (Cause cause in listCauses)
                    {
                        htmlString +=
                        "           <li>" +
                        "               <label>" + cause.CAUSE_DESCRIPTION + "</label>" +
                        "               <br />" +
                        "               <label>" + "Tipo: " + cause.CAUSE_TYPE_NAME + "</label>" +
                        "               <br />" +
                        "               <label>" + "Porcentaje: " + cause.CAUSE_PERCENT + "%</label>";

                        List<Effect> listEffect = EffectDAO.getInstance().ListEffects(cause.CAUSE_ID);
                        if (listEffect.Count > 0)
                        {
                            htmlString += "               <br />" +
                        "               <strong><label>Consecuencias: </label></strong>" +
                        "               <ul>";
                            foreach (Effect effect in listEffect)
                            {
                                htmlString += "     <li> " +
                                "                       <label>" + effect.DESCRIPTION + "</label>" +
                                "                   </li>";
                            }
                            htmlString += "</ul>";
                        }
                        htmlString += "</li>";

                    }
                    htmlString += "       </ul>";
                    htmlString += "</div>";
                }
                //htmlString+= "</div>";

                AnalysisDetail analysisDetail = AnalysisDetailDAO.getInstance().GetAnalysisDetail(risk.RISK_ID);
                if (analysisDetail != null)
                {
                    htmlString +=
                "<label>Detalle de Análisis: </label>" +
                    "<div style=\"border-style:groove; padding: 10px;\">";
                    htmlString += "<label>Impacto: " + analysisDetail.IMPACT_DESCRIPTION + " </label></br>";
                    htmlString += "<label>Probabilidad: " + analysisDetail.PROBABILITY_DESCRIPTION + " </label></br>";
                    htmlString += "<label>Severidad: " + analysisDetail.SEVERIDAD + " </label>";
                    htmlString += "</div>";
                }

                Treatment treatment = TreatmentDAO.getInstance().GetTreatment(risk.RISK_ID);
                if (treatment != null)
                {
                    htmlString +=
                "<label>Tratamiento: </label>" +
                    "<div style=\"border-style:groove; padding: 10px;\">";
                    htmlString += "<label>Control: " + treatment.CONTROL_NAME + " </label></br>";
                    htmlString += "<label>Persona encargada: " + treatment.PERSON_IN_CHARGE + " </label></br>";
                    htmlString += "<label>Descripción: " + treatment.TREATMENT_DESCRIPTION + " </label></br>";
                    htmlString += "<label>Respuesta al riesgo: " + treatment.RISK_RESPONSE_DESCRIPTION + " </label>";
                    htmlString += "</div>";
                    if (treatment.DATE_IMPLEMENTATION != null)
                    {
                        htmlString +=
                    "<label>Implementación: </label>" +
                        "<div style=\"border-style:groove; padding: 10px;\">";
                        htmlString += "<label>Fecha: " + treatment.DATE_IMPLEMENTATION.ToString("dd/MM/yyyy") + " </label></br>";
                        htmlString += "</div>";
                    }
                    //htmlString += "</div>";
                }

                htmlString += "</div>";
                htmlString += "</li>";
                //fin del riesgo
                htmlString += "</ul>";
            }


            htmlString += "</form>";
            #endregion
            return htmlString;
        }


        protected static void SendEmailProject(string projectName)
        {
            System.Net.Mail.MailMessage correo = new System.Net.Mail.MailMessage();
            correo.From = new System.Net.Mail.MailAddress("rmsystemapp@gmail.com");
            correo.To.Add(userEmail);
            correo.To.Add("rmsystemapp@gmail.com");
            correo.Subject = "Alerta de registro de proyecto";

            correo.Body = getBodyHtml(projectName).ToString();

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
        private static string getBodyHtml(string projectName)
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
"                                 <span class=\"subheading\" style=\"margin-bottom: 20px !important; display: inline-block; font-size: 13px; text-transform: uppercase; letter-spacing: 2px; color: rgba(0, 0, 0, .4); position: relative;  " +
"                                 \">Alerta</span> " +
"                                 <p style=\"color:gray;\">Se registró de manera correcta el proyecto:</p> " +
"                                 <p style=\"color:black;\">" + projectName + "</p> " +
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
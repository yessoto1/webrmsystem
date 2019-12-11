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
    public partial class GeneralReportes : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SessionManager = new SessionManager(Session);
            lblUserName.Text = SessionManager.UserNameSession;
        }

        [WebMethod]
        public static int[] lista1(int desde, int hasta)
        {
            List<Risk> risks = RiskDAO.getInstance().RisksByStatus(desde, hasta);
            int[] estados = new int[2];
            int cerrado = 0;
            int abierto = 0;
            foreach (Risk r in risks)
            {
                if (r.STATUS_DESCRIPTION == "Cerrado")
                {
                    cerrado++;
                }
                if (r.STATUS_DESCRIPTION == "Abierto")
                {
                    abierto++;
                }
            }
            estados = new int[] { abierto, cerrado };

            return estados;
        }

        [WebMethod]
        public static int[] lista2(int desde, int hasta)
        {
            List<Risk> risks = RiskDAO.getInstance().ListRisksFilter(desde, hasta);
            int[] tipos = new int[2];
            int logistico = 0;
            int operativo = 0;

            foreach (Risk r in risks)
            {
                if (r.RISK_TYPE_NAME == "Logístico")
                {
                    logistico++;
                }
                if (r.RISK_TYPE_NAME == "Operativo")
                {
                    operativo++;
                }
            }

            tipos = new int[] { logistico, operativo };

            return tipos;
        }
    }
}
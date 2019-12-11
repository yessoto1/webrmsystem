using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaEntidades;

namespace CapaAccesoDatos
{
    public class TreatmentDAO
    {
        private static TreatmentDAO treatmentDAO = null;
        private TreatmentDAO() { }
        public static TreatmentDAO getInstance()
        {
            if (treatmentDAO == null)
            {
                treatmentDAO = new TreatmentDAO();
            }
            return treatmentDAO;
        }

        public Treatment GetTreatment(int riskId)
        {
            Treatment treatment = null;
            SqlConnection con = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;

            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("dbo.USP_TREATMENT_GET", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@P_RISK_ID", riskId);
                con.Open();
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    treatment = new Treatment();
                    treatment.TREATMENT_ID = Convert.ToInt16(dr["TREATMENT_ID"].ToString());
                    
                    treatment.TREATMENT_DESCRIPTION = dr["TREATMENT_DESCRIPTION"].ToString();
                    treatment.RISK_RESPONSE = Convert.ToInt16(dr["RISK_RESPONSE"].ToString());
                    treatment.RISK_RESPONSE_DESCRIPTION = treatment.RISK_RESPONSE == 1 ? "Aceptar" : treatment.RISK_RESPONSE == 2 ? "Evitar" : treatment.RISK_RESPONSE == 3 ? "Reducir" : "Transferir";
                    treatment.RISK_ID = Convert.ToInt16(dr["RISK_ID"].ToString());
                    treatment.CONTROL_NAME = dr["CONTROL_NAME"].ToString();
                    treatment.PERSON_IN_CHARGE = Convert.ToInt16(dr["PERSON_IN_CHARGE"].ToString());
                }
                ////TREATMENT_ID	TREATMENT_DESCRIPTION	RISK_RESPONSE	RISK_ID	CREATOR_USER_ID	CREATED_DATE	CONTROL_NAME	PERSON_IN_CHARGE
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
            }
            return treatment;
        }

        public bool SaveTreatment(string description, int riskResponse, int riskId, int userId, string controlName, string personInCharge)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            bool response = false;
            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("dbo.USP_TREATMENT_SAVE", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@P_TREATMENT_DESCRIPTION", description);
                cmd.Parameters.AddWithValue("@P_CONTROL_NAME", controlName);
                cmd.Parameters.AddWithValue("@P_RISK_RESPONSE", riskResponse);
                cmd.Parameters.AddWithValue("@P_RISK_ID", riskId);
                cmd.Parameters.AddWithValue("@P_CREATOR_USER_ID", userId);
                cmd.Parameters.AddWithValue("@P_PERSON_IN_CHARGE", personInCharge);
                con.Open();

                int filas = cmd.ExecuteNonQuery();
                if (filas > 0) response = true;

            }
            catch (Exception ex)
            {
                response = false;
                throw ex;
            }
            finally
            {
                con.Close();
            }
            return response;
        }
    }
}

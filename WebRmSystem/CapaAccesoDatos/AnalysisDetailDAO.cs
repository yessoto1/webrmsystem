using CapaEntidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaAccesoDatos
{
    public class AnalysisDetailDAO
    {
        private static AnalysisDetailDAO analysisDetailDAO = null;
        private AnalysisDetailDAO() { }
        public static AnalysisDetailDAO getInstance()
        {
            if (analysisDetailDAO == null)
            {
                analysisDetailDAO = new AnalysisDetailDAO();
            }
            return analysisDetailDAO;
        }

        public AnalysisDetail GetAnalysisDetail(int riskId)
        {
            AnalysisDetail analysisDetail = null;
            SqlConnection con = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;

            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("dbo.USP_DETAIL_GET", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@P_RISK_ID", riskId);
                con.Open();
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    analysisDetail = new AnalysisDetail();
                    analysisDetail.ANALYSIS_DETAIL_ID = Convert.ToInt16(dr["ANALYSIS_DETAIL_ID"].ToString());
                    analysisDetail.IMPACT = Convert.ToInt16(dr["IMPACT"].ToString());
                    analysisDetail.IMPACT_DESCRIPTION = analysisDetail.IMPACT == 1 ? "Menor" : analysisDetail.IMPACT == 2 ? "Moderado" : analysisDetail.IMPACT == 3?"Mayor":"Catastrófico";
                    analysisDetail.PROBABILITY = Convert.ToInt16(dr["PROBABILITY"].ToString());
                    analysisDetail.PROBABILITY_DESCRIPTION = analysisDetail.PROBABILITY == 1 ? "Excepcional" : analysisDetail.PROBABILITY == 2 ? "Poco frecuente" :analysisDetail.PROBABILITY == 3 ? "Frecuente" : "Muy frecuente";
                    analysisDetail.SEVERIDAD = dr["RISK_TYPE"].ToString();
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
            }
            return analysisDetail;
        }
        //impact, probability, riskId, riskType, Convert.ToInt32(userId)
        public bool SaveAnalysisDetail(int impact, int probability, int riskId,string riskType, int userId)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            bool response = false;
            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("dbo.USP_DETAIL_SAVE", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@P_IMPACT", impact);
                cmd.Parameters.AddWithValue("@P_PROBABILITY", probability);
                cmd.Parameters.AddWithValue("@P_RISK_ID", riskId);
                cmd.Parameters.AddWithValue("@P_CREATOR_USER_ID", userId);
                cmd.Parameters.AddWithValue("@P_RISK_TYPE_DESCRIPTION", riskType);
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

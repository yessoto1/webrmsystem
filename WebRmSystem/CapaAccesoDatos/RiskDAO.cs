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
    public class RiskDAO
    {
        private static RiskDAO riskDAO = null;
        private RiskDAO() { }
        public static RiskDAO getInstance()
        {
            if (riskDAO == null)
            {
                riskDAO = new RiskDAO();
            }
            return riskDAO;
        }
        public List<Risk> ListRisks(int projectId)
        {
            List<Risk> List = new List<Risk>();
            SqlConnection con = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;

            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("dbo.USP_RISK_LIST", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@P_PROJECT_ID", projectId);
                //@P_PROJECT_ID
                con.Open();
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    Risk objRisk = new Risk();
                    objRisk.RISK_ID = Convert.ToInt16(dr["RISK_ID"].ToString());
                    objRisk.RISK_NAME = dr["RISK_NAME"].ToString();
                    objRisk.RISK_TYPE = Convert.ToInt16(dr["RISK_TYPE"].ToString());
                    objRisk.RISK_TYPE_NAME = objRisk.RISK_TYPE == 1 ? "Operativo" : "Logístico";
                    objRisk.STATUS = Convert.ToBoolean(dr["STATUS"].ToString());
                    objRisk.STATUS_DESCRIPTION = objRisk.STATUS == false ? "Abierto" : "Cerrado";
                    List.Add(objRisk);
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
            return List;
        }

        public List<Risk> ListRisksFilter(int monthInit, int monthEnd)
        {
            List<Risk> List = new List<Risk>();
            SqlConnection con = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;

            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("dbo.USP_REPORTE_POR_RIESGO", con);
                cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Parameters.AddWithValue("@P_PROJECT_ID", projectId);
                cmd.Parameters.AddWithValue("@P_MONTH_INIT", monthInit);
                cmd.Parameters.AddWithValue("@P_MONTH_END", monthEnd);
                con.Open();
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    Risk objRisk = new Risk();
                    objRisk.RISK_ID = Convert.ToInt16(dr["RISK_ID"].ToString());
                    objRisk.PROCESS_ID = Convert.ToInt16(dr["PROCESS_ID"].ToString());
                    objRisk.RISK_NAME = dr["RISK_NAME"].ToString();
                    objRisk.RISK_TYPE = Convert.ToInt16(dr["RISK_TYPE"].ToString());
                    objRisk.RISK_TYPE_NAME = objRisk.RISK_TYPE == 1 ? "Operativo" : "Logístico";
                    List.Add(objRisk);
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
            return List;
        }

        public bool DeleteRisk(int riskId)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            bool response = false;
            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("dbo.USP_RISK_DELETE", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@P_RISK_ID", riskId);
                con.Open();

                int filas = cmd.ExecuteNonQuery();
                if (filas > 0) response = true;

            }
            catch (Exception ex)
            {
                response = false;
                //throw ex;
            }
            finally
            {
                con.Close();
            }
            return response;
        }

        public bool UpdateRisk(int riskId, string riskName, int riskType)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            bool response = false;
            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("dbo.USP_RISK_UPDATE", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@P_RISK_NAME", riskName);
                cmd.Parameters.AddWithValue("@P_RISK_TYPE", riskType);
                cmd.Parameters.AddWithValue("@P_RISK_ID", riskId);
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

        public List<Risk> RisksByStatus(int monthInit, int monthEnd)
        {
            List<Risk> List = new List<Risk>();
            SqlConnection con = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;

            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("dbo.USP_REPORTE_POR_RIESGO_ESTADO", con);
                cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Parameters.AddWithValue("@P_PROJECT_ID", projectId);
                cmd.Parameters.AddWithValue("@P_MONTH_INIT", monthInit);
                cmd.Parameters.AddWithValue("@P_MONTH_END", monthEnd);
                con.Open();
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    Risk objRisk = new Risk();
                    objRisk.RISK_ID = Convert.ToInt16(dr["RISK_ID"].ToString());
                    objRisk.PROCESS_ID = Convert.ToInt16(dr["PROCESS_ID"].ToString());
                    objRisk.RISK_NAME = dr["RISK_NAME"].ToString();
                    objRisk.STATUS = Convert.ToBoolean(dr["STATUS"].ToString());
                    objRisk.STATUS_DESCRIPTION = dr["STATUS_DESCRIPTION"].ToString();
                    List.Add(objRisk);
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
            return List;
        }

        public List<Risk> RisksByStatusCount(int monthInit, int monthEnd)
        {
            List<Risk> List = new List<Risk>();
            SqlConnection con = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;

            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("dbo.USP_REPORTE_POR_RIESGO_ESTADO_CANTIDAD", con);
                cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Parameters.AddWithValue("@P_PROJECT_ID", projectId);
                cmd.Parameters.AddWithValue("@P_MONTH_INIT", monthInit);
                cmd.Parameters.AddWithValue("@P_MONTH_END", monthEnd);
                con.Open();
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    Risk objRisk = new Risk();
                    objRisk.STATUS_DESCRIPTION = dr["STATUS_DESCRIPTION"].ToString();
                    
                    List.Add(objRisk);
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
            return List;
        }

        public bool SaveRisk(string riskName, int riskType, int projectId, int userId)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            bool response = false;
            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("dbo.USP_RISK_SAVE", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@P_RISK_NAME", riskName);
                cmd.Parameters.AddWithValue("@P_RISK_TYPE", riskType);
                cmd.Parameters.AddWithValue("@P_PROJECT_ID", projectId);
                cmd.Parameters.AddWithValue("@P_CREATOR_USER_ID", userId);
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

        public bool CloseRisk(int riskId)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            bool response = false;
            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("dbo.USP_RISK_CLOSE", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@P_RISK_ID", riskId);
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

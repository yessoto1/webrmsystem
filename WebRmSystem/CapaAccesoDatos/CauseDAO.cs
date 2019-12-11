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
    public class CauseDAO
    {
        private static CauseDAO causeDAO = null;
        private CauseDAO() { }
        public static CauseDAO getInstance()
        {
            if (causeDAO == null)
            {
                causeDAO = new CauseDAO();
            }
            return causeDAO;
        }

        public List<Cause> ListCauses(int riskId)
        {
            List<Cause> List = new List<Cause>();
            SqlConnection con = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;

            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("dbo.USP_CAUSE_LIST", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@P_RISK_ID", riskId);
                //@P_PROJECT_ID
                con.Open();
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    Cause objCause = new Cause();
                    objCause.CAUSE_ID = Convert.ToInt16(dr["CAUSE_ID"].ToString());
                    objCause.CAUSE_DESCRIPTION = dr["CAUSE_DESCRIPTION"].ToString();
                    objCause.CAUSE_PERCENT = Convert.ToInt16(dr["CAUSE_PERCENT"].ToString());
                    objCause.CAUSE_TYPE_ID= Convert.ToInt16(dr["CAUSE_TYPE_ID"].ToString());
                    objCause.CAUSE_TYPE_NAME = objCause.CAUSE_TYPE_ID == 1 ? "Interno" : "Externo";
                    objCause.RISK_ID = Convert.ToInt16(dr["RISK_ID"].ToString());
                    List.Add(objCause);
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

        public bool SaveCause(string descripcion, int porcentaje, int tipoCausa, int riskId, int userId)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            bool response = false;
            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("dbo.USP_CAUSE_SAVE", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@P_DESCRIPTION", descripcion);
                cmd.Parameters.AddWithValue("@P_PERCENT", porcentaje);
                cmd.Parameters.AddWithValue("@P_CAUSE_TYPE", tipoCausa);
                cmd.Parameters.AddWithValue("@P_RISK_ID", riskId);
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

        public bool UpdateCause(int causeId, string description, int percent, int causeType)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            bool response = false;
            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("dbo.USP_CAUSE_UPDATE", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@P_DESCRIPTION", description);
                cmd.Parameters.AddWithValue("@P_PERCENT", percent);
                cmd.Parameters.AddWithValue("@P_CAUSE_TYPE", causeType);
                cmd.Parameters.AddWithValue("@P_CAUSE_ID", causeId);
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

        public bool DeleteCause(int causeId)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            bool response = false;
            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("dbo.USP_CAUSE_DELETE", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@P_CAUSE_ID", causeId);
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
    }
}

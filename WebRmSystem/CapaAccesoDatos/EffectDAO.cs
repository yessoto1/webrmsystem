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
    public class EffectDAO
    {
        private static EffectDAO effectDAO = null;
        private EffectDAO() { }
        public static EffectDAO getInstance()
        {
            if (effectDAO == null)
            {
                effectDAO = new EffectDAO();
            }
            return effectDAO;
        }

        public List<Effect> ListEffects(int causeId)
        {
            List<Effect> List = new List<Effect>();
            SqlConnection con = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;

            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("dbo.USP_EFFECT_LIST", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@P_CAUSE_ID", causeId);
                con.Open();
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    Effect objEffect = new Effect();
                    objEffect.EFFECT_ID = Convert.ToInt16(dr["EFFECT_ID"].ToString());
                    objEffect.DESCRIPTION = dr["DESCRIPTION"].ToString();
                    objEffect.EFFECT_TYPE_ID = Convert.ToInt16(dr["EFFECT_TYPE_ID"].ToString());
                    objEffect.EFFECT_TYPE_NAME= objEffect.EFFECT_TYPE_ID == 1 ? "Financiero" : "Otros";
                    objEffect.CAUSE_ID = Convert.ToInt16(dr["CAUSE_ID"].ToString());
                    List.Add(objEffect);
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

        public bool SaveEffect(string description, int effectType, int causeId, int userId)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            bool response = false;
            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("dbo.USP_EFFECT_SAVE", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@P_DESCRIPTION", description);
                cmd.Parameters.AddWithValue("@P_EFFECT_TYPE_ID", effectType);
                cmd.Parameters.AddWithValue("@P_CAUSE_ID", causeId);
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

        public bool UpdateEffect(string description, int effectId)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            bool response = false;
            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("dbo.USP_EFFECT_UPDATE", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@P_DESCRIPTION", description);
                cmd.Parameters.AddWithValue("@P_EFFECT_ID", effectId);
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

        public bool DeleteEffect(int effectId)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            bool response = false;
            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("dbo.USP_EFFECT_DELETE", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@P_EFFECT_ID", effectId);
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

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
    public class UserDAO
    {
        private static UserDAO userDAO = null;
        private UserDAO() { }
        public static UserDAO getInstance()
        {
            if (userDAO == null)
            {
                userDAO = new UserDAO();
            }
            return userDAO;
        }

        public User Login(string correo, string pass)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            User objUser = null;
            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("dbo.USP_USER_LOGIN", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@P_EMAIL", correo);
                cmd.Parameters.AddWithValue("@P_PASSWORD", pass);
                con.Open();
                dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    objUser = new User();
                    objUser.USER_ID = Convert.ToInt16(dr["USER_ID"].ToString());
                    objUser.FIRST_NAME = dr["FIRST_NAME"].ToString();
                    objUser.LAST_NAME = dr["LAST_NAME"].ToString();
                    objUser.EMAIL = dr["EMAIL"].ToString();
                    objUser.ACTIVE = Convert.ToBoolean(dr["ACTIVE"]);
                    objUser.IS_ADMIN = Convert.ToBoolean(dr["IS_ADMIN"]);
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
            return objUser;
        }

        public User GetUserById(int userId)
        {
            User objUser = null;
            SqlConnection con = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;

            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("dbo.USP_USER_GET_BY_ID", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@P_USER_ID", userId);
                con.Open();
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    objUser = new User();
                    objUser.USER_ID = Convert.ToInt16(dr["USER_ID"].ToString());
                    objUser.FIRST_NAME = dr["FIRST_NAME"].ToString();
                    objUser.LAST_NAME = dr["LAST_NAME"].ToString();
                    objUser.EMAIL = dr["EMAIL"].ToString();
                    objUser.FULL_NAME = dr["FIRST_NAME"].ToString() + ' ' + dr["LAST_NAME"].ToString();
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
            return objUser;
        }

        public bool UpdateUser(int userId, string firstName, string lastName, string password)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            bool response = false;
            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("dbo.USP_USER_UPDATE", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@P_USER_ID", userId);
                cmd.Parameters.AddWithValue("@P_FIRST_NAME", firstName);
                cmd.Parameters.AddWithValue("@P_LAST_NAME", lastName);
                cmd.Parameters.AddWithValue("@P_PASSWORD", password);
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

        public bool DeleteUser(int userId)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            bool response = false;
            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("dbo.USP_USER_DELETE", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@P_USER_ID", userId);

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

        public bool SaveUser(string firstName, string lastName, string email, string password)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            bool response = false;
            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("dbo.USP_USER_SAVE", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@P_FIRST_NAME", firstName);
                cmd.Parameters.AddWithValue("@P_LAST_NAME", lastName);
                cmd.Parameters.AddWithValue("@P_EMAIL", email);
                cmd.Parameters.AddWithValue("@P_PASSWORD", password);
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

        public List<User> ListUsers()
        {
            List<User> List = new List<User>();
            SqlConnection con = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;

            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("dbo.USP_USER_LIST", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    User objUser = new User();
                    objUser.USER_ID = Convert.ToInt16(dr["USER_ID"].ToString());
                    objUser.FULL_NAME = dr["FIRST_NAME"].ToString() + ' ' + dr["LAST_NAME"].ToString();
                    objUser.EMAIL = dr["EMAIL"].ToString();
                    List.Add(objUser);
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
    }
}

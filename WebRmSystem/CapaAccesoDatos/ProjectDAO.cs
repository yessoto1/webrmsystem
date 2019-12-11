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
    public class ProjectDAO
    {
        private static ProjectDAO projectDAO = null;
        private ProjectDAO() { }
        public static ProjectDAO getInstance()
        {
            if (projectDAO == null)
            {
                projectDAO = new ProjectDAO();
            }
            return projectDAO;
        }
        public bool SaveProject(string projectName, int userId)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            bool response = false;
            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("dbo.USP_PROJECT_SAVE", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@P_PROJECT_NAME", projectName);
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

        public List<Project> ListProjects()
        {
            List<Project> List = new List<Project>();
            SqlConnection con = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;

            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("dbo.USP_PROJECT_LIST", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    Project objProject = new Project();
                    objProject.PROCESS_ID = Convert.ToInt16(dr["PROCESS_ID"].ToString());
                    objProject.PROCESS_NAME = dr["PROCESS_NAME"].ToString();
                    objProject.CREATED_DATE= Convert.ToDateTime(dr["CREATED_DATE"].ToString());
                    List.Add(objProject);
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

        public bool UpdateProject(int projectId, string projectName)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            bool response = false;
            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("dbo.USP_PROJECT_UPDATE", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@P_PROJECT_ID", projectId);
                cmd.Parameters.AddWithValue("@P_PROJECT_NAME", projectName);
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

        public bool DeleteProject(int projectId)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            bool response = false;
            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("dbo.USP_PROJECT_DELETE", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@P_PROJECT_ID", projectId);
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

        public List<Project> ListProjectsFilter(int monthInit, int monthEnd)
        {
            List<Project> List = new List<Project>();
            SqlConnection con = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;

            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("dbo.USP_REPORTE_POR_PROYECTO", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@P_MONTH_INIT", monthInit);
                cmd.Parameters.AddWithValue("@P_MONTH_END", monthEnd);    
                con.Open();
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    Project objProject = new Project();
                    objProject.PROCESS_ID = Convert.ToInt16(dr["PROCESS_ID"].ToString());
                    objProject.PROCESS_NAME = dr["PROCESS_NAME"].ToString();
                    objProject.CREATED_DATE = Convert.ToDateTime(dr["CREATED_DATE"].ToString());
                    List.Add(objProject);
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

        public Project GetProjectByCode(int projectId)
        {
            Project objProject = new Project();
            SqlConnection con = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;

            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("dbo.PROJECT_BY_CODE", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@P_PROCESS_ID", projectId);
                con.Open();
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    objProject = new Project();
                    objProject.PROCESS_ID = Convert.ToInt16(dr["PROCESS_ID"].ToString());
                    objProject.PROCESS_NAME = dr["PROCESS_NAME"].ToString();
                    objProject.CREATED_DATE = Convert.ToDateTime(dr["CREATED_DATE"].ToString());
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
            return objProject;
        }
    }
}

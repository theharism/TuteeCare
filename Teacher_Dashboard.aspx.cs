using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication1
{
    public partial class Teacher_Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("TeacherProfile");
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@TeacherID", Session["TeacherID"].ToString());

                cmd.Connection = con;

                SqlDataReader data = cmd.ExecuteReader();

                if (data.HasRows)
                {
                    while (data.Read())
                    {
                        Label2.Text = data.GetValue(0).ToString();
                        string str = data.GetValue(1).ToString();
                        int index = str.IndexOf(" ");
                        Label4.Text = str.Substring(0, index);
                        Label6.Text = data.GetValue(2).ToString();
                        Label8.Text = data.GetValue(3).ToString();
                        Label10.Text = data.GetValue(4).ToString();
                        Label12.Text = data.GetValue(5).ToString();
                    }
                }

                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write(" " + ex.Message + " ");
            }
        }
    }
}
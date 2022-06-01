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
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void Student_Redirect(object sender, EventArgs e)
        {
            Response.Redirect("Student_Login.aspx");
        }

        protected void Admin_Redirect(object sender, EventArgs e)
        {
            Response.Redirect("Admin_Login.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            int check = 0;
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("TeacherLogin");
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@TeacherID", TextBox1.Text.ToUpper().Trim());

                cmd.Parameters.AddWithValue("@password", TextBox2.Text.Trim());

                cmd.Connection = con;
                check = Convert.ToInt32(cmd.ExecuteScalar());

                con.Close();

                if (check == 1)
                {
                    Session["TeacherID"] = TextBox1.Text.Trim();
                    Server.Execute("Teacher_dashboard.aspx");
                    Response.Redirect("Teacher_dashboard.aspx");
                }
                else if (check == -1)
                {
                    Response.Write("<script>alert('Incorrect Password');</script>");
                }
                else if (check == -2)
                {
                    Response.Write("<script>alert('Incorrect Username');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write(" " + ex.Message + " ");
            }
        }
    }
}
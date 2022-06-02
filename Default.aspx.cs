using System;
using System.Web.UI;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication1
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        
        }

        protected void SIGNIN(object sender, EventArgs e)
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
                SqlCommand cmd = new SqlCommand("StudentLogin");
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@rollno", TextBox1.Text.ToUpper().Trim());

                cmd.Parameters.AddWithValue("@password", TextBox2.Text.Trim());

                cmd.Connection = con;
                check = Convert.ToInt32(cmd.ExecuteScalar());

                con.Close();

                if (check == 1)
                {
                    Session["rollno"] = TextBox1.Text.Trim();
                    Server.Execute("Student_dashboard.aspx");
                    // Session["rollno"] = TextBox1.Text.Trim();
                    Server.Execute("Student_Add_Course.aspx");
                    Response.Redirect("Student_dashboard.aspx");
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

        protected void Teacher_Redirect(object sender, EventArgs e)
        {
            Response.Redirect("Teacher_Login.aspx");
        }

        protected void Admin_Redirect(object sender, EventArgs e)
        {
            Response.Redirect("Admin_Login.aspx");
        }
    }
}
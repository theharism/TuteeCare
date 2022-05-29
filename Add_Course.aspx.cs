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
    public partial class Add_Course : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int check = 0;
            string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("addcourse");
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CourseName", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@CourseID", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@CreditHours", TextBox8.Text.Trim());
              
                cmd.Connection = con;

                check = Convert.ToInt32(cmd.ExecuteScalar());

                if (check == 0)
                {
                    Response.Write("<script>alert('Course Name Already Exists');</script>");
                }
                else if (check == -1)
                {
                    Response.Write("<script>alert('Course ID Already Exits.');</script>");
                }
                else if (check == 1)
                {
                    Response.Write("<script>alert('Course Added Successfully');</script>");
                    emptyboxes();
                }

                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void emptyboxes()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox8.Text = "";
        }

    }
}
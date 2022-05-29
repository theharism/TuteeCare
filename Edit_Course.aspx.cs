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
    public partial class Edit_Course1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("EditCourse");
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@CourseName", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@CourseID", Session["CourseID"].ToString());
                cmd.Parameters.AddWithValue("@CreditHours", TextBox8.Text.Trim());

                cmd.Connection = con;

                int check = Convert.ToInt32(cmd.ExecuteScalar());

                if (check == 1)
                {
                    Response.Write("<script>alert('Course Edited Successfully');</script>");
                    emptyboxes();
                }
                else if (check == 0)
                {
                    Response.Write("<script>alert('Enter Some Information.');</script>");
                }
                
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void emptyboxes()
        {
            TextBox1.Text = "";
            TextBox8.Text = "";
        }
    }
}
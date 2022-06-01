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
    public partial class Teacher_Edit_Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

            try
            {
                if (TextBox2.Text.Trim() != TextBox8.Text.Trim())
                {
                    Response.Write("<script>alert('New Password MisMatch');</script>");
                    ClearBoxes();
                    throw new Exception();
                }

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("TeacherProfileEdit");
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@TeacherID", Session["TeacherID"].ToString());
                cmd.Parameters.AddWithValue("@oldpassword", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@newpassword", TextBox2.Text.Trim());

                cmd.Connection = con;

                int check = Convert.ToInt32(cmd.ExecuteScalar());

                if (check == 1)
                {
                    Response.Write("<script>alert('Password Changed Successfully');</script>");
                    ClearBoxes();
                }
                else
                {
                    Response.Write("<script>alert('Incorrect Old Password');</script>");
                    ClearBoxes();
                }

                con.Close();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        protected void ClearBoxes()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox8.Text = "";
        }
    }
}
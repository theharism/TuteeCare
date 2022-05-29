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
    public partial class Add_Teacher : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand("addteacher");
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@FullName", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@DOB", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@TeacherID", TextBox8.Text.Trim().ToUpper());
                cmd.Parameters.AddWithValue("@Email", TextBox3.Text.Trim());
                if (DropDownList1.Text.Trim() == "Male")
                {
                    cmd.Parameters.AddWithValue("@Gender", "M");
                }
                else cmd.Parameters.AddWithValue("@Gender", "F");
                cmd.Parameters.AddWithValue("@Phoneno", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@Address", TextBox6.Text.Trim());
                if (DropDownList2.Text.Trim() == "Yes")
                {
                    cmd.Parameters.AddWithValue("@Availability", "Y");
                }
                else cmd.Parameters.AddWithValue("@Availability", "N");
                cmd.Parameters.AddWithValue("@Password", TextBox7.Text.Trim());
                cmd.Connection = con;

                check = Convert.ToInt32(cmd.ExecuteScalar());

                if (check == 1)
                {
                    Response.Write("<script>alert('Teacher Added Successfully');</script>");
                    emptyboxes();
                }
                else if (check == 0)
                {
                    Response.Write("<script>alert('Email Already Exists. Enter Unique Email.');</script>");
                }
                else if (check == -1)
                {
                    Response.Write("<script>alert('Teacher ID Already Exists.');</script>");
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
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
            TextBox8.Text = "";
        }
    }
}
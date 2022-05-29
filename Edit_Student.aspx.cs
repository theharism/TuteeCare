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
    public partial class Edit_Student : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand("EditStudent");
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@FullName", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@DOB", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@Rollno", Session["Rollno"].ToString());
                if (DropDownList1.Text.Trim() == "Male")
                {
                    cmd.Parameters.AddWithValue("@Gender", "M");
                }
                else if (DropDownList1.Text.Trim() == "Female")
                {
                    cmd.Parameters.AddWithValue("@Gender", "F");
                }
                else cmd.Parameters.AddWithValue("@Gender", "");
                cmd.Parameters.AddWithValue("@Phoneno", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@Address", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", TextBox7.Text.Trim());

                cmd.Connection = con;


                check = Convert.ToInt32(cmd.ExecuteScalar());

                if (check == 0)
                {
                    Response.Write("<script>alert('Enter Some Information');</script>");
                }
                else if (check == 1)
                {
                    Response.Write("<script>alert('Student Edited Successfully');</script>");
                    emptyboxes();
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
            DropDownList1.Text = "Select";
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
        }
    }
}
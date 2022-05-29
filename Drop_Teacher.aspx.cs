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
    public partial class Drop_Teacher : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
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
                SqlCommand cmd = new SqlCommand("dropteacher");
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@teacherid", TextBox1.Text.Trim().ToUpper());

                cmd.Connection = con;

                check = Convert.ToInt32(cmd.ExecuteScalar());

                if (check == 0)
                {
                    Response.Write("<script>alert('Teacher ID Does Not Exists');</script>");
                    TextBox1.Text = "";
                    throw new Exception();
                }
                else if (check == 1)
                {
                    Response.Write("<script>alert('Teacher Droped Successfully');</script>");
                }

                con.Close();

                Response.Redirect(Request.RawUrl);
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Threading;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Update_Fees : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DropDownList2.DataBind();
            string constr = ConfigurationManager.ConnectionStrings["con"].ToString();
            // connection string  
            SqlConnection con = new SqlConnection(constr);
            con.Open();

            SqlCommand com = new SqlCommand("select Rollno from Student", con);
            // table name   

            SqlDataReader data = com.ExecuteReader();

            int i = 0;
            
                DropDownList2.Items.Insert(i++, new ListItem("--Select Student--"));

            if (data.HasRows)
            {
                while (data.Read())
                {
                    DropDownList2.Items.Insert(i++, new ListItem(data.GetValue(0).ToString()));
                }
            }
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
                SqlCommand cmd = new SqlCommand("updatefees");
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@rollno", DropDownList2.Text.Trim());
                cmd.Parameters.AddWithValue("@status", DropDownList1.Text.Trim());

                cmd.Connection = con;

                check = Convert.ToInt32(cmd.ExecuteScalar());

                if (check == 0)
                {
                    Response.Write("<script>alert('Student ID Does Not Exists');</script>");
                }
                else if (check == 1)
                {
                    Response.Write("<script>alert('Fees Status Updated Successfully');</script>");
                    Response.Redirect(Request.RawUrl);
                }

                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}
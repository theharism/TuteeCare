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
    public partial class Edit_Teacher_1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DropDownList2.DataBind();
            string constr = ConfigurationManager.ConnectionStrings["con"].ToString();
            // connection string  
            SqlConnection con = new SqlConnection(constr);
            con.Open();

            SqlCommand com = new SqlCommand("select TeacherID from Teacher", con);
            // table name   

            SqlDataReader data = com.ExecuteReader();

            int i = 0;

            DropDownList2.Items.Insert(i++, new ListItem("--Select Teacher--"));

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
            Session["TeacherID"] = DropDownList2.Text.Trim().ToUpper();
            Response.Redirect("Edit_Teacher.aspx");
        }
    }
}
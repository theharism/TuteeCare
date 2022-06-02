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
    public partial class Teacher_Add_Grades : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DropDownList2.DataBind();
            string constr = ConfigurationManager.ConnectionStrings["con"].ToString();
            // connection string  
            SqlConnection con = new SqlConnection(constr);
            con.Open();
         
            SqlCommand com = new SqlCommand("TeacherRegisteredCoursesView", con);

            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@TeacherID", Session["TeacherID"].ToString());

            // table name   

            SqlDataReader data = com.ExecuteReader();

            int i = 0;

            DropDownList2.Items.Insert(i++, new ListItem("--Select Course--"));

            if (data.HasRows)
            {
                while (data.Read())
                {
                    DropDownList2.Items.Insert(i++, new ListItem(data.GetValue(0).ToString(), data.GetValue(1).ToString()));
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["CourseID"] = DropDownList2.Text.Trim().ToUpper();
            Response.Redirect("T_Grades.aspx");
        }
    }
}
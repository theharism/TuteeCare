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
    public partial class T_Attendance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Teacher_Add_Attendance.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            string status="";

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                foreach (GridViewRow gr in GridView1.Rows)
                {

                    SqlCommand cmd = new SqlCommand("AddAttendance");
                    cmd.CommandType = CommandType.StoredProcedure;

                
                    CheckBox check = (CheckBox)gr.FindControl("chkCheck");

                    string rollno = GridView1.Rows[gr.RowIndex].Cells[1].Text;

                    if (check.Checked == true)
                    {
                        status = "P";
                        cmd.Parameters.AddWithValue("@rollno", rollno);
                        cmd.Parameters.AddWithValue("@courseID", Session["CourseID"].ToString());
                        cmd.Parameters.AddWithValue("@status", status);
                        cmd.Connection = con;
                        cmd.ExecuteNonQuery();
                    }
                    else
                    {
                        status = "A";
                        cmd.Parameters.AddWithValue("@rollno", rollno);
                        cmd.Parameters.AddWithValue("@courseID", Session["CourseID"].ToString());
                        cmd.Parameters.AddWithValue("@status", status);
                        cmd.Connection = con;
                        cmd.ExecuteNonQuery();
                    }
                }

                Response.Write("<script>alert('Attendance Updated Successfully');</script>");

                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write(" " + ex.Message + " ");
            }
        }
    }
}
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
    public partial class T_Grades : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Teacher_Add_Grades.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            string status = "";

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                foreach (GridViewRow gr in GridView1.Rows)
                {

                    SqlCommand cmd = new SqlCommand("AddGrades");
                    cmd.CommandType = CommandType.StoredProcedure;


                    CheckBox check = (CheckBox)gr.FindControl("chkCheck");
                    CheckBox check1 = (CheckBox)gr.FindControl("chkCheck1");
                    CheckBox check2 = (CheckBox)gr.FindControl("chkCheck2");
                    CheckBox check3 = (CheckBox)gr.FindControl("chkCheck3");
                    CheckBox check4 = (CheckBox)gr.FindControl("chkCheck4");
                    CheckBox check5 = (CheckBox)gr.FindControl("chkCheck5");

                    string rollno = GridView1.Rows[gr.RowIndex].Cells[1].Text;

                    if (check.Checked == true)
                    {
                        status = "A";
                        cmd.Parameters.AddWithValue("@rollno", rollno);
                        cmd.Parameters.AddWithValue("@courseID", Session["CourseID"].ToString());
                        cmd.Parameters.AddWithValue("@status", status);
                        cmd.Connection = con;
                        cmd.ExecuteNonQuery();
                    }
                    else if(check1.Checked == true)
                    {
                        status = "B";
                        cmd.Parameters.AddWithValue("@rollno", rollno);
                        cmd.Parameters.AddWithValue("@courseID", Session["CourseID"].ToString());
                        cmd.Parameters.AddWithValue("@status", status);
                        cmd.Connection = con;
                        cmd.ExecuteNonQuery();
                    }
                    else if (check2.Checked == true)
                    {
                        status = "C";
                        cmd.Parameters.AddWithValue("@rollno", rollno);
                        cmd.Parameters.AddWithValue("@courseID", Session["CourseID"].ToString());
                        cmd.Parameters.AddWithValue("@status", status);
                        cmd.Connection = con;
                        cmd.ExecuteNonQuery();
                    }
                    else if (check3.Checked == true)
                    {
                        status = "D";
                        cmd.Parameters.AddWithValue("@rollno", rollno);
                        cmd.Parameters.AddWithValue("@courseID", Session["CourseID"].ToString());
                        cmd.Parameters.AddWithValue("@status", status);
                        cmd.Connection = con;
                        cmd.ExecuteNonQuery();
                    }
                    else if (check4.Checked == true)
                    {
                        status = "E";
                        cmd.Parameters.AddWithValue("@rollno", rollno);
                        cmd.Parameters.AddWithValue("@courseID", Session["CourseID"].ToString());
                        cmd.Parameters.AddWithValue("@status", status);
                        cmd.Connection = con;
                        cmd.ExecuteNonQuery();
                    }
                    else if (check5.Checked == true)
                    {
                        status = "F";
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
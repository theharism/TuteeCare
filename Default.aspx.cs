using System;
using System.Web.UI;

namespace WebApplication1
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        
        }

        protected void SignIn(object sender, EventArgs e)
        {
            Response.Redirect("Student_dashboard.aspx");
        }

        protected void Teacher_Redirect(object sender, EventArgs e)
        {
            Response.Redirect("Teacher_Login.aspx");
        }

        protected void Admin_Redirect(object sender, EventArgs e)
        {
            Response.Redirect("Admin_Login.aspx");
        }

    }
}
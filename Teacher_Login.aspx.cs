﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void Student_Redirect(object sender, EventArgs e)
        {
            Response.Redirect("Student_Login.aspx");
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
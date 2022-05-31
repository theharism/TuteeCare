<%@ Page Title="" Language="C#" MasterPageFile="~/Student.Master" AutoEventWireup="true" CodeBehind="Student_Grades.aspx.cs" Inherits="WebApplication1.Student_Grades" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <div class="d-flex align-item-center justify-content-center" style="height:100vh;">
            <div style="margin-block:auto">


    <div>
        <asp:Label ID="Label1" runat="server" Text="Label">Enter Course to look at Grade:</asp:Label>
         &nbsp;
        <asp:TextBox ID="TextBox1" runat="server" Placeholder="Enter Course Name"></asp:TextBox>
        <br /><br /> <br />
        <asp:Button ID="Button1" runat="server" Text="Submit" cssclass="Submit_Button"/>
        
        <br /><br /> <br />
         <asp:Label ID="Label2" runat="server" Text="Grade:"></asp:Label>
        <asp:Label ID="TextBox2" runat="server" Placeholder="Course Grade"></asp:Label>

    </div>
                </div>
        </div>

</asp:Content>

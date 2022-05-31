<%@ Page Title="" Language="C#" MasterPageFile="~/Student.Master" AutoEventWireup="true" CodeBehind="Student_Add_Course.aspx.cs" Inherits="WebApplication1.Student_Add_Course" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <div class="d-flex align-item-center justify-content-center" style="height:100vh;">
            <div style="margin-block:auto">


    <div>
        <asp:Label ID="Label1" runat="server" Text="Label">Course Name:</asp:Label>
         &nbsp;
        <asp:TextBox ID="TextBox1" runat="server" Placeholder="Enter Course Name"></asp:TextBox>
        <br /><br /> <br />
        <asp:Button ID="Button1" runat="server" Text="Submit" cssclass="Submit_Button"/>
        
    </div>
                </div>
        </div>
</asp:Content>

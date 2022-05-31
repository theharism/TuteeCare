<%@ Page Title="" Language="C#" MasterPageFile="~/Student.Master" AutoEventWireup="true" CodeBehind="Student_Grades.aspx.cs" Inherits="WebApplication1.Student_Grades" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

      <div class="d-flex align-item-center justify-content-center" style="height:100vh;">
            <div style="margin-block:auto">

                 <div>
        <asp:Label ID="Label1" runat="server" Text="Label">Course Name:</asp:Label>
         &nbsp;
        <asp:DropDownList ID="DropDownList2" runat="server"></asp:DropDownList>
        <br /><br />

                      <asp:Button ID="Button1" runat="server" Text="Submit" cssclass="Submit_Button" OnClick="Button1_Click"/>   

                     </div>

                </div>
    </div>


</asp:Content>

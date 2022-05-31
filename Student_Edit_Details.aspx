<%@ Page Title="" Language="C#" MasterPageFile="~/Student.Master" AutoEventWireup="true" CodeBehind="Student_Edit_Details.aspx.cs" Inherits="WebApplication1.Student_Edit_Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

        <div class="d-flex align-item-center justify-content-center" style="height:100vh;">
            <div style="margin-block:auto">

    <div>
        <asp:Label ID="Label1" runat="server" Text="Label">Old Password:</asp:Label>
         &nbsp;
        <asp:TextBox ID="TextBox1" runat="server" Placeholder="Enter Old Password" AutoComplete="off"></asp:TextBox>
        <br /><br />
        <asp:Label ID="Label2" runat="server" Text="Label">New Password:</asp:Label>
         &nbsp;
        <asp:TextBox ID="TextBox2" runat="server" Placeholder="Enter New Password" AutoComplete="off"></asp:TextBox>
        <br /><br />
        <asp:Label ID="Label8" runat="server" Text="Label">Confirm New Password:</asp:Label>
         &nbsp;
        <asp:TextBox ID="TextBox8" runat="server" Placeholder="Enter New Password" AutoComplete="off"></asp:TextBox>
        <br /><br />
        <asp:Button ID="Button1" runat="server" Text="Change Password" cssclass="Submit_Button" OnClick="Button1_Click"/>
        
    </div>

    </div>
        </div>

   

</asp:Content>

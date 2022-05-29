<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Edit_Course.aspx.cs" Inherits="WebApplication1.Edit_Course1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    
    <div class="d-flex align-item-center justify-content-center" style="height:100vh;">
            <div style="margin-block:auto">


    <div>
        <asp:Label ID="Label1" runat="server" Text="Label">Course Name:</asp:Label>
         &nbsp;
        <asp:TextBox ID="TextBox1" runat="server" Placeholder="Enter Course Name" AutoComplete="off"></asp:TextBox>
        <br /><br /> <br />
        <asp:Label ID="Label8" runat="server" Text="Label">Credit Hours:</asp:Label>
         &nbsp;
        <asp:TextBox ID="TextBox8" runat="server" Placeholder="Enter Credit Hours" AutoComplete="off"></asp:TextBox>
        <br /><br /> <br />
        <asp:Button ID="Button1" runat="server" Text="Submit" cssclass="Submit_Button" OnClick="Button1_Click"/>
        
    </div>
                </div>
        </div>


</asp:Content>

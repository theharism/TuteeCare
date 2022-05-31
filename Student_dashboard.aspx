<%@ Page Title="" Language="C#" MasterPageFile="~/Student.Master" AutoEventWireup="true" CodeBehind="Student_dashboard.aspx.cs" Inherits="WebApplication1.Student_dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


        <style>

        .home{
            font-weight:normal;
            text-align:center;
            font-size:x-large;
            color:black;
            background-color:yellow;
        }
        .home1{
             font-weight:bold;
            text-align:center;
            font-size:x-large;
            color:blue;
            background-color:yellow;
        }

    </style>

    <asp:LoginName ID="LoginName1" runat="server" Font-Bold = "true" />

    <div class="d-flex align-item-center justify-content-center" style="height:100vh;">
            <div style="margin-block:auto">
        <asp:Label ID="Label1" runat="server" CssClass="home1" Text="Full Name:"></asp:Label>
        &nbsp;
        <asp:Label ID="Label2" runat="server" CssClass="home" Text=""></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label3" runat="server" CssClass="home1" Text="Date of Birth:"></asp:Label>
     &nbsp;
        <asp:Label ID="Label4" runat="server" CssClass="home" Text=""></asp:Label>
    <br /><br />

        <asp:Label ID="Label5" runat="server"  CssClass="home1" Text="Roll No:"></asp:Label>
        &nbsp;
        <asp:Label ID="Label6" runat="server" CssClass="home" Text=""></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label7" runat="server"  CssClass="home1" Text="Email:"></asp:Label>
     &nbsp;
        <asp:Label ID="Label8" runat="server" CssClass="home" Text=""></asp:Label>
    <br /><br />

        <asp:Label ID="Label9" runat="server" CssClass="home1" Text="Gender:"></asp:Label>
        &nbsp;
        <asp:Label ID="Label10" runat="server" CssClass="home" Text=""></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label11" runat="server" CssClass="home1" Text="Home Address:"></asp:Label>
     &nbsp;
        <asp:Label ID="Label12" runat="server" CssClass="home" Text=""></asp:Label>
    <br /><br />

    </div>
    </div>



</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Teacher_Login.aspx.cs" Inherits="WebApplication1.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    
<style>
    
    body{
        background-color:lightgray;
    }

 .logo{
        margin-left:58%;
        margin-top:8%;
        height:50%;
        width:50%;
 }
 .vl {
  border-left: 2px solid black;
  margin-left:50%;
  top:0;
  position:absolute;
  height: 540px;
 }

</style>        


    <asp:Image id="logo" cssclass="logo" ImageUrl="~/logo.png" runat="server" />
  
    <div class="vl"></div>


    <link href="Login.css" rel="stylesheet"/>

    <div class="Student_Login">
     <h2>TEACHER LOGIN</h2> 
      
            <asp:Label ID="Label1" runat="server" Text="Email" CssClass="email"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" Placeholder="Enter Email" CssClass="txtemail" autocomplete="off"></asp:TextBox>
            <asp:Label ID="Label2" runat="server" Text="Password" CssClass="pass"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server" placeholder="********" CssClass="txtpass" AutoComplete="off" TextMode="Password"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Sign In" CssClass="txtbutton" OnClick="Button1_Click" />
            
        <br /><br />
            <asp:Button ID="Button2" runat="server" Text="Student Sign in" CssClass="txtbutton1" OnClick="Student_Redirect"/>
            <asp:Button ID="Button3" runat="server" Text="Admin Sign in" CssClass="txtbutton1" OnClick="Admin_Redirect"/>
    </div>

</asp:Content>

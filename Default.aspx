<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<style>
    
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
   
     <h2>STUDENT LOGIN</h2> 
      
            <asp:Label ID="Label1" runat="server" Text="Email" CssClass="email"></asp:Label>
      
        
        
        <asp:TextBox ID="TextBox1" runat="server" Placeholder="Enter Email" CssClass="txtemail" ></asp:TextBox>
            
        <asp:Label ID="Label2" runat="server" Text="Password" CssClass="pass"></asp:Label>
            
        
        <asp:TextBox ID="TextBox2" runat="server" placeholder="********" CssClass="txtpass"></asp:TextBox>
            
        
        <asp:Button ID="Button1" runat="server" Text="Sign In" CssClass="txtbutton" OnClick="SignIn"/>
            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btnforget">Forgot Password</asp:LinkButton>
            <br /><br />
            <asp:Button ID="Button2" runat="server" Text="Teacher Sign in" CssClass="txtbutton1" OnClick="Teacher_Redirect"  />
            <asp:Button ID="Button3" runat="server" Text="Admin Sign in" CssClass="txtbutton1" OnClick="Admin_Redirect" />
      </div>
    
    
</asp:Content>

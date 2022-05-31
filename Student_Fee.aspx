<%@ Page Title="" Language="C#" MasterPageFile="~/Student.Master" AutoEventWireup="true" CodeBehind="Student_Fee.aspx.cs" Inherits="WebApplication1.Student_Fee" %>
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


     <div class="d-flex align-item-center justify-content-center" style="height:100vh;">
            <div style="margin-block:auto">


    <div>
        <asp:Label ID="Label1" CssClass="home1" runat="server" Text="Fee Status: "/>
         &nbsp;
        <asp:Label ID="label2" runat="server" CssClass="home" Text=""></asp:Label>

    </div>
                </div>
        </div>


</asp:Content>

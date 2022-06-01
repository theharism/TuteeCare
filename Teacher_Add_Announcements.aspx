<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher.Master" AutoEventWireup="true" CodeBehind="Teacher_Add_Announcements.aspx.cs" Inherits="WebApplication1.Teacher_Add_Announcements" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    
    <br />
    <br />
<div class="justify-content-center" style="height:100vh;">

  
    <div>
                     <center>
                    <h4>Announcements</h4>
                </center>

                 </div>

                <div class="row">
                    <div class="col">
                        <hr />
                    </div>
                </div>

                <div class="row">
                    <div class="col">

                        <asp:TextBox ID="TextBox1" TextMode="MultiLine" runat="server" Height="400px" Width="800px" Placeholder="Word limit: 1000" AutoComplete="off"></asp:TextBox>

                    </div>

                </div>
    <br /> 
    <center>
        <asp:Button ID="Button1" runat="server" Text="Add" cssclass="Submit_Button" OnClick="Button1_Click"/>
    </center>

    </div>


</asp:Content>

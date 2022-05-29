<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Edit_Student.aspx.cs" Inherits="WebApplication1.Edit_Student" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <br />
    <br />

       <div class="align-item-center justify-content-center" style="height:100vh;">
            <div style="margin-block:auto">

    <div>
        <div class="row">

            <div class="col-md-6">
                <asp:Label ID="Label1" runat="server" Text="Label">Full Name:</asp:Label>
         &nbsp;
        <asp:TextBox ID="TextBox1" runat="server" Placeholder="Enter Full Name" AutoComplete="off"></asp:TextBox>
         &nbsp;
                </div>
                <div>
                <asp:Label ID="Label2" runat="server" Text="Label">Date of Birth:</asp:Label>
         &nbsp;
        <asp:TextBox ID="TextBox2" runat="server" Placeholder="Enter DoB (yyyy-mm-dd)" TextMode="Date" AutoComplete="off"></asp:TextBox>
         &nbsp;
            </div>
        </div>
        
        <br />
        <br />

        <div class="row">
            <div class="col-md-6">
                <asp:Label ID="Label4" runat="server" Text="Label">Gender:</asp:Label>
         &nbsp;
       <asp:DropDownList ID="DropDownList1" runat="server">
                   <asp:ListItem>Select</asp:ListItem>
                   <asp:ListItem>Male</asp:ListItem>
                   <asp:ListItem>Female</asp:ListItem>
               </asp:DropDownList>
         &nbsp;
            </div>
            <div>
                 
        <asp:Label ID="Label5" runat="server" Text="Label">Phone No:</asp:Label>
         &nbsp;
        <asp:TextBox ID="TextBox5" runat="server" Placeholder="Enter Phone No (0xxxxxxxxxx)" AutoComplete="off"></asp:TextBox>
         &nbsp;
            </div>
        </div>


        <br /><br />
        
        
        <div class="row">
            <div class="col-md-6">
                <asp:Label ID="Label6" runat="server" Text="Label">Address:</asp:Label>
         &nbsp;
        <asp:TextBox ID="TextBox6" runat="server" Placeholder="Enter Home Address" AutoComplete="off"></asp:TextBox>
         &nbsp;
            </div>
            <div>
                 <asp:Label ID="Label7" runat="server" Text="Label">Password:</asp:Label>
         &nbsp;
        <asp:TextBox ID="TextBox7" runat="server" Placeholder="Enter Password" AutoComplete="off"></asp:TextBox>
         &nbsp;
            </div>
        </div>       <br /><br />
        
        </div>
        
        <asp:Button ID="Button1" runat="server" Text="Submit" cssclass="Submit_Button" OnClick="Button1_Click"/>   
        </div>


           </div>
 
</asp:Content>

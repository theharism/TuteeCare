<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Update_Fees.aspx.cs" Inherits="WebApplication1.Update_Fees" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

      <div class="d-flex align-item-center justify-content-center" style="height:100vh;">
            <div style="margin-block:auto">

                
    <div>
        <asp:Label ID="Label1" runat="server" Text="Label">Roll No:</asp:Label>
         &nbsp;
       <asp:DropDownList ID="DropDownList2" runat="server"></asp:DropDownList>
        <br /><br />
        <asp:Label ID="Label2" runat="server" Text="Label">Status:</asp:Label>
         &nbsp;
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem Text="Paid"></asp:ListItem>
            <asp:ListItem Text="UnPaid"></asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
         <asp:Button ID="Button1" runat="server" Text="Submit" cssclass="Submit_Button" OnClick="Button1_Click"/>   

        </div>


                </div>
          </div>

</asp:Content>

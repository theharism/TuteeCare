<%@ Page Title="" Language="C#" MasterPageFile="~/Student.Master" AutoEventWireup="true" CodeBehind="Student_dashboard.aspx.cs" Inherits="WebApplication1.Student_dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <div class="d-flex align-item-center justify-content-center" style="height:100vh;">
            <div style="margin-block:auto">
    <h1>

        Student Details 

    </h1>
        <br />
        <br />
        <div>
            <p>

               Name : 
                <asp:TextBox ID="Name" ReadOnly="true" runat="server" BorderColor="White" ></asp:TextBox>

                <br />
                <br />
                <br />

                Roll No. : 
                <asp:TextBox ID="TextBox1" ReadOnly="true" runat="server" BorderColor="White" ></asp:TextBox>

                <br />
                <br />
                <br />
                
                Gender : 
                <asp:TextBox ID="TextBox2" ReadOnly="true" runat="server" BorderColor="White" ></asp:TextBox>

                <br />
                <br />
                <br />


                E-Mail Address : 
                <asp:TextBox ID="TextBox3" ReadOnly="true" runat="server" BorderColor="White" ></asp:TextBox>

                <br />
                <br />
                <br />


                Residential Address : 
                <asp:TextBox ID="TextBox4" ReadOnly="true" runat="server" BorderColor="White" ></asp:TextBox>

                <br />
                <br />
                <br />

                Date Of Birth : 
                <asp:TextBox ID="TextBox5" ReadOnly="true" runat="server" BorderColor="White" ></asp:TextBox>

                <br />
                <br />
                <br />
                


                

            </p>
        </div>

        <br / >
   


    </div>
  </div>



</asp:Content>

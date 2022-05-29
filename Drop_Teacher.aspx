<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Drop_Teacher.aspx.cs" Inherits="WebApplication1.Drop_Teacher" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

      
     <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.css">
  
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>

   <script type="text/javascript">
       $(document).ready(function () {

           $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();

       });
   </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

     <br />
    <br />
<div class="justify-content-center" style="height:100vh;">

      
            <div style="margin-block:auto">

               

        <asp:Label ID="Label1" runat="server" Text="Label">Teacher ID:</asp:Label>
         &nbsp;
        <asp:TextBox ID="TextBox1" runat="server" Placeholder="Enter Teacher ID" autocomplete="off"></asp:TextBox>
        <br /><br />

                      <asp:Button ID="Button1" runat="server" Text="Submit" cssclass="Submit_Button" OnClick="Button1_Click"/>   

                     </div>

    <br />
    <br />

   
    <div>
                     <center>
                    <h4>Teachers</h4>
                </center>

                 </div>

                <div class="row">
                    <div class="col">
                        <hr />
                    </div>
                </div>

                <div class="row">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TuteeCareConnectionString %>" SelectCommand="SELECT [FullName], [TeacherID], [Availability] FROM [Teacher]"></asp:SqlDataSource>
                    <div class="col">
                        <asp:GridView ID="GridView1" runat="server" class="table table-striped table-bordered" AutoGenerateColumns="False" DataKeyNames="TeacherID" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="FullName" HeaderText="FullName" SortExpression="FullName" />
                                <asp:BoundField DataField="TeacherID" HeaderText="TeacherID" ReadOnly="True" SortExpression="TeacherID" />
                                <asp:BoundField DataField="Availability" HeaderText="Availability" SortExpression="Availability" />
                            </Columns>
                        </asp:GridView>
                    </div>

                </div>

    </div>

</asp:Content>

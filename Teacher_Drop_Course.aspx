<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher.Master" AutoEventWireup="true" CodeBehind="Teacher_Drop_Course.aspx.cs" Inherits="WebApplication1.Teacher_Drop_Course" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    
    <br />
    <br />
<div class="justify-content-center" style="height:100vh;">

      
            <div style="margin-block:auto">

               

        <asp:Label ID="Label1" runat="server" Text="Label">Course ID:</asp:Label>
         &nbsp;
        <asp:TextBox ID="TextBox1" runat="server" Placeholder="Enter Course ID" AutoComplete="off"></asp:TextBox>
        <br /><br />

                      <asp:Button ID="Button1" runat="server" Text="Submit" cssclass="Submit_Button" OnClick="Button1_Click"/>   

                     </div>

    <br />
    <br />

   
    <div>
                     <center>
                    <h4>Opted Courses</h4>
                </center>

                 </div>

                <div class="row">
                    <div class="col">
                        <hr />
                    </div>
                </div>

                <div class="row">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TuteeCareConnectionString %>" SelectCommand="TeacherRegisteredCoursesView" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="TeacherID" SessionField="TeacherID" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <div class="col">
                        <asp:GridView ID="GridView1" runat="server" class="table table-striped table-bordered" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="courseID">
                            <Columns>
                                <asp:BoundField DataField="CourseName" HeaderText="CourseName" SortExpression="CourseName" />
                                <asp:BoundField DataField="courseID" HeaderText="courseID" ReadOnly="True" SortExpression="courseID" />
                                <asp:BoundField DataField="credithours" HeaderText="credithours" SortExpression="credithours" />
                            </Columns>
                            
                        </asp:GridView>
                    </div>

                </div>

    </div>

</asp:Content>

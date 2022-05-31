<%@ Page Title="" Language="C#" MasterPageFile="~/Student.Master" AutoEventWireup="true" CodeBehind="Student_Course_View.aspx.cs" Inherits="WebApplication1.Student_Course_View" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    
    <br />
    <br />
<div class="justify-content-center" style="height:100vh;">

      
   
    <div>
                     <center>
                    <h4>Registered Courses</h4>
                </center>

                 </div>

                <div class="row">
                    <div class="col">
                        <hr />
                    </div>
                </div>

                <div class="row">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TuteeCareConnectionString %>" SelectCommand="RegisteredCoursesView" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="rollno" SessionField="rollno" Type="String" />
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

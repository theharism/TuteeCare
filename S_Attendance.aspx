﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Student.Master" AutoEventWireup="true" CodeBehind="S_Attendance.aspx.cs" Inherits="WebApplication1.S_Attendance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <br />  
    <br />

<div class="justify-content-center" style="height:100vh;">
   
    <div>
      

                           <center>
                    <h4>

                        Attendance</h4>
                </center>

                 </div>

                <div class="row">
                    <div class="col">
                        <hr />
                    </div>
                </div>
  
    <div class="row">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TuteeCareConnectionString %>" SelectCommand="AttendanceView" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="rollno" SessionField="rollno" Type="String" />
                <asp:SessionParameter Name="courseID" SessionField="CourseID" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
                     <div class="col">
                        <asp:GridView ID="GridView1" runat="server" class="table table-striped table-bordered" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="Date" HeaderText="Date" ReadOnly="True" SortExpression="Column1" />
                                <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
                            </Columns>
                            </asp:GridView>
                    </div>

                </div>

    <br />
    <br />

    <center>
        <asp:Button ID="Button1" runat="server" Text="Back" CssClass="Submit_Button" OnClick="Button1_Click" />
    </center>
      
    </div>

</asp:Content>

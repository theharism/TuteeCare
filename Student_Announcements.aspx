<%@ Page Title="" Language="C#" MasterPageFile="~/Student.Master" AutoEventWireup="true" CodeBehind="Student_Announcements.aspx.cs" Inherits="WebApplication1.Student_Announcements" %>
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TuteeCareConnectionString %>" SelectCommand="AnnouncementsView" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    <div class="col">
                        <asp:GridView ID="GridView1" runat="server" class="table table-striped table-bordered" AutoGenerateColumns="False" DataKeyNames="Date,message" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="Date" HeaderText="Date" ReadOnly="True" SortExpression="Date" />
                                <asp:BoundField DataField="message" HeaderText="message" ReadOnly="True" SortExpression="message" />
                            </Columns>
                           
                        </asp:GridView>
                    </div>

                </div>

    </div>


</asp:Content>

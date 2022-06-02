<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher.Master" AutoEventWireup="true" CodeBehind="T_Grades.aspx.cs" Inherits="WebApplication1.T_Grades" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    
    <script src="Scripts/jquery-1.7.1.js"></script>
<script language="javascript" type="text/javascript">
    function SelectAllCheckboxes(chk) {
        var totalRows = $("#<%=GridView1.ClientID %> tr").length;
        var selected = 0;
        $('#<%=GridView1.ClientID %>').find("input:checkbox").each(function () {
            if (this != chk) {
                this.checked = chk.checked;
                selected += 1;
            }
        });
    }
 
    function CheckedCheckboxes(chk) {
        if (chk.checked) {
            var totalRows = $('#<%=GridView1.ClientID %> :checkbox').length;
            var checked = $('#<%=GridView1.ClientID %> :checkbox:checked').length
            if (checked == (totalRows - 1)) {
                $('#<%=GridView1.ClientID %>').find("input:checkbox").each(function () {
                    this.checked = true;
                });
            }
            else {
                $('#<%=GridView1.ClientID %>').find('input:checkbox:first').removeAttr('checked');
            }
        }
        else {
            $('#<%=GridView1.ClientID %>').find('input:checkbox:first').removeAttr('checked');
        }
    }       
</script>
    
    <br />  
    <br />

<div class="justify-content-center" style="height:100vh;">
   
    <div>
      

                           <center>
                    <h4>

                        Enrolled Students</h4>
                </center>

                 </div>

                <div class="row">
                    <div class="col">
                        <hr />
                    </div>
                </div>
  
    <div class="row">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TuteeCareConnectionString %>" SelectCommand="ViewEnrolled" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="CourseID" SessionField="CourseID" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
                     <div class="col">
                        <asp:GridView ID="GridView1" runat="server" class="table table-striped table-bordered" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="Rollno">
                            <Columns>
                                <asp:BoundField  DataField ="FullName" HeaderText="FullName" SortExpression="FullName" />
                                <asp:BoundField  DataField="Rollno" HeaderText="Rollno" ReadOnly="True" SortExpression="Rollno" />
                             <asp:TemplateField >
            
            <ItemTemplate>
                A&nbsp;&nbsp;<asp:CheckBox ID="chkCheck" runat="server" onclick="javascript:CheckedCheckboxes(this)" />
            </ItemTemplate>
                                 </asp:TemplateField>
                                <asp:TemplateField >
                                 <ItemTemplate>
                B&nbsp;&nbsp;<asp:CheckBox ID="chkCheck1" runat="server" onclick="javascript:CheckedCheckboxes(this)" />
            </ItemTemplate>
                                    </asp:TemplateField >
                                <asp:TemplateField >
                                 <ItemTemplate>
                C&nbsp;&nbsp;<asp:CheckBox ID="chkCheck2" runat="server" onclick="javascript:CheckedCheckboxes(this)" />
            </ItemTemplate>
                                  </asp:TemplateField >
                                         <asp:TemplateField >
                                             <ItemTemplate>
                D&nbsp;&nbsp;<asp:CheckBox ID="chkCheck3" runat="server" onclick="javascript:CheckedCheckboxes(this)" />
            </ItemTemplate>
                                             </asp:TemplateField >
                                <asp:TemplateField >
                                 <ItemTemplate>
                E&nbsp;&nbsp;<asp:CheckBox ID="chkCheck4" runat="server" onclick="javascript:CheckedCheckboxes(this)" />
            </ItemTemplate>
                                                 </asp:TemplateField>
                                                     <asp:TemplateField >
                                <ItemTemplate>
                F&nbsp;&nbsp;<asp:CheckBox ID="chkCheck5" runat="server" onclick="javascript:CheckedCheckboxes(this)" />
            </ItemTemplate>
        </asp:TemplateField>

                                   
                            </Columns>
                            
                            </asp:GridView>
                       
                    </div>

                </div>

    <br />
    <br />

    <center>
        <asp:Button ID="Button2" runat="server" Text="Add" OnClick="Button2_Click" CssClass="Submit_Button"/>
        </center>
    <br />
    <center>
        <asp:Button ID="Button1" runat="server" Text="Back" CssClass="Submit_Button" OnClick="Button1_Click" />
        
    </center>
      
    </div>


</asp:Content>

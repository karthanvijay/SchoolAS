<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ExamTypeMaintenance.aspx.cs" Inherits="SchoolManagement.Admin.ExamTypeMaintenance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <h2>ExamType Maintenance</h2>

    <asp:GridView ID="GvExamType" runat="server" OnRowCommand="GvExamTypeRowCommand" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ExamTypeId" 
        DataSourceID="EntityDataSourceExamType" BackColor="White" ShowFooter="True"
        BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
        GridLines="Horizontal">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" ValidationGroup="g1" runat="server" CausesValidation="True"
                            CommandName="Update" Text="Update" ></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="Cancel" ></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="Edit" ></asp:LinkButton>
                        &nbsp;|&nbsp;<asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False"
                            CommandName="Delete" Text="Delete" OnClientClick="if (!confirm('Do you want to delete this ExamType ?')) return false"
                          ></asp:LinkButton>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton ID="LinkButton1"  runat="server" 
                            CommandName="Insert" Text="Add" ></asp:LinkButton>
                    </FooterTemplate>
                </asp:TemplateField>
                  <asp:TemplateField HeaderText="ExamType Id" SortExpression="ExamTypeId" Visible="False">
                     <EditItemTemplate>
                        <asp:TextBox ID="txtExamTypeId" runat="server" Text='<%# Bind("ExamTypeId") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                       <asp:Label ID="lblExamTypeId" runat="server" Text='<%# Bind("ExamTypeId") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            <asp:TemplateField HeaderText="Exam Name" SortExpression="ExamName">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtExamName" runat="server" Text='<%# Bind("ExamName") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                       <asp:Label ID="lblExamName" runat="server" Text='<%# Bind("ExamName") %>' />
                    </ItemTemplate>
                    <FooterTemplate>
                      <asp:TextBox ID="ftrExamName" runat="server"/>
                    </FooterTemplate>
                </asp:TemplateField>
           <asp:TemplateField HeaderText="PerSubjectMarks" SortExpression="PerSubjectMarks">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtPerSubjectMarks" runat="server" Text='<%# Bind("PerSubjectMarks") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                       <asp:Label ID="lblPerSubjectMarks" runat="server" Text='<%# Bind("PerSubjectMarks") %>' />
                    </ItemTemplate>
                    <FooterTemplate>
                      <asp:TextBox ID="ftrPerSubjectMarks" runat="server"/>
                    </FooterTemplate>
                </asp:TemplateField>
       <asp:TemplateField HeaderText="PassingMarksPerSubject" SortExpression="PassingMarksPerSubject">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtPassingMarksPerSubject" runat="server" Text='<%# Bind("PassingMarksPerSubject") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                       <asp:Label ID="lblPassingMarksPerSubject" runat="server" Text='<%# Bind("PassingMarksPerSubject") %>' />
                    </ItemTemplate>
                    <FooterTemplate>
                      <asp:TextBox ID="ftrPassingMarksPerSubject" runat="server"/>
                    </FooterTemplate>
                </asp:TemplateField>
       
        </Columns>
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
       <EmptyDataTemplate>
           
       </EmptyDataTemplate>
    </asp:GridView>
    <asp:Panel ID="PnlAddExamTemplateType" runat="server">
         <table>
               <tr>
                   <td>
                       Exam Name
                   </td>
                   <td>
                      <asp:TextBox ID="emptyDataTemplateExamName" runat="server"/>
                       
                   </td>
               </tr>
           <tr>
                   <td>
                      Per Subject Marks
                   </td>
                   <td>
                      <asp:TextBox ID="emptyDataTemplatePerSubjectMarks" runat="server"/>
                       
                   </td>
               </tr>
               
           <tr>
                   <td>
                    Passing Marks Per Subject
                   </td>
                   <td>
                      <asp:TextBox ID="emptyDataTemplatePassingMarksPerSubject" runat="server"/>
                       
                   </td>
               </tr>
            <tr>
                   <td>
                       
                   </td>
                   <td>
                       
                        <asp:LinkButton ID="LinkButton1"  runat="server" 
                            OnClick="AddExamtype" Text="Add" ></asp:LinkButton>
                   </td>
               </tr>
           
           </table>
          
    </asp:Panel>
      
        <asp:EntityDataSource ID="EntityDataSourceExamType" runat="server" ViewStateMode="Enabled"
        EnableInsert="True" EnableUpdate="True" EnableDelete="True" 
      ConnectionString="metadata=res://DataLib/SchoolManagement.csdl|res://DataLib/SchoolManagement.ssdl|res://DataLib/SchoolManagement.msl;provider=System.Data.SqlClient;provider connection string=&quot;data source=VIJAY;initial catalog=TestDB;integrated security=True;multipleactiveresultsets=True;App=EntityFramework&quot;" 
        DefaultContainerName="SchoolManagementSystemEntities" EnableFlattening="False" 
         EntitySetName="ExamTypes" EntityTypeFilter="ExamType">
  </asp:EntityDataSource>
       

</asp:Content>

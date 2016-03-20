<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SubjectTypeMaintenance.aspx.cs" Inherits="SchoolManagement.Admin.SubjectTypeMaintenance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <h2>SubjectType Maintenance</h2>
    <asp:GridView ID="GvSubjectType" runat="server" OnRowCommand="GvSubjectTypeRowCommand" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="SubjectId" 
        DataSourceID="EntityDataSourceSubjectMaster" BackColor="White" ShowFooter="True"
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
                            CommandName="Delete" Text="Delete" OnClientClick="if (!confirm('Do you want to delete this SubjectType ?')) return false"
                          ></asp:LinkButton>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton ID="LinkButton1"  runat="server" 
                            CommandName="Insert" Text="Add" ></asp:LinkButton>
                    </FooterTemplate>
                </asp:TemplateField>
                  <asp:TemplateField HeaderText="Subject Id" SortExpression="SubjectId" Visible="False">
                     <EditItemTemplate>
                        <asp:TextBox ID="txtExamTypeId" runat="server" Text='<%# Bind("SubjectId") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                       <asp:Label ID="lblExamTypeId" runat="server" Text='<%# Bind("SubjectId") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            <asp:TemplateField HeaderText="Subject Name" SortExpression="SubjectName">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtSubjectName" runat="server" Text='<%# Bind("SubjectName") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                       <asp:Label ID="lblSubjectName" runat="server" Text='<%# Bind("SubjectName") %>' />
                    </ItemTemplate>
                    <FooterTemplate>
                      <asp:TextBox ID="ftrSubjectName" runat="server"/>
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
    <asp:Panel ID="PnlAddSubjectNameTemplateType" runat="server">
         <table>
               <tr>
                   <td>
                       Subject Name
                   </td>
                   <td>
                      <asp:TextBox ID="emptyDataTemplateSubjectName" runat="server"/>
                       
                   </td>
                   <td>
                       
                        <asp:LinkButton ID="LinkButton1"  runat="server" 
                            OnClick="AddSubjecType" Text="Add" ></asp:LinkButton>
                   </td>
               </tr>
            </table>
          
    </asp:Panel>
    
         <asp:EntityDataSource ID="EntityDataSourceSubjectMaster" 
        runat="server" ViewStateMode="Enabled"
        EnableInsert="True" EnableUpdate="True" EnableDelete="True" 
       ConnectionString="metadata=res://DataLib/SchoolManagement.csdl|res://DataLib/SchoolManagement.ssdl|res://DataLib/SchoolManagement.msl;provider=System.Data.SqlClient;provider connection string=&quot;data source=VIJAY;initial catalog=TestDB;integrated security=True;multipleactiveresultsets=True;App=EntityFramework&quot;" 
        DefaultContainerName="SchoolManagementSystemEntities" EnableFlattening="False" 
         EntitySetName="SubjectMasters" EntityTypeFilter="SubjectMaster">
         </asp:EntityDataSource>
</asp:Content>

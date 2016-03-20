<%@ Page Title="Medium Maintenance" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MediumMaintenance.aspx.cs" Inherits="SchoolManagement.Admin.MediumMaintenance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Medium Maintenance
    </h2>
    <asp:GridView ID="GvMedium" runat="server" OnRowCommand="GvMediumRowCommand"
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="MediumId" 
        DataSourceID="EntityDataSourceMedium" BackColor="White" ShowFooter="True"
        BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
        GridLines="Horizontal">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <EmptyDataTemplate>Hello </EmptyDataTemplate>
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
                            CommandName="Delete" Text="Delete" OnClientClick="if (!confirm('Do you want to delete this medium ?')) return false"
                          ></asp:LinkButton>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton ID="LinkButton1"  runat="server" 
                            CommandName="Insert" Text="Add" ></asp:LinkButton>
                    </FooterTemplate>
                </asp:TemplateField>
                  <asp:TemplateField HeaderText="Medium Id" SortExpression="MediumId" Visible="False">
                     <EditItemTemplate>
                        <asp:TextBox ID="txtMediumId" runat="server" Text='<%# Bind("MediumId") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                       <asp:Label ID="lblMediumId" runat="server" Text='<%# Bind("MediumId") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            <asp:TemplateField HeaderText="Medium Name" SortExpression="MediumName">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtMediumName" runat="server" Text='<%# Bind("MediumName") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                       <asp:Label ID="lblMediumName" runat="server" Text='<%# Bind("MediumName") %>' />
                    </ItemTemplate>
                    <FooterTemplate>
                      <asp:TextBox ID="ftrMediumName" runat="server"/>
                    </FooterTemplate>
                </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
       
    </asp:GridView>
      
        <asp:EntityDataSource ID="EntityDataSourceMedium" 
        runat="server" ViewStateMode="Enabled"
        EnableInsert="True" EnableUpdate="True" EnableDelete="True" 
     ConnectionString="metadata=res://DataLib/SchoolManagement.csdl|res://DataLib/SchoolManagement.ssdl|res://DataLib/SchoolManagement.msl;provider=System.Data.SqlClient;provider connection string=&quot;data source=VIJAY;initial catalog=TestDB;integrated security=True;multipleactiveresultsets=True;App=EntityFramework&quot;" 
        DefaultContainerName="SchoolManagementSystemEntities" EnableFlattening="False" 
         EntitySetName="Media" EntityTypeFilter="Medium">
         </asp:EntityDataSource>
   

</asp:Content>

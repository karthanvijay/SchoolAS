<%@ Page Title="Cast Maintenance" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CastMaintenance.aspx.cs" Inherits="SchoolManagement.Admin.CastMaintenance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Cast Maintenance
    </h2>
     <asp:EntityDataSource ID="EntityDataSource1" runat="server" 
        EnableInsert="True" EnableUpdate="True" EnableDelete="True" 
        ConnectionString="metadata=res://DataLib/SchoolManagement.csdl|res://DataLib/SchoolManagement.ssdl|res://DataLib/SchoolManagement.msl;provider=System.Data.SqlClient;provider connection string=&quot;data source=VIJAY;initial catalog=TestDB;integrated security=True;multipleactiveresultsets=True;App=EntityFramework&quot;" 
        DefaultContainerName="SchoolManagementSystemEntities" EnableFlattening="False" 
        EntitySetName="Casts" EntityTypeFilter="Cast">
    </asp:EntityDataSource>

      <asp:GridView ID="GvCast" runat="server" OnRowCommand="GvCastRowCommand"
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="CastId" 
        DataSourceID="EntityDataSource1" BackColor="White" ShowFooter="True"
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
                            CommandName="Delete" Text="Delete" OnClientClick="if (!confirm('Do you want to delete this Cast ?')) return false"
                          ></asp:LinkButton>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton ID="LinkButton1"  runat="server" 
                            CommandName="Insert" Text="Add" ></asp:LinkButton>
                    </FooterTemplate>
                </asp:TemplateField>
                  <asp:TemplateField HeaderText="Cast Id" SortExpression="CastId" Visible="False">
                     <EditItemTemplate>
                        <asp:TextBox ID="txtCastId" runat="server" Text='<%# Bind("CastId") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                       <asp:Label ID="lblCastId" runat="server" Text='<%# Bind("CastId") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            <asp:TemplateField HeaderText="Cast Name" SortExpression="CastName">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtCastName" runat="server" Text='<%# Bind("CastName") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                       <asp:Label ID="lblCastName" runat="server" Text='<%# Bind("CastName") %>' />
                    </ItemTemplate>
                    <FooterTemplate>
                      <asp:TextBox ID="ftrCastName" runat="server"/>
                    </FooterTemplate>
                </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
    </asp:GridView>

</asp:Content>

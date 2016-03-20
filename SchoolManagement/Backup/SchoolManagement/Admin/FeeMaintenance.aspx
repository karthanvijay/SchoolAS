<%@ Page Title="Fee Maintenance" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="FeeMaintenance.aspx.cs" Inherits="SchoolManagement.Admin.FeeMaintenance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Fee Maintenance</h2> 
    <asp:Label ID="lblError" runat="server" Text="Fee Type for Class and Medium already exists." Visible="False" ForeColor="red"></asp:Label>
    <asp:GridView ID="GvFeeMaster" runat="server"  AllowSorting="True" OnRowCommand="GvFeeMasterRowCommand"
        AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="EntityDataSourceFeeMasters" EditMode="InPlace"
        BackColor="White" ShowFooter="True" BorderColor="#E7E7FF" BorderStyle="None"
        BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <EmptyDataTemplate>
          
        </EmptyDataTemplate>
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" ValidationGroup="editFee" runat="server" CausesValidation="True" 
                        CommandName="Update" Text="Update"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                        Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                        Text="Edit"></asp:LinkButton>
                    &nbsp;|&nbsp;<asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False"
                        CommandName="Delete" Text="Delete" OnClientClick="if (!confirm('Do you want to delete this Fee ?')) return false"></asp:LinkButton>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Insert" Text="Add" ValidationGroup="addFee" CausesValidation="True"></asp:LinkButton>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Id" SortExpression="Id" Visible="False">
                <EditItemTemplate>
                    <asp:Label ID="txtId" runat="server" Text='<%# Bind("Id") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblId" runat="server" Text='<%# Bind("Id") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Fee" SortExpression="Fee">
                <EditItemTemplate>
                    <asp:TextBox ID="txtFeeName" runat="server" Text='<%# Bind("Fee") %>' CausesValidation="True"/>  
                     <asp:RequiredFieldValidator ID="rfvftrFeeName" runat="server" ErrorMessage="*" ValidationGroup="editFee" Display="Dynamic" ForeColor="red" ControlToValidate="txtFeeName"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="rgexFee" runat="server" ErrorMessage="Only Numbers" Display="Dynamic" ValidationGroup="editFee" ForeColor="red" ControlToValidate="txtFeeName" ValidationExpression="[0-9]+"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblFeeName" runat="server" Text='<%# Bind("Fee") %>' />
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="ftrFeeName" runat="server" Text='<%# Bind("Fee") %>' /> 
                    <asp:RequiredFieldValidator ID="rfvftrFeeName" runat="server" ErrorMessage="*"  Display="Dynamic" ForeColor="red" ControlToValidate="ftrFeeName" ValidationGroup="addFee"></asp:RequiredFieldValidator>
                      <asp:RegularExpressionValidator ID="rgexFee" runat="server" Display="Dynamic" ErrorMessage="Only Numbers" ControlToValidate="ftrFeeName" ValidationGroup="addFee" ForeColor="red" ValidationExpression="[0-9]+"></asp:RegularExpressionValidator>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Class" SortExpression="ClassId">
                <EditItemTemplate>
                    <asp:Label ID="lblClassName" runat="server" Text='<%# Bind("Class.ClassName") %>' />
                </EditItemTemplate>
                <ItemTemplate> 
                    <asp:Label ID="lblClassName" runat="server" Text='<%# Bind("Class.ClassName") %>' />
                </ItemTemplate>
                <FooterTemplate>
                  <asp:DropDownList ID="ddlClass" runat="server" 
                        DataSourceID="LinqDataSourceClass" DataTextField="ClassName" DataValueField="ClassId">
                    </asp:DropDownList>
                    <asp:LinqDataSource ID="LinqDataSourceClass" runat="server" ContextTypeName="DataLib.SchoolManagementSystemEntities"
                         TableName="Classes">
                    </asp:LinqDataSource>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Medium Name" SortExpression="MediumId">
                <EditItemTemplate>
                   <asp:Label ID="lblMediumName" runat="server" Text='<%# Bind("Medium.MediumName") %>' />
                
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblMediumName" runat="server" Text='<%# Bind("Medium.MediumName") %>' />
                </ItemTemplate>
                <FooterTemplate>
                  <asp:DropDownList ID="ddlMedium" runat="server" SelectedValue='<%# Bind("MediumId") %>'
                        DataSourceID="LinqDataSourceMedium" DataTextField="MediumName" DataValueField="MediumId">
                    </asp:DropDownList>
                  
                </FooterTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
   
    </asp:GridView>

       <asp:LinqDataSource ID="LinqDataSourceMedium" runat="server" ContextTypeName="DataLib.SchoolManagementSystemEntities"
                         TableName="Media" EntityTypeName="">
                    </asp:LinqDataSource>
        <asp:EntityDataSource ID="EntityDataSourceFeeMasters" 
        runat="server" ViewStateMode="Enabled"
        EnableInsert="True" EnableUpdate="True" EnableDelete="True" 
     ConnectionString="metadata=res://DataLib/SchoolManagement.csdl|res://DataLib/SchoolManagement.ssdl|res://DataLib/SchoolManagement.msl;provider=System.Data.SqlClient;provider connection string=&quot;data source=VIJAY;initial catalog=TestDB;integrated security=True;multipleactiveresultsets=True;App=EntityFramework&quot;" 
        DefaultContainerName="SchoolManagementSystemEntities" EnableFlattening="False" 
          EntitySetName="FeeMasters" EntityTypeFilter="FeeMaster">
         </asp:EntityDataSource>
</asp:Content>

<%@ Page Title="User Maintenance" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="UserMaintenance.aspx.cs" Inherits="SchoolManagement.Admin.UserMaintenance" %>
    <%@ Register tagPrefix="ucUserMaintenance" tagName="UserMaintenance" src="/UserControls/userMaintenance.ascx"%>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
        <link href="/Scripts/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css" />
    <script src="/Scripts/jquery.js" type="text/javascript"></script>
    <script src="/Scripts/jqueryui.js" type="text/javascript"></script>
    <script src="/Scripts/SchoolManagementScripts/userMaintenance.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        User Maintenance
    </h2>
    <asp:Button ID="btnAddUser" runat="server" Text="Add User" Style="float: right;" OnClick="AddUser" CausesValidation="False" />
    <br />
    <br />
    <br />
    <asp:Label ID="lblAddOrUpdateUser" runat="server" Text="" CssClass="addOrUpdateUser"></asp:Label>
    <asp:GridView ID="GvUsers" runat="server" AllowPaging="True" Width="100%" AllowSorting="True" OnSelectedIndexChanged="GvUsersSelectedIndexChanged"
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UserId" DataSourceID="EntityDataSourceUser" OnRowCommand="GvUsersOnRowCommand"
        ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:TemplateField ShowHeader="True" HeaderText="User Name" SortExpression="UserName">
                <ItemTemplate>
                    <asp:Label ID="lblStudentName" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="True" HeaderText="User Email" SortExpression="UserEmail">
                <ItemTemplate>
                    <asp:Label ID="lblUserEmail" runat="server" Text='<%# Bind("UserEmail") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="True" HeaderText="Date Added" SortExpression="DateAdded">
                <ItemTemplate>
                    <asp:Label ID="lblDateAdded" runat="server" Text='<%# Bind("DateAdded","{0:d}") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="True" HeaderText="Effective Date" SortExpression="EffectiveDate">
                <ItemTemplate>
                    <asp:Label ID="lblEffectiveDate" runat="server" Text='<%# Bind("EffectiveDate","{0:d}") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="True" HeaderText="Expiration Date" SortExpression="ExpirationDate">
                <ItemTemplate>
                    <asp:Label ID="lblExpirationDate" runat="server" Text='<%# Bind("ExpirationDate","{0:d}") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="True" HeaderText="User Title" SortExpression="UserTitle">
                <ItemTemplate>
                    <asp:Label ID="lblUserTitle" runat="server" Text='<%# Bind("UserTitle") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="True" HeaderText="Deleted" SortExpression="IsDeleted">
                <ItemTemplate>
                    <asp:CheckBox ID="lblIsDeleted" runat="server" Checked='<%# Bind("IsDeleted") %>'
                        Enabled="False"></asp:CheckBox>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="True" HeaderText="Last Login Date" SortExpression="LastLoginDate">
                <ItemTemplate>
                    <asp:Label ID="lblLastLoginDate" runat="server" Text='<%# Bind("LastLoginDate","{0:d}") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
              <asp:TemplateField ShowHeader="True" HeaderText="Delete" SortExpression="">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" CausesValidation="False" runat="server" CommandArgument='<%# Bind("UserId") %>' CommandName="UpdateUser" Enabled='<%# IsUserDeleted(Container.DataItem) %>'>Delete</asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
          
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
     
    </asp:GridView>
 
      <asp:EntityDataSource ID="EntityDataSourceUser" 
        runat="server" ViewStateMode="Enabled"
        EnableInsert="True" EnableUpdate="True" EnableDelete="True" 
      ConnectionString="metadata=res://DataLib/SchoolManagement.csdl|res://DataLib/SchoolManagement.ssdl|res://DataLib/SchoolManagement.msl;provider=System.Data.SqlClient;provider connection string=&quot;data source=VIJAY;initial catalog=TestDB;integrated security=True;multipleactiveresultsets=True;App=EntityFramework&quot;" 
        DefaultContainerName="SchoolManagementSystemEntities" EnableFlattening="False" 
        EntitySetName="Users" EntityTypeFilter="User">
         </asp:EntityDataSource>

    <div id="addOrUpdateUser">
         <ucUserMaintenance:UserMaintenance ID="ucUserMaintenance" runat="server" ></ucUserMaintenance:UserMaintenance>
    </div>
   
</asp:Content>

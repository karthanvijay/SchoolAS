<%@ Page Title="Fee Approvals" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="FeeApprovals.aspx.cs" Inherits="SchoolManagement.Admin.FeeApprovals" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
       <link href="/Scripts/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css" />
    <script src="/Scripts/jquery.js" type="text/javascript"></script>
    <script src="/Scripts/jqueryui.js" type="text/javascript"></script>
    <script src="/Scripts/SchoolManagementScripts/transactionApprovals.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Fee Approvals
    </h2>
    <asp:Label ID="lblFeeTransactionDetail" runat="server" Text="" CssClass="feeTransactionDetail" Style="display: none;"></asp:Label>

    <asp:GridView ID="GvTransactionDetails" runat="server" AllowPaging="True" AllowSorting="True" OnSelectedIndexChanged="GvTransactionDetailsSelectedIndexChanging"
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="TransactionDetailsId"
        Width="100%" DataSourceID="EntityDataSourceTransactionDetails" ForeColor="#333333"
        GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
         <EmptyDataTemplate>No Approvals Present. </EmptyDataTemplate>
        <Columns>
            <asp:TemplateField ShowHeader="False" >
                <ItemTemplate>
                    <asp:LinkButton ID="btnSelectButton" runat="server" CommandName="Select" Text="Select" ></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False" Visible="False">
                <ItemTemplate>
                    <asp:Label ID="lblTransactionDetailsId" runat="server" Text='<%# Bind("TransactionDetailsId") %>'
                        Visible="False"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False" Visible="False">
                <ItemTemplate>
                    <asp:Label ID="lblAccountId" runat="server" Text='<%# Bind("AccountId") %>' Visible="False"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="True" Visible="True" HeaderText="Student Name" SortExpression="Student.StudentName">
                <ItemTemplate>
                    <asp:Label ID="lblStudentName" runat="server" Text='<%# Bind("Student.StudentName") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="True" Visible="True" HeaderText="Mother's Name" SortExpression="Student.MotherName">
                <ItemTemplate>
                    <asp:Label ID="lblStudentmName" runat="server" Text='<%# Bind("Student.MotherName") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="True" Visible="True" HeaderText="Father's Name" SortExpression="Student.FatherName">
                <ItemTemplate>
                    <asp:Label ID="lblStudentfName" runat="server" Text='<%# Bind("Student.FatherName") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="True" Visible="True" HeaderText="Amount Paid" SortExpression="AmountPaid">
                <ItemTemplate>
                    <asp:Label ID="lblAmountPaid" runat="server" Text='<%# Bind("AmountPaid") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="True" Visible="True" HeaderText="Date Paid" SortExpression="DatePaid">
                <ItemTemplate>
                    <asp:Label ID="lblDatePaid" runat="server" Text='<%# Bind("DatePaid","{0:d}") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="True" Visible="True" HeaderText="Academic Year Start"
                SortExpression="AcademicYearStart">
                <ItemTemplate>
                    <asp:Label ID="lblAcademicYearStart" runat="server" Text='<%# Bind("AcademicYear.AcademicYearStart","{0:d}") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="True" Visible="True" HeaderText="Academic Year End"
                SortExpression="AcademicYearEnd">
                <ItemTemplate>
                    <asp:Label ID="lblAcademicYearEnd" runat="server" Text='<%# Bind("AcademicYear.AcademicYearEnd","{0:d}") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="True" Visible="True" HeaderText="Operator" SortExpression="">
                <ItemTemplate>
                    <asp:Label ID="lblUserEmailOfOperator" runat="server" Text='<%# Bind("User.UserEmail") %>'></asp:Label>
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
        <asp:EntityDataSource ID="EntityDataSourceTransactionDetails" 
        runat="server" ViewStateMode="Enabled"
        EnableInsert="True" EnableUpdate="True" EnableDelete="True" 
      ConnectionString="metadata=res://DataLib/SchoolManagement.csdl|res://DataLib/SchoolManagement.ssdl|res://DataLib/SchoolManagement.msl;provider=System.Data.SqlClient;provider connection string=&quot;data source=VIJAY;initial catalog=TestDB;integrated security=True;multipleactiveresultsets=True;App=EntityFramework&quot;" 
        DefaultContainerName="SchoolManagementSystemEntities" EnableFlattening="False" 
         EntitySetName="TransactionDetails" EntityTypeFilter="TransactionDetail" 
       AutoGenerateWhereClause="True">
            <WhereParameters>
                <asp:Parameter DefaultValue="True" Name="Rejected" Type="Boolean"/>
            <asp:Parameter DefaultValue="False" Name="Approved" Type="Boolean" />           
            </WhereParameters>
  </asp:EntityDataSource>
       

    <div id="transactionHistory">
               <fieldset>
            <legend>Fee Information</legend>
            
                          <asp:HiddenField ID="hdnTransactionDetailId" runat="server" />
           
                 <table>
                <tr>
                    <td>
                        <asp:Label ID="lblStudentName" runat="server" Text="Student Name:"></asp:Label>
                    </td>
                    <td>
                         <asp:Label ID="lblStudentNameSelected" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                  <tr>
                    <td>
                        <asp:Label ID="lblmName" runat="server" Text="Mother's Name:"></asp:Label>
                    </td>
                    <td>
                         <asp:Label ID="lblStudentmName" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                  <tr>
                    <td>
                        <asp:Label ID="lblfName" runat="server" Text="Father's Name:"></asp:Label>
                    </td>
                    <td>
                         <asp:Label ID="lblStudentfName" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                  <tr>
                    <td>
                        <asp:Label ID="lblcName" runat="server" Text="Class Name:"></asp:Label>
                    </td>
                    <td>
                         <asp:Label ID="lblStudentcName" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                  <tr>
                    <td>
                        <asp:Label ID="lblsName" runat="server" Text="Section Name:"></asp:Label>
                    </td>
                    <td>
                         <asp:Label ID="lblStudentsName" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                  <tr>
                    <td>
                        <asp:Label ID="lblMediumName" runat="server" Text="Medium Name:"></asp:Label>
                    </td>
                    <td>
                         <asp:Label ID="lblStudentMediumName" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <asp:Label ID="lblAcademicYear" runat="server" Text="Academic Year:"></asp:Label>
                    </td>
                    <td>
                         <asp:Label ID="lblCurrentAcademicYear" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
               <tr>
                    <td>
                        <asp:Label ID="lblCurrentFee" runat="server" Text="Fee Paid:"></asp:Label>
                    </td>
                    <td>
                         <asp:Label ID="txtStudentFeePaid" runat="server" Text="" CssClass="textEntry"></asp:Label>
                    </td>
                </tr>
                    <tr>
                    <td>
                        <asp:Label ID="lblApprove" runat="server" Text="Fee Approved:"></asp:Label>
                    </td>
                    <td>
                           <asp:CheckBox ID="chkApprove" runat="server" />
                    </td>
                </tr>
                    <tr>
                    <td>
                        <asp:Label ID="lblReject" runat="server" Text="Fee Reject:"></asp:Label>
                    </td>
                    <td>
                         <asp:CheckBox ID="chkReject" runat="server" />
                    </td>
                </tr>
                 <tr>
                    <td>
                     
                    </td>
                    <td>
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="ApproveFeeDetailsOfStudent"/>
                        
                    </td>
                </tr>
            </table>
         </fieldset>
    </div>
</asp:Content>

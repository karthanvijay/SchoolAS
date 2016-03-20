<%@ Page Title="Account Maintenance" Language="C#" MasterPageFile="~/Site.Master" 
    AutoEventWireup="true" CodeBehind="AccountMaintenance.aspx.cs" Inherits="SchoolManagement.Staff.AccountMaintenance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="/Scripts/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css" />
    <script src="/Scripts/jquery.js" type="text/javascript"></script>
    <script src="/Scripts/jqueryui.js" type="text/javascript"></script>
    <script src="/Scripts/SchoolManagementScripts/accountMaintenance.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Account Maintenance
    </h2>
    <table>
        <tr>
            <td>
                <asp:Label ID="lblMedium" runat="server" Text="Medium:"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlMediumForGridView" runat="server" Width="200" OnSelectedIndexChanged="GvStudentDataBind"
                    AutoPostBack="True" DataSourceID="EntityDataSourceMedium" DataTextField="MediumName"
                    DataValueField="MediumId">
                </asp:DropDownList>
            </td>
            <td>
                <asp:Label ID="lblClass" runat="server" Text="Class:"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlClassForGridView" runat="server" Width="200" OnSelectedIndexChanged="GvStudentDataBind"
                    AutoPostBack="True" DataSourceID="EntityDataSourceClass" DataTextField="ClassName"
                    DataValueField="ClassId">
                </asp:DropDownList>
            </td>
            <td>
                <asp:Label ID="lblSection" runat="server" Text="Section:"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlSectionForGridView" runat="server" Width="200" OnSelectedIndexChanged="GvStudentDataBind"
                    AutoPostBack="True" DataSourceID="EntityDataSourceSection" DataTextField="SectionName"
                    DataValueField="SectionId">
                </asp:DropDownList>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                  <asp:Button ID="LinkButton1" runat="server" Text="Download Fee Pending Students"  OnClick="DownloadFeePendingList"   CausesValidation="False"  />
            </td>
        </tr>
    </table>
    <asp:Label ID="lblFeeInformation" runat="server" Text="" CssClass="feeInformation"
        Style="display: none;"></asp:Label>
    <asp:Label ID="lblTransactionInformation" runat="server" Text="" CssClass="transactionInformation"
        Style="display: none;"></asp:Label>
    <asp:GridView ID="GvStudent" runat="server" AllowPaging="True" Width="100%" OnRowCommand="GvStudentRowCommand"
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="StudentId" OnSelectedIndexChanged="GvStudentSelectedIndexChange"
        DataSourceID="EntityDataSourceStudent" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField ShowHeader="True">
                <ItemTemplate>
                    <asp:Label ID="lblStudentId" runat="server" Text='<%# Bind("StudentId") %>' Visible="False"></asp:Label>
                    <asp:LinkButton ID="lnkbtnSelect" runat="server" CausesValidation="False" CommandName="Select"
                        CommandArgument="Select" Text="Select"></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="True" HeaderText="Student Name">
                <ItemTemplate>
                    <asp:Label ID="lblStudentName" runat="server" Text='<%# Bind("StudentName") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="True" HeaderText="Mother Name">
                <ItemTemplate>
                    <asp:Label ID="lblMothersName" runat="server" Text='<%# Bind("MotherName") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="True" HeaderText="Father Name">
                <ItemTemplate>
                    <asp:Label ID="lblFatherName" runat="server" Text='<%# Bind("FatherName") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="True" HeaderText="Medium">
                <ItemTemplate>
                    <asp:Label ID="lblMediumName" runat="server" Text='<%# GetMedium(Container.DataItem) %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="True" HeaderText="Class">
                <ItemTemplate>
                    <asp:Label ID="lblClassName" runat="server" Text='<%# GetClass(Container.DataItem) %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="True" HeaderText="Section">
                <ItemTemplate>
                    <asp:Label ID="lblSectionName" runat="server" Text='<%# GetSection(Container.DataItem)%>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="True" HeaderText="Deleted">
                <ItemTemplate>
                    <asp:CheckBox ID="lblIsDeleted" runat="server" Checked='<%# Bind("IsDeleted") %>'
                        Enabled="False"></asp:CheckBox>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="True" HeaderText="History">
                <ItemTemplate>
                    <asp:LinkButton ID="lnkbtnHistory" runat="server" CausesValidation="False" CommandName="Select"
                        CommandArgument="History" Text="History"></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" ForeColor="#333333" />
    </asp:GridView>
     <asp:EntityDataSource ID="EntityDataSourceMedium" 
        runat="server" ViewStateMode="Enabled"
        EnableInsert="True" EnableUpdate="True" EnableDelete="True" 
         ConnectionString="metadata=res://DataLib/SchoolManagement.csdl|res://DataLib/SchoolManagement.ssdl|res://DataLib/SchoolManagement.msl;provider=System.Data.SqlClient;provider connection string=&quot;data source=VIJAY;initial catalog=TestDB;integrated security=True;multipleactiveresultsets=True;App=EntityFramework&quot;" 
        DefaultContainerName="SchoolManagementSystemEntities" EnableFlattening="False" 
       EntitySetName="Media" EntityTypeFilter="Medium">
         </asp:EntityDataSource>

     <asp:EntityDataSource ID="EntityDataSourceClass" 
        runat="server" ViewStateMode="Enabled"
        EnableInsert="True" EnableUpdate="True" EnableDelete="True" 
        ConnectionString="metadata=res://DataLib/SchoolManagement.csdl|res://DataLib/SchoolManagement.ssdl|res://DataLib/SchoolManagement.msl;provider=System.Data.SqlClient;provider connection string=&quot;data source=VIJAY;initial catalog=TestDB;integrated security=True;multipleactiveresultsets=True;App=EntityFramework&quot;" 
        DefaultContainerName="SchoolManagementSystemEntities" EnableFlattening="False" 
        EntitySetName="Classes" EntityTypeFilter="Class">
         </asp:EntityDataSource>

     <asp:EntityDataSource ID="EntityDataSourceSection" 
        runat="server" ViewStateMode="Enabled"
        EnableInsert="True" EnableUpdate="True" EnableDelete="True" 
        ConnectionString="metadata=res://DataLib/SchoolManagement.csdl|res://DataLib/SchoolManagement.ssdl|res://DataLib/SchoolManagement.msl;provider=System.Data.SqlClient;provider connection string=&quot;data source=VIJAY;initial catalog=TestDB;integrated security=True;multipleactiveresultsets=True;App=EntityFramework&quot;" 
        DefaultContainerName="SchoolManagementSystemEntities" EnableFlattening="False" 
        EntitySetName="Sections" EntityTypeFilter="Section">
         </asp:EntityDataSource>

     <asp:EntityDataSource ID="EntityDataSourceStudent" 
        runat="server" ViewStateMode="Enabled"
        EnableInsert="True" EnableUpdate="True" EnableDelete="True" 
        ConnectionString="metadata=res://DataLib/SchoolManagement.csdl|res://DataLib/SchoolManagement.ssdl|res://DataLib/SchoolManagement.msl;provider=System.Data.SqlClient;provider connection string=&quot;data source=VIJAY;initial catalog=TestDB;integrated security=True;multipleactiveresultsets=True;App=EntityFramework&quot;" 
        DefaultContainerName="SchoolManagementSystemEntities" EnableFlattening="False" AutoGenerateWhereClause="True"
        EntitySetName="Students" EntityTypeFilter="Student"   >
       
         <WhereParameters>
            <asp:ControlParameter ControlID="ddlClassForGridView" DefaultValue="-1" Name="Class"
                PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="ddlMediumForGridView" DefaultValue="-1" Name="MediumId"
                PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="ddlSectionForGridView" DefaultValue="-1" Name="SectionId"
                PropertyName="SelectedValue" Type="Int32" />
        </WhereParameters>

         </asp:EntityDataSource>

    

    <div id="addFee">
        <fieldset>
            <legend>Fee Information</legend>
            <asp:HiddenField ID="hdnStudentId" runat="server" />
            <asp:HiddenField ID="hdnAccountId" runat="server" />
            <asp:HiddenField ID="hdnAccademicYearId" runat="server" />
            <table>
                <tr>
                    <td>
                        <asp:Label ID="lblStudentMessage" runat="server" Text="Current academic year fee for this student is Paid"
                            ForeColor="Green" Visible="False"></asp:Label>
                    </td>
                </tr>
            </table>
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
                        <asp:Label ID="lblCarryFarwordFee" runat="server" Text="Carry Farword Fee:"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblStudentCarryFarwordFee" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblCurrentYearFee" runat="server" Text="Current Year Fee:"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblStuddentCurrentYearFee" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblCurrentYearFeePaid" runat="server" Text="Current Year Fee Paid:"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblStudentCurrentYearFeePaid" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblFeeDue" runat="server" Text="Fee Due:"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblStudentFeeDue" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblTotalScholarShipAmount" runat="server" Text="Total ScholarShip Amount:"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblTotalScholarShipAmountForStudent" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblDiscount" runat="server" Text="Discount Given:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtStudentDiscount" runat="server" Text="" Enabled="False" CssClass="textEntry"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="regexStudentDiscount" runat="server" ErrorMessage="Only Numbers"
                            ForeColor="red" ControlToValidate="txtStudentDiscount" ValidationExpression="[0-9]+"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblCurrentFee" runat="server" Text="Current Fee:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtStudentCurrentFee" runat="server" Text="" CssClass="textEntry"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvStudentCurrentFee" runat="server" ErrorMessage="*"
                            ForeColor="red" ControlToValidate="txtStudentCurrentFee" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regexStudentCurrentFee" runat="server" ErrorMessage="Only Numbers"
                            Display="Dynamic" ForeColor="red" ControlToValidate="txtStudentCurrentFee" ValidationExpression="[0-9]+"></asp:RegularExpressionValidator>
                        <asp:RangeValidator ID="rngFee" runat="server" ErrorMessage="Enter valid amount"
                            MinimumValue="1" MaximumValue="10000" ControlToValidate="txtStudentCurrentFee"
                            ForeColor="red" Display="Dynamic" Type="Integer"></asp:RangeValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="AddFeeDetailsOfStudent" />
                    </td>
                </tr>
            </table>
        </fieldset>
    </div>
    <div id="history">
        <fieldset>
            <legend>Student Transaction History</legend>
            <asp:GridView ID="GvTransactionDetail" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateColumns="False" CellPadding="4" OnRowDataBound="GvTransactionDetailRowDataBound"
                DataKeyNames="TransactionDetailsId" Width="100%" OnSelectedIndexChanged="GvGeneratePDF"
                DataSourceID="EntityDataSourceTransactionDetails" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:TemplateField ShowHeader="False" Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="lblTransactionDetailsId" runat="server" Text='<%# Bind("TransactionDetailsId") %>'
                                Visible="False"></asp:Label>
                            <asp:Label ID="lblApproved" runat="server" Text='<%# Bind("Approved") %>' Visible="False"></asp:Label>
                            <asp:Label ID="lblRejected" runat="server" Text='<%# Bind("Rejected") %>' Visible="False"></asp:Label>
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
                    <asp:TemplateField ShowHeader="True" Visible="True" HeaderText="Status" SortExpression="">
                        <ItemTemplate>
                            <asp:Label ID="lblTransactionStatus" runat="server" Text='<%# GetStatus(Container.DataItem) %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="True" Visible="True" HeaderText="PDF" SortExpression="">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkbtnGeneratePDF" runat="server" CausesValidation="False" CommandName="Select"
                                CommandArgument="GeneratePDF" Text="Generate-PDF"></asp:LinkButton>
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
        EntitySetName="TransactionDetails" EntityTypeFilter="TransactionDetail" AutoGenerateWhereClause="True">
            
         <WhereParameters>
                    <asp:ControlParameter ControlID="GvStudent" DefaultValue="-1" Name="StudentId" PropertyName="SelectedValue"
                        Type="Int32" />
        </WhereParameters>

         </asp:EntityDataSource>

    
        </fieldset>
    </div>
</asp:Content>

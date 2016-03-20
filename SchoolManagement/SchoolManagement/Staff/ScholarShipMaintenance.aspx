<%@ Page Title="ScholarShip Maintenance" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ScholarShipMaintenance.aspx.cs" Inherits="SchoolManagement.Staff.ScholarShipMaintenance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    
    <style type="text/css">
        .style1
        {
            height: 21px;
        }
    </style>
    <link href="/Scripts/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css" />
    <script src="/Scripts/jquery.js" type="text/javascript"></script>
    <script src="/Scripts/jqueryui.js" type="text/javascript"></script>
    <script src="/Scripts/SchoolManagementScripts/scholarshipMaintenance.js" type="text/javascript"></script>
    <script type="text/javascript">
        function pageLoad() {
            if ($.trim($(".updateStudentScholarShipDetails").text()).toLowerCase() == 'true') {
                $('#updateScholarShip').dialog('open');
                return false;
            }

            if ($.trim($(".addScholarShipForStudents").text()).toLowerCase() == 'true') {
                $('#addScholarShips').dialog('open');
                return false;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Scholarship Maintenance
    </h2>
    <table>
        <tr>
            <td style="text-align: end;">
                <asp:Label ID="lblMedium" runat="server" Text="Medium:" Width="100" Style=""></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlMediumForGridView" runat="server" Width="200" OnSelectedIndexChanged="GvStudentDataBind"
                    AutoPostBack="True" DataSourceID="EntityDataSourceMedium" DataTextField="MediumName"
                    DataValueField="MediumId">
                </asp:DropDownList>
            </td>
            <td style="text-align: end;">
                <asp:Label ID="lblClass" runat="server" Text="Class:" Width="100" Style=""></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlClassForGridView" runat="server" Width="200" OnSelectedIndexChanged="GvStudentDataBind"
                    AutoPostBack="True" DataSourceID="EntityDataSourceClass" DataTextField="ClassName"
                    DataValueField="ClassId">
                </asp:DropDownList>
            </td>
            <td style="text-align: end;">
                <asp:Label ID="lblSection" runat="server" Text="Section:" Width="100" Style=""></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlSectionForGridView" runat="server" Width="200" OnSelectedIndexChanged="GvStudentDataBind"
                    AutoPostBack="True" DataSourceID="EntityDataSourceSection" DataTextField="SectionName"
                    DataValueField="SectionId">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="text-align: end;">
                <asp:Label ID="lblAcademicYear" runat="server" Text="Academic Year:" Width="100"
                    Style=""></asp:Label>
            </td>
            <td>
                    <asp:DropDownList ID="ddlAcademicYear" runat="server" Width="200"
                            DataSourceID="ObjectDataSourceAcademicYearList" DataTextField="Text" 
                            DataValueField="Value">
                        </asp:DropDownList>
                      
            <%--    <asp:DropDownList ID="" runat="server" DataSourceID="LinqDataSourceAcademicYear"
                    Width="200" DataTextField="AcademicYearStart" DataValueField="AcademicYearId">
                </asp:DropDownList>
                <asp:LinqDataSource ID="LinqDataSourceAcademicYear" runat="server" ContextTypeName="DataLib.SchoolManagementSystemEntities"
                     Select="new (AcademicYearStart, AcademicYearEnd, AcademicYearId)"
                    TableName="AcademicYears">
                </asp:LinqDataSource>--%>
            </td>
        </tr>   </table><table style="width: 100%; ">
        <tr>
            <td>
                <asp:Button ID="btnAddStudentScholarShip" runat="server" Text="Add Student ScholarShip" Style="float: right;" OnClick="AddScholarDetails" CausesValidation="False"/>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblUpdateStudentScholarShipDetails" runat="server" Text="" style="display: none;" CssClass="updateStudentScholarShipDetails"></asp:Label>
      <asp:Label ID="lblAddScholarShipForStudents" runat="server" Text="" style="display: none;" CssClass="addScholarShipForStudents"></asp:Label>
    <asp:GridView ID="GvScholarShip" runat="server" AllowPaging="True" 
        AllowSorting="True" OnSelectedIndexChanged="GvScholarShipSelectedIndexChanging"
        AutoGenerateColumns="False" Font-Size="9pt" DataKeyNames="ScholarShipDetailsId"
        DataSourceID="EntityDataSourceScholarShip" CellPadding="4" 
        ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:TemplateField ShowHeader="True" HeaderText="Student Name">
                <ItemTemplate>
                    <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Bind("ScholarShipDetailsId") %>' />
                    <asp:Label ID="lblStudentName" runat="server" Text='<%# Bind("Student.StudentName") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="True" HeaderText="Mother Name">
                <ItemTemplate>
                    <asp:Label ID="lblMothersName" runat="server" Text='<%# Bind("Student.MotherName") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="True" HeaderText="Father Name">
                <ItemTemplate>
                    <asp:Label ID="lblFatherName" runat="server" Text='<%# Bind("Student.FatherName") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="True" HeaderText="Medium">
                <ItemTemplate>
                    <asp:Label ID="lblMediumName" runat="server" Text='<%# Bind("Student.Medium.MediumName")  %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="True" HeaderText="Class">
                <ItemTemplate>
                    <asp:Label ID="lblClassName" runat="server" Text='<%#  Bind("Student.Class1.ClassName") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="True" HeaderText="Section">
                <ItemTemplate>
                    <asp:Label ID="lblSectionName" runat="server" Text='<%# Bind("Student.Section.SectionName")%>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="True" HeaderText="Amount Sanctioned">
                <ItemTemplate>
                    <asp:Label ID="lblAmountSanctioned" runat="server" Text='<%# Bind("AmountSanctioned") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="True" HeaderText="Date Sanctioned">
                <ItemTemplate>
                    <asp:Label ID="lblDateSanctioned" runat="server" Text='<%# Bind("DateSanctioned","{0:d}") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="True" HeaderText="ScholarShip Type">
                <ItemTemplate>
                    <asp:Label ID="lblScholarShipName" runat="server" Text='<%# Bind("ScholarShip.ScholarShipName") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="True" Visible="True" HeaderText="Academic Year Start"
                SortExpression="AcademicYear.AcademicYearStart">
                <ItemTemplate>
                    <asp:Label ID="lblAcademicYearStart" runat="server" Text='<%# Bind("AcademicYear.AcademicYearStart","{0:d}") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="True" Visible="True" HeaderText="Academic Year End"
                SortExpression="AcademicYear.AcademicYearEnd">
                <ItemTemplate>
                    <asp:Label ID="lblAcademicYearEnd" runat="server" Text='<%# Bind("AcademicYear.AcademicYearEnd","{0:d}") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
             <asp:CommandField ShowDeleteButton="True" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
       
    </asp:GridView>
        <asp:EntityDataSource ID="EntityDataSourceScholarShip" 
        runat="server" ViewStateMode="Enabled"
        EnableInsert="True" EnableUpdate="True" EnableDelete="True" 
       ConnectionString="metadata=res://DataLib/SchoolManagement.csdl|res://DataLib/SchoolManagement.ssdl|res://DataLib/SchoolManagement.msl;provider=System.Data.SqlClient;provider connection string=&quot;data source=VIJAY;initial catalog=TestDB;integrated security=True;multipleactiveresultsets=True;App=EntityFramework&quot;" 
        DefaultContainerName="SchoolManagementSystemEntities" EnableFlattening="False" 
        EntitySetName="ScholarShipDetails" 
    EntityTypeFilter="ScholarShipDetail" AutoGenerateWhereClause="True">
    
   <%--     <WhereParameters>
            <asp:ControlParameter ControlID="ddlClassForGridView" DefaultValue="-1" Name="Student.ClassId"
                PropertyName="SelectedValue" Type="Int32" />
           <asp:ControlParameter ControlID="ddlMediumForGridView" DefaultValue="-1" Name="Medium"
                PropertyName="SelectedValue" Type="Int32" />
           <asp:ControlParameter ControlID="ddlSectionForGridView" DefaultValue="-1" Name="Section"
                PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="ddlAcademicYear" DefaultValue="-1" Name="AcademicYear"
                PropertyName="SelectedValue" Type="Int32" />
        </WhereParameters>--%>
         </asp:EntityDataSource>

    
    
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



    <div id="updateScholarShip">
        <fieldset>
            <legend>ScholarShip Information</legend>
           <asp:HiddenField ID="hdnScholarShipDetailsId" runat="server" />
            <table>
                <tr>
                    <td>
                        <asp:Label ID="lblStudentMessage" runat="server" Text="" ForeColor="Green" Visible="False"></asp:Label>
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
                    <td class="style1">
                        <asp:Label ID="lblsName" runat="server" Text="Section Name:"></asp:Label>
                    </td>
                    <td class="style1">
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
                        <asp:Label ID="lblCurrentAcademicYear" runat="server" Text="Academic Year:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlAcademicYearInScholarShipAdd" runat="server" 
                            DataSourceID="ObjectDataSourceAcademicYearList" DataTextField="Text" 
                            DataValueField="Value">
                        </asp:DropDownList>
                      
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblScholarShipType" runat="server" Text="ScholarShip Type:"></asp:Label>
                    </td>
                    <td>  <asp:DropDownList ID="ddlScholarShipTypeInScholarShipAdd" runat="server" 
                            DataSourceID="LinqDataSourceScholarShipType" DataTextField="ScholarShipName" 
                            DataValueField="ScholarShipId">
                        </asp:DropDownList>
                    
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblScholarShip" runat="server" Text="ScholarShip Amount:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtStudentScholarShip" runat="server" Text=""  CssClass="textEntry"></asp:TextBox>
                      <asp:RequiredFieldValidator
                   ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtStudentScholarShip" ForeColor="red">
                      </asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="regexStudentScholarShip" runat="server" ErrorMessage="Only Numbers" ValidationGroup="ScholarShip"
                            ForeColor="red" ControlToValidate="txtStudentScholarShip" ValidationExpression="[0-9]+"></asp:RegularExpressionValidator>
               <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Amount should be in 1-9999 range" Display="Dynamic" ForeColor="red"
               ControlToValidate="txtStudentScholarShip" MaximumValue="9999" MinimumValue="1"></asp:RangeValidator>
                     
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="UpdateFeeDetailsOfStudent" ValidationGroup="ScholarShip" />
                    </td>
                </tr>
            </table>
                <asp:LinqDataSource ID="LinqDataSourceScholarShipType" runat="server" 
                            ContextTypeName="DataLib.SchoolManagementSystemEntities"  
                            TableName="ScholarShips">
                        </asp:LinqDataSource>
                          <asp:ObjectDataSource ID="ObjectDataSourceAcademicYearList" runat="server" 
                            SelectMethod="AcademmicYearList" TypeName="SchoolManagement.Helpers.HelperFunctions">
                        </asp:ObjectDataSource>
        </fieldset>
    </div>
<div id="addScholarShips">
   <table>
       <tr>
           <td>
               <asp:Label ID="Label1" runat="server" Text="Medium:"></asp:Label>
           </td>
           <td>
                 <asp:DropDownList ID="ddlMedium" runat="server" Width="200" OnSelectedIndexChanged="GvStudentDataBind"
                    AutoPostBack="True" DataSourceID="EntityDataSourceMedium" DataTextField="MediumName"
                    DataValueField="MediumId">
                </asp:DropDownList>
           </td>
       </tr>
        <tr>
           <td>
               <asp:Label ID="Label2" runat="server" Text="Class:"></asp:Label>
           </td>
           <td>
                 <asp:DropDownList ID="ddlClass" runat="server" Width="200" OnSelectedIndexChanged="GvStudentDataBind"
                    AutoPostBack="True" DataSourceID="EntityDataSourceClass" DataTextField="ClassName"
                    DataValueField="ClassId">
                </asp:DropDownList>
           </td>
       </tr>
        <tr>
           <td>
               <asp:Label ID="Label3" runat="server" Text="Section:"></asp:Label>
           </td>
           <td>
                 <asp:DropDownList ID="ddlSection" runat="server" Width="200" OnSelectedIndexChanged="GvStudentDataBind"
                    AutoPostBack="True" DataSourceID="EntityDataSourceSection" DataTextField="SectionName"
                    DataValueField="SectionId">
                </asp:DropDownList>
           </td>
       </tr>
        <tr>
           <td style="vertical-align:  top;">
               <asp:Label ID="Label4" runat="server" Text="Student List:"></asp:Label>
           </td>
           <td>
               <div style="height: 200px;width: 500px;overflow: scroll;">
               <asp:CheckBoxList ID="chkStudentList" runat="server" 
                       DataSourceID="ObjectDataSourceStudent"   DataTextField="Text" DataValueField="Value">
               </asp:CheckBoxList>
                   <asp:ObjectDataSource ID="ObjectDataSourceStudent" runat="server" 
                       SelectMethod="StudentDetails" TypeName="SchoolManagement.Helpers.HelperFunctions">
                       <SelectParameters>
                           <asp:ControlParameter ControlID="ddlMedium" DefaultValue="-1" Name="mediumId" 
                               PropertyName="SelectedValue" Type="Int32" />
                           <asp:ControlParameter ControlID="ddlClass" DefaultValue="-1" Name="classId" 
                               PropertyName="SelectedValue" Type="Int32" />
                           <asp:ControlParameter ControlID="ddlSection" DefaultValue="-1" Name="sectionId" 
                               PropertyName="SelectedValue" Type="Int32" />
                       </SelectParameters>
                   </asp:ObjectDataSource>
               </div>
           
           </td>
       </tr>
        <tr>
           <td>
               <asp:Label ID="Label5" runat="server" Text="ScholarShip Type:"></asp:Label>
           </td>
           <td>
               <asp:DropDownList ID="ddlScholarShipType" runat="server" Width="200"
                   DataSourceID="LinqDataSourceStudentScholarShipType" 
                   DataTextField="ScholarShipName" DataValueField="ScholarShipId">
               </asp:DropDownList>
             
           </td>
       </tr>
       <tr>
           <td>
               <asp:Label ID="Label7" runat="server" Text="Academic Year:"></asp:Label> 
           </td>
           <td>
               <asp:DropDownList ID="ddlAcademicYearInAddScholarShip" runat="server" DataSourceID="ObjectDataSourceAcademicYearList"
                DataTextField="Text" Width="200" DataValueField="Value">
               </asp:DropDownList>
           </td>
       </tr>
       <tr>
           <td>
               <asp:Label ID="Label6" runat="server" Text="Sanctioned Amount:"></asp:Label>
           </td>
           <td>
               <asp:TextBox ID="txtScholarShipAmountSanctioned" runat="server" CssClass="textEntry" ></asp:TextBox><asp:RequiredFieldValidator
                   ID="rfvScholarShipAmountSanctioned" runat="server" ErrorMessage="*" ControlToValidate="txtScholarShipAmountSanctioned" ForeColor="red"></asp:RequiredFieldValidator>
               <asp:RangeValidator ID="rngvScholarShipAmountSanctioned" runat="server" ErrorMessage="Amount should be in 1-9999 range" Display="Dynamic" ForeColor="red"
               ControlToValidate="txtScholarShipAmountSanctioned" MaximumValue="9999" MinimumValue="1"></asp:RangeValidator>
           </td>
       </tr>
       <tr>
           <td>
               
           </td>
           <td>
               <asp:Button ID="btnAddOrUpdateScholarShipDetails" runat="server" Text="Submit" OnClick="AddOrUpdateScholarShipDetails" CausesValidation="False" />
           </td>
       </tr>
   </table>

</div>
    <asp:LinqDataSource ID="LinqDataSourceInAddScholarShipForStudent" 
                   runat="server" ContextTypeName="DataLib.SchoolManagementSystemEntities" 
                    Select="new (StudentId, StudentName, MotherName, FatherName)" 
                   TableName="Students"> <%--AutoGenerateWhereClause="True">--%>
                  <%-- <WhereParameters>
                       <asp:ControlParameter ControlID="ddlClass" DefaultValue="-1" Name="Class" 
                           PropertyName="SelectedValue" Type="Int32" />
                       <asp:ControlParameter ControlID="ddlMedium" DefaultValue="-1" Name="MediumId" 
                           PropertyName="SelectedValue" Type="Int32" />
                       <asp:ControlParameter ControlID="ddlSection" DefaultValue="-1" Name="SectionId" 
                           PropertyName="SelectedValue" Type="Int32" />
                   </WhereParameters>--%>
               </asp:LinqDataSource>
                 <asp:LinqDataSource ID="LinqDataSourceStudentScholarShipType" runat="server" 
                   ContextTypeName="DataLib.SchoolManagementSystemEntities"  
                   Select="new (ScholarShipId, ScholarShipName)" TableName="ScholarShips">
               </asp:LinqDataSource>
</asp:Content>

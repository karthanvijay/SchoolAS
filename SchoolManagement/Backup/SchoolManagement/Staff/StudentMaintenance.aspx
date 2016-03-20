<%@ Page Title="Student Maintenance" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StudentMaintenance.aspx.cs" Inherits="SchoolManagement.Staff.StudentCreation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="/Scripts/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css" />
    <script src="/Scripts/jquery.js" type="text/javascript"></script>
    <script src="/Scripts/jqueryui.js" type="text/javascript"></script>
    <script src="/Scripts/SchoolManagementScripts/studentMaintenance.js" type="text/javascript"></script>
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <h2>               
        Student Maintenance
    </h2>
    <asp:Label ID="lblShowPopup" runat="server" Text="false" CssClass="showPopup" Style="display: none;"></asp:Label>
    <asp:Button ID="btnAddStudent" runat="server" Text="Add Individual Student" Style="float: right;" CssClass="addStudent" OnClick="ShowPopupToAddUser"/>
    <table style="border:1px solid black">
        <tr>
            <td>
                <asp:Label ID="lblSelectClass" runat="server" Text="Class"></asp:Label>
            </td>
             <td style="padding-left: 100px;">
                 <asp:DropDownList ID="ddlClass" runat="server" Width="200"
                     DataSourceID="EntityDataSourceClass" DataTextField="ClassName" 
                     DataValueField="ClassId">
                 </asp:DropDownList>
                
            </td>
        </tr>
         <tr style="border:1px solid black">
            <td >
                <asp:Label ID="lblSelectSection" runat="server" Text="Section"></asp:Label>
            </td>
             <td style="padding-left: 100px;">
                 <asp:DropDownList ID="ddlSection" runat="server" Width="200"
                     DataSourceID="EntityDataSourceSection" DataTextField="SectionName" 
                     DataValueField="SectionId">
                 </asp:DropDownList>
                 
            </td>
        </tr>
         <tr style="border:1px solid black">
            <td>
                <asp:Label ID="lblSelectMedium" runat="server" Text="Medium"></asp:Label>
            </td>
             <td style="padding-left: 100px;">
                 <asp:DropDownList ID="ddlMedium" runat="server" Width="200"
                     DataSourceID="EntityDataSourceMedium" DataTextField="MediumName" 
                     DataValueField="MediumId">
                 </asp:DropDownList>
                
            </td>
        </tr>
         <tr style="border:1px solid black">
            <td>
                <asp:Label ID="lblFileUpload" runat="server" Text="Upload File"></asp:Label>
            </td>
             <td style="padding-left: 100px;">
                 <asp:FileUpload ID="flStudent" runat="server" Width="200" />
            </td> 
            <td>
                 <asp:LinkButton ID="lnkDownloadTemplate" runat="server">Download Template</asp:LinkButton>
            </td>
        </tr>
         <tr style="border:1px solid black">
             <td>
                 
             </td>
            <td style="padding-left: 100px;">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" />
            </td>
            
        </tr>
    </table>
                 
                 
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




    <div id="addStudentDiv">
        <asp:Label ID="lblMandatory" runat="server" Text="Fields marked '*' are mandatory" ForeColor="Red"></asp:Label>
        <table style="border:1px solid black">
            <tr>
                <td>
                    <asp:Label ID="lblStudentName" runat="server" Text="Student Name"></asp:Label>
                </td>
                  <td style="padding-left: 100px;">
                      <asp:TextBox ID="txtStudentName" runat="server"  Width="320"></asp:TextBox>
                </td><td>
                    <asp:RequiredFieldValidator ID="rfvStudentName" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtStudentName"  Display="Dynamic"></asp:RequiredFieldValidator>
                     </td>
            </tr>
             <tr>
                <td>
                    <asp:Label ID="lblMotherName" runat="server" Text="Mother's Name"></asp:Label>
                </td>
                  <td style="padding-left: 100px;">
                      <asp:TextBox ID="txtMotherName" runat="server"  Width="320"></asp:TextBox>
                </td><td>
                    <asp:RequiredFieldValidator ID="efvMothersName" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtMotherName"  Display="Dynamic"></asp:RequiredFieldValidator>
                     </td>
            </tr>
             <tr>
                <td>
                    <asp:Label ID="lblFatherName" runat="server" Text="Father's Name"></asp:Label>
                </td>
                  <td style="padding-left: 100px;">
                      <asp:TextBox ID="txtFatherName" runat="server"  Width="320"></asp:TextBox>
                </td><td>
                    <asp:RequiredFieldValidator ID="rfvFathersName" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtFatherName"  Display="Dynamic"></asp:RequiredFieldValidator>
                     </td>
            </tr>
             <tr>
                <td>
                    <asp:Label ID="lblAge" runat="server" Text="Age"></asp:Label>
                </td>
                  <td style="padding-left: 100px;">
                      <asp:TextBox ID="txtAge" runat="server"  Width="320"></asp:TextBox>
                </td><td>
                    <asp:RequiredFieldValidator ID="rfvAge" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtAge"  Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="rngAge" runat="server" ErrorMessage="Student age should be between 3-25" Type="Integer" ForeColor="Red" ControlToValidate="txtAge" Display="Dynamic"  MaximumValue="30" MinimumValue="3"></asp:RangeValidator>  </td>
            </tr>
             <tr>
                <td>
                    <asp:Label ID="lblGender" runat="server" Text="Gender"></asp:Label>
                </td>
                  <td style="padding-left: 100px;">
                   <asp:DropDownList ID="ddlGender" runat="server" Width="320">
                      <asp:ListItem runat="server" Text="Male" Value="Male"></asp:ListItem>
                         <asp:ListItem runat="server" Text="Female" Value="Female"></asp:ListItem>
                 </asp:DropDownList>
                </td>
            </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Class"></asp:Label>
            </td>
             <td style="padding-left: 100px;">
                 <asp:DropDownList ID="ddlClassInAddStudent" runat="server" Width="320"
                     DataSourceID="EntityDataSourceClass" DataTextField="ClassName" 
                     DataValueField="ClassId">
                 </asp:DropDownList>
          
            </td>
        </tr>
         <tr style="border:1px solid black">
            <td >
                <asp:Label ID="Label2" runat="server" Text="Section"></asp:Label>
            </td>
             <td style="padding-left: 100px;">
                 <asp:DropDownList ID="ddlSectionInAddStudent" runat="server" Width="320"
                     DataSourceID="EntityDataSourceSection" DataTextField="SectionName" 
                     DataValueField="SectionId">
                 </asp:DropDownList>
             
            </td>
        </tr>
         <tr style="border:1px solid black">
            <td>
                <asp:Label ID="Label3" runat="server" Text="Medium"></asp:Label>
            </td>
             <td style="padding-left: 100px;">
                 <asp:DropDownList ID="ddlMediumInAddStudent" runat="server" Width="320"
                     DataSourceID="EntityDataSourceMedium" DataTextField="MediumName" 
                     DataValueField="MediumId">
                 </asp:DropDownList>
               
            </td>
        </tr>
                 <tr style="border:1px solid black">
            <td>
                <asp:Label ID="Label5" runat="server" Text="Cast"></asp:Label>
            </td>
             <td style="padding-left: 100px;">
                 <asp:DropDownList ID="ddlCastInAddStudent" runat="server" Width="320"
                     DataSourceID="EntityDataSourceCast" DataTextField="CastName" 
                     DataValueField="CastId">
                 </asp:DropDownList>
               
            </td>
        </tr>
   
              <tr>
                    <td>
                        <asp:Label ID="lblAddressLineOne" runat="server" Text="AddressLineOne" ></asp:Label>
                    </td>
                     <td class="columnSpacing" style="padding-left: 100px;"> <asp:TextBox ID="txtAddressLineOne" runat="server" CssClass="textEntry"></asp:TextBox>
                     </td>     
                   <td>   <asp:RequiredFieldValidator ID="rfvAddressLineOne" runat="server" ErrorMessage="*" ControlToValidate="txtAddressLineOne" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td> <asp:Label ID="lblVillage" runat="server" Text="Village" ></asp:Label>
                    </td>
                      <td class="columnSpacing" style="padding-left: 100px;"> <asp:TextBox ID="txtVillage" runat="server" CssClass="textEntry"></asp:TextBox>
                     </td>     
                   <td>  <asp:RequiredFieldValidator ID="rfvVillage" runat="server" ErrorMessage="*" ControlToValidate="txtVillage" ForeColor="Red"></asp:RequiredFieldValidator>
                    
                    </td>
                </tr>
                <tr>
                    <td> <asp:Label ID="lblDistrict" runat="server" Text="District" ></asp:Label>
                    </td>
                      <td class="columnSpacing" style="padding-left: 100px;">   <asp:TextBox ID="txtDistrict" runat="server" CssClass="textEntry"></asp:TextBox>
                    </td>     
                   <td> <asp:RequiredFieldValidator ID="rfvDistrict" runat="server" ErrorMessage="*" ControlToValidate="txtDistrict" ForeColor="Red"></asp:RequiredFieldValidator>
                    
                    </td>
                </tr>
                <tr>
                    <td> <asp:Label ID="lblPincode" runat="server" Text="Pincode" ></asp:Label>
                    </td>
                     <td class="columnSpacing" style="padding-left: 100px;">  <asp:TextBox ID="txtPincode" runat="server" CssClass="textEntry"></asp:TextBox>
                   </td>     
                   <td> <asp:RequiredFieldValidator ID="rfvPincode" runat="server" ErrorMessage="*" ControlToValidate="txtPincode" ForeColor="Red"></asp:RequiredFieldValidator>
                    
                    </td>
                </tr>
                <tr>
                    <td></td>  <td class="columnSpacing" style="padding-left: 100px;">
                        <asp:Button ID="btnCreateStudent" runat="server" Text="Create Student" OnClick="CreateStudent" />
                         <asp:Button ID="btnUpdateStudent" runat="server" Text="Update Student" OnClick="UpdateStudent" Visible="False"/>
                             </td>
                </tr>
    </table>
                 
     <asp:EntityDataSource ID="EntityDataSourceCast" runat="server" 
        EnableInsert="True" EnableUpdate="True" EnableDelete="True" 
       ConnectionString="metadata=res://DataLib/SchoolManagement.csdl|res://DataLib/SchoolManagement.ssdl|res://DataLib/SchoolManagement.msl;provider=System.Data.SqlClient;provider connection string=&quot;data source=VIJAY;initial catalog=TestDB;integrated security=True;multipleactiveresultsets=True;App=EntityFramework&quot;" 
        DefaultContainerName="SchoolManagementSystemEntities" EnableFlattening="False" 
        EntitySetName="Casts" EntityTypeFilter="Cast"></asp:EntityDataSource>


    </div>
    <br/>
    <table>
        <tr><td>
                <asp:Label ID="lblMedium" runat="server" Text="Medium:"></asp:Label>
            
            </td>
            <td>
                    <asp:DropDownList ID="ddlMediumForGridView" runat="server" Width="200" OnSelectedIndexChanged="GvStudentDataBind" AutoPostBack="True"
                     DataSourceID="EntityDataSourceMedium" DataTextField="MediumName" 
                     DataValueField="MediumId">
                 </asp:DropDownList>
            </td>
            <td>
                <asp:Label ID="lblClass" runat="server" Text="Class:"></asp:Label>
            
            </td>
            <td>
                 <asp:DropDownList ID="ddlClassForGridView" runat="server" Width="200" OnSelectedIndexChanged="GvStudentDataBind" AutoPostBack="True"
                     DataSourceID="EntityDataSourceClass" DataTextField="ClassName" 
                     DataValueField="ClassId">
                 </asp:DropDownList>
            </td>
            <td>
                <asp:Label ID="lblSection" runat="server" Text="Section:"></asp:Label>
            
            </td>
             <td>
                 <asp:DropDownList ID="ddlSectionForGridView" runat="server" Width="200" OnSelectedIndexChanged="GvStudentDataBind" AutoPostBack="True"
                     DataSourceID="EntityDataSourceSection" DataTextField="SectionName" 
                     DataValueField="SectionId">
                 </asp:DropDownList>
             
            </td>
        </tr>
    </table>
    
    <asp:GridView ID="GvStudent" runat="server" AllowPaging="True" Width="100%" OnRowCommand="GvStudentRowCommand"
         AutoGenerateColumns="False" DataKeyNames="StudentId" OnSelectedIndexChanged="GvStudentSelectedIndexChange" 
         DataSourceID="EntityDataSourceStudent" CellPadding="4" ForeColor="#333333" 
         GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
             <asp:TemplateField ShowHeader="True">
                <ItemTemplate>
                       <asp:Label ID="lblStudentId" runat="server" Text='<%# Bind("StudentId") %>' Style="display: none;"></asp:Label>
                    <asp:LinkButton ID="lnkbtnSelect" runat="server" CausesValidation="False" CommandName="Select" 
                        Text="Select" ></asp:LinkButton>
                </ItemTemplate>
                 <ItemStyle HorizontalAlign="Center"> </ItemStyle>
            </asp:TemplateField>
             <asp:TemplateField ShowHeader="True" HeaderText="Student Name">
                <ItemTemplate>
                    <asp:Label ID="lblStudentName" runat="server" Text='<%# Bind("StudentName") %>'></asp:Label>
                </ItemTemplate>
                 <ItemStyle HorizontalAlign="Center"> </ItemStyle>
            </asp:TemplateField>
         <asp:TemplateField ShowHeader="True" HeaderText="Mother Name">
                <ItemTemplate>
                    <asp:Label ID="lblMothersName" runat="server" Text='<%# Bind("MotherName") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"> </ItemStyle>
            </asp:TemplateField>
          <asp:TemplateField ShowHeader="True" HeaderText="Father Name">
                <ItemTemplate>
                    <asp:Label ID="lblFatherName" runat="server" Text='<%# Bind("FatherName") %>'></asp:Label>
                </ItemTemplate>
                 <ItemStyle HorizontalAlign="Center"> </ItemStyle>
            </asp:TemplateField>
         <asp:TemplateField ShowHeader="True" HeaderText="Medium">
                <ItemTemplate>
                    <asp:Label ID="lblMediumName" runat="server" Text='<%# GetMedium(Container.DataItem) %>'></asp:Label>
                </ItemTemplate>
                 <ItemStyle HorizontalAlign="Center"> </ItemStyle>
            </asp:TemplateField>
           <asp:TemplateField ShowHeader="True" HeaderText="Class">
                <ItemTemplate>
                    <asp:Label ID="lblClassName" runat="server" Text='<%# GetClass(Container.DataItem) %>'></asp:Label>
                </ItemTemplate>
                 <ItemStyle HorizontalAlign="Center"> </ItemStyle>
            </asp:TemplateField>
          <asp:TemplateField ShowHeader="True" HeaderText="Section"> 
                <ItemTemplate>
                    <asp:Label ID="lblSectionName" runat="server" Text='<%# GetSection(Container.DataItem)%>'></asp:Label>
                </ItemTemplate>
                 <ItemStyle HorizontalAlign="Center"> </ItemStyle>
            </asp:TemplateField>
              <asp:TemplateField ShowHeader="True" HeaderText="Deleted"> 
                <ItemTemplate>
                    <asp:CheckBox ID="lblIsDeleted" runat="server" Checked='<%# Bind("IsDeleted") %>' Enabled="False"></asp:CheckBox>
                </ItemTemplate>
                 <ItemStyle HorizontalAlign="Center"> </ItemStyle>
            </asp:TemplateField>
           <asp:TemplateField ShowHeader="True" >
                <ItemTemplate>
                     <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" CommandArgument=<%# Bind("StudentId") %>
                        Text="Delete"></asp:LinkButton>
                </ItemTemplate>
                 <ItemStyle HorizontalAlign="Center"> </ItemStyle>
            </asp:TemplateField>
           
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D"  ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6"  ForeColor="#333333" />
       
    </asp:GridView>

     
     <asp:EntityDataSource ID="EntityDataSourceStudent" runat="server" 
        EnableInsert="True" EnableUpdate="True" EnableDelete="True" 
       ConnectionString="metadata=res://DataLib/SchoolManagement.csdl|res://DataLib/SchoolManagement.ssdl|res://DataLib/SchoolManagement.msl;provider=System.Data.SqlClient;provider connection string=&quot;data source=VIJAY;initial catalog=TestDB;integrated security=True;multipleactiveresultsets=True;App=EntityFramework&quot;" 
        DefaultContainerName="SchoolManagementSystemEntities" EnableFlattening="False" 
        EntitySetName="Students" EntityTypeFilter="Student"  AutoGenerateWhereClause="True">
   <WhereParameters>
             <asp:ControlParameter ControlID="ddlClassForGridView" DefaultValue="-1" 
                 Name="Class" PropertyName="SelectedValue" Type="Int32" />
             <asp:ControlParameter ControlID="ddlMediumForGridView" DefaultValue="-1" 
                 Name="MediumId" PropertyName="SelectedValue" Type="Int32" />
             <asp:ControlParameter ControlID="ddlSectionForGridView" DefaultValue="-1" 
                 Name="SectionId" PropertyName="SelectedValue" Type="Int32" />
         </WhereParameters>
         
     </asp:EntityDataSource>


</asp:Content>

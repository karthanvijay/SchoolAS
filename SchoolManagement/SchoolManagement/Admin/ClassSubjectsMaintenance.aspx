<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClassSubjectsMaintenance.aspx.cs" Inherits="SchoolManagement.Admin.ClassSubjectsMaintenance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table>
        <tr>
         <td>
             Select Medium:
         </td>   
         <td>
             <asp:DropDownList ID="ddlMedium" runat="server" AutoPostBack="True" 
                 DataSourceID="EntityDataSourceMedium" DataTextField="MediumName" 
                 DataValueField="MediumId">
             </asp:DropDownList>       
             <asp:EntityDataSource ID="EntityDataSourceMedium" runat="server" 
        EnableInsert="True" EnableUpdate="True" EnableDelete="True" 
      ConnectionString="metadata=res://DataLib/SchoolManagement.csdl|res://DataLib/SchoolManagement.ssdl|res://DataLib/SchoolManagement.msl;provider=System.Data.SqlClient;provider connection string=&quot;data source=VIJAY;initial catalog=TestDB;integrated security=True;multipleactiveresultsets=True;App=EntityFramework&quot;" 
        DefaultContainerName="SchoolManagementSystemEntities" EnableFlattening="False" 
         EntitySetName="Media" EntityTypeFilter="Medium">
  </asp:EntityDataSource>
       </td>
         <td>
               Select Class:
           
         </td>
         <td>
               <asp:DropDownList ID="ddlClass" runat="server" AutoPostBack="True"
                   DataSourceID="EntityDataSourceClass" DataTextField="ClassName" 
                   DataValueField="ClassId">
        </asp:DropDownList>
             <asp:EntityDataSource ID="EntityDataSourceClass" runat="server" 
       ConnectionString="metadata=res://DataLib/SchoolManagement.csdl|res://DataLib/SchoolManagement.ssdl|res://DataLib/SchoolManagement.msl;provider=System.Data.SqlClient;provider connection string=&quot;data source=VIJAY;initial catalog=TestDB;integrated security=True;multipleactiveresultsets=True;App=EntityFramework&quot;" 
        DefaultContainerName="SchoolManagementSystemEntities" EnableFlattening="False" 
       EntitySetName="Classes" EntityTypeFilter="Class">
  </asp:EntityDataSource>
       
         </td>
         
        </tr>
        </table>
        <table>
        <tr>
              <td>
              <b>   Subjects List:</b>
               </td>
               <td>
                   <asp:Label ID="lblSuccess" runat="server" Text="" Visible="False"></asp:Label>           
               </td>
        </tr>
        <tr>
          <td></td>
            <td>
                <asp:CheckBoxList ID="CheckBoxListSubjects" runat="server"  
                    DataSourceID="EntityDataSourceSubject" DataTextField="SubjectName" 
                    DataValueField="SubjectId">
                </asp:CheckBoxList>      
            
             <asp:EntityDataSource ID="EntityDataSourceSubject" runat="server" 
        ConnectionString="metadata=res://DataLib/SchoolManagement.csdl|res://DataLib/SchoolManagement.ssdl|res://DataLib/SchoolManagement.msl;provider=System.Data.SqlClient;provider connection string=&quot;data source=VIJAY;initial catalog=TestDB;integrated security=True;multipleactiveresultsets=True;App=EntityFramework&quot;" 
        DefaultContainerName="SchoolManagementSystemEntities" EnableFlattening="False" 
      EntitySetName="SubjectMasters" EntityTypeFilter="SubjectMaster">
  </asp:EntityDataSource>
            
            </td>
        </tr>
        <tr>
            <td>
                
            </td>
            <td>
                <asp:Button ID="btnSubmitChanges" runat="server" Text="Submit Changes" OnClick="AddOrUpdateSubjectsForClassMedium"/>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <b>
                    Note:
                </b>
                Check/Un-check the boxes to add/remove the subjects for class in medium and click on <b>Submit Changes</b> to save changes
             </td>
        </tr>
    </table>
</asp:Content>


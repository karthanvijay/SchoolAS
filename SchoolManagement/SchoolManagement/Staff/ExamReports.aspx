<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ExamReports.aspx.cs" Inherits="SchoolManagement.Staff.ExamReports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table>
        <tr>
            <td style="text-align: end;">
                <asp:Label ID="lblMedium" runat="server" Text="Medium:" Width="100" Style=""></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlMediumForGridView" runat="server" Width="200" 
                    AutoPostBack="True" DataSourceID="LinqDataSourceMedium" DataTextField="MediumName"
                    DataValueField="MediumId">
                </asp:DropDownList>
            </td>
            <td style="text-align: end;">
                <asp:Label ID="lblClass" runat="server" Text="Class:" Width="100" Style=""></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlClassForGridView" runat="server" Width="200" 
                    AutoPostBack="True" DataSourceID="LinqDataSourceClass" DataTextField="ClassName"
                    DataValueField="ClassId">
                </asp:DropDownList>
            </td>
            <td style="text-align: end;">
                <asp:Label ID="lblSection" runat="server" Text="Section:" Width="100" Style=""></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlSectionForGridView" runat="server" Width="200" 
                    AutoPostBack="True" DataSourceID="LinqDataSourceSection" DataTextField="SectionName"
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
        
            </td>
        
            <td style="text-align: end;">
                <asp:Label ID="lblExamType" runat="server" Text="Exam Type:" Width="100"
                    Style=""></asp:Label>
            </td>
            <td>
                    <asp:DropDownList ID="ddlExamType" runat="server" Width="200px" 
                        DataSourceID="SqlDataSourceExamType" DataTextField="ExamName" 
                        DataValueField="ExamTypeId">
                        </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceExamType" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:SchoolManagement %>" 
                        SelectCommand="SELECT [ExamTypeId], [ExamName] FROM [ExamType]">
                    </asp:SqlDataSource>
        
            </td>
        </tr>   
           
        </table>
                
                          <asp:ObjectDataSource ID="ObjectDataSourceAcademicYearList" runat="server" 
                            SelectMethod="AcademmicYearList" TypeName="SchoolManagement.Helpers.HelperFunctions">
                        </asp:ObjectDataSource>              
                        
    <asp:LinqDataSource ID="LinqDataSourceClass" runat="server" ContextTypeName="DataLib.SchoolManagementSystemEntities"
         Select="new (ClassId, ClassName)" TableName="Classes">
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="LinqDataSourceSection" runat="server" ContextTypeName="DataLib.SchoolManagementSystemEntities"
         Select="new (SectionId, SectionName)" TableName="Sections">
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="LinqDataSourceMedium" runat="server" ContextTypeName="DataLib.SchoolManagementSystemEntities"
         Select="new (MediumId, MediumName)" TableName="Mediums">
    </asp:LinqDataSource>
</asp:Content>

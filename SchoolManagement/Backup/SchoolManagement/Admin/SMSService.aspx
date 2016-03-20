<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SMSService.aspx.cs" Inherits="SchoolManagement.Admin.SMSService" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table border="0">
<tr>
    <td>
        Your Number:
    </td>
    <td>
        <asp:TextBox ID="txtNumber" runat="server"></asp:TextBox>
    </td>
    <td>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required"
            ControlToValidate="txtNumber" ForeColor="Red"></asp:RequiredFieldValidator>
    </td>
</tr>
<tr>
    <td>
        Password:
    </td>
    <td>
        <asp:TextBox ID="txtPassword" TextMode="Password" runat="server"></asp:TextBox>
    </td>
    <td>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required"
            ControlToValidate="txtPassword" ForeColor="Red"></asp:RequiredFieldValidator>
    </td>
</tr>
<tr>
    <td>
        Recepient Number:
    </td>
    <td>
        <asp:TextBox ID="txtRecepientNumber" runat="server" Width = "300"></asp:TextBox>
    </td>
    <td>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required"
            ControlToValidate="txtRecepientNumber" ForeColor="Red"></asp:RequiredFieldValidator>
    </td>
</tr>
<tr>
    <td>
        Message:
    </td>
    <td>
        <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine"></asp:TextBox>
    </td>
    <td>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Required"
            ControlToValidate="txtMessage" ForeColor="Red"></asp:RequiredFieldValidator>
    </td>
</tr>
<tr>
    <td>
    </td>
    <td>
        <asp:Button ID="btnSend" runat="server" Text="Send" OnClick="BtnSendClick" />
    </td>
    <td>
    </td>
</tr>
</table>
</asp:Content>

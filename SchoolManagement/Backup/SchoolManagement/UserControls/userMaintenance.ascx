<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="userMaintenance.ascx.cs"
    Inherits="SchoolManagement.UserControls.UserMaintenance" %>
 
<script type="text/javascript">
    $(function () {
        $(".effectiveDate").datepicker();
        $(".expirationDate").datepicker();

    });
</script>
<span class="failureNotification">
    <asp:Literal ID="ErrorMessage" runat="server"></asp:Literal>
</span>
<asp:ValidationSummary ID="RegisterUserValidationSummary" runat="server" CssClass="failureNotification"
    ValidationGroup="RegisterUserValidationGroup" />
<div class="accountInfo" style="width: 100%;">
    <fieldset class="register" >
        <legend>User Information</legend>
        <asp:Label ID="lblNote" runat="server" Text="Fileds marked '*' are  mandatory" ForeColor="Red"></asp:Label>
        <table>
            <tr>
                <td>
                    <asp:Label ID="lblUserName" runat="server" Text="UserName"></asp:Label>
                </td>
                <td class="columnSpacing">
                    <asp:TextBox ID="txtUserName" runat="server" CssClass="textEntry"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ErrorMessage="*" ControlToValidate="txtUserName"
                        SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblUserEmail" runat="server" Text="UserEmail"></asp:Label>
                </td>
                <td class="columnSpacing">
                    <asp:TextBox ID="txtUserEmail" runat="server" CssClass="textEntry"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvUserEmail" runat="server" ErrorMessage="*" ControlToValidate="txtUserEmail"
                        SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regexUserEmail" runat="server" Display="Dynamic"
                        ErrorMessage="In-valid Email." ForeColor="Red" SetFocusOnError="True" ValidationExpression="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}"
                        ControlToValidate="txtUserEmail">
                    </asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblUserPassword" runat="server" Text="UserPassword"></asp:Label>
                </td>
                <td class="columnSpacing">
                    <asp:TextBox ID="txtUserPassword" runat="server" TextMode="Password" CssClass="textEntry" EnableViewState="True"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvUserPassword" runat="server" ErrorMessage="*"
                        ControlToValidate="txtUserPassword" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblConfirmPassword" runat="server" Text="ConfirmPassword" ></asp:Label>
                </td>
                <td class="columnSpacing">
                    <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="textEntry" TextMode="Password" EnableViewState="True"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" ErrorMessage="*"
                        ControlToValidate="txtConfirmPassword" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cmpvlConfirmPassword" runat="server" Display="Dynamic"
                        ForeColor="Red" ErrorMessage="Password does not match." ControlToValidate="txtUserPassword"
                        ControlToCompare="txtConfirmPassword"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblEffectiveDate" runat="server" Text="EffectiveDate"></asp:Label>
                </td>
                <td class="columnSpacing">
                    <asp:TextBox ID="wdcEffectiveDate" runat="server" CssClass="effectiveDate"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEffectiveDate" runat="server" ErrorMessage="*"
                        ForeColor="red" ControlToValidate="wdcEffectiveDate"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblExpirationDate" runat="server" Text="ExpirationDate"></asp:Label>
                </td>
                <td class="columnSpacing">
                    <asp:TextBox ID="wdcExpirationDate" runat="server" CssClass="expirationDate"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvExpirationDate" runat="server" ErrorMessage="*"
                        ForeColor="red" ControlToValidate="wdcExpirationDate"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cmpDate" runat="server" ErrorMessage="ExpirationDate cannot be less than EffectiveDate"
                        ForeColor="red" Display="Dynamic" ControlToValidate="wdcExpirationDate" ControlToCompare="wdcEffectiveDate"
                        Operator="GreaterThan"></asp:CompareValidator>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblGroup" runat="server" Text="Group"></asp:Label>
                </td>
                <td class="columnSpacing">
                    <asp:CheckBoxList ID="chklstGroup" runat="server" DataSourceID="LinqDataSource1"
                        DataTextField="GroupDescription" DataValueField="GroupId">
                    </asp:CheckBoxList>
                    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DataLib.SchoolManagementSystemEntities"
                         Select="new (GroupId, GroupDescription)" TableName="Groups" 
                        EntityTypeName="">
                    </asp:LinqDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblAddressLineOne" runat="server" Text="AddressLineOne"></asp:Label>
                </td>
                <td class="columnSpacing">
                    <asp:TextBox ID="txtAddressLineOne" runat="server" CssClass="textEntry"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvAddressLineOne" runat="server" ErrorMessage="*"
                        ControlToValidate="txtAddressLineOne" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblVillage" runat="server" Text="Village"></asp:Label>
                </td>
                <td class="columnSpacing">
                    <asp:TextBox ID="txtVillage" runat="server" CssClass="textEntry"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvVillage" runat="server" ErrorMessage="*" ControlToValidate="txtVillage"
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblDistrict" runat="server" Text="District"></asp:Label>
                </td>
                <td class="columnSpacing">
                    <asp:TextBox ID="txtDistrict" runat="server" CssClass="textEntry"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvDistrict" runat="server" ErrorMessage="*" ControlToValidate="txtDistrict"
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPincode" runat="server" Text="Pincode"></asp:Label>
                </td>
                <td class="columnSpacing">
                    <asp:TextBox ID="txtPincode" runat="server" CssClass="textEntry"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvPincode" runat="server" ErrorMessage="*" ControlToValidate="txtPincode"
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td class="columnSpacing">
                    <asp:Button ID="btnSubmit" runat="server" Text="Create User/Update User" OnClick="CreateUser" />
                </td>
            </tr>
        </table>
    </fieldset>
</div>

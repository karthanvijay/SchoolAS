using System;
using System.Globalization;
using System.Web.UI.WebControls;
using DataLib;
using SchoolManagement.Helpers;

namespace SchoolManagement.UserControls
{
    public partial class UserMaintenance : System.Web.UI.UserControl
    {
        public PageDataService PageDataService = new PageDataService(); 
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session[SessionVariables.UserIdInSession] == null)
            {
                Response.Redirect("~/AccountManagement/Logout.aspx");
            }
        }
        protected void CreateUser(object sender, EventArgs e)
        {
            int addressId = 0;
            if (!string.IsNullOrEmpty(txtAddressLineOne.Text) && !string.IsNullOrEmpty(txtDistrict.Text) && !string.IsNullOrEmpty(txtPincode.Text)
                 && !string.IsNullOrEmpty(txtVillage.Text))
            {
                var address = PageDataService.AddAddressByAdoNet(txtAddressLineOne.Text, txtVillage.Text, txtDistrict.Text,
                                                       txtPincode.Text);
                if (address != null)
                {
                    addressId = address.AddressId;
                }
            }

            if (!string.IsNullOrEmpty(txtUserName.Text) && !string.IsNullOrEmpty(txtUserEmail.Text) && !string.IsNullOrEmpty(txtUserPassword.Text)
                 && addressId != 0)
            {
                var user = PageDataService.AddUserAdoNet(txtUserName.Text, txtUserEmail.Text, txtUserPassword.Text,
                                     Convert.ToDateTime(wdcEffectiveDate.Text),
                                     Convert.ToDateTime(wdcExpirationDate.Text), addressId);
                if (user != null)
                {
                    foreach (ListItem item in chklstGroup.Items)
                    {
                        if (item.Selected)
                        {
                            PageDataService.AddUserGroupAssociationByEntityFrameWork(Convert.ToInt32(item.Value), user.UserId);
                        }
                    }
                }
                Response.Redirect(Request.RawUrl, false);
            }
        }
        protected void Page_PreRender(object sender, EventArgs e)
        {
            if(Session[SessionVariables.UserSelectedToUpdateInUserMaintenance]!=null)
            {
                var user =
                    PageDataService.GetUserByIdInAdoNet(
                        Convert.ToInt32(Session[SessionVariables.UserSelectedToUpdateInUserMaintenance].ToString()));
                if(user!=null)
                {
                    var userGroups =
                        PageDataService.GetUserGroupAssociationsByUserIdByAdoNet(
                            Convert.ToInt32(Session[SessionVariables.UserSelectedToUpdateInUserMaintenance].ToString()));
                    txtUserName.Text = user.UserName;
                    txtUserEmail.Text = user.UserEmail;
                    wdcEffectiveDate.Text = Convert.ToString(Convert.ToDateTime(user.EffectiveDate).Date);
                    wdcExpirationDate.Text = Convert.ToString(Convert.ToDateTime(user.ExpirationDate).Date);
                    txtUserPassword.Text = user.UserPassword;
                    txtConfirmPassword.Text = user.UserPassword;
                    txtAddressLineOne.Text = user.Address.AdrressLineOne;
                    txtVillage.Text = user.Address.Village;
                    txtDistrict.Text = user.Address.District;
                    txtPincode.Text = user.Address.Pincode;
                    foreach (ListItem chk in chklstGroup.Items)
                    {
                        foreach (var userGroupAssociation in userGroups.UserGroupAssociations)
                        {
                            if(chk.Value.Equals(userGroupAssociation.GroupId.ToString(CultureInfo.InvariantCulture)))
                            {
                                chk.Selected = true;
                                break;
                            }
                        }
                    }
                }
            }
        }
    }
}
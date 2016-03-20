using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataLib;
using SchoolManagement.Helpers;

namespace SchoolManagement.AccountManagement
{
    public partial class Register : Page
    {
        public PageDataService PageDataService=new PageDataService(); 
       
        protected void Page_Load(object sender, EventArgs e)
        {
           if(Session[SessionVariables.UserIdInSession]==null)
           {
               Response.Redirect("~/AccountManagement/Logout.aspx");
           }
        }


        protected void CreateUser(object sender, EventArgs e)
        {
            int addressId = 0;
            if(!string.IsNullOrEmpty(txtAddressLineOne.Text) && !string.IsNullOrEmpty(txtDistrict.Text) && !string.IsNullOrEmpty(txtPincode.Text)
                 && !string.IsNullOrEmpty(txtVillage.Text) )
            {
                var address = PageDataService.Address(txtAddressLineOne.Text, txtVillage.Text, txtDistrict.Text,
                                                       txtPincode.Text);
                if(address!=null)
                {
                    addressId = address.AddressId;
                }
            }
          
            if(!string.IsNullOrEmpty(txtUserName.Text) && !string.IsNullOrEmpty(txtUserEmail.Text) && !string.IsNullOrEmpty(txtUserPassword.Text)
                 && addressId != 0)
            {
               var user = PageDataService.AddUser(txtUserName.Text, txtUserEmail.Text, txtUserPassword.Text,
                                    Convert.ToDateTime(wdcEffectiveDate.Value),
                                    Convert.ToDateTime(wdcExpirationDate.Value), addressId);
                if(user!=null)
                {
                    foreach (ListItem item in chklstGroup.Items)
                    {
                        if(item.Selected)
                        {
                            PageDataService.AddUserGroupAssociation(Convert.ToInt32(item.Value), user.UserId);
                        }
                    }
                }
                Response.Redirect(Request.RawUrl,false);
            }
            
        }

        protected void EffectiveDateInit(object sender, EventArgs e)
        {
            var dateChooser = (WebDateChooser)sender;
            dateChooser.Editable = true;
            dateChooser.ReadOnly = false;
            dateChooser.MinDate = new DateTime(1754, 1, 1);
            dateChooser.Value = DateTime.Now;
        }

        protected void ExpirationDateInit(object sender, EventArgs e)
        {
            var dateChooser = (WebDateChooser)sender;
            dateChooser.Editable = true;
            dateChooser.ReadOnly = false;
            dateChooser.MinDate = new DateTime(1754, 1, 1);
            dateChooser.Value = new DateTime(DateTime.Now.Year+5, 1, 1);
        }
    }
}

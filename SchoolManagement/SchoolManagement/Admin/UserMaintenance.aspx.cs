using System;
using System.Globalization;
using System.Web.UI.WebControls;
using DataLib;
using SchoolManagement.Helpers;

namespace SchoolManagement.Admin
{
    public partial class UserMaintenance : AdminHelper
    {
      
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session[SessionVariables.UserIdInSession] == null)
            {
                Response.Redirect("~/AccountManagement/Logout.aspx");
            }
        }

        protected void AddUser(object sender, EventArgs e)
        {
            lblAddOrUpdateUser.Text = true.ToString(CultureInfo.InvariantCulture);
        }

        protected void GvUsersSelectedIndexChanged(object sender, EventArgs e)
        {
            lblAddOrUpdateUser.Text = true.ToString(CultureInfo.InvariantCulture);
           Session[SessionVariables.UserSelectedToUpdateInUserMaintenance] = GvUsers.SelectedValue;
        }

        protected void DeleteUser(object sender, EventArgs e)
        {
            
        }

        protected void GvUsersOnRowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName.Equals("UpdateUser"))
            {
                var userUpdated = PageDataService.DeleteUserByAdoNet(Convert.ToInt32(e.CommandArgument));
                if (userUpdated)
                {
                    Response.Redirect(Request.RawUrl,false);
                }
            }
        }

        protected bool IsUserDeleted(object bind)
        {
            var user = (User) bind;
            if(user!=null)
            return !user.IsDeleted;
            return true;
        }
    }
}
using System;
using System.Web.UI.WebControls;
using DataLib;
using SchoolManagement.Helpers;

namespace SchoolManagement.Admin
{
    public partial class GroupMaintenance : AdminHelper
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session[SessionVariables.UserIdInSession] == null)
            {
                Response.Redirect("~/AccountManagement/Logout.aspx");
            }
        }

        protected void GvGroupRowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName.Equals("Insert"))
            {
                var grpCode = GvGroup.FooterRow.FindControl("ftrGroupCode") as TextBox;
                var grpDescription = GvGroup.FooterRow.FindControl("ftrGroupDescription") as TextBox;
                if (grpCode != null && grpDescription != null && !string.IsNullOrEmpty(grpCode.Text.Trim()) && !string.IsNullOrEmpty(grpDescription.Text.Trim()))
                    PageDataService.AddGroupAdoNet(grpCode.Text.Trim(), grpDescription.Text.Trim());
                Response.Redirect(Request.RawUrl);
            }
        }
    }
}
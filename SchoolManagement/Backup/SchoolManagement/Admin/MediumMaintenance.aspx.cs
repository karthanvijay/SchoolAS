using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataLib;
using SchoolManagement.Helpers;

namespace SchoolManagement.Admin
{
    public partial class MediumMaintenance : AdminHelper
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session[SessionVariables.UserIdInSession] == null)
            {
                Response.Redirect("~/AccountManagement/Logout.aspx");
            }
        }

        protected void GvMediumRowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Insert"))
            {
                var mName = GvMedium.FooterRow.FindControl("ftrMediumName") as TextBox;
                if (mName != null && !string.IsNullOrEmpty(mName.Text.Trim()))
                    PageDataService.AddMediumByAdoNet(mName.Text);
                Response.Redirect(Request.RawUrl);
            }
        }
    }
}
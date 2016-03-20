using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataLib;
using SchoolManagement.Helpers;

namespace SchoolManagement.Admin
{
    public partial class CastMaintenance : AdminHelper
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session[SessionVariables.UserIdInSession] == null)
            {
                Response.Redirect("~/AccountManagement/Logout.aspx");
            }
        }

        protected void GvCastRowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Insert"))
            {
                var cstName = GvCast.FooterRow.FindControl("ftrCastName") as TextBox;
                if (cstName != null && !string.IsNullOrEmpty(cstName.Text.Trim()))
                    PageDataService.AddCastAdoNet(cstName.Text);
                Response.Redirect(Request.RawUrl);
            }

        }
    }
}
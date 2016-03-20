using System;
using System.Web.UI.WebControls;
using DataLib;
using SchoolManagement.Helpers;

namespace SchoolManagement.Admin
{
    public partial class ClassMaintenance : AdminHelper
    { 
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session[SessionVariables.UserIdInSession] == null)
            {
                Response.Redirect("~/AccountManagement/Logout.aspx");
            }
        }

        protected void GvClassRowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Insert"))
            {
                var mName = GvClass.FooterRow.FindControl("ftrClassName") as TextBox;
                if (mName != null && !string.IsNullOrEmpty(mName.Text.Trim()))
                    PageDataService.AddClassByAdoNet(mName.Text);
                Response.Redirect(Request.RawUrl);
            }
        }
    }
}
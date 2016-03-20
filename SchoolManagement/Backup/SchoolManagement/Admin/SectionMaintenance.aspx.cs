using System;
using System.Web.UI.WebControls;
using DataLib;
using SchoolManagement.Helpers;

namespace SchoolManagement.Admin
{
    public partial class SectionMaintenance : AdminHelper
    {
        public PageDataService PageDataService = new PageDataService(); 
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session[SessionVariables.UserIdInSession] == null)
            {
                Response.Redirect("~/AccountManagement/Logout.aspx");
            }
        }

        protected void GvSectionRowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Insert"))
            {
                var mName = GvSection.FooterRow.FindControl("ftrSectionName") as TextBox;
                if (mName != null && !string.IsNullOrEmpty(mName.Text.Trim()))
                    PageDataService.AddSectionByEntityFrameWork(mName.Text);
                Response.Redirect(Request.RawUrl);
            }

        }
    }
}
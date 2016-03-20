using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataLib;

namespace SchoolManagement.Admin
{
    public partial class SubjectTypeMaintenance : System.Web.UI.Page
    {
        public PageDataService PageDataService = new PageDataService(); 
    
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GvSubjectTypeRowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Insert"))
            {
                var ftrPerSubjectName = GvSubjectType.FooterRow != null ? GvSubjectType.FooterRow.FindControl("ftrSubjectName") as TextBox :
                    null;
                if (ftrPerSubjectName != null && !string.IsNullOrEmpty(ftrPerSubjectName.Text.Trim()))
                    PageDataService.AddSubjectByEntityFrameWork(ftrPerSubjectName.Text);
                Response.Redirect(Request.RawUrl);
            }
        }

        protected void AddSubjecType(object sender, EventArgs e)
        {

            var ftrPerSubjectName = emptyDataTemplateSubjectName;
            if (ftrPerSubjectName != null && !string.IsNullOrEmpty(ftrPerSubjectName.Text.Trim()))
                PageDataService.AddSubjectByEntityFrameWork(ftrPerSubjectName.Text);
            Response.Redirect(Request.RawUrl);
        }
        protected void Page_PreRender(object sender, EventArgs e)
        {
            PnlAddSubjectNameTemplateType.Visible = GvSubjectType.Rows.Count == 0;
        }
 
    }
}
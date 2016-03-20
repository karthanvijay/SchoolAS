using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataLib;

namespace SchoolManagement.Admin
{
    public partial class ExamTypeMaintenance : System.Web.UI.Page
    {
        public PageDataService PageDataService = new PageDataService(); 
    
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void GvExamTypeRowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Insert"))
            {
                var ftrPerSubjectMarks = GvExamType.FooterRow!=null? GvExamType.FooterRow.FindControl("ftrPerSubjectMarks") as TextBox :
                    GvExamType.FindControl("emptyDataTemplatePerSubjectMarks") as TextBox;
                var examName = GvExamType.FooterRow != null ? GvExamType.FooterRow.FindControl("ftrExamName") as TextBox : GvExamType.FindControl("emptyDataTemplateExamName") as TextBox;
                var ftrPassingMarksPerSubject = GvExamType.FooterRow != null ? GvExamType.FooterRow.FindControl("ftrPassingMarksPerSubject") as TextBox : GvExamType.FindControl("emptyDataTemplatePassingMarksPerSubject") as TextBox;
              
                if (examName != null && !string.IsNullOrEmpty(examName.Text.Trim()) && ftrPerSubjectMarks != null && !string.IsNullOrEmpty(ftrPerSubjectMarks.Text.Trim())
                    && ftrPassingMarksPerSubject != null && !string.IsNullOrEmpty(ftrPassingMarksPerSubject.Text.Trim()))
                    PageDataService.AddExamTypeAdoNet(examName.Text, Convert.ToInt32(ftrPerSubjectMarks.Text), Convert.ToInt32(ftrPassingMarksPerSubject.Text));
                Response.Redirect(Request.RawUrl);
            }
        }

        protected void AddExamtype(object sender, EventArgs e)
        {
            var ftrPerSubjectMarks = emptyDataTemplatePerSubjectMarks;
            var examName = emptyDataTemplateExamName;
            if (examName != null && !string.IsNullOrEmpty(examName.Text.Trim()) && ftrPerSubjectMarks != null && !string.IsNullOrEmpty(ftrPerSubjectMarks.Text.Trim())
                && !string.IsNullOrEmpty(emptyDataTemplatePassingMarksPerSubject.Text.Trim()))
                PageDataService.AddExamTypeAdoNet(examName.Text, Convert.ToInt32(ftrPerSubjectMarks.Text), Convert.ToInt32(emptyDataTemplatePassingMarksPerSubject.Text));
            Response.Redirect(Request.RawUrl);
        }
        protected void Page_PreRender(object sender, EventArgs e)
        {
            PnlAddExamTemplateType.Visible = GvExamType.Rows.Count == 0;     
        }
    }
}
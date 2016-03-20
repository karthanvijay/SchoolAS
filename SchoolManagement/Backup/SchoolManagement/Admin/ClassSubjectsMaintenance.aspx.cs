using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
using DataLib;

namespace SchoolManagement.Admin
{
    public partial class ClassSubjectsMaintenance : System.Web.UI.Page
    {
        public PageDataService PageDataService = new PageDataService(); 

        protected void Page_Load(object sender, EventArgs e)
        {
            lblSuccess.Text = string.Empty;
        }

        protected void GvClassSubjectsSelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void AddOrUpdateSubjectsForClassMedium(object sender, EventArgs e)
        {
            var subjectTables = (from ListItem listItem in CheckBoxListSubjects.Items
                                 where listItem.Selected
                                 select new SubjectTable
                                            {
                                                SubjectId = Convert.ToInt32(listItem.Value),
                                                ClassId = Convert.ToInt32(ddlClass.SelectedItem.Value), 
                                                MediumId = Convert.ToInt32(ddlMedium.SelectedItem.Value)
                                            }).ToList();

            PageDataService.AddAllSubjectTableRecordsForClassAndMediumAdoNet(subjectTables);
            lblSuccess.Text = "Subjects Changes for " + ddlClass.SelectedItem.Text + "(" + ddlMedium.SelectedItem.Text +")"+
                              " updated successfully";

            lblSuccess.ForeColor = System.Drawing.Color.Green;
            lblSuccess.Visible = true;
        }
        protected void Page_PreRender(object sender, EventArgs e)
        {
            if(ddlClass.SelectedItem==null || ddlMedium.SelectedItem==null)
            {
                ddlClass.DataBind();
                ddlMedium.DataBind();
                CheckBoxListSubjects.DataBind();
            }
            var subjectTables =
                PageDataService.GetAllSubjectTableRecordsForClassAndMediumAdoNet(Convert.ToInt32(ddlClass.SelectedItem.Value),
                                                                           Convert.ToInt32(ddlMedium.SelectedItem.Value));
            foreach (ListItem listItem in CheckBoxListSubjects.Items)
            {
                listItem.Selected = false;
            }
            var listItems = (from ListItem listItem in CheckBoxListSubjects.Items
                             join subjectTable in subjectTables on listItem.Value equals Convert.ToString(subjectTable.SubjectId)
                             select listItem);
            foreach (var listItem in listItems)
            {
                listItem.Selected = true;
            }
        }
    }
}
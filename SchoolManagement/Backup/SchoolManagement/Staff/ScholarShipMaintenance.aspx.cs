using System;
using System.Globalization;
using DataLib;
using System.Web.UI.WebControls;
using SchoolManagement.Helpers;
namespace SchoolManagement.Staff
{
    public partial class ScholarShipMaintenance : System.Web.UI.Page
    {
        public PageDataService PageDataService = new PageDataService(); 
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session[SessionVariables.UserIdInSession] == null)
            {
                Response.Redirect("~/AccountManagement/Logout.aspx");
            }
        }
        protected void GvStudentDataBind(object sender, EventArgs e)
        {
            GvScholarShip.DataBind();
        }

        protected void AddFeeDetailsOfStudent(object sender, EventArgs e)
        {
            
        }

        protected void GvScholarShipSelectedIndexChanging(object sender, EventArgs e)
        {
            hdnScholarShipDetailsId.Value = GvScholarShip.SelectedValue.ToString();
            PopulateScholarShipDetails(GvScholarShip.SelectedValue.ToString());
            lblUpdateStudentScholarShipDetails.Text = true.ToString(CultureInfo.InvariantCulture);
            lblAddScholarShipForStudents.Text = false.ToString(CultureInfo.InvariantCulture);
        }

        private void PopulateScholarShipDetails(string scholarShipDetailsId)
        {
            var scholarShipDetails = PageDataService.GetScholarShipDetailsByScholarShipDetailsIdAdoNet(Convert.ToInt32(scholarShipDetailsId));
            if (scholarShipDetails != null && lblStudentNameSelected != null && lblStudentmName != null && lblStudentfName!=null
                && lblStudentcName != null && lblStudentsName != null && lblStudentMediumName != null && ddlAcademicYearInScholarShipAdd != null 
                && ddlScholarShipTypeInScholarShipAdd!=null)
            {
                lblStudentNameSelected.Text = scholarShipDetails.Student.StudentName;
                lblStudentmName.Text =scholarShipDetails.Student.MotherName;
                lblStudentfName.Text =scholarShipDetails.Student.FatherName;
                lblStudentcName.Text =scholarShipDetails.Student.Class1.ClassName;
                lblStudentsName.Text =scholarShipDetails.Student.Section.SectionName;
                lblStudentMediumName.Text =scholarShipDetails.Student.Medium.MediumName;
                ddlAcademicYearInScholarShipAdd.SelectedValue =Convert.ToString(scholarShipDetails.AcademicYearId);
                ddlScholarShipTypeInScholarShipAdd.SelectedValue =Convert.ToString(scholarShipDetails.ScholarShipTypeId);
                txtStudentScholarShip.Text =Convert.ToString(scholarShipDetails.AmountSanctioned);
              
            }
        }

        protected void UpdateFeeDetailsOfStudent(object sender, EventArgs e)
        {
             if (Session[SessionVariables.UserIdInSession] != null)
             {
                 PageDataService.UpdateScholarShipDetailsByScholarShipDetailsIdAdoNet(
                     Convert.ToInt32(hdnScholarShipDetailsId.Value), Convert.ToInt32(txtStudentScholarShip.Text.Trim()),
                     Convert.ToInt32(Session[SessionVariables.UserIdInSession].ToString()));

                 lblUpdateStudentScholarShipDetails.Text = false.ToString(CultureInfo.InvariantCulture);
                 lblAddScholarShipForStudents.Text = false.ToString(CultureInfo.InvariantCulture);
                 Response.Redirect(Request.RawUrl,false);
             }
        }

        protected void AddOrUpdateScholarShipDetails(object sender, EventArgs e)
        {
            if (Session[SessionVariables.UserIdInSession] != null)
            {
                foreach (ListItem studentItem in chkStudentList.Items)
                {
                    if (studentItem.Selected)
                    {
                        if (!string.IsNullOrEmpty(txtScholarShipAmountSanctioned.Text.Trim()))
                        PageDataService.AddScholarShipDetailAdoNet(Convert.ToInt32(studentItem.Value),
                                                             Convert.ToInt32(ddlScholarShipType.SelectedValue),
                                                             Convert.ToInt32(txtScholarShipAmountSanctioned.Text.Trim()),
                                                             Convert.ToInt32(ddlAcademicYear.SelectedValue),
                                                             Convert.ToInt32(
                                                                 Session[SessionVariables.UserIdInSession].ToString()));
                    }
                }
            }
            Response.Redirect(Request.RawUrl,false);

        }

        protected void AddScholarDetails(object sender, EventArgs e)
        {
            lblAddScholarShipForStudents.Text = true.ToString(CultureInfo.InvariantCulture);
            lblUpdateStudentScholarShipDetails.Text = false.ToString(CultureInfo.InvariantCulture);
        }
    }
}
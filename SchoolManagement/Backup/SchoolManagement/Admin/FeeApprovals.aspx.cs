using System;
using System.Diagnostics;
using System.Globalization;
using DataLib;
using SchoolManagement.Helpers;
using MigraDoc.DocumentObjectModel;
using PdfSharp.Drawing;
using PdfSharp.Pdf;

namespace SchoolManagement.Admin
{
    public partial class FeeApprovals : AdminHelper
    {
        #region Variables

        public PageDataService PageDataService = new PageDataService();

        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session[SessionVariables.UserIdInSession] == null)
            {
                Response.Redirect("~/AccountManagement/Logout.aspx");
            }
        }

        protected void GvTransactionDetailsSelectedIndexChanging(object sender, EventArgs e)
        {
            lblFeeTransactionDetail.Text = true.ToString(CultureInfo.InvariantCulture);
            PopulateStudentDetails(GvTransactionDetails.SelectedValue.ToString());
        }

        private void PopulateStudentDetails(string transactionId)
        {
            var transactionDetail =
                PageDataService.GetTransactionDetailByTransactionDetailIdAdoNet(Convert.ToInt32(transactionId));

            if (transactionDetail != null && transactionDetail.Student != null && transactionDetail.AcademicYear != null)
            {
                PopulateStudentAccountDetails(transactionDetail.Student, transactionDetail.AcademicYear,
                                              transactionDetail);
            }
        }

        private void PopulateStudentAccountDetails(Student student, AcademicYear currentAcademicYear,
                                                   TransactionDetail transactionDetail)
        {
            if (lblStudentNameSelected != null && lblStudentmName != null && lblStudentfName != null &&
                lblStudentcName != null
                && lblStudentsName != null && lblStudentMediumName != null && lblCurrentAcademicYear != null &&
                txtStudentFeePaid != null)
            {
                hdnTransactionDetailId.Value = Convert.ToString(transactionDetail.TransactionDetailsId);

                lblStudentNameSelected.Text = student.StudentName;
                lblStudentfName.Text = student.FatherName;
                lblStudentmName.Text = student.MotherName;
                lblStudentcName.Text = student.Class1.ClassName;
                lblStudentsName.Text = student.Section.SectionName;
                lblStudentMediumName.Text = student.Medium.MediumName;
                lblCurrentAcademicYear.Text = currentAcademicYear.AcademicYearStart.ToString("dd/MM/yyyy") + " - " +
                                              currentAcademicYear.AcademicYearEnd.ToString("dd/MM/yyyy");
                txtStudentFeePaid.Text = Convert.ToString(transactionDetail.AmountPaid);
            }
        }

        protected void ApproveFeeDetailsOfStudent(object sender, EventArgs e)
        {
            var transactionDetail =
                PageDataService.GetTransactionDetailByTransactionDetailIdAdoNet(Convert.ToInt32(hdnTransactionDetailId.Value));

            if (Session[SessionVariables.UserIdInSession] != null && transactionDetail != null)
            {
                var currentlyLoggedInUser =
                    PageDataService.GetUserByIdInAdoNet(Convert.ToInt32(Session[SessionVariables.UserIdInSession].ToString()));

                var isAdmin =
                    PageDataService.IsUserAdminEntityFrameWork(currentlyLoggedInUser.UserId);

                if (isAdmin && chkReject != null && chkApprove != null)
                {
                    PageDataService.UpdateTransactionDetailByTransactionIdAdoNet(transactionDetail.TransactionDetailsId,
                                                                           chkReject.Checked, chkApprove.Checked);
                    Response.Redirect(Request.RawUrl, false);
                }

            }
        }

        private void CreatePdf(TransactionDetail transactionDetail)
        {

        }
    }
}
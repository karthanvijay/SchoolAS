using System;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI.WebControls;
using DataLib;
using SchoolManagement.Helpers;

namespace SchoolManagement.Staff
{
    public partial class AccountMaintenance : PdfHelpers
    {

        #region Variables

        public PageDataService PageDataService = new PageDataService();

        private const string DoubleQuote = "\"";
        private const string DoubleQuoteAndComa = "\",";
        public static string ContentDisposition = "content-disposition";
        public static string ContentTypeTextCsv = "text/csv";
        public static string Pragma = "Pragma";
        public static string Public = "public";
        public static string AttachmentFileName = "attachment; filename=";

        #endregion

        #region Protected Methods

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session[SessionVariables.UserIdInSession] == null)
            {
                Response.Redirect("~/AccountManagement/Logout.aspx");
            }
            if (Session[SessionVariables.UserIdInSession] != null)
            {
                var currentlyLoggedInUser =
                    PageDataService.GetUserByIdInAdoNet(Convert.ToInt32(Session[SessionVariables.UserIdInSession].ToString()));
                var isAdmin =
                    PageDataService.IsUserAdminEntityFrameWork(currentlyLoggedInUser.UserId);
                txtStudentDiscount.Enabled = isAdmin;
            }

        }

        protected object GetMedium(object dataItem)
        {
            var student = dataItem as Student;
            if (student != null && student.Medium != null)
            {
                return student.Medium.MediumName;
            }
            return "N.A.";
        }

        protected object GetClass(object dataItem)
        {
            var student = dataItem as Student;
            if (student != null && student.Class1 != null)
            {
                return student.Class1.ClassName;
            }
            return "N.A.";
        }

        protected object GetSection(object dataItem)
        {
            var student = dataItem as Student;
            if (student != null && student.Section != null)
            {
                return student.Section.SectionName;
            }
            return "N.A.";
        }

        protected void GvStudentDataBind(object sender, EventArgs e)
        {
            GvStudent.DataBind();
        }

        protected void GvStudentRowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Delete"))
            {
                PageDataService.DeleteStudentAdoNet(Convert.ToInt32(e.CommandArgument));
                Response.Redirect(Request.RawUrl, false);
            }
            else if (e.CommandArgument.Equals("Select"))
            {
                lblFeeInformation.Text = true.ToString(CultureInfo.InvariantCulture);
                lblTransactionInformation.Text = false.ToString(CultureInfo.InstalledUICulture);
            }
            else if (e.CommandArgument.Equals("History"))
            {
                lblFeeInformation.Text = false.ToString(CultureInfo.InstalledUICulture);
                lblTransactionInformation.Text = true.ToString(CultureInfo.InvariantCulture);
            }
        }

        protected void GvStudentSelectedIndexChange(object sender, EventArgs e)
        {
            Session[SessionVariables.StudentSelectedToUpdateInAccountMaintenance] = GvStudent.SelectedValue.ToString();
            PopulateStudentDetails(GvStudent.SelectedValue.ToString());
        }

        #endregion

        #region Private Methods

        private void PopulateStudentDetails(string studentId)
        {

            var student = PageDataService.GetStudentAdoNet(Convert.ToInt32(studentId));
            var currentAcademicYear = PageDataService.GetActiveAcademicYearAdoNet();

            if (student != null && currentAcademicYear != null)
            {
                hdnAccademicYearId.Value = Convert.ToString(currentAcademicYear.AcademicYearId);
                var feeMaster = PageDataService.GetFeeMasterByMediumIdAndClassIdAndAcademicYearIdAdoNet(student.MediumId,
                                                                                                  student.Class,
                                                                                                  currentAcademicYear.
                                                                                                      AcademicYearId);
                var studentAccount = AddAccountForCurrentAcademicYearForStuddentIfNotPresent(currentAcademicYear,
                                                                                             student);
                PopulateStudentAccountDetails(studentAccount, feeMaster, student, currentAcademicYear);
            }
        }

        private Account AddAccountForCurrentAcademicYearForStuddentIfNotPresent(AcademicYear currentAcademicYear,
                                                                                Student student)
        {
            var previousAcademicYear =
                PageDataService.GetAcademicYearByStartYearAdoNet(currentAcademicYear.AcademicYearStart.Year - 1);
            var studentAccount = PageDataService.GetAccountByStudentIdAndAcademicYearIdAdoNet(student.StudentId,
                                                                                        currentAcademicYear.
                                                                                            AcademicYearId);


            if (previousAcademicYear != null && studentAccount == null)
            {
                var studentPreviousYearAccount =
                    PageDataService.GetAccountByStudentIdAndAcademicYearIdAdoNet(student.StudentId,
                                                                           previousAcademicYear.
                                                                               AcademicYearId);
                if (studentPreviousYearAccount != null)
                {
                    var transactionDetailListOfPreviousYear =
                        PageDataService.GetAllActiveTransactionDetailsByStudentIdByAccountIdByAcademicYearIdAdoNet(
                            student.StudentId, studentPreviousYearAccount.AccountId, previousAcademicYear.AcademicYearId);
                    if (transactionDetailListOfPreviousYear != null && transactionDetailListOfPreviousYear.Count > 0)
                    {
                        var totalAmountPaid = transactionDetailListOfPreviousYear.Aggregate(0,
                                                                                            (current, transactionDetail)
                                                                                            =>
                                                                                            current +
                                                                                            Convert.ToInt32(
                                                                                                transactionDetail.
                                                                                                    AmountPaid));
                        var previousYearFee = PageDataService.GetFeeMasterByMediumIdAndClassIdAndAcademicYearIdAdoNet(
                            studentPreviousYearAccount.MediumId, studentPreviousYearAccount.ClassId,
                            previousAcademicYear.AcademicYearId);
                        var scholarShipDetailsOfPreviousYear =
                            PageDataService.GetScholarShipDetailsByStudentIdAndAcademicYearIdAdoNet(student.StudentId,
                                                                                              previousAcademicYear.
                                                                                                  AcademicYearId);
                        var scholarShipToatlAmountSanctioned = scholarShipDetailsOfPreviousYear.Aggregate(0,
                                                                                                          (current,
                                                                                                           scholarShipDetail)
                                                                                                          =>
                                                                                                          current +
                                                                                                          Convert.
                                                                                                              ToInt32(
                                                                                                                  scholarShipDetail
                                                                                                                      .
                                                                                                                      AmountSanctioned));

                        var carryFarwardFee = (Convert.ToInt32(studentPreviousYearAccount.CarryFarwordFee) +
                                               Convert.ToInt32(previousYearFee.Fee)) -
                                              (Convert.ToInt32(scholarShipToatlAmountSanctioned) + totalAmountPaid);


                        PageDataService.AddAcoountByStudentIdByAcademicYearIdByClassIdByMediumIdByCarryFarwordFeeAdoNet(
                            student.StudentId, currentAcademicYear.AcademicYearId, student.Class, student.MediumId,
                            Convert.ToInt32(carryFarwardFee));

                    }
                }
                else
                {
                    PageDataService.AddAcoountByStudentIdByAcademicYearIdByClassIdByMediumIdByCarryFarwordFeeAdoNet(
                        student.StudentId, currentAcademicYear.AcademicYearId, student.Class, student.MediumId, 0);
                }

            }
            else if (previousAcademicYear == null && studentAccount == null)
            {
                PageDataService.AddAcoountByStudentIdByAcademicYearIdByClassIdByMediumIdByCarryFarwordFeeAdoNet(
                    student.StudentId, currentAcademicYear.AcademicYearId, student.Class, student.MediumId, 0);
            }
            studentAccount = PageDataService.GetAccountByStudentIdAndAcademicYearIdAdoNet(student.StudentId,
                                                                                    currentAcademicYear.
                                                                                        AcademicYearId);
            return studentAccount;
        }

        private void PopulateStudentAccountDetails(Account studentAccount, FeeMaster feeMaster, Student student,
                                                   AcademicYear currentAcademicYear)
        {
            
            if (lblStudentNameSelected != null && lblStudentmName != null && lblStudentfName != null &&
                lblStudentcName != null
                && lblStudentsName != null && lblStudentMediumName != null && lblStudentFeeDue != null
                && txtStudentDiscount != null && lblStudentCarryFarwordFee != null &&
                lblStuddentCurrentYearFee != null && lblStudentCurrentYearFeePaid != null &&
                lblCurrentAcademicYear != null
                && studentAccount != null && feeMaster != null)
            {
                var scholarShipToatlAmountSanctioned = 0;
                var scholarShipDetailsOfCurrentYear =
                    PageDataService.GetScholarShipDetailsByStudentIdAndAcademicYearIdAdoNet(student.StudentId,
                                                                                      currentAcademicYear.
                                                                                          AcademicYearId);
                scholarShipToatlAmountSanctioned = scholarShipDetailsOfCurrentYear.Aggregate(0,
                                                                                             (current, scholarShipDetail)
                                                                                             =>
                                                                                             current +
                                                                                             Convert.ToInt32(
                                                                                                 scholarShipDetail.
                                                                                                     AmountSanctioned));

                var transactionDetailList = PageDataService.
                    GetAllActiveTransactionDetailsByStudentIdByAccountIdByAcademicYearIdAdoNet
                    (student.StudentId, studentAccount.AccountId, currentAcademicYear.AcademicYearId);
                lblStudentFeeDue.Text =
                    Convert.ToString(Convert.ToInt32(feeMaster.Fee) + Convert.ToInt32(studentAccount.CarryFarwordFee) -
                                     (Convert.ToInt32(studentAccount.Discount) + scholarShipToatlAmountSanctioned));
                var dueAmount = Convert.ToInt32(feeMaster.Fee) + Convert.ToInt32(studentAccount.CarryFarwordFee) -
                                (Convert.ToInt32(studentAccount.Discount) + scholarShipToatlAmountSanctioned);
                if (transactionDetailList != null && transactionDetailList.Count > 0)
                {


                    var totalAmountPaid = transactionDetailList.Aggregate(0,
                                                                          (current, transactionDetail) =>
                                                                          current +
                                                                          Convert.ToInt32(transactionDetail.AmountPaid));
                    var feeDue = (Convert.ToInt32(feeMaster.Fee) + Convert.ToInt32(studentAccount.CarryFarwordFee) -
                                  (totalAmountPaid + Convert.ToInt32(studentAccount.Discount) +
                                   Convert.ToInt32(scholarShipToatlAmountSanctioned)));
                    dueAmount = feeDue;
                    btnSubmit.Enabled = txtStudentCurrentFee.Enabled = feeDue > 0;
                    lblStudentMessage.Visible = feeDue <= 0;
                    lblStudentFeeDue.Text = Convert.ToString(feeDue);
                }
                hdnStudentId.Value = Convert.ToString(student.StudentId);
                hdnAccountId.Value = Convert.ToString(studentAccount.AccountId);
                ViewState["MinimumValue"] = (dueAmount <= 0) ? "0" : "1";
                ViewState["MaximumValue"] = dueAmount <= 0 ? Convert.ToString(1) : Convert.ToString(dueAmount);
                ViewState["ErrorMessage"] = "Enter amount between " + rngFee.MinimumValue + "-" + Convert.ToString(dueAmount);
                lblStudentNameSelected.Text = student.StudentName;
                lblStudentfName.Text = student.FatherName;
                lblStudentmName.Text = student.MotherName;
                lblStudentcName.Text = student.Class1.ClassName;
                lblStudentsName.Text = student.Section.SectionName;
                lblStudentMediumName.Text = student.Medium.MediumName;
                lblStudentCarryFarwordFee.Text = Convert.ToString(studentAccount.CarryFarwordFee);
                lblStuddentCurrentYearFee.Text = Convert.ToString(feeMaster.Fee);
                lblStudentCurrentYearFeePaid.Text = studentAccount.FeePaid != null
                                                        ? Convert.ToString(studentAccount.FeePaid)
                                                        : "-";
                lblCurrentAcademicYear.Text = currentAcademicYear.AcademicYearStart.ToString("dd/MM/yyyy") + " - " +
                                              currentAcademicYear.AcademicYearEnd.ToString("dd/MM/yyyy");
                lblTotalScholarShipAmountForStudent.Text = Convert.ToString(scholarShipToatlAmountSanctioned);
                txtStudentDiscount.Text = studentAccount.Discount == null
                                              ? "0"
                                              : Convert.ToString(studentAccount.Discount);
            }
        }

        protected void AddFeeDetailsOfStudent(object sender, EventArgs e)
        {
            Page.Validate("rngCurrentGroup");
       //     Page.Validate();
            if(!Page.IsValid)
                return;
            if (Session[SessionVariables.UserIdInSession] != null &&
                Session[SessionVariables.StudentSelectedToUpdateInAccountMaintenance] != null)
            {
                var currentlyLoggedInUser =
                    PageDataService.GetUserByIdInAdoNet(Convert.ToInt32(Session[SessionVariables.UserIdInSession].ToString()));

                var isAdmin =
                    PageDataService.IsUserAdminEntityFrameWork(currentlyLoggedInUser.UserId);

                PageDataService.AddTransactionDetailAdoNet(Convert.ToInt32(hdnAccountId.Value),
                                                     Convert.ToInt32(hdnStudentId.Value),
                                                     Convert.ToInt32(txtStudentCurrentFee.Text.Trim()),
                                                     Convert.ToInt32(
                                                         Session[SessionVariables.UserIdInSession].ToString()), isAdmin,
                                                     Convert.ToInt32(hdnAccademicYearId.Value));
                if (isAdmin)
                {
                    PageDataService.UpdateFeePaidForAccountByAccountIdAdoNet(Convert.ToInt32(hdnAccountId.Value),
                                                                       Convert.ToInt32(txtStudentCurrentFee.Text.Trim()),
                                                                       Convert.ToInt32(txtStudentDiscount.Text));
                }
                Response.Redirect(Request.RawUrl, false);

            }
        }

        protected void GvGeneratePDF(object sender, EventArgs e)
        {
            var transactionDetail =
                PageDataService.GetTransactionDetailByTransactionDetailIdAdoNet(
                    Convert.ToInt32(GvTransactionDetail.SelectedValue.ToString()));
            var pdfHelpers = new PdfHelpers();
            if (Convert.ToBoolean(transactionDetail.Approved))
            {
                var filePathWithName = pdfHelpers.CreatePdf(transactionDetail);

                Response.ContentType = "application/pdf";

                Response.AddHeader("content-disposition", "attachment; filename=" + filePathWithName);

                FileStream sourceFile = new FileStream(Server.MapPath(Constants.AccounStudentFeePdf) + filePathWithName,
                                                       FileMode.Open);

                long FileSize;

                FileSize = sourceFile.Length;

                byte[] getContent = new byte[(int) FileSize];

                sourceFile.Read(getContent, 0, (int) sourceFile.Length);

                sourceFile.Close();

                Response.BinaryWrite(getContent);


            }

        }

        protected object GetStatus(object dataItem)
        {
            var transaction = (TransactionDetail) dataItem;
            if (transaction != null)
            {
                if (transaction.Approved == false && transaction.Rejected == false)
                {
                    return "Pending";
                }
                if (transaction.Approved == true)
                {
                    return "Approved";
                }
                if (transaction.Rejected == true)
                {
                    return "Rejected";
                }
            }
            return "N.A.";
        }

        protected void GvTransactionDetailRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                var lnkGenerateButton =e.Row.FindControl("lnkbtnGeneratePDF") as LinkButton;
                var lblApproved = e.Row.FindControl("lblApproved") as Label;
                var lblRejected = e.Row.FindControl("lblRejected") as Label;
                if (lnkGenerateButton != null && lblRejected != null && lblApproved != null)
                {
                    lnkGenerateButton.Enabled = (lblApproved.Text.Equals(true.ToString(CultureInfo.InvariantCulture)));
                }
            }

        }
        protected void RngCurrentFeePreRender(object sender, EventArgs e)
        {
            rngFee.MinimumValue = ViewState["MinimumValue"] != null ? ViewState["MinimumValue"].ToString() : "0";
            rngFee.MaximumValue = ViewState["MaximumValue"] != null ? ViewState["MaximumValue"].ToString() : "1";
            rngFee.ErrorMessage = ViewState["ErrorMessage"] != null ? ViewState["ErrorMessage"].ToString() : "--";
           
        }

        protected void DownloadFeePendingList(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.ClearHeaders();
            HttpContext.Current.Response.ClearContent();
            HttpContext.Current.Response.AddHeader(ContentDisposition, AttachmentFileName + "FeePendingStudentsList_" + (ddlMediumForGridView.SelectedItem.Text) + "_" + ddlClassForGridView.SelectedItem.Text + ".csv");
            HttpContext.Current.Response.ContentType = ContentTypeTextCsv;
            HttpContext.Current.Response.AddHeader(Pragma, Public);
            HttpContext.Current.Response.Output.Write(PopulateFeePendingDataInStringBuilder());
            HttpContext.Current.Response.Flush();
            HttpContext.Current.Response.End();
        }

        #endregion

        #region Private Methods

        private StringBuilder PopulateFeePendingDataInStringBuilder()
        {
            var stringBuilder = new StringBuilder();
            
            stringBuilder.Append(DoubleQuote + "Student Name" + DoubleQuoteAndComa);
            stringBuilder.Append(DoubleQuote + "Class Name" + DoubleQuoteAndComa);
            stringBuilder.Append(DoubleQuote + "Section Name" + DoubleQuoteAndComa);
            stringBuilder.Append(DoubleQuote + "Medium Name" + DoubleQuoteAndComa);
            stringBuilder.Append(DoubleQuote + "Academic Year" + DoubleQuoteAndComa);
            stringBuilder.Append(DoubleQuote + "Fee Paid" + DoubleQuoteAndComa);
            stringBuilder.Append(DoubleQuote + "Fee Due" + DoubleQuoteAndComa);
            stringBuilder.AppendLine();
            
            var accounts = PageDataService.GetFeePendingDetailsByMediumIdByClassIdAdoNet(Convert.ToInt32(ddlMediumForGridView.SelectedValue), Convert.ToInt32(ddlClassForGridView.SelectedValue));
            var feeDetails =
                PageDataService.GetCurrentYearFeeMasterByMediumIdAndClassIdAdoNet(
                    Convert.ToInt32(ddlMediumForGridView.SelectedValue),
                    Convert.ToInt32(ddlClassForGridView.SelectedValue));
            var currentAcademicYear = PageDataService.GetActiveAcademicYearAdoNet();
            foreach (var account in accounts)
            {
                var scholarShipDetailsOfCurrentYear =
                   PageDataService.GetScholarShipDetailsByStudentIdAndAcademicYearIdAdoNet(account.Student.StudentId,
                                                                                     currentAcademicYear.
                                                                                         AcademicYearId);
              var  scholarShipToatlAmountSanctioned = scholarShipDetailsOfCurrentYear.Aggregate(0,
                                                                                             (current, scholarShipDetail)
                                                                                             =>
                                                                                             current +
                                                                                             Convert.ToInt32(
                                                                                                 scholarShipDetail.
                                                                                                     AmountSanctioned));
              var feePending =Convert.ToInt32(feeDetails.Fee)- Convert.ToInt32(account.FeePaid) - Convert.ToInt32(account.CarryFarwordFee) - Convert.ToInt32(scholarShipToatlAmountSanctioned);
                if(feePending>0)
                {
                    stringBuilder.Append(DoubleQuote + account.Student.StudentName+ DoubleQuoteAndComa);
                    stringBuilder.Append(DoubleQuote + account.Class.ClassName+ DoubleQuoteAndComa);
                    stringBuilder.Append(DoubleQuote + account.Student.Section.SectionName + DoubleQuoteAndComa);
                    stringBuilder.Append(DoubleQuote +account.Medium.MediumName+ DoubleQuoteAndComa);
                    stringBuilder.Append(DoubleQuote + account.AcademicYear.AcademicYearStart + "-" + account.AcademicYear.AcademicYearEnd + DoubleQuoteAndComa);
                    stringBuilder.Append(DoubleQuote + Convert.ToInt32(account.FeePaid)  + DoubleQuoteAndComa);
                    stringBuilder.Append(DoubleQuote + feePending + DoubleQuoteAndComa);
                    stringBuilder.AppendLine();
                }
            }

            return stringBuilder;
        }

        #endregion

        protected void DownloadFeePendingListT(object sender, EventArgs e)
        {
            throw new NotImplementedException();
        }
    }
}
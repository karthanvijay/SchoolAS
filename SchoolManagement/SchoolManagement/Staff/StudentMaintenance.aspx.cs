using System;
using System.Globalization;
using System.Web.UI.WebControls;
using DataLib;
using SchoolManagement.Helpers;

namespace SchoolManagement.Staff
{
    public partial class StudentCreation : System.Web.UI.Page
    {
        public PageDataService PageDataService = new PageDataService(); 
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session[SessionVariables.UserIdInSession] == null)
            {
                Response.Redirect("~/AccountManagement/Logout.aspx");
            }
        }

        protected void CreateStudent(object sender, EventArgs e)
        {
            int addressId = 0;
            if(txtStudentName!=null && txtMotherName!=null && txtFatherName!=null && txtAge!=null
                && ddlGender!=null && ddlClassInAddStudent!=null && ddlSectionInAddStudent!=null
                && ddlMediumInAddStudent!=null && ddlCastInAddStudent!=null && txtAddressLineOne!=null
                && txtVillage!=null && txtDistrict!=null && txtPincode!=null)
            {
                if(!String.IsNullOrEmpty(txtStudentName.Text.Trim()) && !String.IsNullOrEmpty(txtMotherName.Text.Trim()) && !String.IsNullOrEmpty(txtAge.Text.Trim())
                    && !String.IsNullOrEmpty(txtFatherName.Text.Trim()) && !String.IsNullOrEmpty(txtAddressLineOne.Text.Trim()) 
                    && !String.IsNullOrEmpty(txtVillage.Text.Trim()) && !String.IsNullOrEmpty(txtDistrict.Text.Trim())
                    && !String.IsNullOrEmpty(txtPincode.Text.Trim()))
                {
                    var address = PageDataService.AddAddressByAdoNet(txtAddressLineOne.Text, txtVillage.Text, txtDistrict.Text,
                                                      txtPincode.Text);
                    if (address != null)
                    {
                        addressId = address.AddressId;
                    }
                    if(addressId!=0)
                    {
                        PageDataService.AddStudentAdoNet(txtStudentName.Text.Trim(), txtMotherName.Text.Trim(),
                                                   txtFatherName.Text.Trim(), Convert.ToInt32(txtAge.Text.Trim()),
                                                   ddlGender.SelectedValue,
                                                   Convert.ToInt32(ddlClassInAddStudent.SelectedValue),
                                                   Convert.ToInt32(ddlSectionInAddStudent.SelectedValue),
                                                   Convert.ToInt32(ddlCastInAddStudent.SelectedValue),
                                                   Convert.ToInt32(ddlMediumInAddStudent.SelectedValue), addressId);
                    }
                }
            }
            Response.Redirect(Request.RawUrl,false);
        }

        protected object GetMedium(object dataItem)
        {
            var student = dataItem as Student;
            if (student != null && student.Medium!=null)
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
      
        }

        private void PopulateStudentDetails(string studentId)
        {
           var student= PageDataService.GetStudentAdoNet(Convert.ToInt32(studentId));
           
            if(student!=null)
            {
                if (txtStudentName != null && txtMotherName != null && txtFatherName != null && txtAge != null
                    && ddlGender != null && ddlClassInAddStudent != null && ddlSectionInAddStudent != null
                    && ddlMediumInAddStudent != null && ddlCastInAddStudent != null && txtAddressLineOne != null
                    && txtVillage != null && txtDistrict != null && txtPincode != null)
                {
                    txtStudentName.Text =student.StudentName;
                    txtFatherName.Text =student.FatherName;
                    txtMotherName.Text =student.MotherName;
                    txtAge.Text =Convert.ToString(student.Age);
                    txtAddressLineOne.Text =student.Address.AdrressLineOne;
                    txtVillage.Text =student.Address.Village;
                    txtDistrict.Text =student.Address.District;
                    txtPincode.Text =student.Address.Pincode;
                    ddlGender.SelectedValue =student.Gender;
                    ddlClassInAddStudent.SelectedValue =Convert.ToString(student.Class);
                    ddlSectionInAddStudent.SelectedValue =Convert.ToString(student.SectionId);
                    ddlCastInAddStudent.SelectedValue =Convert.ToString(student.CastId);
                    ddlMediumInAddStudent.SelectedValue = Convert.ToString(student.MediumId);
                }
            }
        }

        protected void GvStudentSelectedIndexChange(object sender, EventArgs e)
        {
            lblShowPopup.Text = true.ToString(CultureInfo.InvariantCulture);
            PopulateStudentDetails(GvStudent.SelectedValue.ToString());
            Session[SessionVariables.StudentSelectedToUpdate] = GvStudent.SelectedValue.ToString();
            btnUpdateStudent.Visible = true;
            btnCreateStudent.Visible = false;
        }

        protected void UpdateStudent(object sender, EventArgs e)
        {

            int addressId = 0,studentId=0;
            if (Session[SessionVariables.StudentSelectedToUpdate] != null)
            {
               var student = PageDataService.GetStudentAdoNet(Convert.ToInt32(Session[SessionVariables.StudentSelectedToUpdate].ToString()));
               if (student != null)
               {
                   studentId = student.StudentId;
                   addressId = student.AddressId;
               }
            }
            if (txtStudentName != null && txtMotherName != null && txtFatherName != null && txtAge != null
                && ddlGender != null && ddlClassInAddStudent != null && ddlSectionInAddStudent != null
                && ddlMediumInAddStudent != null && ddlCastInAddStudent != null && txtAddressLineOne != null
                && txtVillage != null && txtDistrict != null && txtPincode != null)
            {
                if (!String.IsNullOrEmpty(txtStudentName.Text.Trim()) && !String.IsNullOrEmpty(txtMotherName.Text.Trim()) && !String.IsNullOrEmpty(txtAge.Text.Trim())
                    && !String.IsNullOrEmpty(txtFatherName.Text.Trim()) && !String.IsNullOrEmpty(txtAddressLineOne.Text.Trim())
                    && !String.IsNullOrEmpty(txtVillage.Text.Trim()) && !String.IsNullOrEmpty(txtDistrict.Text.Trim())
                    && !String.IsNullOrEmpty(txtPincode.Text.Trim()))
                {
                    if (addressId != 0)
                    {
                        PageDataService.UpdateAddressInAdoNet(addressId, txtAddressLineOne.Text, txtVillage.Text,
                                                      txtDistrict.Text,
                                                      txtPincode.Text);
                    }
                    if (studentId != 0)
                    {
                        PageDataService.UpdateStudentAdoNet(studentId,txtStudentName.Text.Trim(), txtMotherName.Text.Trim(),
                                                   txtFatherName.Text.Trim(), Convert.ToInt32(txtAge.Text.Trim()),
                                                   ddlGender.SelectedValue,
                                                   Convert.ToInt32(ddlClassInAddStudent.SelectedValue),
                                                   Convert.ToInt32(ddlSectionInAddStudent.SelectedValue),
                                                   Convert.ToInt32(ddlCastInAddStudent.SelectedValue),
                                                   Convert.ToInt32(ddlMediumInAddStudent.SelectedValue));
                        PageDataService.UpdateCurrentYearAccountAdoNet(studentId, Convert.ToInt32(ddlClassInAddStudent.SelectedValue),
                                                      Convert.ToInt32(ddlMediumInAddStudent.SelectedValue));
                    }
                }
            }
            Session.Remove(SessionVariables.StudentSelectedToUpdate);
            Response.Redirect(Request.RawUrl, false);
        }

        protected void ShowPopupToAddUser(object sender, EventArgs e)
        {
            lblShowPopup.Text = true.ToString(CultureInfo.InvariantCulture);
            btnUpdateStudent.Visible = false;
            btnCreateStudent.Visible = true;
        }
    }
}
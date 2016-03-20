using System;
using System.Web.UI.WebControls;
using DataLib;

namespace SchoolManagement.Helpers
{
    public class HelperFunctions
    {
        public PageDataService PageDataService = new PageDataService(); 
      
        public ListItemCollection AcademmicYearList()
        {
            var academicYearList = new ListItemCollection();
            var academicYears = PageDataService.GetAllAcademicYearsAdoNet();
            foreach (var academicYear in academicYears)
            {
                academicYearList.Add(new ListItem(
                     academicYear.AcademicYearStart.ToString("dd/MM/yyyy") +"--"+
                     academicYear.AcademicYearEnd.ToString("dd/MM/yyyy"), Convert.ToString(academicYear.AcademicYearId)));

            }
            return academicYearList;
        }
        public ListItemCollection StudentDetails(int mediumId, int classId, int sectionId)
        {
            var studentList = new ListItemCollection();
            var activeStudents = PageDataService.GetActiveStudentsAdoNet(mediumId,sectionId,classId);
            foreach (var student in activeStudents)
            {

                studentList.Add(new ListItem(
                     student.StudentName+ "(Mother Name: " +
                     student.MotherName + " , Father Name: " + student.FatherName + ")", Convert.ToString(student.StudentId)));

            }
            return studentList;
        } 
    }
}
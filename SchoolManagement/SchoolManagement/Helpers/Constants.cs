using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace SchoolManagement.Helpers
{
    public class Constants
    {
        private const string AccounStudentFeePdfKey = "Account.StudentFee.Pdf";
        public static string AccounStudentFeePdf
        {
            get
            {
                object obj = ConfigurationManager.AppSettings[AccounStudentFeePdfKey];
                return obj == null ? string.Empty : obj as string;
            }
        }
        private const string SchoolNameKey = "School.Name";
        public static string SchoolName
        {
            get
            {
                object obj = ConfigurationManager.AppSettings[SchoolNameKey];
                return obj == null ? string.Empty : obj as string;
            }
        }
        private const string SchoolAddressKey = "School.Address";
        public static string SchoolAddress
        {
            get
            {
                object obj = ConfigurationManager.AppSettings[SchoolAddressKey];
                return obj == null ? string.Empty : obj as string;
            }
        }
        private const string SchoolContactNumbersKey = "School.Contact.Numbers";
        public static string SchoolContactNumbers
        {
            get
            {
                object obj = ConfigurationManager.AppSettings[SchoolContactNumbersKey];
                return obj == null ? string.Empty : obj as string;
            }
        }
    }
}
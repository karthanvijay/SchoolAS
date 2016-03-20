using System;
using System.Web.UI.WebControls;
using DataLib;
using SchoolManagement.Helpers;

namespace SchoolManagement
{
    public partial class Login : System.Web.UI.Page
    {
        #region Variables

        public PageDataService PageDataService = new PageDataService();

        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void OnClickForUserSignIn(object sender, EventArgs e)
        {
            var userEmail = LoginUser.FindControl("UserName") as TextBox;
            var userPassword = LoginUser.FindControl("Password") as TextBox;
            if (userEmail != null && userPassword!=null)
            {
                var user = PageDataService.GetActiiveUserByUserEmailInAdoNet(userEmail.Text.Trim());
                if (user != null && user.UserPassword.Equals(userPassword.Text))
                {
                    Session[SessionVariables.UserIdInSession] = user.UserId;
                    Response.Redirect("~/Staff/AccountMaintenance.aspx", true);
                }
            }
          
        }
    }
}

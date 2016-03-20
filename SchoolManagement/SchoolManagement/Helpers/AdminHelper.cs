using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using DataLib;

namespace SchoolManagement.Helpers
{
    public class AdminHelper:Page
    {
        #region Variables

        public PageDataService PageDataService = new PageDataService();

        #endregion

        protected override void OnInit(EventArgs e)
        {
            if(HttpContext.Current.Session[SessionVariables.UserIdInSession]!=null )
            {
                var currentlyLoggedInUser =
                   PageDataService.GetUserByIdInAdoNet(Convert.ToInt32(Session[SessionVariables.UserIdInSession].ToString()));
                var isAdmin =
                    PageDataService.IsUserAdminEntityFrameWork(currentlyLoggedInUser.UserId);
                if(!isAdmin)
                    Response.Redirect("/AccountManagement/Logout.aspx",false);
                
            }
        }
    }
}
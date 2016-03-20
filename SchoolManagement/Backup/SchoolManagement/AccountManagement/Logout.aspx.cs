using System;

namespace SchoolManagement.AccountManagement
{
    
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Clear();
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("/Login.aspx");
        }
    }
}
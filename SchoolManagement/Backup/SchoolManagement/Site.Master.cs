using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using DataLib;
using SchoolManagement.Helpers;
namespace SchoolManagement
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        public PageDataService PageDataService = new PageDataService();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session[SessionVariables.UserIdInSession] == null)
            {
                Response.Redirect("~/AccountManagement/Logout.aspx");
            }
            NavigationMenu.Items.Clear();
            if (Session[SessionVariables.UserIdInSession] != null)
            {
                var user = PageDataService.GetUserByIdInAdoNet(Convert.ToInt32(Session[SessionVariables.UserIdInSession].ToString()));
                if (user != null)
                {
                   User userGroups = PageDataService.GetUserGroupAssociationsByUserIdByAdoNet(user.UserId);
                    foreach (var userGroupAssociation in userGroups.UserGroupAssociations)
                    {
                        if (userGroupAssociation.Group.GroupCode.Equals("Admin"))
                        {
                            AddMenuItems(userGroupAssociation.Group.GroupCode);
                            break;
                        }
                        if (userGroupAssociation.Group.GroupCode.Equals("Staff"))
                        {
                            AddMenuItems(userGroupAssociation.Group.GroupCode);
                            break;
                        }
                    }
                }
            }

        }

        private void AddMenuItems(string groupCode)
        {
            var accountMaintenance = new MenuItem { NavigateUrl = "/Staff/AccountMaintenance.aspx", Text = "Account Maintenance" };
            NavigationMenu.Items.Add(accountMaintenance);
            var scholarShipMaintenance = new MenuItem { NavigateUrl = "/Staff/ScholarShipMaintenance.aspx", Text = "ScholarShip Maintenance" };
            NavigationMenu.Items.Add(scholarShipMaintenance);
            var studentMaintenance = new MenuItem { NavigateUrl = "/Staff/StudentMaintenance.aspx", Text = "Student Maintenance" };
            NavigationMenu.Items.Add(studentMaintenance);
            if (groupCode.Equals("Admin"))
            {
                
                var castMaintenance = new MenuItem { NavigateUrl = "/Admin/CastMaintenance.aspx", Text = "Cast Maintenance" };
                NavigationMenu.Items.Add(castMaintenance);
                var classMaintenance = new MenuItem { NavigateUrl = "/Admin/ClassMaintenance.aspx", Text = "Class Maintenance" };
                NavigationMenu.Items.Add(classMaintenance);
                var feeApprovals = new MenuItem { NavigateUrl = "/Admin/FeeApprovals.aspx", Text = "Fee Approvals" };
                NavigationMenu.Items.Add(feeApprovals);
                var feeMaintenance = new MenuItem { NavigateUrl = "/Admin/FeeMaintenance.aspx", Text = "Fee Maintenance" };
                NavigationMenu.Items.Add(feeMaintenance);
                var groupMaintenance = new MenuItem { NavigateUrl = "/Admin/GroupMaintenance.aspx", Text = "Group Maintenance" };
                NavigationMenu.Items.Add(groupMaintenance);
                var mediumMaintenance = new MenuItem { NavigateUrl = "/Admin/MediumMaintenance.aspx", Text = "Medium Maintenance" };
                NavigationMenu.Items.Add(mediumMaintenance);
                var sectionMaintenance = new MenuItem { NavigateUrl = "/Admin/SectionMaintenance.aspx", Text = "Section Maintenance" };
                NavigationMenu.Items.Add(sectionMaintenance);
                var examTypeMaintenance = new MenuItem { NavigateUrl = "/Admin/ExamTypeMaintenance.aspx", Text = "ExamType Maintenance" };
                NavigationMenu.Items.Add(examTypeMaintenance);
                var classSubjectsMaintenance = new MenuItem { NavigateUrl = "/Admin/ClassSubjectsMaintenance.aspx", Text = "ClassSubjects Maintenance" };
                NavigationMenu.Items.Add(classSubjectsMaintenance);
               
                var subjectTypeMaintenance = new MenuItem { NavigateUrl = "/Admin/SubjectTypeMaintenance.aspx", Text = "SubjectType Maintenance" };
                NavigationMenu.Items.Add(subjectTypeMaintenance);
 

                
                var userMaintenance = new MenuItem { NavigateUrl = "/Admin/UserMaintenance.aspx", Text = "User Maintenance" };
                NavigationMenu.Items.Add(userMaintenance);

            }
        }
    }
}

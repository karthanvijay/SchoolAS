using System;
using System.Web.UI.WebControls;
using DataLib;
using SchoolManagement.Helpers;

namespace SchoolManagement.Admin
{
    public partial class FeeMaintenance : AdminHelper
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session[SessionVariables.UserIdInSession] == null)
            {
                Response.Redirect("~/AccountManagement/Logout.aspx");
            }
        }

        protected void GvFeeMasterRowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Insert"))
            {
                Page.Validate("addFee");
                 if(!Page.IsValid)
                     return;
                var ddlclass = GvFeeMaster.FooterRow.FindControl("ddlClass") as DropDownList;
                var ddlMedium = GvFeeMaster.FooterRow.FindControl("ddlMedium") as DropDownList;
                var txtFeeName = GvFeeMaster.FooterRow.FindControl("ftrFeeName") as TextBox;
                var currentAcademicYear = PageDataService.GetActiveAcademicYearAdoNet();

                if (ddlclass != null && ddlMedium != null && txtFeeName != null && currentAcademicYear!=null)
                {
                    if (PageDataService.GetFeeMasterByMediumIdAndClassIdAndAcademicYearIdAdoNet(Convert.ToInt32(ddlMedium.SelectedValue),
                                                                         Convert.ToInt32(ddlclass.SelectedValue), currentAcademicYear.AcademicYearId) !=
                        null)
                    {
                        lblError.Visible = true;
                    }
                    else
                    {
                        PageDataService.AddFeeMasterAdoNet(Convert.ToInt32(ddlMedium.SelectedValue),
                                                     Convert.ToInt32(ddlclass.SelectedValue),
                                                     Convert.ToInt32(txtFeeName.Text.Trim()),currentAcademicYear.AcademicYearId);
                        Response.Redirect(Request.RawUrl, false);
                    }
                }
            }
            else if (e.CommandName.Equals("Update"))
            {
                Page.Validate("editFee");
                EntityDataSourceFeeMasters.EnableUpdate = Page.IsValid;

                //var txtId = GvFeeMaster.Rows[GvFeeMaster.EditIndex].FindControl("txtId") as Label;
                //var txtFeeName = GvFeeMaster.Rows[GvFeeMaster.EditIndex].FindControl("txtFeeName") as TextBox;

                // if (txtId != null && txtFeeName != null)
                // {

                //     PageDataService.UpdateFeeMaster(Convert.ToInt32(txtId.Text),
                //                                     Convert.ToInt32(txtFeeName.Text.Trim()));
                   
                // }
            
            }
        }
    }
}
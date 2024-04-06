using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLayerApplicationsindhu;
using DataLayerApplication_sindhu;

namespace CourseManagementApplicationsindhu
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        CourseClass course = new CourseClass();
        CourseLogic blLogic = new CourseLogic();
        protected void Page_Load(object sender, EventArgs e)
        {
            loaddata();
        }
        public void loaddata()
        {
            CourseGrid.DataSource = blLogic.getEmployeeData();
            CourseGrid.DataBind();
            
        }
       
        
        protected void CourseGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = CourseGrid.Rows[e.RowIndex];
            Label lbl_cid = (Label)row.FindControl("lbl_cid");
            var CourseId = Convert.ToInt32(lbl_cid.Text);
            int rows = blLogic.DeleteData(CourseId);
            if (rows == 1)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Deleted Successfully')", true);

            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record not deleted')", true);
            }
            loaddata();
            clearFields();
        }
        protected void Insert_Data(object sender, EventArgs e)
        {
            if (rfvname.IsValid && rfvcode.IsValid )
            {
                course.CourseName = crname.Text;
                course.CourseCode = ccode.Text;
                course.Description = txtArea.InnerText;
                course.CourseStartDate = csdate.Text;
                int rows = blLogic.InsertData(course);
                if (rows == 1)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record inserted Successfully')", true);
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record not inserted')", true);
                }
                loaddata();
                clearFields();
            }
        }

        private void clearFields()
        {
            crname.Text = string.Empty;
            ccode.Text = string.Empty;
            txtArea.InnerText = string.Empty;
            csdate.Text = string.Empty;

        }
    }
}
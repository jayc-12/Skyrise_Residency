using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Data;

public partial class admin_facility_image : System.Web.UI.Page
{
    public residencyclass re = new residencyclass();

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();

        lblmsg.Enabled = false;

        if (!IsPostBack)
        {
            re.conopen();
            re.qry = "select * from facility_mstr";
            re.grid(re.qry);
            drpfactype.DataTextField = re.ds.Tables[0].Columns["facility_type"].ToString();
            drpfactype.DataValueField = re.ds.Tables[0].Columns["facilityid"].ToString();
            drpfactype.DataSource = re.ds.Tables[0];
            drpfactype.DataBind();
            re.conclose();

            drpfactype.Items.Insert(0, new ListItem("Select Facility", "0"));
        }
    }
    protected void btn_facimg_insert_Click(object sender, EventArgs e)
    {
        if (drpfactype.SelectedIndex == 0)
        {

            lblmsg.Text = "You must fill dropdowns";
        }
        else
        {
            lblmsg.Enabled = true;
            if (facpicupload.HasFile)
            {
                lblmsg.Text = "";
                String[] ext = { "image/jpg", "image/jpeg", "image/png", "image/jbmp", "image/gif" };
                if (ext.Contains(facpicupload.PostedFile.ContentType))
                {
                    lblmsg.Text = "";
                    facpicupload.SaveAs(Server.MapPath("~/facility_photos/") + Path.GetFileName(facpicupload.FileName));
                    String link = "~/facility_photos/" + Path.GetFileName(facpicupload.FileName);
                    facphoto.Visible = true;
                    facphoto.ImageUrl = facpicupload.FileName;
                    re.conopen();
                    re.qry = "insert into facility_album values('" + drpfactype.SelectedItem.Value + "','" + link + "')";
                    re.uid();
                    lblmsg.Text = "you uploaded image successfully.";
                    re.conclose();
                    Response.Redirect("facility_image.aspx");
                }
                else
                {
                    lblmsg.Text = "Please select an image file only";
                }
            }
            else
            {
                lblmsg.Text = "Please select a file";
            }
        }
    }
}
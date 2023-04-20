using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Data;

public partial class admin_hall_album : System.Web.UI.Page
{
    public residencyclass re = new residencyclass();

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();

        if (!IsPostBack)
        {
            re.conopen();
            re.qry = "select * from hall_mstr";
            re.grid(re.qry);
            drphalltype.DataTextField = re.ds.Tables[0].Columns["halltype"].ToString();
            drphalltype.DataValueField = re.ds.Tables[0].Columns["hall_id"].ToString();
            drphalltype.DataSource = re.ds.Tables[0];
            drphalltype.DataBind();
            re.conclose();

            drphalltype.Items.Insert(0, new ListItem("Select HallType", "0"));
        }
    }
    protected void btn_albumn_insert_Click(object sender, EventArgs e)
    {
        if (drphalltype.SelectedIndex == 0)
        {

            lblalbum.Text = "You must fill dropdowns";
        }
        else
        {
            lblalbum.Enabled = true;
            if (hallpicupload.HasFile)
            {
                lblalbum.Text = "";
                String[] ext = { "image/jpg", "image/jpeg", "image/png", "image/jbmp", "image/gif" };
                if (ext.Contains(hallpicupload.PostedFile.ContentType))
                {
                    lblalbum.Text = "";
                    hallpicupload.SaveAs(Server.MapPath("~/hall_photos/") + Path.GetFileName(hallpicupload.FileName));
                    String link = "~/hall_photos/" + Path.GetFileName(hallpicupload.FileName);
                    imghallpho.Visible = true;
                    imghallpho.ImageUrl = hallpicupload.FileName;
                    re.conopen();
                    re.qry = "insert into hall_album values('" + drphalltype.SelectedItem.Value + "','" + link + "')";
                    re.uid();
                    re.clear(Page.Controls);
                    lblpicuplod.Text = "you uploaded image successfully.";
                    re.conclose();
                    Response.Redirect("hall_album.aspx");
                }
                else
                {
                    lblalbum.Text = "Please select an image file only";
                }
            }
            else
            {
                lblalbum.Text = "Please select a file";
            }
        }
    }
}
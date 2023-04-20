using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Data;

public partial class admin_Default : System.Web.UI.Page
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
            re.qry = "select * from event_mstr";
            re.grid(re.qry);
            drpeventname.DataTextField = re.ds.Tables[0].Columns["event_name"].ToString();
            drpeventname.DataValueField = re.ds.Tables[0].Columns["event_id"].ToString();
            drpeventname.DataSource = re.ds.Tables[0];
            drpeventname.DataBind();
            re.conclose();

            drpeventname.Items.Insert(0, new ListItem("Select Event", "0"));
        }
    }

    protected void btn_albumn_insert_Click(object sender, EventArgs e)
    {
        if (drpeventname.SelectedIndex == 0)
        {

            lblalbum.Text = "You must fill dropdowns";
        }
        else
        {
            lblalbum.Enabled = true;
            if (evntpicupload.HasFile)
            {
                lblalbum.Text = "";
                String[] ext = { "image/jpg", "image/jpeg", "image/png", "image/jbmp", "image/gif" };
                if (ext.Contains(evntpicupload.PostedFile.ContentType))
                {
                    lblalbum.Text = "";
                    evntpicupload.SaveAs(Server.MapPath("~/event_photos/") + Path.GetFileName( evntpicupload.FileName));
                    String  link = "~/event_photos/" + Path.GetFileName(evntpicupload.FileName);
                    imgevepho.Visible = true;
                    imgevepho.ImageUrl = evntpicupload.FileName;
                    re.conopen();
                    re.qry = "insert into event_album values('" + drpeventname.SelectedItem.Value + "','" + link  + "')";
                    re.uid();
                    re.clear(Page.Controls);
                    lblpicuplod.Text = "you uploaded image successfully.";
                    re.conclose();
                   Response.Redirect("event_album.aspx");
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
        
        
        
        
        //string path = Path.GetFileName(evntpicupload.FileName);
        //path = path.Replace(" ", "");
        //String filename1 = path;
        //evntpicupload.SaveAs(Server.MapPath("~/Photos/") + path);
        //lblalbum.Text = "Image Uploaded and Saved in Server Successfully";

    }
}
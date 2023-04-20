using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class user_facilityreview : System.Web.UI.Page
{
    public residencyclass re = new residencyclass();

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();


        if (Session["uname"] == null)
        {
            Response.Redirect("login.aspx");
        }

        lblmsg.Visible = false;

        if (!IsPostBack)
        {

            re.conopen();
            re.qry = "select * from facility_mstr";
            re.grid(re.qry);
            drpfacitype.DataTextField = re.ds.Tables[0].Columns["facility_type"].ToString();
            drpfacitype.DataValueField = re.ds.Tables[0].Columns["facilityid"].ToString();
            drpfacitype.DataSource = re.ds.Tables[0];
            drpfacitype.DataBind();
            re.conclose();

            drpfacitype.Items.Insert(0, new ListItem("Select Facility", "0"));
            re.conopen();
            re.qry = "select om.owner_name,f.flatno,t.tname,f.fid from owner_mstr as om,flat as f,tower as t where om.owner_id= "+ Session["uname"] + " and om.fid=f.fid and f.tid=t.tid";
            //re.qry = "select om.owner_name,f.flatno,t.tname,f.fid from owner_mstr as om,flat as f,tower as t where om.owner_id=" + Session["uname"] + " and om.fid=f.fid and f.tid=t.tid";
            re.grid(re.qry);
            lbltname.Text = re.ds.Tables[0].Rows[0][2].ToString();
            lblflatno.Text = re.ds.Tables[0].Rows[0][1].ToString();
            lblownname.Text = re.ds.Tables[0].Rows[0][0].ToString();
            lblfid.Text = re.ds.Tables[0].Rows[0][3].ToString();
            re.conclose();


        }
    
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        lblmsg.Visible = true;
        if (drpfacitype.SelectedIndex == 0)
        {
            lblmsg.Text = "You Must Fill Dropdowns.";
        }
        else
        {
            re.conopen();
            re.qry = "insert into facility_review(reviewtitle,reviewmsg,facilityid,fid,date) values('" + txtfacirevtitle.Text + "','" + txtfacirevmessage.Text + "','" + drpfacitype.SelectedItem.Value + "','" + lblfid.Text + "','" + DateTime.Now + "')";
            re.uid();
            lblmsg.Text = "you are recorded Facility Review information successfully.";
            re.clear(Page.Controls);
            re.conclose();
            Response.Redirect("facilityreview.aspx");
        }
    }
}
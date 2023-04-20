using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_feedback : System.Web.UI.Page
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
         lblmsg.Visible = false ;
        if(!IsPostBack)
        {
            re.conopen();
            re.qry = "select om.owner_name,f.flatno,t.tname,f.fid from owner_mstr as om,flat as f,tower as t where om.owner_id=" + Session["uname"] + " and om.fid=f.fid and f.tid=t.tid";
            re.grid(re.qry);
            lbltname.Text = re.ds.Tables[0].Rows[0][2].ToString();
            lblflatno.Text = re.ds.Tables[0].Rows[0][1].ToString();
            lblownname.Text = re.ds.Tables[0].Rows[0][0].ToString();
            lblfid.Text = re.ds.Tables[0].Rows[0][3].ToString();
            re.conclose();
        }
    }
    protected void btnfeedinsert_Click(object sender, EventArgs e)
    {
        lblmsg.Visible = true;
        GridView1.Visible = true;

        re.conopen();
        re.qry = "insert into feedback(fid,feedbacktitle,feedbackmsg,date) values('" + lblfid.Text + "','" + txtfeedtitle.Text + "','" + txtfeedmessage.Text + "','" + DateTime.Now + "')";
        re.uid();
        lblmsg.Text = "you are recorded tower information successfully.";
        re.clear(Page.Controls);
        re.conclose();
        Response.Redirect("feedback.aspx");
    }
}
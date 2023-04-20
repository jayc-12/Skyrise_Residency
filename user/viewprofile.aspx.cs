using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using System.Web.UI.WebControls.Label;

public partial class user_viewprofile : System.Web.UI.Page
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
        re.conopen();
        re.qry = "select om.owner_name, om.emailid, om.mobileno, om.dob, f.flatno, tm.tname  from owner_mstr as om, tower as tm, flat as f where owner_id='" + Session["uname"].ToString() + "' and f.fid=om.fid and f.tid=tm.tid";
        re.grid(re.qry);
        lblownname.Text = re.ds.Tables[0].Rows[0][0].ToString();
        lbloemail.Text = re.ds.Tables[0].Rows[0][1].ToString();
        lblophno.Text = re.ds.Tables[0].Rows[0][2].ToString();
        lbldob.Text = (re.ds.Tables[0].Rows[0][3].ToString()).Substring(0, 10);
        lblflatno.Text = re.ds.Tables[0].Rows[0][4].ToString();
        lbltname.Text = re.ds.Tables[0].Rows[0][5].ToString();
        re.conclose();
    }
    protected void changepw_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
    }
    protected void btnpwchange_Click(object sender, EventArgs e)
    {
        re.conopen();
        re.qry = "select * from owner_mstr where owner_id='" + Session["uname"].ToString() + "'";
        re.grid(re.qry);
        if (re.ds.Tables[0].Rows[0]["password"].ToString() == txt_currentpw.Text)
        {

            if (txt_newpw.Text == txt_new_confirmpw.Text)
            {
                re.qry = "update owner_mstr set password='" + txt_newpw.Text + "' where owner_id='" + Session["uname"].ToString() + "'";
                re.uid();
                lblmsg.Text  = "Password Change Succesfully..!";
            }
            else
            {
                lblmsg.Text = "New Password and Confirm Password Must Be Same";
            }
        }
        else
        {
            lblmsg.Text = "Password not Match";
        }

        re.conclose();
        Session.RemoveAll();
        Session.Abandon();
        Response.Redirect("login.aspx");
    }
}
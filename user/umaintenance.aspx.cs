using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_umaintenance : System.Web.UI.Page
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
        pnlpay.Visible = false;
        lblnote.Visible = false;
        if (!IsPostBack)
        {
            re.conopen();
            re.qry = "select om.owner_name,f.flatno,t.tname,t.tid,f.fid,om.owner_id from owner_mstr as om,flat as f,tower as t where om.owner_id=" + Session["uname"] + " and om.fid=f.fid and f.tid=t.tid";
            re.grid(re.qry);
            lbltid.Text = re.ds.Tables[0].Rows[0][3].ToString();
            lbltname.Text = re.ds.Tables[0].Rows[0][2].ToString();
            lblfid.Text = re.ds.Tables[0].Rows[0][4].ToString();
            lblflatno.Text = re.ds.Tables[0].Rows[0][1].ToString();
            lbluname.Text = re.ds.Tables[0].Rows[0][0].ToString();
           
            re.conclose();
        }
        drpduration.Items.Insert(0, new ListItem("Select Duration", "0"));
        drpduration.Items.Add("Quarterlly");
        drpduration.Items.Add("Half-Yearlly");
        drpduration.Items.Add("Full-Yearlly");
    }
    protected void btnpay_Click(object sender, EventArgs e)
    {
        lblmsg.Enabled = true;
        re.conopen();
        re.qry = "insert into maintenance(tid,fid,amount,date,paymentmode,timeperiod) values('" + lbltid.Text  + "','" + lblfid.Text  + "','" + txtpayamt.Text + "','" + DateTime.Now + "','" + rblpaymethod.SelectedItem.Text + "','" + drpduration.SelectedItem.Value + "')";
        re.uid();
        re.clear(Page.Controls);
        lblmsg.Text = "you are recorded maintainance information successfully.";
        re.conclose();
        Response.Redirect("umaintenance.aspx");

    }
    protected void rblpaymethod_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rblpaymethod.SelectedIndex == 2)
        {
            pnlpay.Visible = true;
        }
        else
        {
            lblnote.Visible = true;
        }
    }
    protected void drpduration_SelectedIndexChanged(object sender, EventArgs e)
    {
        re.conopen();
        re.qry = "select maintenance from tower where tid=" + lbltid.Text ;
        re.grid(re.qry);
        lblamt.Text = re.ds.Tables[0].Rows[0][0].ToString();
        re.conclose();

        if (drpduration.SelectedIndex == 1)
        {
            int a = Convert.ToInt32(lblamt.Text) / 4;
            txtpayamt.Text = a.ToString();
        }
        else if (drpduration.SelectedIndex == 2)
        {
            int a = Convert.ToInt32(lblamt.Text) / 2;
            txtpayamt.Text = a.ToString();
        }
        else if (drpduration.SelectedIndex == 3)
        {
            int a = Convert.ToInt32(lblamt.Text);
            txtpayamt.Text = a.ToString();
        }
    }
}
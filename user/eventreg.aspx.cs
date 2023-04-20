using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_eventreg : System.Web.UI.Page
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
            re.qry = "select * from event_mstr";
            re.grid(re.qry);
            drpeventtype.DataTextField = re.ds.Tables[0].Columns["event_name"].ToString();
            drpeventtype.DataValueField = re.ds.Tables[0].Columns["event_id"].ToString();
            drpeventtype.DataSource = re.ds.Tables[0];
            drpeventtype.DataBind();
            re.conclose();
            drpeventtype.Items.Insert(0, new ListItem("Select event", "0"));

            re.conopen();
            re.qry = "select om.owner_name,f.flatno,t.tname,om.owner_id from owner_mstr as om,flat as f,tower as t where om.owner_id=" + Session["uname"] + " and om.fid=f.fid and f.tid=t.tid";
            re.grid(re.qry);
            lbltname.Text = re.ds.Tables[0].Rows[0][2].ToString();
            lblflatno.Text = re.ds.Tables[0].Rows[0][1].ToString();
            lblownname.Text = re.ds.Tables[0].Rows[0][0].ToString();
            lblfid.Text = re.ds.Tables[0].Rows[0][3].ToString();
            re.conclose();
        }
    }
    protected void btnevered_Click(object sender, EventArgs e)
    {
        lblmsg.Visible = true;
        if (drpeventtype.SelectedIndex == 0)
        {
            lblmsg.Text = "You Must Fill Dropdown.";
        }
        else
        {

            re.conopen();
            int a = Convert.ToInt32(lblamount.Text);
            int c = Convert.ToInt32(txtevemembers.Text);
            int b = a * c;
            lbltotalamt.Text = b.ToString();
            lbltotalamt.Visible = true;
            re.qry = "insert into event_payment(event_id,owner_id,amount,members,totalamount,paymentmode) values('" + drpeventtype.SelectedItem.Value + "','" + lblfid.Text + "','" + lblamount.Text + "','" + txtevemembers.Text + "','" + lbltotalamt.Text + "','"+rblpaymethod.SelectedItem.Text +"')";
            re.uid();
            lblmsg.Text = "Your Event Registered successfully.";
            re.clear(Page.Controls);
            re.conclose();
            Response.Redirect("eventreg.aspx");
        }
    }
    protected void drpeventtype_SelectedIndexChanged(object sender, EventArgs e)
    {
        re.conopen();
        re.qry = "select * from event_mstr where event_id=" + drpeventtype.SelectedItem.Value;
        re.grid(re.qry);
        lblamount.Text = re.ds.Tables[0].Rows[0][3].ToString();
        re.conclose();
    }

    protected void txtevemembers_TextChanged(object sender, EventArgs e)
    {
        int a = Convert.ToInt32(lblamount.Text);
        int c = Convert.ToInt32(txtevemembers.Text);
        int b = a * c;
        lbltotalamt.Text = b.ToString();
        lbltotalamt.Visible = true;
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
}
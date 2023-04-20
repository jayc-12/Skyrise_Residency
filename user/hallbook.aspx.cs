using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_hallbook : System.Web.UI.Page
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
            re.qry = "select * from hall_mstr";
            re.grid(re.qry);
            drphalltype.DataTextField = re.ds.Tables[0].Columns["halltype"].ToString();
            drphalltype.DataValueField = re.ds.Tables[0].Columns["hall_id"].ToString();
            drphalltype.DataSource = re.ds.Tables[0];
            drphalltype.DataBind();
            re.conclose();

            drphalltype.Items.Insert(0, new ListItem("Select Halltype", "0"));
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
    protected void btnbookhall_Click(object sender, EventArgs e)
    {
        lblmsg.Visible = true;
        if (drphalltype.SelectedIndex == 0)
        {
            lblmsg.Text = "You Must Fill Dropdowns.";
        }
        else
        {
            int a = Convert.ToInt32(lblamount.Text);
            int b = Convert.ToInt32(txtnofdays.Text);
            lbltotalamount.Text = Convert.ToString(a * b);

            re.conopen();
            re.qry = "select * from hall_booking where bookingdate = '" + txtbookdate.Text + "' and hall_id = '" + drphalltype.SelectedItem.Value + "'";

            re.grid(re.qry);
            if (re.ds.Tables[0].Rows.Count > 0) 
            {
                lblmsg.Text = "already booking is done on that day.";
            }


            else
            {
                re.qry = "insert into hall_booking(hall_id,owner_id,amount,date,noofdays,bookingdate,totalamount,paymentmode) values('" + drphalltype.SelectedItem.Value + "','" + lblfid.Text + "','" + lblamount.Text + "','" + DateTime.Now + "','" + txtnofdays.Text + "','" + txtbookdate.Text + "','" + lbltotalamount.Text + "','"+rblpaymethod.SelectedItem.Text +"')";
                re.uid();
                lblmsg.Text = "you are recorded hall booking information successfully.";
                re.clear(Page.Controls);
                re.conclose();
                Response.Redirect("hallbook.aspx");

            }
        }
    }
    protected void drphalltype_SelectedIndexChanged(object sender, EventArgs e)
    {
       
        re.conopen();
        re.qry = "select amount from hall_mstr where hall_id=" + drphalltype.SelectedItem.Value;
        re.grid(re.qry);
        lblamount.Text = re.ds.Tables[0].Rows[0][0].ToString();
        re.conclose();
    }
    protected void txtnofdays_TextChanged(object sender, EventArgs e)
    {
        int a = Convert.ToInt32(lblamount.Text);
        int b = Convert.ToInt32(txtnofdays.Text);
        lbltotalamount.Text = Convert.ToString(a * b);
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
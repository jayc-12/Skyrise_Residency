using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Default : System.Web.UI.Page
{
    public residencyclass re = new residencyclass();

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();

        if (Session["emailid"] == null)
        {
            Response.Redirect("admin_login.aspx");
        }

        pnlpmode.Visible =false;
        lblmsg.Visible = false;

        if (!IsPostBack)
        {
            re.conopen();
            re.qry = "select * from tower";
            re.grid(re.qry);
            drptname.DataTextField = re.ds.Tables[0].Columns["tname"].ToString();
            drptname.DataValueField = re.ds.Tables[0].Columns["tid"].ToString();
            drptname.DataSource = re.ds.Tables[0];
            drptname.DataBind();
            re.conclose();
            drptname.Items.Insert(0, new ListItem("Select Tower", "0"));
            drpduration.Items.Insert(0, new ListItem("Select Duration", "0"));
            drpduration.Items.Add("Quarterlly");
            drpduration.Items.Add("Half-Yearlly");
            drpduration.Items.Add("Full-Yearlly");

        }
    }
    protected void rblpaymentmode_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rblpaymentmode.SelectedIndex == 1)
        {
            pnlpmode.Visible = true;
        }
    }
    protected void btnminsert_Click(object sender, EventArgs e)
    {
        lblmsg.Visible = true;
        if (drpflatno.SelectedIndex == 0 || drptname.SelectedIndex == 0 || drpduration.SelectedIndex == 0)
        {
            lblmsg.Text = " you must fill dropdowns";
        }
        else
        {

            lblmsg.Enabled = true;
            re.conopen();
            re.qry = "insert into maintenance(tid,fid,amount,date,paymentmode,timeperiod,bankname,chequeno,accountno) values('" + drptname.SelectedItem.Value + "','" + drpflatno.SelectedItem.Value + "','" + txtpaymentamt.Text + "','" + DateTime.Now + "','" + rblpaymentmode.SelectedItem.Text + "','" + drpduration.SelectedItem.Value + "','" + txtbankname.Text + "','" + txtcheckno.Text + "','" + txtaccno.Text + "')";
            re.uid();
            re.clear(Page.Controls);
            lblmsg.Text = "you are recorded maintainance information successfully.";
            re.conclose();
            Response.Redirect("maintenance.aspx");
        }
    }
    protected void drptname_SelectedIndexChanged(object sender, EventArgs e)
    {
        re.conopen();
        re.qry = "select * from flat where tid=" + drptname.SelectedItem.Value;
        re.grid(re.qry);
        drpflatno.DataTextField = re.ds.Tables[0].Columns["flatno"].ToString();
        drpflatno.DataValueField = re.ds.Tables[0].Columns["fid"].ToString();
        drpflatno.DataSource = re.ds.Tables[0];
        drpflatno.DataBind();
        re.conclose();
        drpflatno.Items.Insert(0, new ListItem("Select flat", "0"));
    }
    protected void drpflatno_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            re.conopen();
            re.qry = "select owner_name from owner_mstr where fid=" + drpflatno.SelectedItem.Value;
            re.grid(re.qry);
            txtownernm.Text = re.ds.Tables[0].Rows[0][0].ToString();
            re.conclose();
        }
        catch(Exception ex)
        {
            Response.Write("<script>alert('Owner Data Not Found')</script>");
        }

    }
    protected void drpduration_SelectedIndexChanged(object sender, EventArgs e)
    {
        re.conopen();
        re.qry = "select maintenance from tower where tid=" + drptname.SelectedItem.Value;
        re.grid(re.qry);
        lblamt.Text = re.ds.Tables[0].Rows[0][0].ToString();
        re.conclose();

        if (drpduration.SelectedIndex == 1)
        {
            int a = Convert.ToInt32(lblamt.Text) / 4;
            txtpaymentamt.Text = a.ToString();
        }
        else if (drpduration.SelectedIndex == 2)
        {
            int a = Convert.ToInt32(lblamt.Text) / 2;
            txtpaymentamt.Text = a.ToString();
        }
        else if (drpduration.SelectedIndex == 3)
        {
            int a = Convert.ToInt32(lblamt.Text);
            txtpaymentamt.Text = a.ToString();
        }
    }
}
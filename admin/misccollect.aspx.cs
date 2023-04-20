using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_misccollect : System.Web.UI.Page
{
    public residencyclass re = new residencyclass();

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();
        lblmsg.Enabled = false;

        if (Session["emailid"] == null)
        {
            Response.Redirect("admin_login.aspx");
        }

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

        }
    }
    protected void btnmcollect_Click(object sender, EventArgs e)
    {
        lblmsg.Enabled = true;
        if (drpflatno.SelectedIndex == 0 || drptname.SelectedIndex == 0)
        {
            lblmsg.Text = " you must fill dropdowns";
        }
        else
        {
            re.conopen();
            re.qry = "insert into other_collection values('" + drptname.SelectedItem.Value + "','" + drpflatno.SelectedItem.Value + "','" + txtcpurpose.Text + "','" + txtcamt.Text + "','" + DateTime.Now + "')";
            re.uid();
            re.clear(Page.Controls);
            lblmsg.Text = "you are recorded other collection information successfully.";
            re.conclose();
            Response.Redirect("misccollect.aspx");
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
    //protected void drpflatno_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    re.conopen();
    //    re.qry = "select owner_name from owner_mstr where fid=" + drpflatno.SelectedItem.Value;
    //    re.grid(re.qry);
    //    txtoname.Text = re.ds.Tables[0].Rows[0][0].ToString();
    //    re.conclose();
    //}
    
    protected void drpflatno_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            re.conopen();
            re.qry = "select owner_name from owner_mstr where fid=" + drpflatno.SelectedItem.Value;
            re.grid(re.qry);
            txtoname.Text = re.ds.Tables[0].Rows[0][0].ToString();
            re.conclose();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert(' Owner Data Not Found')</script>");
        }
    }
}
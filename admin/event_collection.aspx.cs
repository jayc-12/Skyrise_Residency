using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

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

        if (!IsPostBack)
        {
            fill();
        }
    }
    public void fill()
    {

        re.conopen();
        re.qry = "SELECT ep.eventpaymentid, em.event_name, om.owner_name, ep.amount, ep.members, ep.totalamount,ep.paymentmode ,ep.bankname ,ep.chequeno ,ep.accountno , ep.status, f.flatno FROM event_payment AS ep INNER JOIN owner_mstr AS om ON ep.owner_id = om.owner_id INNER JOIN event_mstr AS em ON ep.event_id = em.event_id INNER JOIN flat AS f ON om.fid = f.fid";
        re.ds = re.grid(re.qry);
        GridView1.DataSource = re.ds.Tables[0];
        GridView1.DataBind();
        re.conclose();
    }
    protected void gridview_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        fill();
    }
    protected void gridview_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label eventpaymentid = (Label)row.FindControl("eventpaymentid");
        Label totalamount = (Label)row.FindControl("totalamount");
        Label amount = (Label)row.FindControl("amount");
        Label bankname = (Label)row.FindControl("bankname");
        Label chequeno = (Label)row.FindControl("chequeno");
        Label accountno = (Label)row.FindControl("accountno");
        TextBox txtmembers = (TextBox)row.FindControl("txtmembers");
        TextBox txtbankname = (TextBox)row.FindControl("txtbankname");
        TextBox txtchequeno = (TextBox)row.FindControl("txtchequeno");
        TextBox txtaccountno = (TextBox)row.FindControl("txtaccountno");
        TextBox txtstatus = (TextBox)row.FindControl("txtstatus");
        GridView1.EditIndex = -1;


        re.conopen();
        int i = Convert.ToInt32(amount.Text);
        int j = Convert.ToInt32(txtmembers.Text);
        totalamount.Text = Convert.ToString(i * j);
        re.qry = "update event_payment set members='" + txtmembers.Text + "',totalamount='" + totalamount.Text + "',bankname='" + txtbankname.Text + "',chequeno='" + txtchequeno.Text + "',accountno='" + txtaccountno.Text + "',status='" + txtstatus.Text + "' where eventpaymentid='" + eventpaymentid.Text + "'";
        re.uid();
        re.conclose();
        fill();
    }
    protected void gridview_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        fill();
    }
    protected void gridview_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label eventpaymentid = (Label)row.FindControl("eventpaymentid");
        Label totalamount = (Label)row.FindControl("totalamount");
        Label amount = (Label)row.FindControl("amount");
        Label bankname = (Label)row.FindControl("bankname");
        Label chequeno = (Label)row.FindControl("chequeno");
        Label accountno = (Label)row.FindControl("accountno");
        TextBox txtmembers = (TextBox)row.FindControl("txtmembers");
        TextBox txtbankname = (TextBox)row.FindControl("txtbankname");
        TextBox txtchequeno = (TextBox)row.FindControl("txtchequeno");
        TextBox txtaccountno = (TextBox)row.FindControl("txtaccountno");
        TextBox txtstatus = (TextBox)row.FindControl("txtstatus");
        GridView1.EditIndex = -1;


        re.conopen();

        re.qry = "delete from event_payment where eventpaymentid='" + eventpaymentid.Text + "'";
        re.uid();
        re.conclose();
        fill();
    }
  
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_miscexpense : System.Web.UI.Page
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
        lblmsg.Enabled = false;
    }
    protected void btnmexpense_Click(object sender, EventArgs e)
    {
        re.conopen();
        re.qry = "insert into other_expense values('" + txtexpurpose.Text + "','" + txtexamt.Text + "','" + DateTime.Now + "')";
        re.uid();
        re.clear(Page.Controls);
        lblmsg.Text = "you are recorded other expence information successfully.";
        re.conclose();
        Response.Redirect("miscexpense.aspx");
    }
}
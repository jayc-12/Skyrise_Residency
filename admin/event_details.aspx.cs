using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class admin_Default : System.Web.UI.Page
{
    public residencyclass re = new residencyclass();
   
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();
        lblmsg.Enabled = false;
    }

    protected void btnevinsert_Click(object sender, EventArgs e)
    {
        lblmsg.Enabled = true;
        re.conopen();
        re.qry = "insert into event_mstr  values('" + txtevname.Text + "','" + txtevdate.Text + "','" + txtevamtp.Text + "' )";
        re.uid();
        re.clear(Page.Controls);
        re.conclose();
        Response.Redirect("event_details.aspx");
    }

    
}
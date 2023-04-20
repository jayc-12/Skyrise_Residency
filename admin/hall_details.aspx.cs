using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class admin_hall_details : System.Web.UI.Page
{
    public residencyclass re = new residencyclass();

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();

    }
    protected void btnhallinsert_Click(object sender, EventArgs e)
    {
        re.conopen();
        re.qry = "insert into hall_mstr values('" + txthalltype.Text + "','" + txthallrate.Text + "' )";
        re.uid();
        re.conclose();
        Response.Redirect("hall_details.aspx");
    }
}
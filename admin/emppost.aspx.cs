using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class emppost : System.Web.UI.Page
{
    public residencyclass re = new residencyclass();

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();
    }
    protected void btnempdetls_Click(object sender, EventArgs e)
    {
        re.conopen();
        re.qry = "insert into emp_type values('" + txtemppost.Text + "','" + txtempsalary.Text + "')";
        re.uid();
        re.conclose();
       
        Response.Redirect("emppost.aspx");
    }
}
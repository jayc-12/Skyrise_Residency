using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class changepw : System.Web.UI.Page
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

    }
    protected void btnchngepw_Click(object sender, EventArgs e)
    {
        re.conopen();
        re.qry = "select * from empmstr where emailid='" + Session["emailid"].ToString() + "'";
        re.grid(re.qry);
        if (re.ds.Tables[0].Rows[0]["password"].ToString() == txtcurpw.Text)
        {
             if (txtnewpw.Text == txtconnewpw.Text && txtnewpw.Text != "")
             {
                 re.qry = "update empmstr set password ='" + txtnewpw.Text + "' where emailid='"  + Session["emailid"].ToString() +  "'";
                 re.uid(); 
                 Session.Abandon();
                 Session.RemoveAll();
                 Response.Redirect("changepw.aspx");              
             }
             else
             {
                lblpwmsg.Text = "New Password and Re-enter Password Not Matched / BlankPassword Not Accepted";
             }
        }
        else
        {
            lblpwmsg.Text = "Invalid Username or Password - Cannot Change Password with User Authentication";
        }

    }
}
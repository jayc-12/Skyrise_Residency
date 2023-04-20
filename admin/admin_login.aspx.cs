using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


public partial class admin_admin_login : System.Web.UI.Page
{
    public residencyclass re = new residencyclass();
    String s1, s2, s3;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        lblmsg.Visible = false;

        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();
        if (Session["emailid"] != null)
        {
            Response.Redirect("adminhome.aspx");
        }
        //else
        //{
        //    Response.Redirect("admin_login.aspx");
        //}

    }
    protected void txtaemail_TextChanged(object sender, EventArgs e)
    {
    }
    protected void btnalogin_Click(object sender, EventArgs e)
    {
        re.conopen();

        re.qry = "select em.emailid,em.name,em.password,em.picture,em.emptypeid,et.emptype from empmstr as em,emp_type as et where em.emailid='" + txtuname.Text + "' and  em.emptypeid=et.emptypeid and et.emptype='admin'";
        re.grid(re.qry);




        if (re.ds.Tables[0].Rows.Count > 0)
        {
            s1 = re.ds.Tables[0].Rows[0]["emailid"].ToString();
            s2 = re.ds.Tables[0].Rows[0]["password"].ToString();
            s3 = re.ds.Tables[0].Rows[0]["picture"].ToString();

            if (s1 == txtuname.Text && s2 == txtapass.Text)
            {
              
                Session["emailid"] = re.ds.Tables[0].Rows[0][1].ToString();
                Session["admin_img"] = re.ds.Tables[0].Rows[0][3].ToString();
                Response.Redirect("adminhome.aspx");
            }
            else
            {
                lblmsg.Visible = true;
                lblmsg.Text = "........Username And Password Not Matched........";
            }
        }
        else
        {
            lblmsg.Visible = true;
            lblmsg.Text = "........Username And Password Not Matched........";
        }


        re.conclose();
    }
    
}
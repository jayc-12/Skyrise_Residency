using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class user_verifyotp : System.Web.UI.Page
{
    public residencyclass re = new residencyclass();
    String s1;


    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();
        lblmsg.Visible = false;
    }
    protected void btnforgot_Click(object sender, EventArgs e)
    {
        re.conopen();
        re.qry="select * from owner_mstr where otp='"+txtotp.Text +"'";
        //re.qry = "select * from owner_mstr where otp ='" + txtotp.Text + "';
         re.grid(re.qry);

        if (re.ds.Tables[0].Rows.Count > 0)
        {
              s1 = re.ds.Tables[0].Rows[0]["otp"].ToString();
             if (s1 == txtotp.Text)
            {
                lblmsg.Visible = true;
                lblmsg.Text = "Your Registration is done, wait for some time while we are verifying your details you will recieve an email when your details will be verified Shortly. Thank You";
                 //Response.Redirect("login.aspx");
             }
             else
             {
                 lblmsg.Visible = true;
                 lblmsg.Text="Pleae enter correct OTP.";
             }
        }
        else
        {
                lblmsg.Visible = true;
                 lblmsg.Text="Pleae enter correct OTP.";
        }
        }
    }

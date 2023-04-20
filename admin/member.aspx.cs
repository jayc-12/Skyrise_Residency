using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;

public partial class admin_member : System.Web.UI.Page
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
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        //re.qry = "select * from "
        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.Port = 587;
        smtp.Credentials = new System.Net.NetworkCredential("skyrise.rms@gmail.com", "Jay@101255");
        smtp.EnableSsl = true;
        MailMessage msg = new MailMessage();
        msg.Subject = "Hello  Thanks for Register at SkyRise";
        msg.Body = "Hi, Thanks For Your Registration at SkyRise Residency, Wait for the authentication ,Try to login after some time . Thanks";
        //string toaddress = lblemail.Text;
        //msg.To.Add(toaddress);
        string fromaddress = "SkyRise Residency <skyrise.rms@gmail.com>";
        msg.From = new MailAddress(fromaddress);
        //try
        //{
        //    smtp.Send(msg);
        //    //lblmsg.Text = "Your Email Has Been Registered with Us";

        //}
        //catch
        //{
        //    thr;
        //}
    }
    
}

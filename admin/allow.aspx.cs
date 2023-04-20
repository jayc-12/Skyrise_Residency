using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Net.Mail;
using System.Net;
using System.Collections.Specialized;

public partial class admin_allow : System.Web.UI.Page
{
    public residencyclass re = new residencyclass();

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();

        txtname.Text = Request.QueryString["owner_name"].ToString();
        txtemail.Text = Request.QueryString["emailid"].ToString();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (chkallow.Checked)
        {
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("skyrise.rms@gmail.com", "Jay@101255");
            smtp.EnableSsl = true;
            MailMessage msg = new MailMessage();
            msg.Subject = "Hello " + txtname.Text + "";
            msg.Body = "Hi, Thanks For Your Registration at SkyRise Residency, Your Authentication is done and Now You Can Login. Thank You.  ";
            string toaddress = txtemail.Text;
            msg.To.Add(toaddress);
            string fromaddress = "SkyRise Residency <skyrise.rms@gmail.com>";
            msg.From = new MailAddress(fromaddress);
            try
            {
                smtp.Send(msg);              

            }
            catch
            {
                throw;
            }

            re.conopen();
            re.qry = "UPDATE owner_mstr SET status='"+lblallow.Text +"'";
            re.uid();
            re.conclose();

            Response.Redirect("member.aspx");
        }
        else
        {
            Response.Write("<script>alert('Please check the checkbox')</script>");
        }
    }
}
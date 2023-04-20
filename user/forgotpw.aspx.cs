using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Net.Mail;
using System.Net;
using System.Collections.Specialized;

public partial class user_forgotpw : System.Web.UI.Page
{
        //public residencyclass re = new residencyclass();

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();
        lblmsg.Enabled = false;
    }
    protected void btnforgot_Click(object sender, EventArgs e)
    {
        String password;
        String mycon = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True";
        String myquery = "Select * from owner_mstr where mobileno='" + txtuphno.Text + "' and emailid='" + txtuemail.Text + "'"; ;
        SqlConnection con = new SqlConnection(mycon);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = myquery;
        cmd.Connection = con;
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            //Label3.Text = "Data Found";

            password = ds.Tables[0].Rows[0]["password"].ToString();
            sendpassword(password, txtuemail.Text , txtuphno.Text );
            lblmsg.Text = "Your Password Has Been Sent to Registered Email Address. Check Your Mail Inbox";

        }
        else
        {
            lblmsg.Text = "Your Phone Number or Email id is Not Registered or Not Valid";

        }
        con.Close();
    }
    private void sendpassword(String password, String email , String phone)
    {
        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.Port = 587;
        smtp.Credentials = new System.Net.NetworkCredential("skyrise.rms@gmail.com", "Jay@101255");
        smtp.EnableSsl = true;
        MailMessage msg = new MailMessage();
        msg.Subject = "Forgot Password";
        msg.Body = "Hi ,You just requested for your Password. Here is Your password   " + password + "   please dont share it with anyone and change it after login . Thank you  ";
        string toaddress = txtuemail.Text;
        msg.To.Add(toaddress);
        string fromaddress = "SkyRise Residency <skyrise.rms@gmail.com>";
        msg.From = new MailAddress(fromaddress);
        try
        {
            smtp.Send(msg);
            lblmsg.Text = "Password Send To Your Email id ";
        }
        catch
        {
            throw;
        }

        
    }
}
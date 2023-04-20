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

public partial class user_signup : System.Web.UI.Page
{
    public residencyclass re = new residencyclass();

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();
        lblmsg.Enabled = false;
    }
    protected void btnosubmit_Click(object sender, EventArgs e)
    {
        Random r = new Random();
        string OTP = r.Next().ToString();
        OTP = OTP.Substring(0, 6);
        lblotp.Text = OTP;

        lblmsg.Enabled = true;
        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.Port = 587;
        smtp.Credentials = new System.Net.NetworkCredential("skyrise.rms@gmail.com", "Jay@101255");
        smtp.EnableSsl = true;
        MailMessage msg = new MailMessage();
        msg.Subject = "Hello " + txtoname.Text + "  Thanks for Register at SkyRise";
        msg.Body = "Hi, Thanks For Your Registration at SkyRise Residency, Your OTP is  "+lblotp.Text +" . Thanks";
        string toaddress = txtoemail.Text;
        msg.To.Add(toaddress);
        string fromaddress = "SkyRise Residency <skyrise.rms@gmail.com>";
        msg.From = new MailAddress(fromaddress);
        try
        {
            smtp.Send(msg);
            lblmsg.Text = "Your Email Has Been Registered with Us";
            
        }
        catch
        {
            throw;
        }

        string destinationaddr = "91" + txtophno.Text;
        string message = "Hi " + txtoname.Text + " , You Have Been Registered , Your OTP is "+lblotp.Text +" Thanks!!";

        String message1 = HttpUtility.UrlEncode(message);
        using (var wb = new WebClient())
        {
            byte[] response = wb.UploadValues("https://api.textlocal.in/send/", new NameValueCollection()
                {
                {"apikey" , "1IeKeQPlYjc-SDLSdx7oCGzEzK76AN3hOIJgBMD0KP"},
                {"numbers" , destinationaddr},
                {"message" , message1},
                {"sender" , "TXTLCL"}
                });
            string result = System.Text.Encoding.UTF8.GetString(response);
            //savedata();
            //Label3.Text = "You Have Successfully Registered";
        }


       if (fuoimg.HasFile)
            {
                lblmsg.Text = "";
                String[] ext = { "image/jpg", "image/jpeg", "image/png", "image/jbmp", "image/gif" };
                if (ext.Contains(fuoimg.PostedFile.ContentType))
                {
                    lblmsg.Text = "";
                    fuoimg.SaveAs(Server.MapPath("~/user_owner_photo/") + Path.GetFileName( fuoimg.FileName));
                    String  link = Path.GetFileName(fuoimg.FileName);
                    oimg.Visible = true;
                    oimg.ImageUrl = fuoimg.FileName;
                    re.conopen();
                    re.qry = "insert into owner_mstr(owner_name,fid,emailid,password,mobileno,dob,gender,owner_image,otp) values('" +txtoname.Text + "','" + drpflatno.SelectedItem.Value  + "','" + txtoemail.Text + "','" + txtopass.Text + "','" + txtophno.Text + "','" + txtodob .Text  + "','" +drpgender.SelectedItem.Text  + "','"+ link  + "','"+lblotp.Text +"')";
                    re.uid();
                    re.clear(Page.Controls);
                    lblmsg.Text = "you are registered successfully.";
                    re.conclose();
                    Response.Redirect("verifyotp.aspx");
                }
           else
                {
                    lblmsg.Text = "Please select an image file only";
                }
            }
       else
       {
           lblmsg.Text = "Please select a file";
       }
    }
    protected void drptname_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void txtoemail_TextChanged(object sender, EventArgs e)
    {
        re.conopen();
        String qry1 = "select * from owner_mstr where emailid='"+txtoemail.Text +"'";
        re.cmd = new SqlCommand(qry1, re.cn);
        re.dr = re.cmd.ExecuteReader();

        if (re.dr.HasRows)
        {
            Label1.Text = "Email id is already Exist";
            Label1.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            Label1.Text = "Valid Emailid";
            Label1.ForeColor = System.Drawing.Color.Green;
        }
        re.conclose();

    }
    protected void txtophno_TextChanged(object sender, EventArgs e)
    {
        re.conopen();
        String qry1 = "select * from owner_mstr where mobileno='" + txtophno.Text + "'";
        re.cmd = new SqlCommand(qry1, re.cn);
        re.dr = re.cmd.ExecuteReader();

        if (re.dr.HasRows)
        {
            lblexist.Text = "Phone Number is already Exist";
            lblexist.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            lblexist.Text = "Valid Phone Number";
            lblexist.ForeColor = System.Drawing.Color.Green;
        }
        re.conclose();
    }
}
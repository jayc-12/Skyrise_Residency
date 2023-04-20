using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Net.Mail;
using System.Net;

public partial class empreg : System.Web.UI.Page
{
    public residencyclass re = new residencyclass();

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();

        if (!IsPostBack)
        {
            re.conopen();
            re.qry = "select * from emp_type";
            re.grid(re.qry);
            drpemppost.DataTextField = re.ds.Tables[0].Columns["emptype"].ToString();
            drpemppost.DataValueField = re.ds.Tables[0].Columns["emptypeid"].ToString();
            drpemppost.DataSource = re.ds.Tables[0];
            drpemppost.DataBind();
            re.conclose();
            drpemppost.Items.Insert(0, new ListItem("Select Post", "0"));

        }
        lblmsg.Enabled = false;
        lblamount.Visible = false;
        pnlpass.Visible = false;
    }
    protected void btnempinsert_Click(object sender, EventArgs e)
    {
        

        re.conopen();
        if (drpemppost.SelectedIndex == 0 )
        {

            lblmsg.Text = "You must fill dropdowns";
        }
        else
        {
            lblmsg.Enabled = true;
            if (emppicupload.HasFile)
            {
                lblmsg.Text = "";
                String[] ext = { "image/jpg", "image/jpeg", "image/png", "image/jbmp", "image/gif" };
                if (ext.Contains(emppicupload.PostedFile.ContentType))
                {
                    lblmsg.Text = "";
                    emppicupload.SaveAs(Server.MapPath("~/emp_photos/") + Path.GetFileName(emppicupload.FileName));
                    String link = "~/emp_photos/" + Path.GetFileName(emppicupload.FileName);
                    empprofilepic.Visible = true;
                    empprofilepic.ImageUrl = emppicupload.FileName;

                    re.qry = "insert into empmstr(emptypeid,name,emailid,password,mobileno,gender,picture,amount) values('" + drpemppost.SelectedItem.Value + "','" + txtempname.Text + "','" + txtempemail.Text + "','" + txtemppass.Text + "','" + txtempphnno.Text + "','" + rblgender.SelectedItem.Text + "','" + link + "','" + lblamount.Text + "')";
                    re.uid();
                    lblmsg.Text = "you uploaded image successfully.";
                    re.conclose();

                    lblmsg.Enabled = true;
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "smtp.gmail.com";
                    smtp.Port = 587;
                    smtp.Credentials = new System.Net.NetworkCredential("skyrise.rms@gmail.com", "Jay@101255");
                    smtp.EnableSsl = true;
                    MailMessage msg = new MailMessage();
                    msg.Subject = "Hello " + txtempname.Text + "  Thanks for Register at SkyRise";
                    msg.Body = "Hi, Thanks For Your Registration at SkyRise Residency .Thanks";
                    string toaddress = txtempemail.Text;
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

                    Response.Redirect("empreg.aspx");
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
        
    }
    protected void drpemppost_SelectedIndexChanged(object sender, EventArgs e)
    {
        re.conopen();
        re.qry = "select * from emp_type where emptypeid=" + drpemppost.SelectedItem.Value;
        re.grid(re.qry);
        lblamount.Text = re.ds.Tables[0].Rows[0][2].ToString();
        re.conclose();

        if (drpemppost.SelectedIndex == 1)
        {
            pnlpass.Visible = true;       
        }
    }
    protected void txtempemail_TextChanged(object sender, EventArgs e)
    {
        re.conopen();
        String qry1 = "select * from empmstr where emailid='" + txtempemail.Text + "'";
        re.cmd = new SqlCommand(qry1, re.cn);
        re.dr = re.cmd.ExecuteReader();

        if (re.dr.HasRows)
        {
            lblexmsg.Text = "Email id is already Exist";
            lblexmsg.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            lblexmsg.Text = "Valid Emailid";
            lblexmsg.ForeColor = System.Drawing.Color.Green;
        }
        re.conclose();
    }
    protected void txtempphnno_TextChanged(object sender, EventArgs e)
    {
        re.conopen();
        String qry1 = "select * from empmstr where mobileno='" + txtempphnno.Text + "'";
        re.cmd = new SqlCommand(qry1, re.cn);
        re.dr = re.cmd.ExecuteReader();

        if (re.dr.HasRows)
        {
            lblexmsg1.Text = "Phone Number is already Exist";
            lblexmsg1.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            lblexmsg1.Text = "Valid Phone Number";
            lblexmsg1.ForeColor = System.Drawing.Color.Green;
        }
        re.conclose();
    }
}
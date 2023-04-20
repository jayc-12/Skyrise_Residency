using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class user_login : System.Web.UI.Page
{
    public residencyclass re = new residencyclass();
    String s1, s2;

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();
        lblmsg.Visible = false;

        if (Session["uname"] != null)
        {
            Response.Redirect("Home.aspx");
        }
    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        re.conopen();

        re.qry = "select * from owner_mstr where emailid='" + txtuname.Text + "' and status='allow'";
        re.grid(re.qry);

        if (re.ds.Tables[0].Rows.Count > 0)
        {
            s1 = re.ds.Tables[0].Rows[0]["emailid"].ToString();
            s2 = re.ds.Tables[0].Rows[0]["password"].ToString();

            if (s1 == txtuname.Text && s2 == txtupass.Text)
            {
                Session["uname"] = re.ds.Tables[0].Rows[0][0].ToString();
                Session["fid"] = re.ds.Tables[0].Rows[0][2].ToString();
                Response.Redirect("Home.aspx");
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
        //re.conopen();
        //re.qry = "select * from owner_mstr where emailid='" + txtuname.Text + "' and password='" + txtupass.Text + "' ";
        //re.cmd = new SqlCommand(re.qry, re.cn);
        //re.dr = re.cmd.ExecuteReader();
        //if (re.dr.HasRows)
        //{
        //    re.dr.Read();
        //    //Session["emailid"] = txtuname.Text;
        //    //Session["admin_img"] = dr["picture"].ToString();
        //    Response.Redirect("Home.aspx");
        //}
        //else
        //{
        //    lblmsg.Text = "Wrong User!";
        //}

        //re.conclose();

    }
}
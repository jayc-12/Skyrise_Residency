using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class admin_admin_login_admin_home_flat : System.Web.UI.Page
{
    public residencyclass re = new residencyclass();
   

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();
        lblintercom.Visible = false;
        lblmsg.Enabled = false;

         if (Session["emailid"] == null)
        {
            Response.Redirect("admin_login.aspx");
        }       

        if (!IsPostBack)
        {
            re.conopen();
            re.qry = "select * from tower";
            re.grid(re.qry);
            drptname.DataTextField = re.ds.Tables[0].Columns["tname"].ToString();
            drptname.DataValueField = re.ds.Tables[0].Columns["tid"].ToString();
            drptname.DataSource = re.ds.Tables[0];
            drptname.DataBind();
            re.conclose();
            drptname.Items.Insert(0, new ListItem("Select Tower", "0"));

        }
    }
    protected void btnfinsert_Click(object sender, EventArgs e)
    {
        lblmsg.Enabled = true;

        if (drptname.SelectedIndex == 0)
        {
          
            lblmsg.Text = "You must fill dropdowns";
        }
        else
        {
            lblintercom.Text = lblintercom.Text + txtflatno.Text;
            re.conopen();
            re.qry = "insert into flat values('" + drptname.SelectedItem.Value + "','" + txtflatno.Text + "','" + lblintercom.Text + "')";
            re.uid();
            re.clear(Page.Controls);
            re.conclose();
            Response.Redirect("flat.aspx");
        }
    }


    protected void drptname_SelectedIndexChanged(object sender, EventArgs e)
    {
        re.conopen();
        re.qry = "select * from tower where tid=" + drptname.SelectedItem.Value;
        re.grid(re.qry);
        lblintercom.Text = re.ds.Tables[0].Rows[0][6].ToString();
        re.conclose();
    }
}
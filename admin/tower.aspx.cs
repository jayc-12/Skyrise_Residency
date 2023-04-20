using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class admin_admin_login_admin_home_tower : System.Web.UI.Page
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

         

        if (!IsPostBack)
        {
            drpsqft.Items.Insert(0, new ListItem("Select Square Feet Type", "0"));
            drpsqft.Items.Add("1800 SQFT");
            drpsqft.Items.Add("2500 SQFT");
            drpsqft.Items.Add("3200 SQFT");
            drpsqft.Items.Add("4000 SQFT");
            drpttype.Items.Insert(0, new ListItem("Select Tower Type", "0"));
            drpttype.Items.Add("2BHK");
            drpttype.Items.Add("3BHK");
            drpttype.Items.Add("4BHK");
            drpttype.Items.Add("5BHK");
        }
    }
   
    protected void btntinsert_Click(object sender, EventArgs e)
    {
        
        if (drpsqft.SelectedIndex == 0 || drpttype.SelectedIndex == 0)
        {
            
            lblmsg.Text = "you must fill Dropdowns";
        }
        else
        {
            re.conopen();
            re.qry = "insert into tower values('" + txttname.Text + "','" + drpsqft.SelectedItem.Text + "','" + txttrate.Text + "','" + txttnof.Text + "','" + drpttype.SelectedItem.Text + "','" + txttintercom.Text + "','"+txtmainamt.Text +"','" + txtttransferfee.Text + "' )";
            re.uid();
            lblmsg.Text = " Tower information inserted successfully";
            re.clear(Page.Controls);
            re.conclose();
            Response.Redirect("tower.aspx");
        }
    }
    
}
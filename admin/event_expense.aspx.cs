using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_expense : System.Web.UI.Page
{
    public residencyclass re = new residencyclass();

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();
        lbldate.Visible = false;
        if (!IsPostBack)
        {
            re.conopen();
            re.qry = "select * from event_mstr";
            re.grid(re.qry);
            drpevname.DataTextField = re.ds.Tables[0].Columns["event_name"].ToString();
            drpevname.DataValueField = re.ds.Tables[0].Columns["event_id"].ToString();
            drpevname.DataSource = re.ds.Tables[0];
            drpevname.DataBind();
            re.conclose();
            drpevname.Items.Insert(0, new ListItem("Select Event", "0"));

        }
    }
    protected void btnevxinsert_Click(object sender, EventArgs e)
    {
        
        if (drpevname.SelectedIndex == 0)
        {

            lblmsg.Text = "You must fill dropdowns";
        }
        else
        {
            re.conopen();
            re.qry = "insert into event_expense values('" + drpevname.SelectedItem.Value + "','" +txtevamt.Text  + "','" + lbldate.Text + "')";
            re.uid();
            re.clear(Page.Controls);
            lblmsg.Text = "you are recorded event expence information successfully.";
            re.conclose();
            Response.Redirect("event_expense.aspx");
        }
    }
    protected void drpevname_SelectedIndexChanged(object sender, EventArgs e)
    {
        re.conopen();
        re.qry = "select * from event_mstr where event_id=" + drpevname.SelectedItem.Value;
        re.grid(re.qry);
        lbldate.Text = re.ds.Tables[0].Rows[0][2].ToString();
        re.conclose();
    }
}
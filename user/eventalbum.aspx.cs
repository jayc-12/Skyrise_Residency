using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_eventalbum : System.Web.UI.Page
{
    public residencyclass re = new residencyclass();

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();
        
         DataList1.Visible = false;

        if (Session["uname"] == null)
        {
            Response.Redirect("login.aspx");
        }

        if (!IsPostBack)
        {
            re.conopen();
            re.qry = "select * from event_mstr";
            re.grid(re.qry);
            drpeventtype.DataTextField = re.ds.Tables[0].Columns["event_name"].ToString();
            drpeventtype.DataValueField = re.ds.Tables[0].Columns["event_id"].ToString();
            drpeventtype.DataSource = re.ds.Tables[0];
            drpeventtype.DataBind();
            re.conclose();
            drpeventtype.Items.Insert(0, new ListItem("Select Event", "0"));

            re.conopen();
            re.qry = "select ea.photo from event_album as ea,event_mstr as em where em.event_id=ea.event_id";
            re.grid(re.qry);
            DataList1.DataSource = re.ds.Tables[0];
            DataList1.DataBind();

            re.conclose();
        }
    }
    protected void drpeventtype_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataList1.Visible = true;
        re.conopen();
        re.qry = "select ea.photo from event_album as ea,event_mstr as em where em.event_id=ea.event_id and event_name='" + drpeventtype.SelectedItem.Text + "'";
        re.grid(re.qry);
        DataList1.DataSource = re.ds.Tables[0];
        DataList1.DataBind();

        re.conclose();
    }
}
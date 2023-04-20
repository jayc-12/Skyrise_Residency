using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_hall_album : System.Web.UI.Page
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
            re.qry = "select * from hall_mstr";
            re.grid(re.qry);
            drphalltype.DataTextField = re.ds.Tables[0].Columns["halltype"].ToString();
            drphalltype.DataValueField = re.ds.Tables[0].Columns["hall_id"].ToString();
            drphalltype.DataSource = re.ds.Tables[0];
            drphalltype.DataBind();
            re.conclose();
            drphalltype.Items.Insert(0, new ListItem("Select HallType", "0"));

            re.conopen();
            re.qry = "select ha.photo from hall_album as ha,hall_mstr as hm where hm.hall_id=ha.hall_id";
            re.grid(re.qry);
            DataList1.DataSource = re.ds.Tables[0];
            DataList1.DataBind();

            re.conclose();
        }
    }
    protected void drphalltype_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataList1.Visible = true;
        re.conopen();
        re.qry = "select ha.photo from hall_album as ha,hall_mstr as hm where hm.hall_id=ha.hall_id and halltype='" + drphalltype.SelectedItem.Text + "'";
        re.grid(re.qry);
        DataList1.DataSource = re.ds.Tables[0];
        DataList1.DataBind();

        re.conclose();
    }
}
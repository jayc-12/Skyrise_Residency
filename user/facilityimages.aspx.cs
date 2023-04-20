using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_facilityimages : System.Web.UI.Page
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
            re.qry = "select * from facility_mstr";
            re.grid(re.qry);
            drpfacitype.DataTextField = re.ds.Tables[0].Columns["facility_type"].ToString();
            drpfacitype.DataValueField = re.ds.Tables[0].Columns["facilityid"].ToString();
            drpfacitype.DataSource = re.ds.Tables[0];
            drpfacitype.DataBind();
            re.conclose();
            drpfacitype.Items.Insert(0, new ListItem("Select Facility", "0"));

            re.conopen();
            re.qry = "select ea.picture from facility_album as ea,facility_mstr as em where em.facilityid=ea.facilityid";
            re.grid(re.qry);
            DataList1.DataSource = re.ds.Tables[0];
            DataList1.DataBind();

            re.conclose();
        }
    }
    protected void drpfacitype_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataList1.Visible = true;
        re.conopen();
        re.qry = "select ea.picture from facility_album as ea,facility_mstr as em where em.facilityid=ea.facilityid and facility_type='" + drpfacitype.SelectedItem.Text + "'";
        re.grid(re.qry);
        DataList1.DataSource = re.ds.Tables[0];
        DataList1.DataBind();

        re.conclose();
    }
}
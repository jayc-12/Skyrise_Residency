using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_admin_login_admin_home_Default : System.Web.UI.Page
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
        re.conopen();
        re.qry = "select count(tid) as totamt from tower";
        lbltow.Text = re.getTotAmt(re.qry).ToString();

        re.conclose();
        re.conopen();
        re.qry = "select count(fid) as totamt from flat";
        lblfla.Text = re.getTotAmt(re.qry).ToString();

        re.conclose();
        re.conopen();
        re.qry = "select count(owner_id) as totamt from owner_mstr where status='allow'";
        lblown.Text = re.getTotAmt(re.qry).ToString();

        re.conclose();
        re.conopen();
        re.qry = "select count(facilityid) as totamt from facility_mstr";
        lblfac.Text = re.getTotAmt(re.qry).ToString();

        re.conclose();
        re.conopen();
        re.qry = "select count(event_id) as totamt from event_mstr";
        lbleve.Text = re.getTotAmt(re.qry).ToString();

        re.conclose();
        re.conopen();
        re.qry = "select count(bookhall_id) as totamt from hall_booking";
        lblhall.Text = re.getTotAmt(re.qry).ToString();

        re.conclose();


        re.conopen();
        re.qry = "select sum(amount) as totamt from maintenance";
        ViewState["a1"] = re.getTotAmt(re.qry).ToString();
        re.conclose();


        re.conopen();
        re.qry = "select sum(totalamount) as totamt from event_payment where status='paid'";
        ViewState["a2"] = re.getTotAmt(re.qry).ToString();
        re.conclose();

        re.conopen();
        re.qry = "select sum(totalamount) as totamt from hall_booking where status='paid'";
        ViewState["a3"] = re.getTotAmt(re.qry).ToString();
        re.conclose();

        re.conopen();
        re.qry = "select sum(amount) as totamt from transfer where status='paid'";
        ViewState["a4"] = re.getTotAmt(re.qry).ToString();
        re.conclose();

        re.conopen();
        re.qry = "select sum(amount) as totamt from other_collection";
        ViewState["a5"] = re.getTotAmt(re.qry).ToString();
        re.conclose();

        re.conopen();
        re.qry = "select sum(amount) as totamt from event_expense";
        ViewState["a6"] = re.getTotAmt(re.qry).ToString();
        re.conclose();

        re.conopen();
        re.qry = "select sum(amount) as totamt from salary_expense";
        ViewState["a7"] = re.getTotAmt(re.qry).ToString();
        re.conclose();

        re.conopen();
        re.qry = "select sum(amount) as totamt from other_expense";
        ViewState["a8"] = re.getTotAmt(re.qry).ToString();
        re.conclose();
        int a = Convert.ToInt32(ViewState["a1"].ToString());
        int b = Convert.ToInt32(ViewState["a2"].ToString());
        int c = Convert.ToInt32(ViewState["a3"].ToString());
        int d = Convert.ToInt32(ViewState["a4"].ToString());
        int g = Convert.ToInt32(ViewState["a5"].ToString());
        int h = Convert.ToInt32(ViewState["a6"].ToString());
        int i = Convert.ToInt32(ViewState["a7"].ToString());
        int j = Convert.ToInt32(ViewState["a8"].ToString());
        lbltoin.Text = Convert.ToString(a + b + c + d + g);
        lbltoex.Text = Convert.ToString(h + i + j);
        lblbal.Text = Convert.ToString(Convert.ToInt32(lbltoin.Text) - Convert.ToInt32(lbltoex.Text));
    }
}
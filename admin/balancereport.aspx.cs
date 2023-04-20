using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_balancereport : System.Web.UI.Page
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
        re.qry = "select sum(amount) as totamt from maintenance";
        txtmaininc.Text = re.getTotAmt(re.qry).ToString();
        re.conclose();

        re.conopen();
        re.qry = "select sum(totalamount) as totamt from event_payment where status='paid'";
        txteveinc.Text = re.getTotAmt(re.qry).ToString();
        re.conclose();

        re.conopen();
        re.qry = "select sum(totalamount) as totamt from hall_booking where status='paid'";
        txthallinc.Text = re.getTotAmt(re.qry).ToString();
        re.conclose();

        re.conopen();
        re.qry = "select sum(amount) as totamt from transfer where status='paid'";
        txttrainc.Text = re.getTotAmt(re.qry).ToString();
        re.conclose();

        re.conopen();
        re.qry = "select sum(amount) as totamt from other_collection";
        txtmiscinc.Text = re.getTotAmt(re.qry).ToString();
        re.conclose();

        re.conopen();
        re.qry = "select sum(amount) as totamt from event_expense";
        txteveexp.Text = re.getTotAmt(re.qry).ToString();
        re.conclose();

        re.conopen();
        re.qry = "select sum(amount) as totamt from salary_expense";
        txtsalexp.Text = re.getTotAmt(re.qry).ToString();
        re.conclose();

        re.conopen();
        re.qry = "select sum(amount) as totamt from other_expense";
        txtmisexp.Text = re.getTotAmt(re.qry).ToString();
        re.conclose();

        int a = Convert.ToInt32(txtmaininc.Text);
        int b = Convert.ToInt32(txteveinc.Text);
        int c = Convert.ToInt32(txthallinc.Text);
        int d = Convert.ToInt32(txttrainc.Text);
        int g = Convert.ToInt32(txtmiscinc.Text);
        int h = Convert.ToInt32(txteveexp.Text);
        int i = Convert.ToInt32(txtsalexp.Text);
        int j = Convert.ToInt32(txtmisexp.Text);
        txtgtinc.Text = Convert.ToString(a + b + c + d + g);
        txtgtexp.Text = Convert.ToString(h + i + j);
        txtbal.Text = Convert.ToString(Convert.ToInt32(txtgtinc.Text) - Convert.ToInt32(txtgtexp.Text));
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_salaryexpense : System.Web.UI.Page
{
    public residencyclass re = new residencyclass();

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();

        lblmsg.Enabled = false;

        lblamt.Visible = false;
        if (!IsPostBack)
        {
            re.conopen();
            re.qry = "select * from emp_type";
            re.grid(re.qry);
            drpemptype.DataTextField = re.ds.Tables[0].Columns["emptype"].ToString();
            drpemptype.DataValueField = re.ds.Tables[0].Columns["emptypeid"].ToString();
            drpemptype.DataSource = re.ds.Tables[0];
            drpemptype.DataBind();
            re.conclose();
            drpemptype.Items.Insert(0, new ListItem("Select Post", "0"));

        }
    }
   
    protected void btnempsalex_Click(object sender, EventArgs e)
    {
        if (drpemptype.SelectedIndex == 0)
        {

            lblmsg.Text = "You must fill dropdowns";
        }
        else
        {


            re.conopen();
            re.qry = "insert into salary_expense values('" + drpempname.SelectedItem.Value + "','" + drpempname.SelectedItem.Text + "','" + DateTime.Now + "','" + lblamt.Text + "')";
            re.uid();
            re.clear(Page.Controls);
            lblmsg.Text = "you are recorded salary expence information successfully.";
            re.conclose();
            Response.Redirect("salaryexpense.aspx");

        }   
    }

    protected void drpemptype_SelectedIndexChanged(object sender, EventArgs e)
    {
        re.conopen();
        re.qry = "select * from emp_type where emptypeid=" + drpemptype.SelectedItem.Value;
        re.grid(re.qry);
        lblamt.Text = re.ds.Tables[0].Rows[0][2].ToString();
        re.conclose();
    }
    protected void drpempname_SelectedIndexChanged(object sender, EventArgs e)
    {
        //re.conopen();
        //re.qry = "select * from empmstr where emptypeid='" + drpemptype.SelectedItem.Value + "'";
        //re.grid(re.qry);
       

    }
}
﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_eventexreport : System.Web.UI.Page
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
        try
        {
            re.conopen();
            re.qry = "select sum(amount) as totamt from event_expense";
            txtinc.Text = re.getTotAmt(re.qry).ToString();

            re.conclose();
        }
        catch (Exception ex)
        {
            txtinc.Text = "0";
        }
    }
}
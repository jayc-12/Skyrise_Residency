using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class admin_rules : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();

        if (!IsPostBack)
        {
            StreamReader sr = new StreamReader(Server.MapPath("~/html/rules.htm"));
            fck.Value = sr.ReadToEnd();
            sr.Close();
            sr.Dispose();
        }
    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        StreamWriter sw = new StreamWriter(Server.MapPath("~/html/rules.htm"));
        sw.Write(fck.Value);
        sw.Close();
        sw.Dispose();
    }
}
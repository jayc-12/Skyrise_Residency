using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class admin_aboutus : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();
        if (!IsPostBack)
        {
            StreamReader sr = new StreamReader(Server.MapPath("~/html/aboutus.htm"));
            fck1.Value = sr.ReadToEnd();
            sr.Close();
            sr.Dispose();
        }
    }
    protected void btnasave_Click(object sender, EventArgs e)
    {
        StreamWriter sw = new StreamWriter(Server.MapPath("~/html/aboutus.htm"));
        sw.Write(fck1.Value);
        sw.Close();
        sw.Dispose();
    }
}
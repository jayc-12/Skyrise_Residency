using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

/// <summary>
/// Summary description for residencyclass
/// </summary>
public class residencyclass
{
    public SqlConnection cn = new SqlConnection();
    public SqlCommand cmd = new SqlCommand();
    public DataSet ds = new DataSet();

    public SqlDataAdapter da = new SqlDataAdapter();
    public String qry;
    public int pno, f, i;
    public SqlDataReader dr;
    public String[] drr;
    private string _cnstr;

	public residencyclass()
	{
        cn.ConnectionString=@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True";
		//
		// TODO: Add constructor logic here
		//
	}
    public void conopen()
    {
        cn.Open();
    }
    public void conclose()
    {
        cn.Close();
    }
     public void uid()
    {
        cmd = new SqlCommand(qry,cn);
        cmd.ExecuteNonQuery();
    }
    public void clear(ControlCollection ctrls)
    {
        foreach (Control ctrl in ctrls)
        {
            if (ctrl is TextBox)
                ((TextBox)ctrl).Text = string.Empty;
            clear(ctrl.Controls);
        }
    }
     public Double  getTotAmt(String q)
    {
        Double  f;
        cmd = new SqlCommand(q, cn);
        
            f = Convert.ToDouble(cmd.ExecuteScalar());
            return f;
        
        
    }
     public void se()
    {
        cmd = new SqlCommand(qry, cn);
        dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            f = 1;
            while (dr.Read())
            {
                drr = new String[dr.FieldCount];
                for (i = 0; i < dr.FieldCount; i++)
                {
                    drr[i] = dr[i].ToString();
                }
            }
        }
        else
        {
            f = 0;
        }
    }
     public DataSet grid(String str)
    {
        da = new SqlDataAdapter(str, cn);
        ds = new DataSet();
        ds.Clear();
        da.Fill(ds);
        return ds;
    }
        
}
<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmstr.master" AutoEventWireup="true" CodeFile="maintereport.aspx.cs" Inherits="admin_mainterepoert" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
<div class="col-sm-6">
    <h2 class="m-0 text-dark">Maintenance Income Report</h2>
        <p>&nbsp;</p>
    </div><br />
                   <div class="table-responsive">
                       <asp:GridView ID="GridView1" runat="server" 
                           class="table table-bordered table-striped" AutoGenerateColumns="False" 
                           DataSourceID="SqlDataSource1">
                           <Columns>
                               <asp:BoundField DataField="tname" HeaderText="tname" SortExpression="tname" />
                               <asp:BoundField DataField="owner_name" HeaderText="owner_name" 
                                   SortExpression="owner_name" />
                               <asp:BoundField DataField="flatno" HeaderText="flatno" 
                                   SortExpression="flatno" />
                               <asp:BoundField DataField="amount" HeaderText="amount" ReadOnly="True" 
                                   SortExpression="amount" />
                           </Columns>
                       </asp:GridView>
                       <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                           ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" 
                           
                           SelectCommand="SELECT tm.tname, om.owner_name, fl.flatno, SUM(m.amount) AS amount FROM maintenance AS m INNER JOIN flat AS fl ON m.fid = fl.fid INNER JOIN owner_mstr AS om ON m.fid = om.fid INNER JOIN tower AS tm ON m.tid = tm.tid GROUP BY tm.tname, om.owner_name, fl.flatno">
                       </asp:SqlDataSource>
                   </div>

                   <div class="form-group">
                   <label>Total Maintenance Income: </label>
                   <asp:TextBox ID="txtinc" runat="server" class="form-control" ReadOnly="true" Width="500px" ></asp:TextBox>
                  
                   </div>
    </form>
</asp:Content>


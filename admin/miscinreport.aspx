<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmstr.master" AutoEventWireup="true" CodeFile="miscinreport.aspx.cs" Inherits="admin_miscinreport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<form id="form1" runat="server">
<div class="col-sm-6">
    <h2 class="m-0 text-dark">Miscellaneous Income Report</h2>
        <p>&nbsp;</p>
    </div><br />
                   <div class="table-responsive">
                       <asp:GridView ID="GridView1" runat="server" 
                           class="table table-bordered table-striped" AutoGenerateColumns="False" 
                           DataSourceID="SqlDataSource1">
                           <Columns>
                               <asp:BoundField DataField="tname" HeaderText="tname" SortExpression="tname" />
                               <asp:BoundField DataField="flatno" HeaderText="flatno" 
                                   SortExpression="flatno" />
                               <asp:BoundField DataField="owner_name" HeaderText="owner_name" 
                                   SortExpression="owner_name" />
                               <asp:BoundField DataField="purpose" HeaderText="purpose" 
                                   SortExpression="purpose" />
                               <asp:BoundField DataField="amount" HeaderText="amount" ReadOnly="True" 
                                   SortExpression="amount" />
                           </Columns>
                           </asp:GridView>
                           <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                           ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" 
                           SelectCommand="SELECT SUM(oc.amount) AS amount, tm.tname, om.owner_name, f.flatno, oc.purpose FROM other_collection AS oc INNER JOIN tower AS tm ON oc.tid = tm.tid INNER JOIN flat AS f ON oc.fid = f.fid INNER JOIN owner_mstr AS om ON f.fid = om.fid GROUP BY tm.tname, om.owner_name, f.flatno, oc.purpose">
                       </asp:SqlDataSource>
                           </div>
                           <div class="col-lg-4 col-md-4">
                        <div class="form-group">
                         <label> TOTAL MISCELLANEOUS INCOME:</label> <asp:TextBox ID="txtinc" runat="server" class="form-control" ReadOnly="true" Width="500px" ></asp:TextBox>
          </div> 
          </div> 

                           </form>
</asp:Content>


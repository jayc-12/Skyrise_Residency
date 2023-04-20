<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmstr.master" AutoEventWireup="true" CodeFile="transferinreport.aspx.cs" Inherits="admin_transferinreport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<form id="form1" runat="server">
<div class="col-sm-6">
    <h2 class="m-0 text-dark">Transfer Income Report</h2>
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
                         
                               <asp:BoundField DataField="newowner_name" HeaderText="newowner_name" 
                                   SortExpression="newowner_name" />
                               <asp:BoundField DataField="amount" HeaderText="amount" ReadOnly="True" 
                                   SortExpression="amount" />
                         
                           </Columns>
                           </asp:GridView>
                           <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                           ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" 
                           SelectCommand="SELECT transfer.newowner_name, SUM(transfer.amount) AS amount, owner_mstr.owner_name, tower.tname, flat.flatno FROM transfer INNER JOIN owner_mstr ON transfer.owner_id = owner_mstr.owner_id INNER JOIN flat ON owner_mstr.fid = flat.fid INNER JOIN tower ON flat.tid = tower.tid GROUP BY transfer.newowner_name, owner_mstr.owner_name, tower.tname, flat.flatno">
                       </asp:SqlDataSource>
                           </div>

                            <div class="col-lg-4 col-md-4">
                        <div class="form-group">
                         <label> TOTAL TRANSFER INCOME:</label> <asp:TextBox ID="txtinc" runat="server" class="form-control" ReadOnly="true" Width="500px" ></asp:TextBox>
          </div> 
          </div> 
                           </form>

</asp:Content>


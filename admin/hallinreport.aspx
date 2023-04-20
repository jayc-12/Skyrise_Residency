<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmstr.master" AutoEventWireup="true" CodeFile="hallinreport.aspx.cs" Inherits="admin_hallinreport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<form id="form1" runat="server">
<div class="col-sm-6">
    <h2 class="m-0 text-dark">Hall Income Report</h2>
        <p>&nbsp;</p>
    </div><br />
                   <div class="table-responsive">
                       <asp:GridView ID="GridView1" runat="server" 
                           class="table table-bordered table-striped" AutoGenerateColumns="False" 
                           DataSourceID="SqlDataSource1">
                           <Columns>
                               <asp:BoundField DataField="owner_name" HeaderText="owner_name" 
                                   SortExpression="owner_name" />
                               <asp:BoundField DataField="flatno" HeaderText="flatno" 
                                   SortExpression="flatno" />
                               <asp:BoundField DataField="halltype" HeaderText="halltype" 
                                   SortExpression="halltype" />
                               <asp:BoundField DataField="tname" HeaderText="tname" SortExpression="tname" />
                               <asp:BoundField DataField="totalamount" HeaderText="totalamount" 
                                   ReadOnly="True" SortExpression="totalamount" />
                           </Columns>
                           
                       </asp:GridView>
                       <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                           ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" 
                           SelectCommand="SELECT owner_mstr.owner_name, flat.flatno, hall_mstr.halltype, tower.tname, SUM(hall_booking.totalamount) AS totalamount FROM hall_booking INNER JOIN owner_mstr ON hall_booking.owner_id = owner_mstr.owner_id INNER JOIN flat ON owner_mstr.fid = flat.fid INNER JOIN tower ON flat.tid = tower.tid INNER JOIN hall_mstr ON hall_booking.hall_id = hall_mstr.hall_id GROUP BY owner_mstr.owner_name, flat.flatno, hall_mstr.halltype, tower.tname">
                       </asp:SqlDataSource>
                       </div>
                         <div class="col-lg-4 col-md-4">
                        <div class="form-group">
                         <label> TOTAL HALL INCOME:</label> <asp:TextBox ID="txtinc" runat="server" class="form-control" ReadOnly="true" Width="500px" ></asp:TextBox>
          </div> 
          </div> 

                       </form>
</asp:Content>



<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmstr.master" AutoEventWireup="true" CodeFile="miscexreport.aspx.cs" Inherits="admin_miscexreport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<form id="form1" runat="server">
<div class="col-sm-6">
    <h2 class="m-0 text-dark">Miscellaneous Expense Report</h2>
        <p>&nbsp;</p>
    </div><br />
                   <div class="table-responsive">
                       <asp:GridView ID="GridView1" runat="server" 
                           class="table table-bordered table-striped" AutoGenerateColumns="False" 
                           DataSourceID="SqlDataSource1">
                           <Columns>
                               <asp:BoundField DataField="purpose" HeaderText="purpose" 
                                   SortExpression="purpose" />
                               <asp:BoundField DataField="amount" HeaderText="amount" ReadOnly="True" 
                                   SortExpression="amount" />
                           </Columns>
                           </asp:GridView>
                           <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                           ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" 
                           SelectCommand="SELECT purpose, SUM(amount) AS amount FROM other_expense GROUP BY purpose">
                       </asp:SqlDataSource>
                           </div>

                            <div class="form-group">
                         <label> TOTAL MISCELLANEOUS EXPENSE:</label> <asp:TextBox ID="txtinc" runat="server" class="form-control" ReadOnly="true" Width="500px"></asp:TextBox>
          </div> 
          </div> 

                           </form>

</asp:Content>


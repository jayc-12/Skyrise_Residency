<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmstr.master" AutoEventWireup="true" CodeFile="salaryexreport.aspx.cs" Inherits="admin_salaryexreport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<form id="form1" runat="server">
<div class="col-sm-6">
    <h2 class="m-0 text-dark">Salary Expense Report</h2>
        <p>&nbsp;</p>
    </div><br />
                   <div class="table-responsive">
                       <asp:GridView ID="GridView1" runat="server" 
                           class="table table-bordered table-striped" AutoGenerateColumns="False" 
                           DataSourceID="SqlDataSource1">
                           <Columns>
                               <asp:BoundField DataField="emptype" HeaderText="emptype" 
                                   SortExpression="emptype" />
                               <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                               <asp:BoundField DataField="amount" HeaderText="amount" ReadOnly="True" 
                                   SortExpression="amount" />
                           </Columns>
                           </asp:GridView>
                           <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                           ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" 
                           SelectCommand="SELECT SUM(salary_expense.amount) AS amount, emp_type.emptype, empmstr.name FROM salary_expense INNER JOIN empmstr ON salary_expense.empid = empmstr.empid INNER JOIN emp_type ON empmstr.emptypeid = emp_type.emptypeid GROUP BY emp_type.emptype, empmstr.name">
                       </asp:SqlDataSource>
                           </div>

                           <div class="col-lg-4 col-md-4">
                        <div class="form-group">
                         <label> TOTAL SALARY EXPENSE:</label> <asp:TextBox ID="txtinc" runat="server" class="form-control" ReadOnly="true" Width="500px" ></asp:TextBox>
          </div> 
          </div> 

                           </form>
</asp:Content>


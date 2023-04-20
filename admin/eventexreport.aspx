﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmstr.master" AutoEventWireup="true" CodeFile="eventexreport.aspx.cs" Inherits="admin_eventexreport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<form id="form1" runat="server">
<div class="col-sm-6">
    <h2 class="m-0 text-dark">Event Expense Report</h2>
        <p>&nbsp;</p>
    </div><br />
                   <div class="table-responsive">
                       <asp:GridView ID="GridView1" runat="server" 
                           class="table table-bordered table-striped" AutoGenerateColumns="False" 
                           DataSourceID="SqlDataSource1">
                           <Columns>
                               <asp:BoundField DataField="event_name" HeaderText="event_name" 
                                   SortExpression="event_name" />
                               <asp:BoundField DataField="amount" HeaderText="amount" ReadOnly="True" 
                                   SortExpression="amount" />
                           </Columns>
                           </asp:GridView>
                           <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                           ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" 
                           SelectCommand="SELECT SUM(event_expense.amount) AS amount, event_mstr.event_name FROM event_mstr INNER JOIN event_expense ON event_mstr.event_id = event_expense.event_id GROUP BY event_mstr.event_name">
                       </asp:SqlDataSource>
                           </div>

                             <div class="col-lg-4 col-md-4">
                        <div class="form-group">
                         <label> TOTAL EVENT EXPENSE:</label> <asp:TextBox ID="txtinc" runat="server" class="form-control" ReadOnly="true" Width="500px"></asp:TextBox>
          </div> 
          </div> 

                           </form>
</asp:Content>


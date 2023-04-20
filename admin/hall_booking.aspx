<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmstr.master" AutoEventWireup="true" CodeFile="hall_booking.aspx.cs" Inherits="admin_hall_booking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <form id="form1" runat="server">
     <div class="col-sm-6">
    <h2 class="m-0 text-dark">View Hall Bookings</h2>
        <p>&nbsp;</p>
    </div>
                             <div class="table-responsive">
                                 <asp:GridView ID="GridView1" runat="server" 
                                     class="table table-bordered table-striped" AutoGenerateColumns="False" 
                                     DataKeyNames="bookhall_id" DataSourceID="SqlDataSource1">
                                     <Columns>
                                         <asp:BoundField DataField="bookhall_id" HeaderText="bookhall_id" 
                                             InsertVisible="False" ReadOnly="True" SortExpression="bookhall_id" Visible="false"/>
                                                <asp:BoundField DataField="tname" HeaderText="tname" 
                                             SortExpression="tname" ReadOnly="true" />
                                         <asp:BoundField DataField="flatno" HeaderText="flatno" 
                                             SortExpression="flatno" ReadOnly="true" />
                                         <asp:BoundField DataField="owner_name" HeaderText="owner_name" 
                                             SortExpression="owner_name" ReadOnly="true" />
                                               <asp:BoundField DataField="halltype" HeaderText="halltype" 
                                             SortExpression="halltype" ReadOnly="true" />
                                                <asp:BoundField DataField="amount" HeaderText="amount" 
                                             SortExpression="amount" ReadOnly="true" />                                    
                                       
                                      
                                         <asp:BoundField DataField="noofdays" HeaderText="noofdays" 
                                             SortExpression="noofdays" ReadOnly="true" />
                                               <asp:BoundField DataField="totalamount" HeaderText="totalamount" 
                                             SortExpression="totalamount" ReadOnly="true" />
                                       
                                      
                                         <asp:BoundField DataField="bookingdate" HeaderText="bookingdate" 
                                             SortExpression="bookingdate" ReadOnly="true" />
                                                <asp:BoundField DataField="date" HeaderText="date" 
                                             SortExpression="date" ReadOnly="true" />
                                       
                                      
                                         <asp:BoundField DataField="paymentmode" HeaderText="paymentmode" 
                                             SortExpression="paymentmode" ReadOnly="true" />
                                         <asp:BoundField DataField="bankname" HeaderText="bankname" 
                                             SortExpression="bankname"  />
                                         <asp:BoundField DataField="chequeno" HeaderText="chequeno" 
                                             SortExpression="chequeno" />
                                         <asp:BoundField DataField="accountno" HeaderText="accountno" 
                                             SortExpression="accountno" />
                                         <asp:BoundField DataField="status" HeaderText="status" 
                                             SortExpression="status" />
                                         <asp:CommandField ShowEditButton="True" />
                                         <asp:CommandField ShowDeleteButton="True" />
                                     </Columns>
                                 </asp:GridView>
                                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                     ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" 
                                     DeleteCommand="DELETE FROM hall_booking WHERE (bookhall_id = @bookhall_id)" 
                                     SelectCommand="SELECT hall_booking.bookhall_id, hall_mstr.halltype, owner_mstr.owner_name, tower.tname, flat.flatno, hall_booking.amount, hall_booking.noofdays, hall_booking.date, hall_booking.bookingdate, hall_booking.totalamount, hall_booking.status, hall_booking.paymentmode, hall_booking.bankname, hall_booking.chequeno, hall_booking.accountno FROM hall_booking INNER JOIN hall_mstr ON hall_booking.hall_id = hall_mstr.hall_id INNER JOIN owner_mstr ON hall_booking.owner_id = owner_mstr.owner_id INNER JOIN flat ON owner_mstr.fid = flat.fid INNER JOIN tower ON flat.tid = tower.tid" 
                                     
                                     UpdateCommand="UPDATE hall_booking SET status = @status, bankname = @bankname, chequeno = @chequeno, accountno = @accountno WHERE (bookhall_id = @bookhall_id)">
                                     <DeleteParameters>
                                         <asp:Parameter Name="bookhall_id" />
                                     </DeleteParameters>
                                     <UpdateParameters>
                                         <asp:Parameter Name="status" />
                                         <asp:Parameter Name="bankname" />
                                         <asp:Parameter Name="chequeno" />
                                         <asp:Parameter Name="accountno" />
                                         <asp:Parameter Name="bookhall_id" />
                                     </UpdateParameters>
                                 </asp:SqlDataSource>
                                 
                             </div>
    </form>
</asp:Content>


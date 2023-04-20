<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.master" AutoEventWireup="true" CodeFile="hallbook.aspx.cs" Inherits="user_hallbook" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="h2">
Hall Booking
</div><br /><br />
                    
                    <form id="Form1" runat="server">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <div class="form-group">
                <asp:Label ID ="lblhdtname" runat="server" Text="Tower Name:" ></asp:Label><br />
                        <asp:Label ID="lbltname" runat="server" Text="" class="form-control" 
                        Width="600px"></asp:Label>
                                   </div>
                                   <div class="form-group">
                <asp:Label ID ="Label1" runat="server" Text="Flat No:" ></asp:Label><br />
                        <asp:Label ID="lblflatno" runat="server" Text="" class="form-control" 
                        Width="600px"></asp:Label>
                                   </div>
                                   <div class="form-group">
                <asp:Label ID ="Label3" runat="server" Text="Owner Name:" ></asp:Label><br />
                        <asp:Label ID="lblownname" runat="server" Text="" class="form-control" 
                        Width="600px"></asp:Label>
                                   </div>
                                   <div class="form-group">
                <asp:Label ID ="Label2" runat="server" Text="Hall Type:" ></asp:Label><br />
                                       <asp:DropDownList ID="drphalltype" runat="server" class="form-control" 
                                           Width="600px" AutoPostBack="true" 
                                           onselectedindexchanged="drphalltype_SelectedIndexChanged">
                                       </asp:DropDownList>
                                   </div>
                                   <div class="form-group">
                                     <asp:Label ID ="Label4" runat="server" Text="Booking Date:" ></asp:Label><br />                                   
                                       <asp:TextBox ID="txtbookdate" runat="server" Width="600px" class="form-control"  placeholder="Enter Booking date" ></asp:TextBox>
                                       <asp:RequiredFieldValidator ID="rqvbookdate" runat="server" ErrorMessage="Enter booking date" ValidationGroup="1" SetFocusOnError="True" ControlToValidate="txtbookdate"></asp:RequiredFieldValidator>
                                       <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" 
                                           Enabled="true" TargetControlID="txtbookdate"
                                           DefaultView="Months" ClearTime="True" DaysModeTitleFormat="dd-mm-yyyy" />
                                   </div>
                                   <div class="form-group">
                                     <asp:Label ID ="Label5" runat="server" Text="No. of Days:" ></asp:Label><br />                                   
                                       <asp:TextBox ID="txtnofdays" runat="server" Width="600px" class="form-control"  
                                           placeholder="Enter No of Days " AutoPostBack="True" 
                                           ontextchanged="txtnofdays_TextChanged" ></asp:TextBox>
                                       <asp:RequiredFieldValidator ID="rqvnofdays" runat="server" ErrorMessage="Enter booking date" ValidationGroup="1" ControlToValidate="txtnofdays" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                       <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtnofdays" Enabled="true" FilterType="Numbers" />
                                   </div>
                                   <div class="form-group">
                                     <asp:Label ID ="Label6" runat="server" Text="Amount:" ></asp:Label><br />                                   
                                       <asp:Label ID="lblamount" runat="server" Text="" Width="600px" class="form-control"></asp:Label>
                                      </div>
                                       <div class="form-group">
                                     <asp:Label ID ="Label7" runat="server" Text=" Total Amount:" ></asp:Label><br />                                   
                                       <asp:Label ID="lbltotalamount" runat="server" Text="" Width="600px" class="form-control"></asp:Label>
                                      </div>

                                      
                                       <div class="form-group"><label>Payment Method:</label><br />
         <asp:RadioButtonList ID="rblpaymethod" runat="server"
             AutoPostBack="True" 
             onselectedindexchanged="rblpaymethod_SelectedIndexChanged">
             <asp:ListItem>Cash</asp:ListItem>
             <asp:ListItem>Cheque</asp:ListItem>
             <asp:ListItem>E-wallet</asp:ListItem>
         </asp:RadioButtonList>
         <asp:RequiredFieldValidator ID="rqvpaymethod" runat="server" ErrorMessage="please select any one option" ControlToValidate="rblpaymethod" ValidationGroup="1"></asp:RequiredFieldValidator>
     </div>                           
                        
                        <asp:Panel ID="pnlpay" runat="server" 
     class="form-control" BorderStyle="None" >
                              <img alt="Phonepay" <%--class="style2"--%> src="phonepay.jpg" Height="200px" Width="200px" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <img alt="paytm" <%--class="style3--%>" src="paytm.jpg" Height="200px" Width="200px" />
                            <br />
                            <br />
                            <asp:Label ID="lblinfo" runat="server" ForeColor="#3333CC" Height="16px" 
                                Text="Scan Anyone QR Code and Pay Your Maintenace . After Payment wait for Sometime Your Payment Status will be Updated. "></asp:Label>
                        </asp:Panel>
                       
                      
                       
                            <div class="form-group"><asp:Label ID="lblnote" runat="server" 
                                Text="If You Want To Pay Your TransferFee By Cash/Cheque Please Visit Office room Between 9 AM TO 5PM  and Submit your TransferFee There"></asp:Label></div>
                       

                                       <div class="form-group">
                                     <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><asp:Button ID="btnbookhall" runat="server" Text="BOOK" class="genric-btn primary" 
                                   ValidationGroup="1" onclick="btnbookhall_Click"  />
                                      </div><br />
                                      <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
                                      <div class="form-group">
                                      <asp:Label ID="lblfid" runat="server" Text="" class="form-control" Visible ="false"></asp:Label>
                                      </div> 

                                        <div class="form-group">
                         
                                <div class="table-responsive">
                                    <asp:GridView ID="GridView1" runat="server" 
                                        CssClass="table table-striped table-bordered table-hover" 
                                        AutoGenerateColumns="False" DataKeyNames="bookhall_id" 
                                        DataSourceID="SqlDataSource1">
                                        <Columns>
                                            <asp:BoundField DataField="bookhall_id" HeaderText="bookhall_id" 
                                                InsertVisible="False" ReadOnly="True" SortExpression="bookhall_id" Visible="false" />
                                            <asp:BoundField DataField="flatno" HeaderText="flatno" 
                                                SortExpression="flatno" />
                                            <asp:BoundField DataField="owner_name" HeaderText="owner_name" 
                                                SortExpression="owner_name" />
                                            <asp:BoundField DataField="halltype" HeaderText="halltype" 
                                                SortExpression="halltype" />
                                            <asp:BoundField DataField="noofdays" HeaderText="noofdays" 
                                                SortExpression="noofdays" />
                                            <asp:BoundField DataField="amount" HeaderText="amount" 
                                                SortExpression="amount" />
                                            <asp:BoundField DataField="totalamount" HeaderText="totalamount" 
                                                SortExpression="totalamount" />
                                            <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                                            <asp:BoundField DataField="bookingdate" HeaderText="bookingdate" 
                                                SortExpression="bookingdate" />
                                            <asp:BoundField DataField="paymentmode" HeaderText="paymentmode" 
                                                SortExpression="paymentmode" />
                                            <asp:BoundField DataField="bankname" HeaderText="bankname" 
                                                SortExpression="bankname" />
                                            <asp:BoundField DataField="chequeno" HeaderText="chequeno" 
                                                SortExpression="chequeno" />
                                            <asp:BoundField DataField="accountno" HeaderText="accountno" 
                                                SortExpression="accountno" />
                                            <asp:BoundField DataField="status" HeaderText="status" 
                                                SortExpression="status" />
                                        </Columns>
                                     
                                    </asp:GridView>
                                      
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" 
                                        
                                        SelectCommand="SELECT hall_booking.bookhall_id, flat.flatno, owner_mstr.owner_name, hall_mstr.halltype, hall_booking.noofdays, hall_booking.amount, hall_booking.totalamount, hall_booking.date, hall_booking.bookingdate, hall_booking.status, hall_booking.paymentmode, hall_booking.bankname, hall_booking.chequeno, hall_booking.accountno FROM hall_booking INNER JOIN hall_mstr ON hall_booking.hall_id = hall_mstr.hall_id INNER JOIN owner_mstr ON hall_booking.owner_id = owner_mstr.owner_id INNER JOIN flat ON owner_mstr.fid = flat.fid">
                                    </asp:SqlDataSource>
                                      
                                        </div> 
                                        </div> 
                                   </form>

</asp:Content>


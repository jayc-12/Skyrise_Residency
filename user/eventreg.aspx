<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.master" AutoEventWireup="true" CodeFile="eventreg.aspx.cs" Inherits="user_eventreg" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="h2">
Event Registration
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
                        <label>Event Type</label> 
                            <br />
                            <asp:DropDownList ID="drpeventtype" runat="server" 
                            class="btn btn-default dropdown-toggle dropdown-hover dropdown-icon" 
                            AutoPostBack="true" onselectedindexchanged="drpeventtype_SelectedIndexChanged">
                            </asp:DropDownList><br /><br />
                </div>
                   <div class="form-group">
                <asp:Label ID ="Label4" runat="server" Text="Members:" ></asp:Label><br />
                                        <asp:TextBox ID="txtevemembers" runat="server" Width="600px" 
                           class="form-control"  placeholder="Enter no. of Members" 
                           AutoPostBack="True" ontextchanged="txtevemembers_TextChanged"></asp:TextBox>
                                      <asp:RequiredFieldValidator ID="rqvevemember" runat="server" ErrorMessage="Enter No. of Members" ControlToValidate="txtevemembers" ValidationGroup="1"></asp:RequiredFieldValidator>
                       <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtevemembers" Enabled="true" FilterType="Numbers" />
                                                   </div>

                             <div class="form-group">
                <asp:Label ID ="Label2" runat="server" Text="Amount:" ></asp:Label><br />
                        <asp:Label ID="lblamount" runat="server" Text="" class="form-control" 
                        Width="600px"></asp:Label>
                                   </div>
                            
                             <div class="form-group">
                <asp:Label ID ="Label5" runat="server" Text="Total Amount:" ></asp:Label><br />
                        <asp:Label ID="lbltotalamt" runat="server" class="form-control" 
                        Width="600px" ClientIDMode="AutoID" ViewStateMode="Enabled"></asp:Label>
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
                       <%-- <div class="form-group>--%><asp:Panel ID="pnlpay" runat="server" 
     class="form-control" BorderStyle="None" >
                            <img alt="Phonepay" <%--class="style2"--%> src="phonepay.jpg" Height="200px" Width="200px" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <img alt="paytm" <%--class="style3"--%> src="paytm.jpg" Height="200px" Width="200px" />
                            <br />
                            <br />
                            <asp:Label ID="lblinfo" runat="server" ForeColor="#3333CC" Height="16px" 
                                Text="Scan Anyone QR Code and Pay Your Maintenace . After Payment wait for Sometime Your Payment Status will be Updated. "></asp:Label>
                        </asp:Panel><%--</div>--%>
                      
                       
                            <asp:Label ID="lblnote" runat="server" 
                                Text="If You Want To Pay Your Maintenance By Cash/Cheque Please Visit Office room Between 9 AM TO 5PM  and Submit your Maintenace There"></asp:Label>
                       

                                    <div class="form-group">
                <asp:Label ID ="lblfid" runat="server" Text="" Visible="false" ></asp:Label><br />
                                   </div>

                                    <div class="form-group">
                      <br /><br /><br /><br /><br /><br /><br /><br /><br /><asp:Button ID="btnevered" runat="server" Text="SEND" class="genric-btn primary" 
                                   ValidationGroup="1" onclick="btnevered_Click" />
                                   </div>

                                   <div class="form-group">
                <asp:Label ID ="lblmsg" runat="server" Text=""></asp:Label><br />
                                   </div>

                                      <div class="table-responsive">
                                    <asp:GridView ID="GridView1" runat="server" 
                                        CssClass="table table-striped table-bordered table-hover" 
                                        AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True" 
                                              DataKeyNames="eventpaymentid" DataSourceID="SqlDataSource1">
                                        <Columns>
                                            <asp:BoundField DataField="eventpaymentid" HeaderText="eventpaymentid" 
                                                InsertVisible="False" ReadOnly="True" SortExpression="eventpaymentid" Visible="false" />
                                            <asp:BoundField DataField="flatno" HeaderText="flatno" 
                                                SortExpression="flatno" />
                                          
                                                 <asp:BoundField DataField="owner_name" HeaderText="owner_name" SortExpression="owner_name"/>
                                                  <asp:BoundField DataField="event_name" HeaderText="event_name" 
                                                SortExpression="event_name" />
                                            <asp:BoundField DataField="members" HeaderText="members" 
                                                SortExpression="members" />
                                            <asp:BoundField DataField="amount" HeaderText="amount" 
                                                SortExpression="amount" />
                                            <asp:BoundField DataField="totalamount" HeaderText="totalamount" 
                                                SortExpression="totalamount" />                                           
                                            <asp:BoundField DataField="paymentmode" HeaderText="paymentmode" 
                                                SortExpression="paymentmode" />
                                            <asp:BoundField DataField="bankname" HeaderText="bankname" 
                                                SortExpression="bankname" />
                                            <asp:BoundField DataField="chequeno" HeaderText="chequeno" 
                                                SortExpression="chequeno" />
                                            <asp:BoundField DataField="accountno" HeaderText="accountno" 
                                                SortExpression="accountno" />
                                            <asp:BoundField DataField="status" HeaderText="status" 
                                                SortExpression="status"/>
                                          
                                        </Columns>
                                        </asp:GridView> 


                                          <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                              ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" 
                                              
                                              SelectCommand="SELECT event_payment.eventpaymentid, event_mstr.event_name, owner_mstr.owner_name, event_payment.amount, event_payment.members, event_payment.totalamount, event_payment.status, flat.flatno, event_payment.paymentmode, event_payment.bankname, event_payment.chequeno, event_payment.accountno FROM event_payment INNER JOIN owner_mstr ON event_payment.owner_id = owner_mstr.owner_id INNER JOIN event_mstr ON event_payment.event_id = event_mstr.event_id INNER JOIN flat ON owner_mstr.fid = flat.fid">
                                          </asp:SqlDataSource>


                </form>
</asp:Content>


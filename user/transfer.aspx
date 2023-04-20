<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.master" AutoEventWireup="true" CodeFile="transfer.aspx.cs" Inherits="user_transfer" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="h2">
Transfer Details
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
                                     <asp:Label ID ="Label4" runat="server" Text="New Owner Name:" ></asp:Label><br />                                   
                                       <asp:TextBox ID="txtnewownername" runat="server" Width="600px" class="form-control"  placeholder="Enter New Owner Name" ></asp:TextBox>
                                       <asp:RequiredFieldValidator ID="rqvnewownername" runat="server" ErrorMessage="Enter New Owner Name please" ValidationGroup="1" SetFocusOnError="True" ControlToValidate="txtnewownername"></asp:RequiredFieldValidator>
                                       <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" Enabled="true" TargetControlID="txtnewownername" FilterType="LowercaseLetters,UppercaseLetters,Custom" ValidChars=" "  />
                                   </div>
                                   <div class="form-group">
                                     <asp:Label ID ="Label6" runat="server" Text="Amount:" ></asp:Label><br />                                   
                                       <asp:Label ID="lblamt" runat="server" Text="" Width="600px" class="form-control"></asp:Label>
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
                      <%--  <div class="form-group>--%>
                        <asp:Panel ID="pnlpay" runat="server" 
     class="form-control" BorderStyle="None" Height="200px" Width="600px" >
                            <img alt="Phonepay" src="phonepay.jpg" Height="200px" Width="200px" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <img alt="paytm" src="paytm.jpg" Height="200px" Width="200px" />
                            <br />
                            <br />
                            <asp:Label ID="lblinfo" runat="server" ForeColor="#3333CC" Height="16px" 
                                Text="Scan Anyone QR Code and Pay Your Maintenace . After Payment wait for Sometime Your Payment Status will be Updated. "></asp:Label>
                        </asp:Panel>
                       <%-- </div>--%>
                      
                       
                            <div class="form-group"><asp:Label ID="lblnote" runat="server" 
                                Text="If You Want To Pay Your TransferFee By Cash/Cheque Please Visit Office room Between 9 AM TO 5PM  and Submit your TransferFee There"></asp:Label></div>
                       

                                         <div class="form-group">
                                    <br /><br /><br /> <asp:Button ID="btntransfer" runat="server" Text="SUBMIT" class="genric-btn primary" 
                                   ValidationGroup="1" onclick="btntransfer_Click" />
                                      </div><br />
                                       <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
                                      <div class="form-group">
                                      <asp:Label ID="lblfid" runat="server" Text="" class="form-control" Visible ="false"></asp:Label>
                                      </div>
                                      
                                       <div class="form-group">
                         
                                <div class="table-responsive">
                                
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                        DataKeyNames="transferid" DataSourceID="SqlDataSource1"  CssClass="table table-striped table-bordered table-hover" >
                                        <Columns>
                                            <asp:BoundField DataField="transferid" HeaderText="transferid" 
                                                InsertVisible="False" ReadOnly="True" SortExpression="transferid" Visible="false" />
                                            <asp:BoundField DataField="owner_name" HeaderText="owner_name" 
                                                SortExpression="owner_name" />
                                            <asp:BoundField DataField="newowner_name" HeaderText="newowner_name" 
                                                SortExpression="newowner_name" />
                                            <asp:BoundField DataField="amount" HeaderText="amount" 
                                                SortExpression="amount" />
                                            <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
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
                                        
                                        SelectCommand="SELECT transfer.transferid, owner_mstr.owner_name, transfer.newowner_name, transfer.amount, transfer.date, transfer.status, transfer.paymentmode, transfer.bankname, transfer.chequeno, transfer.accountno FROM transfer INNER JOIN owner_mstr ON transfer.owner_id = owner_mstr.owner_id">
                                    </asp:SqlDataSource>
                                
                                </div>
                                </div> 
    </form>
</asp:Content>


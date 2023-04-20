<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.master" AutoEventWireup="true" CodeFile="umaintenance.aspx.cs" Inherits="user_umaintenance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 200px;
            height: 200px;
        }
        .style3
        {
            width: 200px;
            height: 200px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
<h2>Maintenance Details</h2>
</div><br /><br />
<form runat="server">    
 <div class="form-group"><label>Tower Name:</label><br /> <asp:Label ID="lbltname" 
          runat="server" class="form-control" Width="600px"></asp:Label>
          <asp:Label ID="lbltid" 
          runat="server" class="form-control" Width="600px" Visible="False"></asp:Label>
          </div> 
             <div class="form-group"><label>Flat No:</label><br /> <asp:Label ID="lblflatno" 
                     runat="server" class="form-control" Width="600px"></asp:Label>
                     <asp:Label ID="lblfid" 
          runat="server" class="form-control" Width="600px" Visible="False"></asp:Label></div> 
             <div class="form-group"><label>Name:</label><br /> <asp:Label ID="lbluname" 
                     runat="server" class="form-control" Width="600px"></asp:Label></div> 
                     <div class="form-group">
                     <label>Duration:</label><br />
                         <asp:DropDownList ID="drpduration" runat="server" class="form-control" 
                             Width="600px" AutoPostBack="True" 
                             onselectedindexchanged="drpduration_SelectedIndexChanged">
                         </asp:DropDownList>
</div>
 <div class="form-group"><label>Payment Amount:</label><br />
     <asp:TextBox ID="txtpayamt" runat="server" class="form-group" Width="600px" ReadOnly="true"></asp:TextBox>
     <asp:Label
         ID="lblamt" runat="server" Visible="False"></asp:Label></div> 

     <div class="form-group"><label>Payment Method:</label><br />
         <asp:RadioButtonList ID="rblpaymethod" runat="server"
             AutoPostBack="True" 
             onselectedindexchanged="rblpaymethod_SelectedIndexChanged">
             <asp:ListItem>Cash</asp:ListItem>
             <asp:ListItem>Cheque</asp:ListItem>
             <asp:ListItem>E-wallet</asp:ListItem>
         </asp:RadioButtonList>
         <asp:RequiredFieldValidator ID="rqvpaymethod" runat="server" ErrorMessage="please select any one option" ControlToValidate="rblpaymethod" ValidationGroup="1"></asp:RequiredFieldValidator>
     </div>              <div class="form-group>             
                        <asp:Panel ID="pnlpay" runat="server" 
     class="form-control" BorderStyle="None" >
                            <img alt="Phonepay" class="style2" src="phonepay.jpg" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <img alt="paytm" class="style3" src="paytm.jpg" />
                            <br />
                            <br />
                            <asp:Label ID="lblinfo" runat="server" ForeColor="#3333CC" Height="16px" 
                                Text="Scan Anyone QR Code and Pay Your Maintenace . After Payment wait for Sometime Your Payment Status will be Updated. "></asp:Label>
                        </asp:Panel><br /><br /></div>
                      
                       
                            <div class="form-group><asp:Label ID="lblnote" runat="server" 
                                Text="If You Want To Pay Your Maintenance By Cash/Cheque Please Visit Office room Between 9 AM TO 5PM  and Submit your Maintenace There"></asp:Label></div><br />
                       

                          <div class="form-group">
                                   <asp:Button ID="btnpay" runat="server" Text="Pay" class="genric-btn primary" 
                                   ValidationGroup="1" onclick="btnpay_Click"  />
                                      </div><br />
                                      <div>
                                          <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
                                      </div>

                                      <div class="table-responsive">
                                          <asp:GridView ID="GridView1" runat="server"  
                                              CssClass="table table-striped table-bordered table-hover" 
                                              AutoGenerateColumns="False" DataKeyNames="maiid" DataSourceID="SqlDataSource1">
                                              <Columns>
                                                  <asp:BoundField DataField="maiid" HeaderText="maiid" InsertVisible="False" 
                                                      ReadOnly="True" SortExpression="maiid" Visible="false" />
                                                  <asp:BoundField DataField="tname" HeaderText="tname" SortExpression="tname" />
                                                  <asp:BoundField DataField="flatno" HeaderText="flatno" 
                                                      SortExpression="flatno" />
                                                  <asp:BoundField DataField="owner_name" HeaderText="owner_name" 
                                                      SortExpression="owner_name" />
                                                  <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                                                  <asp:BoundField DataField="maintenance" HeaderText="maintenance" 
                                                      SortExpression="maintenance" />
                                                  <asp:BoundField DataField="timeperiod" HeaderText="timeperiod" 
                                                      SortExpression="timeperiod" />
                                                  <asp:BoundField DataField="amount" HeaderText="amount" 
                                                      SortExpression="amount" />
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
                                              SelectCommand="SELECT maintenance.maiid, tower.tname, flat.flatno, owner_mstr.owner_name, maintenance.date, tower.maintenance, maintenance.timeperiod, maintenance.amount, maintenance.paymentmode, maintenance.bankname, maintenance.chequeno, maintenance.accountno, maintenance.status FROM maintenance INNER JOIN tower ON maintenance.tid = tower.tid INNER JOIN flat ON maintenance.fid = flat.fid AND tower.tid = flat.tid INNER JOIN owner_mstr ON flat.fid = owner_mstr.fid">
                                           <SelectParameters>
                                                 <asp:SessionParameter Name="fid" SessionField="fid" Type="Int32" />
                                             </SelectParameters>

                                          </asp:SqlDataSource>
                                      
                                      </div>
</form>                
</asp:Content>


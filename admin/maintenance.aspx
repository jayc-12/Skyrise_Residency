<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmstr.master" AutoEventWireup="true" CodeFile="maintenance.aspx.cs" Inherits="admin_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <div class="col-sm-6">
    <h2 class="m-0 text-dark">Maintenance Details</h2>
        <p>&nbsp;</p>
    </div>
                 
  <form id="Form1" runat="server">
  <asp:ScriptManager ID="ScriptManager1" runat="server">
  </asp:ScriptManager>
                        <div class="col-sm-6">
                        <div class="form-group">
                        <label>Tower Name</label><br />
                        <%--<input type="text" class="form-control" placeholder="Enter ...">--%>
                            <asp:DropDownList ID="drptname" runat="server" 
                                class="btn btn-default dropdown-toggle dropdown-hover dropdown-icon" 
                                AutoPostBack="True" onselectedindexchanged="drptname_SelectedIndexChanged">
                            </asp:DropDownList><br />
                             </div>
                      </div>

                      <div class="col-sm-6">
                        <div class="form-group">
                        <label>Flat Number</label><br />
                            <asp:DropDownList ID="drpflatno" runat="server" 
                                class="btn btn-default dropdown-toggle dropdown-hover dropdown-icon" 
                                AutoPostBack="True" 
                                onselectedindexchanged="drpflatno_SelectedIndexChanged">
                            </asp:DropDownList><br />                                         
                      </div>
                      </div>

                      <div class="col-sm-6">
                        <div class="form-group">
                        <label>Owner Name</label><br />
                            <asp:TextBox ID="txtownernm" runat="server" ReadOnly="true" class="form-control" Width="500px"></asp:TextBox>                     
                            

                      </div>
                      </div>

                      <div class="col-sm-6">
                        <div class="form-group">
                        <label>Duration</label><br />
                       <%-- <input type="text" class="form-control" placeholder="Enter ...">--%>
                            <asp:DropDownList ID="drpduration" runat="server" AutoPostBack="True" 
                                Enabled="True" 
                                class="btn btn-default dropdown-toggle dropdown-hover dropdown-icon" 
                                onselectedindexchanged="drpduration_SelectedIndexChanged">                                
                            </asp:DropDownList>
                         <%--   <asp:RequiredFieldValidator ID="rqfduration" runat="server" ErrorMessage="enter no. of flats" SetFocusOnError="True" ControlToValidate="" ValidationGroup="1"></asp:RequiredFieldValidator>
--%>
                      </div>
                      </div>

                      <div class="col-sm-6">
                        <div class="form-group">
                        <label>Payment Amount</label><asp:Label ID="lblamt" runat="server" Text="" Visible ="false" ></asp:Label>
                      <%--  <input type="text" class="form-control" placeholder="Enter ...">--%>
                            <asp:TextBox ID="txtpaymentamt" runat="server" class="form-control" Enabled="False" Width="500px"></asp:TextBox>
                            <%--<asp:RequiredFieldValidator ID="rqfpayamt" runat="server" ErrorMessage="enter Payment amount" SetFocusOnError="True" ControlToValidate="txtpayamt"></asp:RequiredFieldValidator>--%>

                      </div>
                      </div>

                      <div class="col-sm-6">
                        <div class="form-group">
                        <label>Payment Mode</label>
                              <asp:RadioButtonList ID="rblpaymentmode" runat="server" AutoPostBack="True" 
                                onselectedindexchanged="rblpaymentmode_SelectedIndexChanged">
                                <asp:ListItem>Cash</asp:ListItem>
                                <asp:ListItem>Cheque</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="rqvpaymentmode" runat="server" ErrorMessage="please select any one payment mode" ControlToValidate="rblpaymentmode" ValidationGroup="1"></asp:RequiredFieldValidator><br />

                      </div>
                      </div>

                      <div class="form-group">
                          <asp:Panel ID="pnlpmode" runat="server">
                            <label>Bank Name:</label>
                                 
                                  <asp:TextBox ID="txtbankname" runat="server" class="form-control" placeholder="Bank Name" Width="500px"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="rffno" runat="server" 
                                   Display="Dynamic" ControlToValidate="txtbankname"  ForeColor ="#E2213E" 
                                   ValidationGroup="1">Please Enter Bank Name</asp:RequiredFieldValidator><br /> 
                              <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server"  Enabled="True" TargetControlID="txtbankname" FilterType="Custom,LowercaseLetters,UppercaseLetters" ValidChars=" " />                         
                             
                          <label>Account No:</label>
                             
                                  <asp:TextBox ID="txtaccno" runat="server" class="form-control" placeholder="Account No" Width="500px"></asp:TextBox>
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                   Display="Dynamic" ControlToValidate="txtaccno"  ForeColor ="#E2213E" 
                                   ValidationGroup="1">Please Enter Account No</asp:RequiredFieldValidator> <br />  
                              <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" Enabled="True" TargetControlID="txtaccno" FilterType="Numbers" />                         
                            

                          <label>Cheque No:</label>
                              
                                  <asp:TextBox ID="txtcheckno" runat="server" class="form-control" placeholder="Cheque No" Width="500px"></asp:TextBox>
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                   Display="Dynamic" ControlToValidate="txtcheckno"  ForeColor ="#E2213E" 
                                   ValidationGroup="1">Please Enter Cheque No</asp:RequiredFieldValidator>
                              <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" Enabled="True" TargetControlID="txtcheckno" FilterType="Numbers" />                                
                      
                          

                          </asp:Panel>
                      </div><br />
                      
                    

                      
                                           
                      <div class="card-footer">
                  <%--<button type="submit" class="btn btn-primary">Submit</button>--%>
                          <asp:Button ID="btnminsert" runat="server" Text="Submit" 
                              class="btn btn-primary" onclick="btnminsert_Click" ValidationGroup="1" />
                         </div><br />
                    <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label><br />

                    <div class="table-responsive">
                        <asp:GridView ID="GridView1" runat="server" 
                            class="table table-bordered table-striped" AutoGenerateColumns="False" 
                            DataKeyNames="maiid" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="maiid" HeaderText="maiid" InsertVisible="False" 
                                    ReadOnly="True" SortExpression="maiid" Visible="false"/>
                                <asp:BoundField DataField="tname" HeaderText="tname" 
                                    SortExpression="tname" ReadOnly="true" />
                                <asp:BoundField DataField="flatno" HeaderText="flatno" 
                                    SortExpression="flatno" ReadOnly="true" />
                                <asp:BoundField DataField="owner_name" HeaderText="owner_name" 
                                    SortExpression="owner_name" ReadOnly="true"  />
                                <asp:BoundField DataField="maintenance" HeaderText="maintenance" 
                                    SortExpression="maintenance" ReadOnly="true" />
                                <asp:BoundField DataField="paymentmode" HeaderText="paymentmode" 
                                    SortExpression="paymentmode" ReadOnly="true" />
                                <asp:BoundField DataField="timeperiod" HeaderText="timeperiod" 
                                    SortExpression="timeperiod" />
                                <asp:BoundField DataField="amount" HeaderText="amount" 
                                    SortExpression="amount" />
                                <asp:BoundField DataField="date" HeaderText="date" 
                                    SortExpression="date" ReadOnly="true" />
                                <asp:BoundField DataField="bankname" HeaderText="bankname" 
                                    SortExpression="bankname" />
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
                            DeleteCommand="DELETE FROM maintenance WHERE (maiid = @maiid)" 
                            SelectCommand="SELECT maintenance.maiid, owner_mstr.owner_name, tower.tname, tower.maintenance, flat.flatno, maintenance.amount, maintenance.date, maintenance.paymentmode, maintenance.timeperiod, maintenance.bankname, maintenance.chequeno, maintenance.accountno, maintenance.status FROM maintenance INNER JOIN flat ON maintenance.fid = flat.fid INNER JOIN tower ON maintenance.tid = tower.tid AND flat.tid = tower.tid INNER JOIN owner_mstr ON flat.fid = owner_mstr.fid" 
                            
                            
                            UpdateCommand="UPDATE maintenance SET bankname = @bankname, chequeno = @chequeno, accountno = @accountno, status = @status WHERE (maiid = @maiid)">
                            <DeleteParameters>
                                <asp:Parameter Name="maiid" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="bankname" />
                                <asp:Parameter Name="chequeno" />
                                <asp:Parameter Name="accountno" />
                                <asp:Parameter Name="status" />
                                <asp:Parameter Name="maiid" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    
                    </div>
                

    </form>
 
</asp:Content>
    

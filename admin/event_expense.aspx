<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmstr.master" AutoEventWireup="true" CodeFile="event_expense.aspx.cs" Inherits="admin_expense" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<form runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    
 <div class="col-sm-6">
    <h2 class="m-0 text-dark">Event Expense Details</h2>
        <p>&nbsp;</p>
    </div>

    
                        <div class="col-sm-6">
                        <div class="form-group">                                
                      </div>
                      </div>

                      <div class="col-sm-6">
                        <div class="form-group">
                        <label>Event Name</label><br/>
                      
                            <asp:DropDownList ID="drpevname" runat="server" 
                                class="btn btn-default dropdown-toggle dropdown-hover dropdown-icon" 
                                AutoPostBack="True" 
                                onselectedindexchanged="drpevname_SelectedIndexChanged" >
                            </asp:DropDownList>
                                                                         
                      </div>
                      </div><br />

                      <div class="col-sm-6">
                        <div class="form-group">
                        <label>Amount</label>
                   
                         <asp:TextBox ID="txtevamt" runat="server" class="form-control" placeholder="Enter Amount" Width="500px"></asp:TextBox><br />
                            <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" Enabled="True" TargetControlID="txtevamt" FilterType="Numbers">
                            </asp:FilteredTextBoxExtender>
                            
                         <asp:RequiredFieldValidator ID="rqfevamt" runat="server" 
                                ErrorMessage="Enter Event Amount" ControlToValidate="txtevamt" 
                                SetFocusOnError="True" Display="Dynamic" ValidationGroup="2"></asp:RequiredFieldValidator>
                      </div>
                      <asp:Label ID="lbldate" runat="server" Text=""></asp:Label>
    </div>
                        <asp:Button ID="btnevxinsert" class="btn btn-primary" runat="server" 
                            Text="Submit"  ValidationGroup="2" 
        onclick="btnevxinsert_Click"/><br />
                        
                        <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label><br />
                            

                            <div class="table-responsive">
                            
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                        DataSourceID="SqlDataSource1" DataKeyNames="eventexpense_id"  
                                         class="table table-bordered table-striped">
                                         <Columns>
                                            <asp:BoundField DataField="eventexpense_id" HeaderText="eventexpense_id" 
                                                 ReadOnly="True" SortExpression="eventexpense_id" Visible="false"/>
                                            <asp:BoundField DataField="event_name" HeaderText="event_name" 
                                                SortExpression="event_name" ReadOnly="true"/>
                                            <asp:BoundField DataField="amount" HeaderText="amount" 
                                                SortExpression="amount" />
                                            <asp:BoundField DataField="event_date" HeaderText="event_date" 
                                                 SortExpression="event_date" ReadOnly="true" />
                                                   <asp:CommandField ShowEditButton="True" />
                                            <asp:CommandField ShowDeleteButton="True" />
                                            </Columns>

                                </asp:GridView>

                            </div>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                 ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" 
                                  DeleteCommand="DELETE FROM event_expense WHERE eventexpense_id=@eventexpense_id" 
                                  SelectCommand="SELECT e.eventexpense_id, e1.event_name, e.amount, e.event_date FROM event_expense AS e INNER JOIN event_mstr AS e1 ON e.event_id = e1.event_id" 
                                  UpdateCommand="UPDATE event_expense SET amount =@amount WHERE eventexpense_id=@eventexpense_id" >
                                  <DeleteParameters>
                                            <asp:Parameter Name="eventexpense_id" />
                                        </DeleteParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="event_id" />
                                            <asp:Parameter Name="amount" />
                                            <asp:Parameter Name="date" />
                                            <asp:Parameter Name="eventexpense_id" />
                                        </UpdateParameters>
                                  </asp:SqlDataSource>
                                  </form>
</asp:Content>


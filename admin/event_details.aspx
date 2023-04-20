<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmstr.master" AutoEventWireup="true" CodeFile="event_details.aspx.cs" Inherits="admin_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<%--<head runat="server"></head>--%>    
 <div class="col-sm-6">
    <h2 class="m-0 text-dark">Event Details</h2>
        <p>&nbsp;</p>
    </div>
                
                        <form id="Form1" runat="server">
                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>
                        <div class="col-sm-6">
                        <div class="form-group">
                        <label>Event Name</label>
                        <%--<input type="text" class="form-control" placeholder="Enter ...">--%>
                            <asp:TextBox ID="txtevname" runat="server" class="form-control" placeholder="Enter Event Name" Width="500px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rqfevname" runat="server" 
                                ControlToValidate="txtevname" 
                                SetFocusOnError="True" Display="Dynamic" ValidationGroup="3">Enter Event name</asp:RequiredFieldValidator>
                                  <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender2"  runat="server" Enabled="True" TargetControlID="txtevname" FilterType="LowercaseLetters,Custom,UppercaseLetters" ValidChars=" ">
                            </asp:FilteredTextBoxExtender>                     
                      </div>
                      </div>

                      <div class="col-sm-6">
                        <div class="form-group">
                        <label>Date</label><br>
                        <%--<input type="text" class="form-control" placeholder="Enter ...">--%>
                            <asp:TextBox ID="txtevdate" runat="server" class="form-control" 
                                placeholder="Enter Date"  Width="500px" ></asp:TextBox>
                        
                            <asp:CalendarExtender ID="txtevdate_CalendarExtender" runat="server" 
                                Enabled="True" TargetControlID="txtevdate" Format="dd/MM/yyyy">
                            </asp:CalendarExtender>
                        
                          <asp:RequiredFieldValidator ID="rqfevdate" runat="server" 
                                 ControlToValidate="txtevdate" 
                                SetFocusOnError="True" Display="Dynamic" ValidationGroup="3">Enter Event date</asp:RequiredFieldValidator>
                      </div>
                      </div>

                      <div class="col-sm-6">
                        <div class="form-group">
                        <label>Amount per person</label>
                        <%--<input type="text" class="form-control" placeholder="Enter ...">--%>
                         <asp:TextBox ID="txtevamtp" runat="server" class="form-control" placeholder="Enter Amount Per Person"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="rqfevamtp" runat="server" 
                               ControlToValidate="txtevamtp" 
                                SetFocusOnError="True" Display="Dynamic" ValidationGroup="3">Enter Amount per person</asp:RequiredFieldValidator>
                            <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1"  runat="server" Enabled="True" TargetControlID="txtevamtp" FilterType="Numbers">
                            </asp:FilteredTextBoxExtender>
                         </div>
                      </div>

                    
                                                                  
                                           
                    <div class="card-footer">
                <%--  <button type="submit" class="btn btn-primary">Submit</button>--%>
                        <asp:Button ID="btnevinsert" class="btn btn-primary" runat="server" 
                            Text="Submit" onclick="btnevinsert_Click" ValidationGroup="3"/>&nbsp
                            
                </div>
                <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
                <div class="table-responsive">
                
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="event_id" DataSourceID="SqlDataSource1"  class="table table-bordered table-striped">
                        <Columns>
                            <asp:BoundField DataField="event_id" HeaderText="event_id" InsertVisible="False" 
                                                ReadOnly="True" SortExpression="eventid" Visible="false"/>
                                            <asp:BoundField DataField="event_name" HeaderText="event_name" 
                                                SortExpression="event_name" ReadOnly="True" />
                                            <asp:BoundField DataField="event_date" HeaderText="event_date" 
                                                SortExpression="event_date" ReadOnly="True" />
                                            <asp:BoundField DataField="amtperprsn" HeaderText="amount per person" 
                                                SortExpression="amtperprsn" />
                                            <asp:CommandField ShowEditButton="True" />
                                            <asp:CommandField ShowDeleteButton="True" />
                        </Columns>
                    </asp:GridView>
                   
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" 
                        DeleteCommand="DELETE FROM [event_mstr] WHERE [event_id] = @event_id" 
                        SelectCommand="SELECT * FROM [event_mstr]" 
                        UpdateCommand="UPDATE [event_mstr] SET [amtperprsn] = @amtperprsn WHERE [event_id] = @event_id">
                        <DeleteParameters>
                            <asp:Parameter Name="event_id" Type="String" />
                        </DeleteParameters>
                            <UpdateParameters>
                            <asp:Parameter Name="event_name" Type="String" />
                            <asp:Parameter Name="event_date" Type="String" />
                            <asp:Parameter Name="amountperperson" Type="Decimal" />
                            <asp:Parameter Name="event_id" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                   
                </div>
                      </form>
    

</asp:Content>


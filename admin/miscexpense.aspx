<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmstr.master" AutoEventWireup="true" CodeFile="miscexpense.aspx.cs" Inherits="admin_miscexpense" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="col-sm-6">
    <h2 class="m-0 text-dark">Miscellaneous Expense</h2>
        <p>&nbsp;</p>
    </div>
      <form id="Form1" runat="server">
  <asp:ScriptManager ID="ScriptManager1" runat="server">
  </asp:ScriptManager>
  
                       <div class="col-sm-6">
                        <div class="form-group">
                        <label>Expense Purpose</label><br/>
                      
                            <asp:TextBox ID="txtexpurpose" runat="server"  class="form-control" placeholder="Enter Expense Purpose" Width="500px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rqvpurpse" runat="server" ErrorMessage="Enter Expense Purpose" ControlToValidate="txtexpurpose" ValidationGroup="1" Display="Dynamic"></asp:RequiredFieldValidator>
                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" Enabled="true" FilterType="Custom,LowercaseLetters,UppercaseLetters" ValidChars=" " TargetControlID="txtexpurpose"   />
                                                                         
                      </div>
                      </div>

                        <div class="col-sm-6">
                        <div class="form-group">
                        <label>Amount</label><br/>
                      
                            <asp:TextBox ID="txtexamt" runat="server"  class="form-control" placeholder="Enter Amount" Width="500px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Expense Amount" ControlToValidate="txtexamt" ValidationGroup="1" Display="Dynamic"></asp:RequiredFieldValidator>
                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" Enabled="true" FilterType="Numbers" TargetControlID="txtexamt"   />
                                                                         
                      </div>
                      </div>

                              <div class="card-footer">
                        <asp:Button ID="btnmexpense" runat="server" Text="Submit" 
                              class="btn btn-primary" ValidationGroup="1" onclick="btnmexpense_Click"/>&nbsp;
                        </div><br />

                               <asp:Label ID="lblmsg" runat="server" Text="" Visible="false"></asp:Label>

                                  <div class="table-responsive">
                                      <asp:GridView ID="GridView1" runat="server"  
                                          class="table table-bordered table-striped" AutoGenerateColumns="False" 
                                          DataKeyNames="otherexpid" DataSourceID="SqlDataSource1">
                                          <Columns>
                                              <asp:BoundField DataField="otherexpid" HeaderText="otherexpid" 
                                                  InsertVisible="False" ReadOnly="True" SortExpression="otherexpid" Visible="false" />
                                              <asp:BoundField DataField="purpose" HeaderText="purpose" 
                                                  SortExpression="purpose" />
                                              <asp:BoundField DataField="amount" HeaderText="amount" 
                                                  SortExpression="amount" />
                                              <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" ReadOnly="true" />
                                              <asp:CommandField ShowEditButton="True" />
                                              <asp:CommandField ShowDeleteButton="True" />
                                          </Columns>
                                      </asp:GridView>
                                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                          ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" 
                                          DeleteCommand="DELETE FROM [other_expense] WHERE [otherexpid] = @otherexpid" 
                                          InsertCommand="INSERT INTO [other_expense] ([purpose], [amount], [date]) VALUES (@purpose, @amount, @date)" 
                                          SelectCommand="SELECT * FROM [other_expense]" 
                                          UpdateCommand="UPDATE [other_expense] SET [purpose] = @purpose, [amount] = @amount, [date] = @date WHERE [otherexpid] = @otherexpid">
                                          <DeleteParameters>
                                              <asp:Parameter Name="otherexpid" Type="Int32" />
                                          </DeleteParameters>
                                          <InsertParameters>
                                              <asp:Parameter Name="purpose" Type="String" />
                                              <asp:Parameter Name="amount" Type="Int32" />
                                              <asp:Parameter Name="date" Type="String" />
                                          </InsertParameters>
                                          <UpdateParameters>
                                              <asp:Parameter Name="purpose" Type="String" />
                                              <asp:Parameter Name="amount" Type="Int32" />
                                              <asp:Parameter Name="date" Type="String" />
                                              <asp:Parameter Name="otherexpid" Type="Int32" />
                                          </UpdateParameters>
                                      </asp:SqlDataSource>
                                  </div>
                            </form>
</asp:Content>


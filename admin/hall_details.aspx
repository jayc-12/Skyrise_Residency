<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmstr.master" AutoEventWireup="true" CodeFile="hall_details.aspx.cs" Inherits="admin_hall_details" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<form id="Form1" runat="server">
 <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
 <div class="col-sm-6">
    <h2 class="m-0 text-dark">Hall Details</h2>
        <p>&nbsp;</p>
    </div>
               
                        
                        <div class="col-sm-6">
                        <div class="form-group">
                        <label>Hall Type</label>
                     
                            <asp:TextBox ID="txthalltype" runat="server" class="form-control" placeholder="Enter Hall type" Width="500px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rqfhalltype" runat="server" 
                                ErrorMessage="Enter Hall Type" ControlToValidate="txthalltype" 
                                SetFocusOnError="True" Display="Dynamic" ValidationGroup="5"></asp:RequiredFieldValidator>   
                                 <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender2"  runat="server" Enabled="True" TargetControlID="txthalltype" FilterType="LowercaseLetters,Custom,UppercaseLetters" ValidChars=" ">
                            </asp:FilteredTextBoxExtender>                  
                      </div>
                      </div>
                     
                      <div class="col-sm-6">
                        <div class="form-group">
                        <label>Rate Per Day</label>
                        
                         <asp:TextBox ID="txthallrate" runat="server" class="form-control" placeholder="Enter Rate per Day" Width="500px"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="rqfhallrate" runat="server" 
                                ErrorMessage="Enter Hall Rate" ControlToValidate="txthallrate" 
                                SetFocusOnError="True" Display="Dynamic" ValidationGroup="5" ></asp:RequiredFieldValidator>
                            <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txthallrate" Enabled="true" FilterType="Numbers" >
                            </asp:FilteredTextBoxExtender>
                      </div>
                      </div>                    
                                                                  
                                           
                    <div class="card-footer">
            
                        <asp:Button ID="btnhallinsert" class="btn btn-primary" runat="server" 
                            Text="Submit" onclick="btnhallinsert_Click" ValidationGroup="5" />&nbsp
                 
                </div>
                <div class="table-responsive">
                    
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="hall_id" DataSourceID="SqlDataSource1"  class="table table-bordered table-striped">
                        <Columns>
                            <asp:BoundField DataField="hall_id" HeaderText="hall_id" InsertVisible="False" 
                                ReadOnly="True" SortExpression="hall_id" Visible="false"/>
                            <asp:BoundField DataField="halltype" HeaderText="halltype" 
                                SortExpression="halltype" />
                            <asp:BoundField DataField="amount" HeaderText="amount" 
                                SortExpression="amount" />
                            <asp:CommandField ShowEditButton="True" />
                            <asp:CommandField ShowDeleteButton="True" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" 
                        DeleteCommand="DELETE FROM [hall_mstr] WHERE [hall_id] = @hall_id" 
                        InsertCommand="INSERT INTO [hall_mstr] ([halltype], [amount]) VALUES (@halltype, @amount)" 
                        SelectCommand="SELECT * FROM [hall_mstr]" 
                        UpdateCommand="UPDATE [hall_mstr] SET [halltype] = @halltype, [amount] = @amount WHERE [hall_id] = @hall_id">
                        <DeleteParameters>
                            <asp:Parameter Name="hall_id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="halltype" Type="String" />
                            <asp:Parameter Name="amount" Type="Decimal" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="halltype" Type="String" />
                            <asp:Parameter Name="amount" Type="Decimal" />
                            <asp:Parameter Name="hall_id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
                     </form>
</asp:Content>


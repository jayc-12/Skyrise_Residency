<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmstr.master" AutoEventWireup="true" CodeFile="emppost.aspx.cs" Inherits="emppost" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<div class="col-sm-6">
    <h2 class="m-0 text-dark">Employee Post</h2>
        <p>&nbsp;</p>
    </div>
        
      
                        <div class="col-sm-6">
                        <div class="form-group">
                        <label>Employee Post</label>
                        <%--<input type="text" class="form-control" placeholder="Enter ...">--%>
                            <asp:TextBox ID="txtemppost" runat="server" class="form-control" placeholder="Enter Employee Post" Width="500px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rqfemppost" runat="server" 
                                 SetFocusOnError="True" 
                                ControlToValidate="txtemppost" Display="Dynamic" ValidationGroup="6">Enter Employee Post</asp:RequiredFieldValidator>
                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender2"  runat="server" Enabled="True" TargetControlID="txtemppost" FilterType="LowercaseLetters,Custom,UppercaseLetters" ValidChars=" ">
                            </asp:FilteredTextBoxExtender>
                      </div>
                      </div>

                      <div class="col-sm-6">
                        <div class="form-group">
                        <label>Employee Salary</label>
                        <%--<input type="text" class="form-control" placeholder="Enter ...">--%>
                            <asp:TextBox ID="txtempsalary" runat="server" class="form-control" placeholder="Enter Employee Salary" Width="500px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rqfempsalary" runat="server" 
                                 SetFocusOnError="True" 
                                ControlToValidate="txtempsalary" Display="Dynamic" ValidationGroup="6">Enter Employee Salary</asp:RequiredFieldValidator>
                            <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtempsalary" FilterType="Numbers" Enabled="true">
                            </asp:FilteredTextBoxExtender>

                      </div>
                      </div>

                      <div class="card-footer">
                  <%--<button type="submit" class="btn btn-primary">Submit</button>--%>
                          <asp:Button ID="btnempdetls" runat="server" Text="Submit" 
                              class="btn btn-primary" ValidationGroup="6" onclick="btnempdetls_Click" />
                       </div>
                       <div class="griddetails">

                          

                           <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                               DataKeyNames="emptypeid" DataSourceID="SqlDataSource1" class="table table-bordered table-striped">
                               <Columns>
                                   <asp:BoundField DataField="emptypeid" HeaderText="emptypeid" 
                                       InsertVisible="False" ReadOnly="True" SortExpression="emptypeid" Visible="false" />
                                   <asp:BoundField DataField="emptype" HeaderText="emptype" 
                                       SortExpression="emptype" />
                                   <asp:BoundField DataField="amount" HeaderText="amount" 
                                       SortExpression="amount" />
                                   <asp:CommandField ShowEditButton="True" />
                                   <asp:CommandField ShowDeleteButton="True" />
                               </Columns>
                           </asp:GridView>
                           <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                               ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" 
                               DeleteCommand="DELETE FROM [emp_type] WHERE [emptypeid] = @emptypeid" 
                               InsertCommand="INSERT INTO [emp_type] ([emptype], [amount]) VALUES (@emptype, @amount)" 
                               SelectCommand="SELECT * FROM [emp_type]" 
                               UpdateCommand="UPDATE [emp_type] SET [emptype] = @emptype, [amount] = @amount WHERE [emptypeid] = @emptypeid">
                               <DeleteParameters>
                                   <asp:Parameter Name="emptypeid" Type="Int32" />
                               </DeleteParameters>
                               <InsertParameters>
                                   <asp:Parameter Name="emptype" Type="String" />
                                   <asp:Parameter Name="amount" Type="String" />
                               </InsertParameters>
                               <UpdateParameters>
                                   <asp:Parameter Name="emptype" Type="String" />
                                   <asp:Parameter Name="amount" Type="String" />
                                   <asp:Parameter Name="emptypeid" Type="Int32" />
                               </UpdateParameters>
                           </asp:SqlDataSource>
                       </div>
    </form>
</asp:Content>


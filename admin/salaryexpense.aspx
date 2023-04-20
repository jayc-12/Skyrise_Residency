<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmstr.master" AutoEventWireup="true" CodeFile="salaryexpense.aspx.cs" Inherits="admin_salaryexpense" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<form runat="server">
<div class="header">
<h2>Employee Salary Details</h2>
<p>&nbsp;</p>

</div>
 <p>             
                            <div class="col-sm-6">
                        <div class="form-group">
                        <label>Employee Post</label><br />
                        <%--<input type="text" class="form-control" placeholder="Enter ...">--%>
                            <asp:DropDownList ID="drpemptype" runat="server"  
                                class="btn btn-default dropdown-toggle dropdown-hover dropdown-icon" 
                                onselectedindexchanged="drpemptype_SelectedIndexChanged" 
                                AutoPostBack="True" >
                            </asp:DropDownList>
                                                                             
                      </div>
                      </div><br />

                       <div class="col-sm-6">
                        <div class="form-group">
                        <label>Employee Name</label><br />
                        <%--<input type="text" class="form-control" placeholder="Enter ...">--%>
                            <asp:DropDownList ID="drpempname" runat="server"  
                                class="btn btn-default dropdown-toggle dropdown-hover dropdown-icon" 
                                onselectedindexchanged="drpempname_SelectedIndexChanged" 
                                AutoPostBack="True" DataSourceID="sqldatasource2" DataTextField="name" DataValueField="empid">
                            </asp:DropDownList>

                             <asp:SqlDataSource ID="sqldatasource2" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" 
                                
                                SelectCommand="SELECT empid, emptypeid, name, emailid, password, mobileno, gender, picture, amount FROM empmstr WHERE (emptypeid = @emptypeid)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="drpemptype" Name="emptypeid" 
                                        PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>

                                                                             
                      </div>
                      </div><br />
                      <asp:Label ID="lblamt" runat="server" Text=""></asp:Label><br />
                      <asp:Button ID="btnempsalex" class="btn btn-primary" 
    runat="server" Text="Submit"  ValidationGroup="7" onclick="btnempsalex_Click" /><br />

                      <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label><br /><br />
                      <div class="grid">
                          <asp:GridView ID="GridView1" runat="server" 
                              class="table table-bordered table-striped" AutoGenerateColumns="False" 
                              DataKeyNames="salaryexpid" DataSourceID="SqlDataSource1">
                              <Columns>
                                 <asp:BoundField DataField="salaryexpid" HeaderText="salaryexpid" InsertVisible="False" 
                                                ReadOnly="True" SortExpression="salaryexpid" Visible="false"/>
                                            <asp:BoundField DataField="emptype" HeaderText="emptype" 
                                                SortExpression="emptype" />                                           
                                            <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                                            <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                                            <asp:BoundField DataField="amount" HeaderText="amount" 
                                                SortExpression="amount" />
                                            <asp:CommandField ShowDeleteButton="True" />
                              </Columns>
                          </asp:GridView>
                          <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                              ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" 
                              DeleteCommand="DELETE FROM [salary_expense] WHERE [salaryexpid] = @salaryexpid"                              
                              
                              SelectCommand="SELECT se.salaryexpid, et.emptype, se.name, se.date, se.amount FROM empmstr AS em INNER JOIN emp_type AS et ON em.empid = et.emptypeid INNER JOIN salary_expense AS se ON em.empid = se.empid">
                             
                              <DeleteParameters>
                                  <asp:Parameter Name="salaryexpid" Type="Int32" />
                              </DeleteParameters>                            
                           </asp:SqlDataSource>
                      </div>

</form>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmstr.master" AutoEventWireup="true" CodeFile="employee.aspx.cs" Inherits="admin_employee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="header">
    <h1>Employee registration </h1>
     <p>&nbsp;</p>
    </div>
     <p>             
                        <form id="Form1" runat="server">
                        <div class="col-sm-6">
                        <div class="form-group">
                        <label>Employee Post</label>
                        <%--<input type="text" class="form-control" placeholder="Enter ...">--%>
                            <asp:TextBox ID="txtemppost" runat="server" class="form-control" placeholder="Enter ..."></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rqfemppost" runat="server" ErrorMessage="Enter Employee Post " ControlToValidate="txtemppost" SetFocusOnError="True"></asp:RequiredFieldValidator>                     
                      </div>
                      </div>

                      <div class="col-sm-6">
                        <div class="form-group">
                        <label>Employee Name</label><br>
                        <%--<input type="text" class="form-control" placeholder="Enter ...">--%>
                            <asp:TextBox ID="txtempname" runat="server" class="form-control" placeholder="Enter ..." ></asp:TextBox>                        
                          <asp:RequiredFieldValidator ID="rqfempname" runat="server" ErrorMessage="Enter Employee Name" ControlToValidate="txtempname" SetFocusOnError="True"></asp:RequiredFieldValidator>
                      </div>
                      </div>

                      <div class="col-sm-6">
                        <div class="form-group">
                        <label>Email ID:</label>
                        <%--<input type="text" class="form-control" placeholder="Enter ...">--%>
                         <asp:TextBox ID="txtempemail" runat="server" class="form-control" placeholder="abc@gmail.com"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="rqfempemail" runat="server" ErrorMessage="Enter Employee Email" ControlToValidate="txtempemail" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <%--<asp:RangeValidator ID="rrvevamtp" runat="server" ErrorMessage="Enter valid amount" ControlToValidate="txtevamtp" MinimumValue="500" MaximumValue="10000"></asp:RangeValidator>--%>
                      </div>
                      </div>

                      <div class="col-sm-6">
                        <div class="form-group">
                        <label>Password</label><br>
                        <%--<input type="text" class="form-control" placeholder="Enter ...">--%>
                            <asp:TextBox ID="txtemppass" TextMode="Password" runat="server" class="form-control"  placeholder="Enter ..." ></asp:TextBox>                        
                          <asp:RequiredFieldValidator ID="rqfemppass" runat="server" ErrorMessage="Enter Employee Password" ControlToValidate="txtemppass" SetFocusOnError="True"></asp:RequiredFieldValidator>
                      </div>
                      </div>

                      <div class="col-sm-6">
                        <div class="form-group">
                        <label>Re-Type Password</label><br>
                        <%--<input type="text" class="form-control" placeholder="Enter ...">--%>
                            <asp:TextBox ID="txtemprpass" runat="server" class="form-control" placeholder="Enter same password as above" TextMode="Password"></asp:TextBox>                        
                          <asp:RequiredFieldValidator ID="rqfemprpass" runat="server" ErrorMessage="Enter Password again" ControlToValidate="txtemprpass" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="comemppass" runat="server" ErrorMessage="Both password and re-type password should be same" ControlToCompare="txtemppass" ControlToValidate="txtemprpass"></asp:CompareValidator>
                      </div>
                      </div>

                        <div class="col-sm-6">
                        <div class="form-group">
                        <label>Gender</label><br>
                      <%--  <input type="text" class="form-control" placeholder="Enter ...">--%>
                            <%--<asp:TextBox ID="txttintercom" runat="server" class="form-control" placeholder="Enter ..."></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rqftintr" runat="server" ErrorMessage="enter tower intercom prefix" SetFocusOnError="True" ControlToValidate="txttintercom"></asp:RequiredFieldValidator>--%>
                            <asp:RadioButton ID="rbmale" runat="server" Text="Male" AutoPostBack="True" 
                                EnableViewState="True" Checked="True" GroupName="empgender" /><br>
                            <asp:RadioButton ID="rbfemale" runat="server" Text="Female" 
                                AutoPostBack="True" GroupName="empgender" />

                      </div>
                      </div>

                      <div class="col-sm-6">
                        <div class="form-group">
                        <label>Mobile Number</label>
                        <%--<input type="text" class="form-control" placeholder="Enter ...">--%>
                         <asp:TextBox ID="txtempmob" runat="server" class="form-control" placeholder="1234567890" MaxLength="10"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="rqfempmob" runat="server" ErrorMessage="Enter valid mobile number" ControlToValidate="txtempmob" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="rrvempnumber" runat="server" ErrorMessage="Only Numeric data is allowed" ControlToValidate="txtempmob" Type="Integer" MinimumValue="0" MaximumValue="99999"></asp:RangeValidator>
                      </div>
                      </div>

                      <div class="col-sm-6">
                        <div class="form-group">
                        <label>Employee Picture</label>
                        <%--<input type="text" class="form-control" placeholder="Enter ...">--%>
                         <asp:TextBox ID="txtemppic" runat="server" class="form-control" placeholder=""></asp:TextBox>
                          <asp:RequiredFieldValidator ID="rqfemppic" runat="server" ErrorMessage="Profile picture is necessary" ControlToValidate="txtemppic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                       
                      </div>
                      </div>

                       <div class="card-footer">
                <%--  <button type="submit" class="btn btn-primary">Submit</button>--%>
                        <asp:Button ID="btnevinsert" class="btn btn-primary" runat="server" Text="Submit" />
                </div>

                       <div>
                        <asp:Repeater runat="server" ID="repeater_employee" DataSourceID="DS_repeater">
                        <HeaderTemplate>
                            <table  class="table table-bordered table-striped">
                                <thead>
                                    <th>Emp Id</th>
                                    <th>Emp Type</th>
                                    <th>Emp Name</th>
                                    <th>Email Id</th>
                                    <th>Password</th>
                                    <th>Mobile No</th>
                                    <th>Gender</th>
                                    <th>Amount</th>
                                    <th>Photo</th>                                                   
                                </thead>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tbody>
                            <tr>
                                <td><%#Eval("empid") %></td>
                                <td><%#Eval("emptypeid") %></td>
                                <td><%#Eval("name") %></td>
                                <td><%#Eval("emailid") %></td>
                                <td><%#Eval("password") %></td>
                                <td><%#Eval("mobileno") %></td>
                                <td><%#Eval("gender") %></td>
                                <td><%#Eval("amount") %></td>
                                <td><%#Eval("picture") %></td>                                
                                <td><a id="edit" href='employee.aspx?empid=<%#Eval("empid") %>'>EDIT</a></td>
                                <td><a id="delete" href='employee.aspx?empid=<%#Eval("empid") %>'>DELETE</a></td>
                            </tr>
                            </tbody>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                        </asp:Repeater>
                    <asp:SqlDataSource ID="DS_repeater" runat="server" 
                                SelectCommand="SELECT * FROM [empmstr]" 
                                ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" ></asp:SqlDataSource> 
                        </div>


                                                                  
                                           
                   
                      </form>
    </p>
</asp:Content>


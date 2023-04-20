<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmstr.master" AutoEventWireup="true" CodeFile="tower.aspx.cs" Inherits="admin_admin_login_admin_home_tower" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="col-sm-6">
    <h2 class="m-0 text-dark">Tower Details</h2>
        <p>&nbsp;</p>
    </div>
               
  <form runat="server">
  <asp:ScriptManager ID="ScriptManager1" runat="server">
  </asp:ScriptManager>
                        <div class="col-sm-6">
                        <div class="form-group">
                        <label>Tower Name</label>
                        <%--<input type="text" class="form-control" placeholder="Enter ...">--%>
                            <asp:TextBox ID="txttname" runat="server" class="form-control" placeholder="Enter Tower Name" Width="500px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rqftname" runat="server" 
                                 SetFocusOnError="True" 
                                ControlToValidate="txttname" Display="Dynamic" ValidationGroup="1">Enter tower name</asp:RequiredFieldValidator>
                      </div>
                      </div>

                      <div class="col-sm-6">
                        <div class="form-group">
                        <label>Tower Sqft</label><br />
                        <%--<input type="text" class="form-control" placeholder="Enter ...">--%>
                            <asp:DropDownList ID="drpsqft" runat="server" class="btn btn-default dropdown-toggle dropdown-hover dropdown-icon" >
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rqtsqft" runat="server" 
                                 SetFocusOnError="True" 
                                ControlToValidate="drpsqft" Display="Dynamic" ValidationGroup="1">Select tower sqft</asp:RequiredFieldValidator>

                      </div>
                      </div>

                      <div class="col-sm-6">
                        <div class="form-group">
                        <label>Rate</label>
                        <%--<input type="text" class="form-control" placeholder="Enter ...">--%>
                            <asp:TextBox ID="txttrate" runat="server" class="form-control" placeholder="Enter Rate per SQFT" Width="500px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rqftrate" runat="server" 
                                 SetFocusOnError="True" 
                                ControlToValidate="txttrate" Display="Dynamic" ValidationGroup="1">Enter tower rate</asp:RequiredFieldValidator>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" Enabled="true" TargetControlID="txttrate" FilterType="Numbers"/>

                                

                      </div>
                      </div>

                      <div class="col-sm-6">
                        <div class="form-group">
                        <label>No of Flats</label>
                       <%-- <input type="text" class="form-control" placeholder="Enter ...">--%>
                            <asp:TextBox ID="txttnof" runat="server" class="form-control" placeholder="Enter Number Of Flats" Width="500px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rqftnof" runat="server" 
                                 SetFocusOnError="True" 
                                ControlToValidate="txttnof" Display="Dynamic" ValidationGroup="1">Enter no. of flats</asp:RequiredFieldValidator>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" Enabled="true" TargetControlID="txttnof" FilterType="Numbers"/>

                      </div>
                      </div>

                      <div class="col-sm-6">
                        <div class="form-group">
                        <label>Type of flats</label><br />
                      <%--  <input type="text" class="form-control" placeholder="Enter ...">--%>
                            <asp:DropDownList ID="drpttype" runat="server" class="btn btn-default dropdown-toggle dropdown-hover dropdown-icon" >
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rqttype" runat="server" 
                                 SetFocusOnError="True" 
                                ControlToValidate="drpttype" Display="Dynamic" ValidationGroup="1">Enter tower type</asp:RequiredFieldValidator>

                      </div>
                      </div>

                      <div class="col-sm-6">
                        <div class="form-group">
                        <label>Intercom prefix</label>
                      <%--  <input type="text" class="form-control" placeholder="Enter ...">--%>
                            <asp:TextBox ID="txttintercom" runat="server" class="form-control" placeholder="Enter Intercom Prefix" Width="500px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rqftintr" runat="server" 
                                 SetFocusOnError="True" 
                                ControlToValidate="txttintercom" Display="Dynamic" ValidationGroup="1">Enter tower intercom prefix</asp:RequiredFieldValidator>
                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" Enabled="true" TargetControlID="txttintercom" FilterType="Numbers"/>


                      </div>
                      </div>

                      <div class="col-sm-6">
                        <div class="form-group">
                        <label>Maintenance Amount</label>
                      <%--  <input type="text" class="form-control" placeholder="Enter ...">--%>
                            <asp:TextBox ID="txtmainamt" runat="server" class="form-control" placeholder="Enter Maintenance Amount" Width="500px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                 SetFocusOnError="True" 
                                ControlToValidate="txtmainamt" Display="Dynamic" ValidationGroup="1">Enter Maintenance Amount </asp:RequiredFieldValidator>
                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" Enabled="true" TargetControlID="txtmainamt" FilterType="Numbers"/>


                      </div>
                      </div>

                      <div class="col-sm-6">
                        <div class="form-group">
                        <label>Transfer fee</label>
                        <%--<input type="text" class="form-control" placeholder="Enter ...">--%>
                            <asp:TextBox ID="txtttransferfee" runat="server" class="form-control" placeholder="Enter Transfer Fee" Width="500px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rqfttfee" runat="server" 
                                 SetFocusOnError="True" 
                                ControlToValidate="txtttransferfee" Display="Dynamic" ValidationGroup="1">Enter transfer fee</asp:RequiredFieldValidator>
                                 <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" Enabled="true" TargetControlID="txtttransferfee" FilterType="Numbers"/>


                      </div>
                      </div>

                      
                                           
                      <div class="card-footer">
                  <%--<button type="submit" class="btn btn-primary">Submit</button>--%>
                          <asp:Button ID="btntinsert" runat="server" Text="Submit" 
                              class="btn btn-primary" onclick="btntinsert_Click" ValidationGroup="1" />&nbsp;
                   
                     </div><br />
                        <asp:Label ID="lblmsg" runat="server" Text="" class="form-control"></asp:Label>
                     <div class="table-responsive">
 
                         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                             DataKeyNames="tid" DataSourceID="SqlDataSource1" class="table table-bordered table-striped">
                             <Columns>
                                 <asp:BoundField DataField="tid" HeaderText="tid" InsertVisible="False" 
                                     ReadOnly="True" SortExpression="tid" />
                                 <asp:BoundField DataField="tname" HeaderText="tname" SortExpression="tname" />
                                 <asp:BoundField DataField="sqft" HeaderText="sqft" SortExpression="sqft" />
                                 <asp:BoundField DataField="rate" HeaderText="rate" SortExpression="rate" />
                                 <asp:BoundField DataField="nof" HeaderText="nof" SortExpression="nof" />
                                 <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
                                 <asp:BoundField DataField="intercom" HeaderText="intercom" 
                                     SortExpression="intercom" />
                                 <asp:BoundField DataField="maintenance" HeaderText="maintenance" 
                                     SortExpression="maintenance" />
                                 <asp:BoundField DataField="transferfee" HeaderText="transferfee" 
                                     SortExpression="transferfee" />
                                 <asp:CommandField ShowEditButton="True" />
                                 <asp:CommandField ShowDeleteButton="True" />
                             </Columns>
                         </asp:GridView>
                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                             ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" 
                             DeleteCommand="DELETE FROM [tower] WHERE [tid] = @tid" 
                             InsertCommand="INSERT INTO [tower] ([tname], [sqft], [rate], [nof], [type], [intercom], [transferfee]) VALUES (@tname, @sqft, @rate, @nof, @type, @intercom, @transferfee)" 
                             SelectCommand="SELECT * FROM [tower]" 
                             
                             UpdateCommand="UPDATE tower SET tname = @tname, sqft = @sqft, rate = @rate, nof = @nof, type = @type, intercom = @intercom, transferfee = @transferfee, maintenance = @maintenance WHERE (tid = @tid)">
                             <DeleteParameters>
                                 <asp:Parameter Name="tid" Type="Int32" />
                             </DeleteParameters>
                             <InsertParameters>
                                 <asp:Parameter Name="tname" Type="String" />
                                 <asp:Parameter Name="sqft" Type="String" />
                                 <asp:Parameter Name="rate" Type="Decimal" />
                                 <asp:Parameter Name="nof" Type="Decimal" />
                                 <asp:Parameter Name="type" Type="String" />
                                 <asp:Parameter Name="intercom" Type="Decimal" />
                                 <asp:Parameter Name="transferfee" Type="Decimal" />
                             </InsertParameters>
                             <UpdateParameters>
                                 <asp:Parameter Name="tname" Type="String" />
                                 <asp:Parameter Name="sqft" Type="String" />
                                 <asp:Parameter Name="rate" Type="Decimal" />
                                 <asp:Parameter Name="nof" Type="Decimal" />
                                 <asp:Parameter Name="type" Type="String" />
                                 <asp:Parameter Name="intercom" Type="Decimal" />
                                 <asp:Parameter Name="transferfee" Type="Decimal" />
                                 <asp:Parameter Name="maintenance" />
                                 <asp:Parameter Name="tid" Type="Int32" />
                             </UpdateParameters>
                         </asp:SqlDataSource>
 
                        </div>
  
  </form>
    
</asp:Content>


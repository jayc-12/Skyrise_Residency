<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmstr.master" AutoEventWireup="true" CodeFile="misccollect.aspx.cs" Inherits="admin_misccollect" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div class="col-sm-6">
    <h2 class="m-0 text-dark">Miscellaneous Collection</h2>
        <p>&nbsp;</p>
    </div>
    <form id="Form1" runat="server">
  <asp:ScriptManager ID="ScriptManager1" runat="server">
  </asp:ScriptManager>
                            
                                 <div class="col-sm-6">
                        <div class="form-group">
                        <label>Tower Name</label><br/>
                      
                            <asp:DropDownList ID="drptname" runat="server" 
                                class="btn btn-default dropdown-toggle dropdown-hover dropdown-icon" 
                                AutoPostBack="True" onselectedindexchanged="drptname_SelectedIndexChanged" >
                            </asp:DropDownList>
                                                                         
                      </div>
                      </div>

                        <div class="col-sm-6">
                        <div class="form-group">
                        <label>Flat No</label><br/>
                            <asp:DropDownList ID="drpflatno" runat="server" 
                                onselectedindexchanged="drpflatno_SelectedIndexChanged" AutoPostBack="true" class="btn btn-default dropdown-toggle dropdown-hover dropdown-icon" >
                            </asp:DropDownList>
                           <%-- <asp:DropDownList ID="drpflatno" runat="server" 
                                class="btn btn-default dropdown-toggle dropdown-hover dropdown-icon" 
                                AutoPostBack="True" onselectedindexchanged="drpflatno_SelectedIndexChanged" >
                            </asp:DropDownList>--%>
                                                                         
                      </div>
                      </div>

                        <div class="col-sm-6">
                        <div class="form-group">
                        <label>Owner Name</label><br/>
                      
                            <asp:TextBox ID="txtoname" runat="server"  class="form-control" placeholder="Owner Name " ReadOnly="true" Width="500px"></asp:TextBox>
                           <%-- <asp:RequiredFieldValidator ID="rqvonmae" runat="server" ErrorMessage="Enter owner name" ControlToValidate="txtoname" ValidationGroup="1"></asp:RequiredFieldValidator>
                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" Enabled="true" FilterType="Custom,LowercaseLetters,UppercaseLetters" ValidChars=" " TargetControlID="txtoname"   />--%>
                                                                         
                      </div>
                      </div>

                       <div class="col-sm-6">
                        <div class="form-group">
                        <label>Collection Purpose</label><br/>
                      
                            <asp:TextBox ID="txtcpurpose" runat="server"  class="form-control" placeholder="Enter Collection Purpose" Width="500px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rqvpurpse" runat="server" ErrorMessage="Enter Collection Purpose" ControlToValidate="txtcpurpose" ValidationGroup="1"></asp:RequiredFieldValidator>
                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" Enabled="true" FilterType="Custom,LowercaseLetters,UppercaseLetters" ValidChars=" " TargetControlID="txtcpurpose"   />
                                                                         
                      </div>
                      </div>

                      <div class="col-sm-6">
                        <div class="form-group">
                        <label>Amount</label><br/>
                      
                            <asp:TextBox ID="txtcamt" runat="server"  class="form-control" placeholder="Enter Collection Amount" Width="500px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Collection Amount" ControlToValidate="txtcamt" ValidationGroup="1"></asp:RequiredFieldValidator>
                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" Enabled="true" FilterType="Numbers" TargetControlID="txtcamt"   />
                                                                         
                      </div>
                      </div>

                        <div class="card-footer">
                        <asp:Button ID="btnmcollect" runat="server" Text="Submit" 
                              class="btn btn-primary" ValidationGroup="1" onclick="btnmcollect_Click" />&nbsp;
                        </div><br />


                        <asp:Label ID="lblmsg" runat="server" Text="" Visible="false"></asp:Label>


                            <div class="table-responsive">
                                <asp:GridView ID="GridView1" runat="server"  
                                    class="table table-bordered table-striped" AutoGenerateColumns="False" 
                                    DataKeyNames="othercolid" DataSourceID="SqlDataSource1" 
                                    DataMember="DefaultView" EnableViewState="False">
                                    <Columns>
                                        <asp:BoundField DataField="othercolid" HeaderText="othercolid" 
                                            InsertVisible="False" ReadOnly="True" SortExpression="othercolid" Visible="false"/>
                                        <asp:BoundField DataField="tname" HeaderText="tname" SortExpression="tname" />
                                        <asp:BoundField DataField="flatno" HeaderText="flatno" 
                                            SortExpression="flatno" />
                                        <asp:BoundField DataField="purpose" HeaderText="purpose" 
                                            SortExpression="purpose" />
                                        <asp:BoundField DataField="amount" HeaderText="amount" 
                                            SortExpression="amount" />
                                        <asp:BoundField DataField="date" HeaderText="date" SortExpression="date"/>
                                        <asp:CommandField ShowEditButton="True" />
                                        <asp:CommandField ShowDeleteButton="True" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" 
                                    DeleteCommand="DELETE FROM other_collection WHERE (othercolid = @othercolid)" 
                                    SelectCommand="SELECT other_collection.othercolid, tower.tname, flat.flatno, other_collection.purpose, other_collection.amount, other_collection.date FROM other_collection INNER JOIN flat ON other_collection.fid = flat.fid INNER JOIN tower ON flat.tid = tower.tid" 
                                    
                                    UpdateCommand="UPDATE other_collection SET purpose = @purpose, amount = @amount WHERE (othercolid = @othercolid)">
                                    <DeleteParameters>
                                        <asp:Parameter Name="othercolid" />
                                    </DeleteParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="purpose" />
                                        <asp:Parameter Name="amount" />
                                        <asp:Parameter Name="othercolid" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </div>
  </form>
  

</asp:Content>


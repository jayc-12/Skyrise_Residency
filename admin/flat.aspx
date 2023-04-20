<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmstr.master" AutoEventWireup="true" CodeFile="flat.aspx.cs" Inherits="admin_admin_login_admin_home_flat" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<form runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
   
         <div class="col-sm-6">
    <h2 class="m-0 text-dark">Flat Details</h2>
        <p>&nbsp;</p>
    </div>
   
                        <div class="col-sm-6">
                        <div class="form-group">                                
                      </div>
                      </div>

                      <div class="col-sm-6">
                        <div class="form-group">
                        <label>Tower Name</label><br/>
                      
                            <asp:DropDownList ID="drptname" runat="server" 
                                class="btn btn-default dropdown-toggle dropdown-hover dropdown-icon" 
                                AutoPostBack="True" onselectedindexchanged="drptname_SelectedIndexChanged" >
                            </asp:DropDownList>
                                                                         
                      </div>
                      </div><br />

                      <div class="col-sm-6">
                        <div class="form-group">
                        <label>Flat Number</label>
                   
                         <asp:TextBox ID="txtflatno" runat="server" class="form-control" placeholder="Enter Flat No."  Width="500px"></asp:TextBox><br />
                            <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" Enabled="True" TargetControlID="txtflatno" FilterType="Numbers">
                            </asp:FilteredTextBoxExtender>
                            <asp:Label ID="lblintercom" runat="server" Text="" class="form-control"></asp:Label>
                         <asp:RequiredFieldValidator ID="rqffnumber" runat="server" 
                                ErrorMessage="Enter flat number" ControlToValidate="txtflatno" 
                                SetFocusOnError="True" Display="Dynamic" ValidationGroup="2"></asp:RequiredFieldValidator>
                      </div>
                      </div>
                                           
                    <div class="card-footer">
            
                        <asp:Button ID="btnfinsert" class="btn btn-primary" runat="server" 
                            Text="Submit" onclick="btnfinsert_Click" ValidationGroup="2"/>

                     &nbsp;
                     <span>
                          
                     </span>
                          <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
                     
                </div>
                   
                   
                <div class="table-responsive">
                        
                    <asp:GridView ID="GridView1" runat="server" 
                        class="table table-bordered table-striped" AutoGenerateColumns="False" 
                        DataKeyNames="fid" DataSourceID="flatsrc">
                        <Columns>
                       <asp:BoundField DataField="fid" HeaderText="fid" InsertVisible="False" 
                                                ReadOnly="True" SortExpression="fid" Visible="false" />
                       <asp:BoundField DataField="tname" HeaderText="tname" SortExpression="tname" />
                        <asp:BoundField DataField="flatno" HeaderText="flatno" 
                                                SortExpression="flatno" />
                                            <asp:BoundField DataField="intercom" HeaderText="intercom" 
                                                SortExpression="intercomno" />
                                            <%--<asp:CommandField ShowEditButton="True" />--%>
                                            <asp:CommandField ShowDeleteButton="True" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="flatsrc" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" 
                        SelectCommand="SELECT f.fid, t.tname, f.flatno, f.intercom FROM flat AS f INNER JOIN tower AS t ON f.tid = t.tid"
                        DeleteCommand="DELETE FROM flat WHERE fid = @fid"
                        UpdateCommand="UPDATE flat SET tid =@tid, flatno =@flatno, intercom =@intercom WHERE fid=@fid">
                        <DeleteParameters>
                                <asp:Parameter Name="fid" Type="Int32" />
                            </DeleteParameters></asp:SqlDataSource>
                     
                   
                        </div>
     </form>
</asp:Content>

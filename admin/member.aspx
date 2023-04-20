<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmstr.master" AutoEventWireup="true" CodeFile="member.aspx.cs" Inherits="admin_member" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
   <div class="col-sm-6">
    <h2 class="m-0 text-dark">Manage User Details</h2>
        <p>&nbsp;</p>
    </div>

                        <div class="table-responsive">
                            <%--<asp:GridView ID="GridView1" runat="server" 
                                class="table table-bordered table-striped" AutoGenerateColumns="False" 
                                DataKeyNames="owner_id" DataSourceID="SqlDataSource1" 
                                onrowupdating="GridView1_RowUpdating" >
                                <Columns>
                                    <asp:BoundField DataField="owner_id" HeaderText="owner_id" 
                                        InsertVisible="False" ReadOnly="True" SortExpression="owner_id" Visible="false" />
                                    <asp:BoundField DataField="owner_name" HeaderText="owner_name" ReadOnly="true" 
                                        SortExpression="owner_name" />
                                    <asp:TemplateField HeaderText="Email">
                                        <ItemTemplate>
                                            <asp:Label ID="lblemail" runat="server" Text='<%# Eval("emailid") %>'></asp:Label>
                                              </ItemTemplate> 
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="mobileno" HeaderText="mobileno" ReadOnly="true" 
                                        SortExpression="mobileno" />
                                    <asp:BoundField DataField="dob" HeaderText="dob" SortExpression="dob" ReadOnly="true" />
                                    <asp:BoundField DataField="status" HeaderText="status" 
                                        SortExpression="status" />
                                    <asp:TemplateField HeaderText="Photo">
                                        <ItemTemplate>
                                            <asp:Image ID="Image1" runat="server" 
                                                ImageUrl='<%# "~/user_owner_photo/" + Eval("owner_image") %>' />
                                        </ItemTemplate>
                                        <ControlStyle Height="150px" Width="150px" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="flatno" HeaderText="flatno" ReadOnly="true" 
                                        SortExpression="flatno" />
                                    <asp:BoundField DataField="tname" HeaderText="tname" SortExpression="tname" ReadOnly="true" />
                                    <asp:CommandField ShowEditButton="True" />
                                    <asp:CommandField ShowDeleteButton="True" />
                  
                                    <asp:HyperLinkField 
                                        Text="allow" DataNavigateUrlFormatString='&#039;<%# String.Format("~/admin/allow.aspx?owner_id={0}&emailid={1}", HttpUtility.UrlEncode(Eval("owner_id").ToString()),HttpUtility.UrlEncode(Eval("emailid").ToString())) %>&#039;' NavigateUrl="~/admin/allow.aspx" />
                  
                                </Columns>
                            </asp:GridView>
                        
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" 
                                SelectCommand="SELECT owner_mstr.owner_id, owner_mstr.owner_name, owner_mstr.emailid, owner_mstr.mobileno, owner_mstr.dob, owner_mstr.status, owner_mstr.owner_image, flat.flatno, tower.tname FROM owner_mstr INNER JOIN flat ON owner_mstr.fid = flat.fid INNER JOIN tower ON flat.tid = tower.tid" 
                                
                                UpdateCommand="UPDATE owner_mstr SET status = @status WHERE (owner_id = @owner_id)" 
                                DeleteCommand="DELETE FROM owner_mstr WHERE (owner_id = @owner_id)">
                                <DeleteParameters>
                                    <asp:Parameter Name="owner_id" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="status" />
                                    <asp:Parameter Name="owner_id" />
                                </UpdateParameters>
                            </asp:SqlDataSource>--%>
                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                            <HeaderTemplate>
                                              <table id="datatable-buttons" class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                                    <thead>
                                                    <tr>
                                                        <th>Tname</th>
                                                        <th>Flatno</th>
                                                        <th>Owner_name</th>
                                                        <th>Emailid</th>
                                                        <th>Mobileno</th>
                                                        <th>Dob</th>
                                                        <th>Status</th>
                                                        <th>Picture</th>
                                                        </tr>
                                                    </thead>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                    <tbody>
                                                    <tr>
                                                        <td><%#Eval("tname") %></td>
                                                        <td><%#Eval("flatno") %></td>
                                                        <td><%#Eval("owner_name") %></td>
                                                        <td><%#Eval("emailid") %></td>
                                                        <td><%#Eval("mobileno") %></td>
                                                        <td><%#Eval("dob") %></td>
                                                        <td><%#Eval("status") %></td>
                                                        <td><img src="../user_owner_photo/<%#Eval("owner_image") %>"  width="150px"/></td>                                                       
                                                        <td><asp:HyperLink ID="hl_edit" runat="server"  NavigateUrl='<%# String.Format("~/admin/allow.aspx?owner_name={0}&emailid={1}", HttpUtility.UrlEncode(Eval("owner_name").ToString()),HttpUtility.UrlEncode(Eval("emailid").ToString())) %>'>Allow</asp:HyperLink></td>
                                                        <td><asp:HyperLink ID="hl_delete" runat="server"  NavigateUrl='<%# String.Format("~/admin/delete.aspx?owner_name={0}&emailid={1}", HttpUtility.UrlEncode(Eval("owner_name").ToString()),HttpUtility.UrlEncode(Eval("emailid").ToString())) %>'>Delete</asp:HyperLink></td>
                                                        
                                                    </tr>
                                           
                                                    </tbody>
                                            </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" 
                                SelectCommand="SELECT owner_mstr.owner_id, owner_mstr.owner_name, owner_mstr.emailid, owner_mstr.mobileno, owner_mstr.dob, owner_mstr.status, owner_mstr.owner_image, flat.flatno, tower.tname FROM owner_mstr INNER JOIN flat ON owner_mstr.fid = flat.fid INNER JOIN tower ON flat.tid = tower.tid">
                            </asp:SqlDataSource>
                       </div>

    </form>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmstr.master" AutoEventWireup="true" CodeFile="event_collection.aspx.cs" Inherits="admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
     <div class="col-sm-6">
    <h2 class="m-0 text-dark">Event Collection Details</h2>
        <p>&nbsp;</p>
    </div>
                                <div class="table-responsive">
                                                                    <asp:GridView ID="GridView1" runat="server" 
                              class="table table-bordered table-striped"
                              AutoGenerateColumns="False"  onrowcancelingedit="gridview_RowCancelingEdit" 
                    onrowdeleting="gridview_RowDeleting" onrowediting="gridview_RowEditing" 
                    onrowupdating="gridview_RowUpdating" DataKeyNames="eventpaymentid">
        <Columns>
                <asp:TemplateField HeaderText="eventpaymentid" Visible="false">
                <ItemTemplate>
                    <asp:Label ID="eventpaymentid" runat="server" Text='<%# Eval("eventpaymentid") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
               <asp:TemplateField HeaderText="event_name" >
                <ItemTemplate>
                    <asp:Label ID="event" runat="server" Text='<%# Eval("event_name") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="flatno" Visible="true" >
                <ItemTemplate>
                    <asp:Label ID="flatno" runat="server" Text='<%# Eval("flatno") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ownername">
                <ItemTemplate>
                    <asp:Label ID="ownername" runat="server" Text='<%# Eval("owner_name") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="amount" Visible="true" >
                <ItemTemplate>
                    <asp:Label ID="amount" runat="server" Text='<%# Eval("amount") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="members">
                <ItemTemplate>
                    <asp:Label ID="members" runat="server" Text='<%# Eval("members") %>'></asp:Label>
                </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="7%" />
                 <EditItemTemplate>
                    <asp:TextBox ID="txtmembers" runat="server" Width="75px" Text='<%# Eval("members") %>'></asp:TextBox>
                </EditItemTemplate>
               
                <ItemStyle HorizontalAlign="Center" Width="30%" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="totalamount">
                <ItemTemplate>
                    <asp:Label ID="totalamount" runat="server" Text='<%# Eval("totalamount") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="7%" />
            </asp:TemplateField>
                <asp:TemplateField HeaderText="paymentmode">
                  <ItemTemplate>
                    <asp:Label ID="paymentmode" runat="server" Text='<%# Eval("paymentmode") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="7%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="bankname">
                 <ItemTemplate>
                    <asp:Label ID="bankname" runat="server" Text='<%# Eval("bankname") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtbankname" runat="server" Width="75px" Text='<%# Eval("bankname") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="7%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="chequeno">
                 <ItemTemplate>
                    <asp:Label ID="chequeno" runat="server" Text='<%# Eval("chequeno") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtchequeno" runat="server" Width="75px" Text='<%# Eval("chequeno") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="7%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="accountno">
                 <ItemTemplate>
                    <asp:Label ID="accountno" runat="server" Text='<%# Eval("accountno") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtaccountno" runat="server" Width="75px" Text='<%# Eval("accountno") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="7%" /></asp:TemplateField>
             <asp:TemplateField HeaderText="status">
                <ItemTemplate>
                    <asp:Label ID="status" runat="server" Text='<%# Eval("status") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtstatus" runat="server" Width="75px" Text='<%# Eval("status") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="7%" />
            </asp:TemplateField>
           
            <asp:TemplateField ShowHeader="False" HeaderText="Update">
                <ItemTemplate>
                    <asp:LinkButton ID="Btn_Edit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:LinkButton ID="Btn_Update" runat="server" CausesValidation="False" CommandName="Update" Text="Update"></asp:LinkButton>
                    <asp:LinkButton ID="Btn_Cancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="5%" />
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False" HeaderText="Delete">
                <ItemTemplate>
                    <asp:LinkButton ID="Btn_Delete" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"
                    OnClientClick="return  confirm ( ' Are you sure you want to delete this record ? ' );"></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="5%" />
            </asp:TemplateField>
        </Columns>
       <%-- <FooterStyle BackColor="White" ForeColor="#000066" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />--%>
    </asp:GridView> 
                                
                                </div>
    
     
    </form>
</asp:Content>


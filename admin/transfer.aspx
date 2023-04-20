<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmstr.master" AutoEventWireup="true" CodeFile="transfer.aspx.cs" Inherits="admin_transfer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<form id="form1" runat="server">
     <div class="header">
    <h1> Transfer collection Details </h1>
     <p>
         &nbsp;</p>
    </div>
                                <div class="table-responsive">
                                    <asp:GridView ID="GridView1" runat="server" 
                                        class="table table-bordered table-striped" AutoGenerateColumns="False" 
                                        DataSourceID="SqlDataSource1" DataKeyNames="transferid" >
                                        <Columns>
                                            <asp:BoundField DataField="transferid" HeaderText="transferid" 
                                                InsertVisible="False" ReadOnly="True" SortExpression="transferid" Visible="false" />
                                            <asp:BoundField DataField="owner_id" HeaderText="owner_id" 
                                                SortExpression="owner_id" Visible="false" />
                                            <asp:BoundField DataField="tname" HeaderText="tname" SortExpression="tname" ReadOnly="true" />
                                            <asp:BoundField DataField="flatno" HeaderText="flatno" 
                                                SortExpression="flatno" ReadOnly="true" />
                                            <asp:BoundField DataField="owner_name" HeaderText="owner_name" 
                                                SortExpression="owner_name" ReadOnly="true" />
                                            <asp:BoundField DataField="newowner_name" HeaderText="newowner_name" 
                                                SortExpression="newowner_name" ReadOnly="true" />
                                            <asp:BoundField DataField="amount" HeaderText="amount" 
                                                SortExpression="amount" ReadOnly="true" />
                                            <asp:BoundField DataField="date" HeaderText="date" 
                                                SortExpression="date" ReadOnly="true"/>
                                            <asp:BoundField DataField="paymentmode" HeaderText="paymentmode" 
                                                SortExpression="paymentmode" ReadOnly="true" />
                                            <asp:BoundField DataField="bankname" HeaderText="bankname" 
                                                SortExpression="bankname" />
                                            <asp:BoundField DataField="chequeno" HeaderText="chequeno" 
                                                SortExpression="chequeno" />
                                            <asp:BoundField DataField="accountno" HeaderText="accountno" 
                                                SortExpression="accountno" />
                                            <asp:BoundField DataField="status" HeaderText="status" 
                                                SortExpression="status" />
                                            <asp:CommandField ShowEditButton="True" />
                                            <asp:CommandField ShowDeleteButton="True" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" 
                                        DeleteCommand="DELETE FROM transfer WHERE (transferid = @transferid)" 
                                        SelectCommand="SELECT transfer.transferid, transfer.owner_id, transfer.newowner_name, transfer.amount, transfer.date, transfer.status, owner_mstr.owner_name, tower.tname, flat.flatno, transfer.paymentmode, transfer.bankname, transfer.chequeno, transfer.accountno FROM transfer INNER JOIN owner_mstr ON transfer.owner_id = owner_mstr.owner_id INNER JOIN flat ON owner_mstr.fid = flat.fid INNER JOIN tower ON flat.tid = tower.tid" 
                                        
                                        
                                        UpdateCommand="UPDATE transfer SET status = @status, paymentmode = @paymentmode, bankname = @bankname, chequeno = @chequeno, accountno = @accountno WHERE (transferid = @transferid)">
                                        <DeleteParameters>
                                            <asp:Parameter Name="transferid" />
                                        </DeleteParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="status" />
                                            <asp:Parameter Name="paymentmode" />
                                            <asp:Parameter Name="bankname" />
                                            <asp:Parameter Name="chequeno" />
                                            <asp:Parameter Name="accountno" />
                                            <asp:Parameter Name="transferid" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </div>

    </form>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmstr.master" AutoEventWireup="true" CodeFile="feedback.aspx.cs" Inherits="admin_feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<form id="form1" runat="server">
     <div class="col-sm-6">
    <h2 class="m-0 text-dark">View Feedback/Complaint Details</h2>
        <p>&nbsp;</p>
    </div>
                                <div class="table-responsive">
                                    <asp:GridView ID="GridView1" runat="server"  
                                        class="table table-bordered table-striped" AutoGenerateColumns="False" 
                                        DataKeyNames="feedbackid" DataSourceID="SqlDataSource1" >
                                        <Columns>
                                          <asp:BoundField DataField="tname" HeaderText="tname" SortExpression="tname" ReadOnly="true" />
                                              <asp:BoundField DataField="flatno" HeaderText="flatno" ReadOnly="true" 
                                                SortExpression="flatno" />                                                
                                            <asp:BoundField DataField="owner_name" HeaderText="owner_name" ReadOnly="true" 
                                                SortExpression="owner_name" />
                                            <asp:BoundField DataField="feedbackid" HeaderText="feedbackid" 
                                                InsertVisible="False" ReadOnly="True" SortExpression="feedbackid" Visible="false" />
                                            <asp:BoundField DataField="feedbacktitle" HeaderText="feedbacktitle" ReadOnly="true" 
                                                SortExpression="feedbacktitle" />
                                            <asp:BoundField DataField="feedbackmsg" HeaderText="feedbackmsg" ReadOnly="true" 
                                                SortExpression="feedbackmsg" />
                                            <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" ReadOnly="true" />                                           
                                        
                                            <asp:BoundField DataField="reply" HeaderText="reply" SortExpression="reply" />
                                            <asp:CommandField ShowEditButton="True" />
                                            <asp:CommandField ShowDeleteButton="True" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" 
                                        DeleteCommand="DELETE FROM feedback WHERE (feedbackid = @feedbackid)" 
                                        SelectCommand="SELECT feedback.feedbackid, feedback.feedbacktitle, feedback.feedbackmsg, feedback.date, feedback.reply, flat.flatno, owner_mstr.owner_name, tower.tname FROM feedback INNER JOIN flat ON feedback.fid = flat.fid INNER JOIN tower ON flat.tid = tower.tid INNER JOIN owner_mstr ON flat.fid = owner_mstr.fid" 
                                        UpdateCommand="UPDATE feedback SET reply = @reply WHERE (feedbackid = @feedbackid)">
                                        <DeleteParameters>
                                            <asp:Parameter Name="feedbackid" />
                                        </DeleteParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="reply" />
                                            <asp:Parameter Name="feedbackid" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </div>
                                </form>
</asp:Content>


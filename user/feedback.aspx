<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.master" AutoEventWireup="true" CodeFile="feedback.aspx.cs" Inherits="user_feedback" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="h2">
Feedbacks And Complaints
</div><br /><br />
                    
                    <form id="Form1" runat="server">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <div class="form-group">
                <asp:Label ID ="lblhdtname" runat="server" Text="Tower Name:" ></asp:Label><br />
                        <asp:Label ID="lbltname" runat="server" Text="" class="form-control" 
                        Width="600px"></asp:Label>
                                   </div>
                                   <div class="form-group">
                <asp:Label ID ="Label1" runat="server" Text="Flat No:" ></asp:Label><br />
                        <asp:Label ID="lblflatno" runat="server" Text="" class="form-control" 
                        Width="600px"></asp:Label>
                                   </div>
                                   <div class="form-group">
                <asp:Label ID ="Label3" runat="server" Text="Owner Name:" ></asp:Label><br />
                        <asp:Label ID="lblownname" runat="server" Text="" class="form-control" 
                        Width="600px"></asp:Label>
                                   </div>
                                    <div class="form-group">
                <asp:Label ID ="Label4" runat="server" Text="Feedback/Complaint Title:" ></asp:Label><br />
                                        <asp:TextBox ID="txtfeedtitle" runat="server" Width="600px" class="form-control"  placeholder="Feedback/Complaint Title"></asp:TextBox>
                                      <asp:RequiredFieldValidator ID="rqvfeedtitle" runat="server" ErrorMessage="Enter Facility Review Title" ControlToValidate="txtfeedtitle" ValidationGroup="1"></asp:RequiredFieldValidator>
                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" Enabled="true" TargetControlID="txtfeedtitle" FilterType="Custom,LowercaseLetters,UppercaseLetters" ValidChars=" "  />
                                   </div>             
                <div class="form-group">
                <asp:Label ID ="Label5" runat="server" Text="Feedback/Complaint Message:" ></asp:Label><br />
                                        <asp:TextBox ID="txtfeedmessage" runat="server" Width="600px" placeholder="Facility Review Message" TextMode="MultiLine"></asp:TextBox><br />
                                   <asp:RequiredFieldValidator ID="rqvtxtfeedvmessage" runat="server" ErrorMessage="Enter Feedback/Complaint Message" ControlToValidate="txtfeedmessage" ValidationGroup="1"></asp:RequiredFieldValidator>
                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" Enabled="true" TargetControlID="txtfeedmessage" FilterType="Custom,LowercaseLetters,UppercaseLetters" ValidChars=" "  />
                                  </div>

                                    <div class="form-group">
                <asp:Label ID ="lblfid" runat="server" Text="" Visible="false" ></asp:Label><br />
                                   </div>

                                    <div class="form-group">
                      <asp:Button ID="btnfeedinsert" runat="server" Text="SEND" class="genric-btn primary" 
                                   ValidationGroup="1" onclick="btnfeedinsert_Click" />
                                   </div>

                                   <div class="form-group">
                <asp:Label ID ="lblmsg" runat="server" Text=""></asp:Label><br />
                                   </div>

                                    <div class="form-group">
                         
                                <div class="table-responsive">
                                    <asp:GridView ID="GridView1" runat="server" 
                                        CssClass="table table-striped table-bordered table-hover" 
                                        AutoGenerateColumns="False" DataKeyNames="feedbackid" 
                                        DataSourceID="SqlDataSource1">
                                        <Columns>
                                            <asp:BoundField DataField="feedbackid" HeaderText="feedbackid" 
                                                InsertVisible="False" ReadOnly="True" SortExpression="feedbackid" Visible="false" />
                                            <asp:BoundField DataField="flatno" HeaderText="flatno" 
                                                SortExpression="flatno" />
                                            <asp:BoundField DataField="feedbacktitle" HeaderText="feedbacktitle" 
                                                SortExpression="feedbacktitle" />
                                            <asp:BoundField DataField="feedbackmsg" HeaderText="feedbackmsg" 
                                                SortExpression="feedbackmsg" />
                                            <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                                            <asp:BoundField DataField="reply" HeaderText="reply" SortExpression="reply" />
                                        </Columns>
                                    </asp:GridView>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" 
                                        SelectCommand="SELECT feedback.feedbackid, flat.flatno, feedback.feedbacktitle, feedback.feedbackmsg, feedback.date, feedback.reply FROM feedback INNER JOIN flat ON feedback.fid = flat.fid">
                                    </asp:SqlDataSource>
                                        </div> 
                                        </div> 
                                   </form>
</asp:Content>



<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmstr.master" AutoEventWireup="true" CodeFile="changepw.aspx.cs" Inherits="changepw" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
   <div class="col-sm-6">
    <h2 class="m-0 text-dark">Change Password</h2>
        <p>&nbsp;</p>
    </div>
                        <form id="Form1" runat="server">
                        <div class="col-sm-6">
                        <div class="form-group">
                        <label>Current password</label><br />
                        <asp:TextBox ID="txtcurpw" runat="server" class="form-control" placeholder="Enter Your Current Password" TextMode="Password" Width="500px" ></asp:TextBox>                        
                          <asp:RequiredFieldValidator ID="rqfcurpw" runat="server" 
                                ControlToValidate="txtcurpw" 
                                SetFocusOnError="True" Display="Dynamic" ValidationGroup="8">Enter your current password </asp:RequiredFieldValidator><br/>
                        
                         <label>New password</label><br />   
                        <asp:TextBox ID="txtnewpw" runat="server" class="form-control" placeholder="Enter New Password" TextMode="Password" Width="500px" ></asp:TextBox>                        
                          <asp:RequiredFieldValidator ID="rqfnewpw" runat="server" 
                                ControlToValidate="txtnewpw" 
                                SetFocusOnError="True" Display="Dynamic" ValidationGroup="8">Enter your New password </asp:RequiredFieldValidator><br />

                                <label>Confirm New password</label><br />   
                        <asp:TextBox ID="txtconnewpw" runat="server" class="form-control" placeholder="Enter New Password Again" TextMode="Password" Width="500px" ></asp:TextBox>                        
                          <asp:RequiredFieldValidator ID="rqfconnewpw" runat="server" 
                                ControlToValidate="txtconnewpw" 
                                SetFocusOnError="True" Display="Dynamic" ValidationGroup="8">Enter your New password again</asp:RequiredFieldValidator><br /><br />
                            <asp:CompareValidator ID="cmpnewpw" runat="server" 
                                ErrorMessage="enter password correctly" ValidationGroup="8" ControlToCompare="txtnewpw" 
                                ControlToValidate="txtconnewpw"></asp:CompareValidator>
                                <br />
                                <asp:Button ID="btnchngepw" class="btn btn-primary" runat="server" 
                            Text="Submit" onclick="btnchngepw_Click" ValidationGroup="8" /><br />
                                <asp:Label runat="server" ID="lblpwmsg" ></asp:Label>
    </form>
</asp:Content>


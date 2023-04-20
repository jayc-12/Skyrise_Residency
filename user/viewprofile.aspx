<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.master" AutoEventWireup="true" CodeFile="viewprofile.aspx.cs" Inherits="user_viewprofile" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="h2">
Profile Details
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
                <asp:Label ID ="Label2" runat="server" Text="Email Id:" ></asp:Label><br />
                        <asp:Label ID="lbloemail" runat="server" Text="" class="form-control" 
                        Width="600px"></asp:Label>
                                   </div>
                                   <div class="form-group">
                <asp:Label ID ="Label5" runat="server" Text="Mobile No:" ></asp:Label><br />
                        <asp:Label ID="lblophno" runat="server" Text="" class="form-control" 
                        Width="600px"></asp:Label>
                                   </div>
                                   <div class="form-group">
                <asp:Label ID ="Label4" runat="server" Text="DOB:" ></asp:Label><br />
                        <asp:Label ID="lbldob" runat="server" Text="" class="form-control" 
                        Width="600px"></asp:Label><br /><br />
                                   </div>
                                    <br /><br /><br /><br /><div class="form-group">
                                     <asp:Button ID="changepw" runat="server" Text="Change Password" class="genric-btn success-border circle arrow" 
                                   ValidationGroup="1" onclick="changepw_Click"/>
                                   <span class="lnr lnr-arrow-right"></span>
                                      </div><br />

                                       <asp:Panel ID="Panel1" runat="server" Visible="false">
                                     <div class="form-group">
                                    <label>Enter Current Password:</label>
                                         <asp:TextBox ID="txt_currentpw" runat="server" TextMode="Password" class="form-control" Width="600px"></asp:TextBox>
                                         <asp:RequiredFieldValidator ID="rqvtxtcurrpw" runat="server" 
                               Display="Dynamic" ControlToValidate="txt_currentpw"  ForeColor ="#E2213E"> Enter Current Password</asp:RequiredFieldValidator>
                                   </div>
                                   <div class="form-group">
                                    <label>Enter New Password:</label>
                                         <asp:TextBox ID="txt_newpw" runat="server" TextMode="Password" class="form-control" Width="600px"></asp:TextBox>
                                          <asp:RequiredFieldValidator ID="rqvnewpw" runat="server" 
                               Display="Dynamic" ControlToValidate="txt_newpw"  ForeColor ="#E2213E"> Enter New Password</asp:RequiredFieldValidator>
                                <ajaxToolkit:PasswordStrength ID="PasswordStrength2" runat="server" DisplayPosition="RightSide" StrengthIndicatorType="Text"
                                 TargetControlID="txt_newpw" PrefixText="Stength:" Enabled="true" RequiresUpperAndLowerCaseCharacters="true" MinimumLowerCaseCharacters="1"
                                 MinimumUpperCaseCharacters="1" MinimumSymbolCharacters="1" MinimumNumericCharacters="1" PreferredPasswordLength="8" TextStrengthDescriptions="VeryPoor; Weak; Average; Strong; Excellent"
                                 BarBorderCssClass="border" HelpStatusLabelID="lblhelp" CalculationWeightings="25;25;15;35"></ajaxToolkit:PasswordStrength>
                                       <asp:Label ID="lblhelp" runat="server" Text="Label"></asp:Label>
                                   </div>
                                   <div class="form-group">
                                    <label>Confirm New Password:</label>
                                         <asp:TextBox ID="txt_new_confirmpw" runat="server" TextMode="Password" class="form-control" Width="600px"></asp:TextBox>
                                         <asp:RequiredFieldValidator ID="rqvconnewpw" runat="server" 
                               Display="Dynamic" ControlToValidate="txt_new_confirmpw"  ForeColor ="#E2213E"> Enter New Password Again</asp:RequiredFieldValidator><br />
                                       <asp:CompareValidator ID="cmppass" runat="server" ErrorMessage="Write Correct Password" ControlToValidate="txt_new_confirmpw" ControlToCompare="txt_newpw"></asp:CompareValidator>
                                       </div>


                                   <div class="form-group">
                                    <asp:Button ID="btnpwchange" runat="server" Text="Update Password" 
                                           class="genric-btn info-border circle arrow" onclick="btnpwchange_Click"/>
                                    <span  class="lnr lnr-arrow-right"></span>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="lblmsg" runat="server" Text="Label"></asp:Label>
                                    </div>
                            </asp:Panel>
    </form>
</asp:Content>


<%@ Page Language="C#" AutoEventWireup="true" CodeFile="signup.aspx.cs" Inherits="user_signup" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>
<html>
<head runat="server"> 
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>User Sign Up</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/fonts2/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="css/css2/style.css"/>
    <style type="text/css">
        .style1
        {
            font-size: large;
        }
    </style>
</head>
<body>
<script src="http://code.jquery.com/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=oimg.ClientID%>').prop('src', e.target.result)
                        .width(200)
                        .height(200);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }

    </script>

<form id="Form1" runat="server">
<asp:scriptmanager ID="Scriptmanager1" runat="server"></asp:scriptmanager>
<div class="main">
       <div class="container">
       <div class="signup-content">
       <div class="signup-img">
                 <br /><br /><br /><br /><img src="img/images1/apt.jpg" alt="image"/>
               </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                 <div class="form-group">
                 
                        <h1>User registration form</h1>
                        <div class="form-row">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <div class="signup-form">
                              
                                &nbsp;&nbsp;&nbsp;<asp:Label ID="Label2" runat="server" Text="Tower Name" 
                                    style="font-weight: 700"></asp:Label>
                                <div class="form-select">
                                <asp:DropDownList ID="drptname" runat="server" 
                                    DataSourceID="SqlDataSource1" DataTextField="tname" DataValueField="tid" 
                                       AutoPostBack="True">
                                </asp:DropDownList>
                                <span class="select-icon"><i class="zmdi zmdi-chevron-down"></i></span>
                                 </div>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" 
                                    SelectCommand="SELECT * FROM [tower]"></asp:SqlDataSource>
                                   
                            </div>
                            <div class="form-group">
                              
                                 <asp:Label ID="Label4" runat="server" Text="Flat No." 
                                    style="font-weight: 700"></asp:Label>
                                  <div class="form-select">
                                 <asp:DropDownList ID="drpflatno" runat="server" 
                                    DataSourceID="SqlDataSource2" DataTextField="flatno" 
                                    DataValueField="fid">
                                </asp:DropDownList>
                                <span class="select-icon"><i class="zmdi zmdi-chevron-down"></i></span>
                                </div>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" 
                                    SelectCommand="SELECT * FROM [flat] WHERE ([tid] = @tid)">
                                     <SelectParameters>
                                    <asp:ControlParameter ControlID="drptname" Name="tid" 
                                        PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="form-group">
                           
                            <asp:Label ID="Label5" runat="server" Text="Owner Name" 
                                    style="font-weight: 700"></asp:Label>
                            <asp:TextBox ID="txtoname" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ErrorMessage="Enter Owner Name" ControlToValidate="txtoname" Display="Dynamic"></asp:RequiredFieldValidator>

                        </div>
                        <div class="form-group">
                             <asp:Label ID="Label6" runat="server" Text="Email Id" 
                                    style="font-weight: 700"></asp:Label>                           
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                            <asp:TextBox ID="txtoemail" runat="server" AutoPostBack="True" 
                                    ontextchanged="txtoemail_TextChanged"></asp:TextBox>
                                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                </ContentTemplate>                     
                               </asp:UpdatePanel> 
                                                           
                                                 
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ErrorMessage="Enter Your Emailid" ControlToValidate="txtoemail" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ControlToValidate="txtoemail" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                ForeColor ="Red" Display="Dynamic" ValidationGroup="1">You Must Enter Proper E-mail Id</asp:RegularExpressionValidator>
                             </div>
                     
                        <div class="form-group">
                            <asp:Label ID="Label10" runat="server" Text="Date Of Birth" 
                                style="font-weight: 700"></asp:Label>
                            <asp:TextBox ID="txtodob" runat="server" ></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtodob" Enabled="true" Format="dd/MM/yyyy"   />
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label11" runat="server" Text="Gender" 
                                style="font-weight: 700"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <div class="form-select">
                                <asp:DropDownList ID="drpgender" runat="server" AutoPostBack="True" >
                                    <asp:ListItem>Male</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                </asp:DropDownList>
                                <span class="select-icon"><i class="zmdi zmdi-chevron-down"></i></span>
                                 </div>
                                                   
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label12" runat="server" Text="Mobile Number"></asp:Label>
                            
                           
                          <asp:TextBox ID="txtophno" runat="server" AutoPostBack="True" 
                                ontextchanged="txtophno_TextChanged" ></asp:TextBox>                               
                                   
                            <asp:Label ID="lblexist" runat="server" Text=""></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Your Phone Number" ControlToValidate="txtophno"></asp:RequiredFieldValidator>
                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtophno" FilterType="Numbers" Enabled="true" />
                            </div>

                               <div class="form-row">
                            <div class="form-group">
                           
                                <asp:Label ID="Label7" runat="server" Text="Password" 
                                    style="font-weight: 700"></asp:Label>
                                <asp:TextBox ID="txtopass" runat="server" TextMode="Password" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Password" ControlToValidate="txtopass" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                <ajaxToolkit:PasswordStrength ID="PasswordStrength2" runat="server" DisplayPosition="RightSide" StrengthIndicatorType="Text"
                                 TargetControlID="txtopass" PrefixText="Stength:" Enabled="true" RequiresUpperAndLowerCaseCharacters="true" MinimumLowerCaseCharacters="1"
                                 MinimumUpperCaseCharacters="1" MinimumSymbolCharacters="1" MinimumNumericCharacters="1" PreferredPasswordLength="8" TextStrengthDescriptions="VeryPoor; Weak; Average; Strong; Excellent"
                                 BarBorderCssClass="border" HelpStatusLabelID="lblhelp" CalculationWeightings="25;25;15;35"></ajaxToolkit:PasswordStrength><br />
                            <asp:Label ID="lblhelp" runat="server" Text=""></asp:Label>
                            </div><br/>
                            <div class="form-group">
                    
                              <asp:Label ID="Label9" runat="server" Text="Confirm Password" 
                                    style="font-weight: 700"></asp:Label>
                                <div class="form-select">
                                    <asp:TextBox ID="txtocpass" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Same Password Again " ControlToValidate="txtocpass" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                        ErrorMessage="Password Not Matched" ControlToCompare="txtopass" 
                                        ControlToValidate="txtocpass" ></asp:CompareValidator>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:FileUpload ID="fuoimg" runat="server" onchange="ImagePreview(this);" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please select profile picture" ControlToValidate="fuoimg"></asp:RequiredFieldValidator>
                            <asp:Image ID="oimg" runat="server" Height="200px" Width="200px" />
                        </div>
                        <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
                       
                        <div class="form-submit">
                            <asp:Label ID="lblotp" runat="server" Visible="False"></asp:Label>
                            <asp:Button ID="Button1" runat="server" Text="Submit" class="submit" 
                                name="submit" BackColor="#FF6600" ForeColor="Black" 
                                onclick="btnosubmit_Click" />
                           
                        </div>
                     <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="#3333FF" 
                            NavigateUrl="~/user/login.aspx">Already Registered?</asp:HyperLink>
                        </form>
                    </div>
            </div>       
       </div>            
   </div>                
                          
    <script src="vendor/vendor1/jquery/jquery.min.js"></script>
    <script src="js/js2/main.js"></script>
    <!-- This templates was made by Colorlib (https://colorlib.com) -->
    </body>
</html>




 
                
              

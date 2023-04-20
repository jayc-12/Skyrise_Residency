<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="user_login" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>User Login</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="img/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/fonts1/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/fonts1/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/css1/util.css">
	<link rel="stylesheet" type="text/css" href="css/css1/main.css">
<!--===============================================================================================-->
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-50 p-b-90">
				<form class="login100-form validate-form flex-sb flex-w" runat="server">
					<span class="login100-form-title p-b-51">
						user Login
					</span>

					
					<div class="wrap-input100 validate-input m-b-16">
			
                        <asp:TextBox ID="txtuname" runat="server" class="input100" placeholder="Username" ></asp:TextBox>
					
					</div>

                <asp:RequiredFieldValidator ID="rqfuname" runat="server" ErrorMessage="Please enter your Emailid " ControlToValidate="txtuname" ValidationGroup="1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                   <asp:RegularExpressionValidator ID="revemailid" runat="server" 
                                                             ControlToValidate="txtuname" 
                                                             ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                                                ForeColor ="#E2213E" Display="Dynamic" ValidationGroup="1">
                                                                You Must Enter Proper E-mail Id
                                                                </asp:RegularExpressionValidator>
					
					<div class="wrap-input100 validate-input m-b-16">
					
                        <asp:TextBox ID="txtupass" runat="server" class="input100" placeholder="Password" TextMode="Password" ></asp:TextBox>
						
					</div>
                     <asp:RequiredFieldValidator ID="rqfupass" runat="server" 
                        ErrorMessage="Please enter your password " ControlToValidate="txtupass" 
                        ValidationGroup="1" SetFocusOnError="True" ></asp:RequiredFieldValidator>

				
                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" onchange="document.getElementById('txtupass').type=this.checked ? 'text' : 'password'" /> Show Password<br />

					<div class="container-login100-form-btn m-t-17">
						
                        <asp:Button ID="btnlogin" runat="server" Text="Submit" 
                            class="login100-form-btn" onclick="btnlogin_Click" ValidationGroup="1" />
					</div><br />


                   <br /> <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="Red" 
                        NavigateUrl="~/user/forgotpw.aspx">Forgot pasword ?</asp:HyperLink><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:HyperLink ID="HyperLink2" runat="server" ForeColor="Blue" 
                        NavigateUrl="~/user/signup.aspx">Haven&#39;t Registerd Yet? </asp:HyperLink> <br />
                <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>

				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="js/js1/main.js"></script>

</body>
</html>
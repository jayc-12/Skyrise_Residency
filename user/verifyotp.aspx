﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="verifyotp.aspx.cs" Inherits="user_verifyotp" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>


<!DOCTYPE html>
<html lang="en">
<head>
	<title>Verify OTP</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<%--<link rel="icon" type="image/png" href="img/images/icons/favicon.ico"/>--%>
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
				<form id="Form1" class="login100-form validate-form flex-sb flex-w" runat="server">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
					<span class="login100-form-title p-b-51">
						Verify OTP
					</span>

					
					<div class="wrap-input100 validate-input m-b-16">
			
                        <asp:TextBox ID="txtotp" runat="server" class="input100" placeholder="Enter OTP " ></asp:TextBox>
					
					</div>
                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" Enabled="true" TargetControlID="txtotp" FilterType="Numbers" />
                <asp:RequiredFieldValidator ID="rqfuname" runat="server" ErrorMessage="Please Enter OTP Please  " ControlToValidate="txtotp" ValidationGroup="1" SetFocusOnError="True"></asp:RequiredFieldValidator>
					
							

					<div class="container-login100-form-btn m-t-17">
						
                        <asp:Button ID="btnforgot" runat="server" Text="VERIFY" 
                            class="login100-form-btn" ValidationGroup="1" onclick="btnforgot_Click" />
					</div><br />
                   <br /> 
                    <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="Red" 
                        NavigateUrl="~/user/login.aspx">Login </asp:HyperLink><br />
                    <br /><br /><br />
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
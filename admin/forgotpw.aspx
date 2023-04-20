<%@ Page Language="C#" AutoEventWireup="true" CodeFile="forgotpw.aspx.cs" Inherits="admin_forgotpw" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Forgot Password</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<%--<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>--%>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
</head>
<body>
	
	    <form runat="server">
		<div class="container-login100">
			<div class="wrap-login100">		
			
					<span class="login100-form-title">
					Recover Password
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<%--<input class="input100" type="text" name="email" placeholder="Email">--%>
                        <asp:TextBox ID="txtuname" runat="server" placeholder="Email" class="input100" ></asp:TextBox>
						<span class="focus-input100"></span>                    
                        		<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>
                      <asp:RequiredFieldValidator ID="rqvuname" runat="server" ErrorMessage="Enter email id" ControlToValidate="txtuname"></asp:RequiredFieldValidator>
                       <asp:RegularExpressionValidator ID="revemailid" runat="server" ControlToValidate="txtuname" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic">
                                                                Please Enter Proper E-mail Id
                                                                </asp:RegularExpressionValidator>

						
					<div class="container-login100-form-btn">
						
                            <asp:Button ID="btnforgot" runat="server" Text="Submit" 
                                class="login100-form-btn" onclick="btnforgot_Click" />
						
					</div>

					<div class="text-center p-t-12">						
						<a class="txt2" href="admin_login.aspx">
							Login 
						</a>
					</div><br /><br />

                <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
				</form>
			</div>
		</div>
	</div>
	
	

	
<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/tilt/tilt.jquery.min.js"></script>
	<script >
	    $('.js-tilt').tilt({
	        scale: 1.1
	    })
	</script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>

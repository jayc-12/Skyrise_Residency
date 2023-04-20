<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_login.aspx.cs" Inherits="admin_admin_login" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Admin Login</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/images3/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/vendor3/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/fonts3/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/vendor3/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/vendor3/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/vendor3/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/css3/util.css">
	<link rel="stylesheet" type="text/css" href="css/css3/main.css">
<!--===============================================================================================-->
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">

				<div class="login100-pic js-tilt" data-tilt>
					<img src="images/images3/img-01.png" alt="IMG">
				</div>

				<form class="login100-form validate-form">
					<span class="login100-form-title">
						Admin Login
					</span>
                    <form id="Form1" runat="server">
					<div class="wrap-input100 validate-input" <%--data-validate = "Valid email is required: ex@abc.xyz"--%>>
						<%--<input class="input100" type="text" name="email" placeholder="Email">--%>
                         <asp:TextBox ID="txtuname" runat="server"  class="input100" 
                            placeholder="Username" ontextchanged="txtaemail_TextChanged" ></asp:TextBox>
                            
                            <asp:RequiredFieldValidator ID="rqfauname" runat="server" 
                                                   Display="Dynamic" ControlToValidate="txtuname" ForeColor ="#E2213E">
                                                   Username is required</asp:RequiredFieldValidator>
                              <asp:RegularExpressionValidator ID="revemailid" runat="server" 
                                                             ControlToValidate="txtuname" 
                                                             ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                                                ForeColor ="#E2213E" Display="Dynamic">
                                                                You Must Enter Proper E-mail Id
                                                                </asp:RegularExpressionValidator>
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
                           
						</span>
					</div>
                    
                  
					<div class="wrap-input100 validate-input" >
						<%--<input class="input100" type="password" name="pass" placeholder="Password">--%>
                        <asp:TextBox ID="txtapass" runat="server" class="input100" 
                            placeholder="Password" TextMode="Password" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfpassword" runat="server" 
                                                            Display="Dynamic" ControlToValidate="txtapass" ForeColor ="#E2213E">
                                                            Password Must Required</asp:RequiredFieldValidator>
                        
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" onchange="document.getElementById('txtapass').type=this.checked ? 'text' : 'password'" /> Show Password<br />
                    

					
					<div class="container-login100-form-btn">
						<%--<button class="login100-form-btn">--%>
                        <asp:Button class="login100-form-btn" ID="btnalogin" runat="server" 
                            Text="Log In" onclick="btnalogin_Click" />
					</div>
                    <asp:Label ID="lblmsg" runat="server" ></asp:Label>

					<div class="text-center p-t-12">
						<span class="txt1">
							Forgot
						</span>
						<a class="txt2" href="forgotpw.aspx">
							Username / Password?
						</a>
					</div>
                    </form>


					<div class="text-center p-t-136">
						
					</div>
				</form>
			</div>
		</div>
	</div>
	
	

	
<!--===============================================================================================-->	
	<script src="vendor/vendor3/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/vendor3/bootstrap/js/popper.js"></script>
	<script src="vendor/vendor3/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/vendor3/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/vendor3/tilt/tilt.jquery.min.js"></script>
	<script >
	    $('.js-tilt').tilt({
	        scale: 1.1
	    })
	</script>
<!--===============================================================================================-->
	<script src="js/js3/main.js"></script>

</body>
</html>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<title>Forgot Password</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/forgot-password.css">


</head>
<body>

	<div class="forgot-container">

		<div class="forgot-header">
			<h2>Forgot Password</h2>
			<p>Enter your email to reset your password</p>
		</div>

		<form action="/forgot-password" method="post">

			<div class="form-group">
				<label>Email</label> <input type="email" name="email" required
					placeholder="Enter your registered email">
			</div>

			<button type="submit" class="submit-btn">Send OTP</button>

		</form>
		<div class="links">
			<a href="login">Back to Login</a> | <a href="signup">Create
				Account</a>
		</div>

	</div>
</body>
</html>

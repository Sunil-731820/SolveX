<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/resendVerification.css">
</head>
<body>

<div class="resend-container">

    <div class="resend-header">
        <h2>Resend Verification Email</h2>
        <p>Enter your email to resend the verification link</p>
    </div>
    
    	<form action="/resend-verification"
		method="get">
		
		 <div class="form-group">
            <label>Email</label>
            <input type="email" name="email" required
                   value="<%= request.getAttribute("email") != null ? request.getAttribute("email") : "" %>"
                   placeholder="Enter your registered email">
        </div>

        <button type="submit" class="submit-btn">Resend Verification Email</button>
		
		
	</form>
 <div class="links">
        <a href="login">Back to Login</a> |
        <a href="signup">Create Account</a>
    </div>

</div>
	<div style="color: red;">${errorMessage}</div>
	<div style="color: green;">${successMessage}</div>

</body>
</html>
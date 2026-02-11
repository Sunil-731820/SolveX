<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>Reset Password</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset-password.css">

</head>
<body>
<div class="reset-container">

    <div class="reset-header">
        <h2>Reset Password</h2>
        <p>Enter your new password</p>
    </div>
<form action="/reset-password" method="post">
    
    <div class="form-group">
            <label>Email</label>
            <input type="email" name="email" required
                   value="<%= request.getAttribute("email") != null ? request.getAttribute("email") : "" %>"
                   placeholder="Enter your registered email">
        </div>

        <div class="form-group">
            <label>New Password</label>
            <input type="password" name="password" required placeholder="Enter new password">
        </div>

        <button type="submit" class="submit-btn">Reset Password</button>
    
    
    
</form>

    <div class="links">
        <a href="login">Back to Login</a>
    </div>

</div>
 
</body>
</html>

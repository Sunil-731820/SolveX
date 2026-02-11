<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>Login</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">

</head>
<body>
<div class="login-container">

 <div class="login-header">
        <h2>CodeBloom</h2>
        <p>Login to CodeBloom</p>
    </div>
<!-- Show error or success messages -->
<div style="color:red;">
    ${errorMessage}
</div>

<div style="color:green;">
    ${successMessage}
</div>



<form action="/login" method="post">
<div class="form-group">
            <label>Email</label>
            <input type="email" name="email" required placeholder="Enter your email">
        </div>
    <div class="form-group">
            <label>Password</label>
            <input type="password" name="password" required placeholder="Enter your password">
        </div>
    <button type="submit" class="login-btn">Login</button>
</form>

 <!-- LINKS -->
    <div class="links">
        <a href="/signup">Create Account</a> |
        <a href="/forgot-password">Forgot Password?</a><br><br>
        <a href="${pageContext.request.contextPath}/resend-verification-page">
    Resend Email Verification
</a><br><br>
<!-- 🔵 GOOGLE LOGIN -->
<a href="/oauth2/authorization/google"
   class="btn btn-outline-danger d-flex align-items-center justify-content-center gap-2">

    <i class="bi bi-google"></i>
    <span>Sign In with Google</span>
</a>        
    </div>
</div>


</body>
</html>

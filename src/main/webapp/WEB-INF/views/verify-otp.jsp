<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head><title>Verify OTP</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/verify-otp.css">
</head>
<style>
.timer {
    font-size: 20px;
    font-weight: bold;
    color: green;
}
.error {
    color: red;
}
button:disabled {
    background-color: #ccc;
}
</style>

<script>
let time = 300;

setInterval(() => {
    if (time <= 0) {
        document.getElementById("countdown").innerText = "OTP Expired ❌";
        return;
    }
    let min = Math.floor(time / 60);
    let sec = time % 60;
    document.getElementById("countdown").innerText =
        "OTP expires in " + min + ":" + String(sec).padStart(2, "0");
    time--;
}, 1000);
</script>
<body>
<div class="otp-container">

    <div class="otp-header">
        <h2>OTP Verification</h2>
        <p>Enter the OTP sent to your email</p>
    </div>
<form action="/verify-otp" method="post">
    
     <div class="form-group">
            <label>Email</label>
            <input type="email" name="email" required
                   value="<%= request.getAttribute("email") != null ? request.getAttribute("email") : "" %>"
                   placeholder="Enter your email">
        </div>

        <div class="form-group">
            <label>OTP</label>
            <input type="text" name="otp" maxlength="6" required placeholder="Enter OTP">
        </div>


    <span id="countdown" class="timer"></span>

    <br><br>
        <button id="verifyBtn" type="submit" class="submit-btn">Verify OTP</button>
    
    
</form>

<%
String error = (String) request.getAttribute("error");
if (error != null) {
%>
<p class="error"><%= error %></p>
<%
}
%>

<div class="links">
        <a href="/login">Back to Login</a> |
        <a href="/forgot-password">Resend OTP</a>
    </div>

</div>


</body>
</html>

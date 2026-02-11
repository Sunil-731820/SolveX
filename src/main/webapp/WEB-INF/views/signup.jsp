<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>Signup</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/signup.css">

</head>
<body>
	<div class="signup-container">
		<div class="signup-header">
			<h2>CodeBloom</h2>
			<p>Create your account</p>
		</div>
		<form action="/signup" method="post">

			<div class="form-group">
				<label>Name</label> <input type="text" name="name"
					value="${user.name}" required placeholder="Enter your full name">
			</div>

			<div class="form-group">
				<label>Email</label> <input type="email" name="email"
					value="${user.email}" required placeholder="Enter your email">
			</div>

			<div class="form-group">
				<label>Password</label> <input type="password" name="password"
					required placeholder="Create a password">
			</div>


			<%--  <!-- Show error message -->
    <div style="color:red;">
        ${errorMessages}
    </div>
     --%>

			<%-- Showing All Error once  --%>

			<%
    List<String> errorMessages = (List<String>) request.getAttribute("errorMessages");
    if (errorMessages != null) {
        for(String msg : errorMessages) {
%>
			<div style="color: red;"><%= msg %></div>
			<%
        }
    }
%>

			<button type="submit" class="signup-btn">Create Account</button>
		</form>

		<!-- LINKS -->
		<div class="links">
			Already have an account? <a href="/login">Login</a>
		</div>

	</div>
</body>
</html>

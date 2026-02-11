<%@page import="com.java.real.entity.Problem"%>
<%
Problem problem = (Problem) request.getAttribute("problem");
%>
<html>
<head>
<title><%=problem.getTitle()%></title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body class="container mt-4">
	<h2><%=problem.getTitle()%></h2>
	<p>
		<strong>Difficulty:</strong>
		<%=problem.getDifficulty()%></p>
	<p><%=problem.getDescription()%></p>
	<h4>Examples</h4>
	<ul>
		<%
		for (var ex : problem.getExamples()) {
		%>
		<li>Input: <%=ex.getInput()%> | Output: <%=ex.getOutput()%></li>
		<%
		}
		%>
	</ul>
	<a href="/login" class="btn btn-secondary">Back</a>
</body>
</html>

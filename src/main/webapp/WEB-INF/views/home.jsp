<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Home | CodePractice</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">



</head>

<body>

	<!-- NAVBAR -->
	<div class="navbar">
		<h2>SolveX</h2>
		<div>
			<span>${userName}</span> <a href="profile">Profile</a> <a
				href="${pageContext.request.contextPath}/logout">Logout</a>
		</div>
	</div>

	<!-- PAGE -->
	<div class="page">

		<!-- SIDEBAR -->
		<div class="sidebar">
			<h4>SolveX</h4>
			<a href="home">🏠 Home</a> 
			<a href="problems">📚 Practice Java Problems</a> 
			<a href="/daily">🔥 Daily Challenge</a> 
			<a href="/practiceSQLQuery">🏆Practice SQL Query</a> 
			<a href="praticePythonProblems">🏆Practice Python Problems</a>
			<a href="praticePythonProblems">🏆Practice Python Problems</a>
			<a href="praticePythonProblems">🏆Practice Python Problems</a>
			<a href="praticePythonProblems">🏆Practice Python Problems</a>
			<a href="praticePythonProblems">🏆Practice Python Problems</a>
			<a href="praticePythonProblems">🏆Practice Python Problems</a>
			<a href="praticePythonProblems">🏆Practice Python Problems</a>
			<a href="praticePythonProblems">🏆Practice Python Problems</a>
			<a href="praticePythonProblems">🏆Practice Python Problems</a>
			
		</div>

		<!-- CONTENT -->
		<div class="content">

			<!-- STATS -->
			<div class="stats">
				<div class="stat-card">
<!-- 					<a href="problems">📚 Practice Java Problems</a>
 -->			<h2>10</h2>
 				<p>Solved</p>		
 				</div>
				<div class="stat-card">
					<h2>20</h2>
					<p>Attempted</p>
				</div>
				<div class="stat-card">
					<h2>60%</h2>
					<p>Acceptance</p>
				</div>
			</div>

			<!-- PROBLEM LIST -->
			<div class="table-container">
				<table>
					<tr>
						<th>Title</th>
						<th>Difficulty</th>
						<th>Status</th>
						<th></th>
					</tr>

					<tr>
						<td>Two Sum</td>
						<td class="easy">Easy</td>
						<td class="status-solved">Solved</td>
						<td><a href="problem/1" class="solve-btn">Solve</a></td>
					</tr>

					<tr>
						<td>Longest Substring Without Repeating Characters</td>
						<td class="medium">Medium</td>
						<td class="status-attempted">Attempted</td>
						<td><a href="problem/2" class="solve-btn">Solve</a></td>
					</tr>

					<tr>
						<td>LRU Cache</td>
						<td class="hard">Hard</td>
						<td class="status-new">Not Tried</td>
						<td><a href="problem/3" class="solve-btn">Solve</a></td>
					</tr>
				</table>
			</div>

		</div>
	</div>

</body>
</html>

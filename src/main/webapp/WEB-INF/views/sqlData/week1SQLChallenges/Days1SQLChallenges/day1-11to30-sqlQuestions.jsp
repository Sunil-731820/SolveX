<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<title>SQL Day 1 Challenges</title>

<!-- Prism.js CSS for syntax highlighting -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/themes/prism.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/day1-11to30-sqlQuestions.css" />
<style>
        .tree-nav { width: 250px; float: left; }
        .content-area { margin-left: 270px; padding: 20px; border: 1px solid #ccc; min-height: 400px; }
        li { margin: 5px 0; }
        a { text-decoration: none; color: #2c3e50; }
        a:hover { color: #e74c3c; }
    </style>
<script>
        function toggleNode(id) {
            var node = document.getElementById("children-" + id);
            var icon = document.getElementById("icon-" + id);
            if (node.classList.contains("hidden")) {
                node.classList.remove("hidden");
                icon.textContent = "−";
            } else {
                node.classList.add("hidden");
                icon.textContent = "+";
            }
        }
    </script>


</head>
<body>
	<div class="tree-container">
		<h3>📘 SQL Tutorials Explorer</h3>
		<ul class="tree">
			<li><span id="icon-sql1" class="toggle"
				onclick="toggleNode('sql1')">+</span> <span class="topic">SELECT
					Statement <span class="badge">Basics</span>
			</span>
				<ul id="children-sql1" class="hidden">
					<li>Introduction to SELECT</li>
					<li>SELECT with WHERE</li>
					<li>SELECT with ORDER BY</li>
				</ul></li>
			<li><span id="icon-sql2" class="toggle"
				onclick="toggleNode('sql2')">+</span> <span class="topic">INSERT
					Statement <span class="badge">InterM</span>
			</span>
				<ul id="children-sql2" class="hidden">
					<li>Basic INSERT</li>
					<li>INSERT Multiple Rows</li>
				</ul></li>
			<li><span id="icon-sql3" class="toggle"
				onclick="toggleNode('sql3')">+</span> <span class="topic">UPDATE
					Statement <span class="badge">Advanced</span>
			</span>
				<ul id="children-sql3" class="hidden">
					<a><li>Basic UPDATE</li></a>
					<li>UPDATE with WHERE</li>
				</ul></li>
			<li><span id="icon-sql4" class="toggle"
				onclick="toggleNode('sql4')">+</span> <span class="topic">UPDATE
					Statement <span class="badge">Advanced</span>
			</span>
				<ul id="children-sql4" class="hidden">
					<li><a href="/sqlData/basicUpdate.html" target="contentFrame">Basic UPDATE</a></li> 
					<li><a href="updateWithWhere.jsp">UPDATE with WHERE</a></li>
				</ul></li>

			<li><span id="icon-sql5" class="toggle"
				onclick="toggleNode('sql5')">+</span> <span class="topic">UPDATE
					Statement <span class="badge">Advanced</span>
			</span>
				<ul id="children-sql5" class="hidden">
					<li>Basic UPDATE</li>
					<li>UPDATE with WHERE</li>
				</ul></li>
		</ul>
		
		<ul>
            <li>
                <span id="icon-sql6" class="toggle" onclick="toggleNode('sql6')">+</span>
                <span class="topic">NEW UPDATE Statement <span class="badge">Advanced</span></span>
                <ul id="children-sql6" class="hidden">
                    <li><a href="/sqlData/basicUpdate.html" target="contentFrame">Basic UPDATE</a></li>
                    <li><a href="/sqlData/updateWithWhere.html" target="contentFrame">UPDATE with WHERE</a></li>
                </ul>
            </li>
        </ul>
	</div>

<!-- Content Area -->
    <div class="content-area">
        <iframe name="contentFrame" width="100%" height="500px" frameborder="0"></iframe>
    </div>


	<!-- Prism.js JavaScript -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/prism.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/components/prism-sql.min.js"></script>
</body>
</html>

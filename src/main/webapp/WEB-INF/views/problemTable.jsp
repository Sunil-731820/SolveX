<%@page import="java.util.Collections"%>
<%@page import="java.util.Comparator"%>
<%@page import="com.java.real.entity.Problem"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    List<Problem> problems = (List<Problem>) request.getAttribute("problems");
//Read sort parameters
String sort = request.getParameter("sort");
String order = request.getParameter("order");

if (problems != null && sort != null) {
    Comparator<Problem> comparator = null;

    if ("title".equals(sort)) {
        comparator = Comparator.comparing(Problem::getTitle, String.CASE_INSENSITIVE_ORDER);
    } else if ("difficulty".equals(sort)) {
        comparator = Comparator.comparing(Problem::getDifficulty, String.CASE_INSENSITIVE_ORDER);
    } else if ("tags".equals(sort)) {
        comparator = Comparator.comparing(
            p -> p.getTags() != null ? String.join(",", p.getTags()) : ""
        );
    }

    if (comparator != null) {
        if ("desc".equalsIgnoreCase(order)) {
            comparator = comparator.reversed();
        }
        Collections.sort(problems, comparator);
    }
}

%>

<table id="problemTable" border="10" cellpadding="8" cellspacing="0">
	<tr>
                <th>
    Title
    <a href="?sort=title&order=asc">&#9650;</a> <!-- ▲ -->
    <a href="?sort=title&order=desc">&#9660;</a> <!-- ▼ -->
</th>

                <th>
                    Difficulty
                    <a href="?sort=difficulty&order=asc">▲</a>
                    <a href="?sort=difficulty&order=desc">▼</a>
                </th>
                <th>
                    Tags
                    <a href="?sort=tags&order=asc">▲</a>
                    <a href="?sort=tags&order=desc">▼</a>
                </th>

		<th>Actions</th>
	</tr>

	<%
if (problems != null) {
    for (Problem p : problems) {
%>

	<tr data-title="<%=p.getTitle().toLowerCase()%>"
		data-difficulty="<%=p.getDifficulty()%>"
		data-tags="<%=p.getTags() != null ? String.join(",", p.getTags()).toLowerCase() : "" %>">

		<td
			onclick="openModal('<%=p.getTitle()%>', '<%=p.getDescription()%>')"
			style="cursor: pointer; color: blue;"><%=p.getTitle()%></td>

		<td class="<%=p.getDifficulty().toLowerCase()%>"><%=p.getDifficulty()%>
		</td>

		<td><%= p.getTags() != null ? String.join(", ", p.getTags()) : "" %>
		</td> 

		<td>
		<a href="/solve/<%=p.getId()%>">Solve In Editor</a>
<br><br>
		
			<%-- <button onclick="markSolved('<%=p.getId()%>')"
				style="background:<%=p.isSolved()?"green":"#ccc"%>;color:white">
				â Solve</button>

			<button onclick="toggleFavorite('<%=p.getId()%>')"
				style="color:<%=p.isFavorite()?"gold":"black"%>">â Favorite
			</button>
 --%>			
		</td>
		
		<td>
   
</td>
<!-- <td>
<a href="/NavigateToSolveproblem">Solve In Editor</a><br><br>
</td>
 -->	</tr>

	<%
    }
}
%>

</table>
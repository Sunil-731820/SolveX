<%@page import="com.java.real.entity.Problem"%>
<%@page import="java.util.List"%>
<%
    List<Problem> problems = (List<Problem>) request.getAttribute("problems");
%>

<style>
    /* Table container */
    #problemTable {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: #fff;
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0 2px 6px rgba(0,0,0,0.1);
    }

    #problemTable th, #problemTable td {
        padding: 14px 18px;
        text-align: left;
    }

    #problemTable th {
        background: #f3f4f6;
        color: #374151;
        font-weight: 600;
        font-size: 15px;
        border-bottom: 2px solid #e5e7eb;
    }

    #problemTable tr:nth-child(even) {
        background: #f9fafb;
    }

    #problemTable tr:hover {
        background: #eef2ff;
        cursor: pointer;
    }

    /* Title clickable */
    #problemTable td.title {
        color: #2563eb;
        font-weight: 500;
    }
    #problemTable td.title:hover {
        text-decoration: underline;
    }

    /* Difficulty badges */
    .easy {
        color: #10b981;
        font-weight: bold;
    }
    .medium {
        color: #f59e0b;
        font-weight: bold;
    }
    .hard {
        color: #ef4444;
        font-weight: bold;
    }

    /* Tags styling */
    #problemTable td.tags {
        color: #6b7280;
        font-size: 14px;
    }

    /* Action buttons */
    .action-btn {
        display: inline-block;
        padding: 8px 12px;
        margin: 4px;
        border-radius: 6px;
        font-size: 14px;
        text-decoration: none;
        transition: all 0.2s ease;
    }
    .solve-btn {
        background: #2563eb;
        color: #fff;
    }
    .solve-btn:hover {
        background: #1e40af;
    }
    .favorite-btn {
        background: #f3f4f6;
        color: #f59e0b;
        border: 1px solid #f59e0b;
    }
    .favorite-btn:hover {
        background: #fef3c7;
    }
    .solved-btn {
        background: #10b981;
        color: #fff;
    }
</style>

<table id="problemTable">
    <tr>
        <th>Title</th>
        <th>Difficulty</th>
        <th>Tags</th>
        <th>Actions</th>
    </tr>

    <%
    if (problems != null) {
        for (Problem p : problems) {
    %>
    <tr data-title="<%=p.getTitle().toLowerCase()%>"
        data-difficulty="<%=p.getDifficulty()%>"
        data-tags="<%=p.getTags() != null ? String.join(",", p.getTags()).toLowerCase() : "" %>">

        <!-- Title -->
        <td class="title"
            onclick="openModal('<%=p.getTitle()%>', '<%=p.getDescription()%>')">
            <%=p.getTitle()%>
        </td>

        <!-- Difficulty -->
        <td class="<%=p.getDifficulty().toLowerCase()%>">
            <%=p.getDifficulty()%>
        </td>

        <!-- Tags -->
        <td class="tags">
            <%= p.getTags() != null ? String.join(", ", p.getTags()) : "" %>
        </td>

        <!-- Actions -->
        <td>
            <a href="/solve/<%=p.getId()%>" class="action-btn solve-btn">Solve In Editor</a>
            <%-- Example extra buttons if you want to enable them --%>
            <%-- 
            <button onclick="markSolved('<%=p.getId()%>')" 
                    class="action-btn solved-btn">
                ✔ Solved
            </button>
            <button onclick="toggleFavorite('<%=p.getId()%>')" 
                    class="action-btn favorite-btn">
                ★ Favorite
            </button>
            --%>
        </td>
    </tr>
    <%
        }
    }
    %>
</table>

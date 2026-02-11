<%@ page import="java.util.List, com.java.real.entity.Problem" %>
<html>
<head>
    <title>DSA Problems</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9fafb;
            margin: 0;
            padding: 0;
        }

        header {
            background: #1f2937;
            color: #fff;
            padding: 15px 30px;
            font-size: 20px;
            font-weight: bold;
        }

        .welcome {
            margin: 20px;
            font-size: 16px;
        }
        .welcome span {
            color: #10b981;
            font-weight: bold;
        }

        .container {
            max-width: 1200px;
            margin: auto;
            padding: 20px;
        }

        .card {
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
            padding: 20px;
            margin-bottom: 20px;
        }

        h2 {
            margin-bottom: 15px;
            color: #374151;
        }

        /* Problem Table */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        th, td {
            padding: 12px 15px;
            text-align: left;
        }
        th {
            background: #f3f4f6;
            color: #374151;
            font-weight: 600;
        }
        tr:nth-child(even) {
            background: #f9fafb;
        }
        tr:hover {
            background: #e5e7eb;
        }

        /* Pagination */
        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .pagination a {
            margin: 0 5px;
            padding: 8px 12px;
            background: #1f2937;
            color: #fff;
            border-radius: 4px;
            text-decoration: none;
        }
        .pagination a:hover {
            background: #4b5563;
        }

        footer {
            background: #1f2937;
            color: #9ca3af;
            text-align: center;
            padding: 15px;
            margin-top: 30px;
        }
        /* Navigation bar */
    .navbar {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        background: #1f2937; /* dark gray */
        color: #fff;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 12px 30px;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        box-shadow: 0 2px 6px rgba(0,0,0,0.2);
        z-index: 1000;
    }
    

    .navbar h1 {
        margin: 0;
        font-size: 20px;
        font-weight: bold;
        color: #f9fafb;
    }

    .navbar .welcome {
        font-size: 14px;
        color: #10b981; /* green accent */
        font-weight: 600;
    }

    /* Add spacing so content isn't hidden behind navbar */
    body {
        margin: 0;
        padding-top: 60px; /* equal to navbar height */
        background: #f9fafb;
    }
        
    </style>
</head>
<body>
<!--     <header>DSA Problem Dashboard</header>
 -->
<%--     <div class="welcome">
        <b>Welcome Back:</b> 
        <span><%= session.getAttribute("userEmail") %></span>
    </div>
 --%>    
    <!-- Navigation bar -->
<div class="navbar">
    <h1>Problem Dashboard</h1>
    <div class="welcome" style="text-align:right; padding-right:30px;">
        Welcome: <span><%= session.getAttribute("userEmail") %></span>
    </div>
</div>
    

    <div class="container">
        <div class="card">
            <%@ include file="fragments/searchFilter.jsp" %>
        </div>

        <div class="card">
            <h2><!-- <i class="fa-solid fa-code"></i> Problem List --></h2>
            <%@ include file="fragments/problemTable.jsp" %>
        </div>

        <div class="card">
            <%@ include file="pagination.jsp" %>
        </div>

        <%@ include file="fragments/modal.jsp" %>
    </div>

    <%@ include file="fragments/footer.jsp" %>
</body>
</html>

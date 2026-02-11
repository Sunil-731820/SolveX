<%@ page import="java.lang.Integer" %>
<%-- <%
    int currentPage = (Integer) request.getAttribute("currentPage");
    int totalPages = (Integer) request.getAttribute("totalPages");
    String ctx = request.getContextPath();
%> --%>

<%
    Integer currentPageObj = (Integer) request.getAttribute("currentPage");
    Integer totalPagesObj = (Integer) request.getAttribute("totalPages");

    int currentPage = currentPageObj != null ? currentPageObj : 0;
    int totalPages = totalPagesObj != null ? totalPagesObj : 0;
	out.println("The Current Page is :="+currentPage);
    String ctx = request.getContextPath();
%>


<style>
    .pagination {
        display: flex;
        justify-content: center;
        margin-top: 20px;
        gap: 8px;
    }

    .pagination button {
        padding: 8px 14px;
        border: none;
        border-radius: 6px;
        background: #f3f4f6;
        color: #374151;
        font-size: 14px;
        cursor: pointer;
        transition: all 0.2s ease;
    }

    .pagination button:hover:not(:disabled) {
        background: #2563eb;
        color: #fff;
    }

    .pagination button.active {
        background: #2563eb;
        color: #fff;
        font-weight: bold;
    }

    .pagination button:disabled {
        background: #e5e7eb;
        color: #9ca3af;
        cursor: not-allowed;
    }
</style>

<!-- <div class="pagination">
    <button id="prevBtn" onclick="goPrev()">Previous</button>
    <button class="page-btn active" onclick="goToPage(1)">1</button>
    <button class="page-btn" onclick="goToPage(2)">2</button>
    <button class="page-btn" onclick="goToPage(3)">3</button>
    <button id="nextBtn" onclick="goNext()">Next</button>
</div> -->


<div class="pagination">
    <!-- Previous -->
    <% if (currentPage > 0) { %>
        <a href="<%= ctx %>/problems?page=<%= currentPage - 1 %>">
            <button id="prevBtn">Previous</button>
        </a>
    <% } %>

    <!-- Page numbers -->
    <% for (int i = 0; i < totalPages; i++) { %>
        <% if (i == currentPage) { %>
            <button class="page-btn active"><%= i + 1 %></button>
        <% } else { %>
            <a href="<%= ctx %>/problems?page=<%= i %>">
                <button class="page-btn"><%= i + 1 %></button>
            </a>
        <% } %>
    <% } %>

    <!-- Next -->
    <% if (currentPage + 1 < totalPages) { %>
        <a href="<%= ctx %>/problems?page=<%= currentPage + 1 %>">
            <button id="nextBtn">Next</button>
        </a>
    <% } %>
</div>


<!-- <script>
    let currentPage = 1;
    const totalPages = 3; // adjust based on your backend data

    function updatePagination() {
        // Highlight active page
        document.querySelectorAll('.page-btn').forEach(btn => {
            btn.classList.remove('active');
            if (parseInt(btn.textContent) === currentPage) {
                btn.classList.add('active');
            }
        });

        // Enable/disable prev/next
        document.getElementById('prevBtn').disabled = currentPage === 1;
        document.getElementById('nextBtn').disabled = currentPage === totalPages;
    }

    function goToPage(page) {
        currentPage = page;
        updatePagination();
        loadPageData(page);
    }

    function goPrev() {
        if (currentPage > 1) {
            currentPage--;
            updatePagination();
            loadPageData(currentPage);
        }
    }

    function goNext() {
        if (currentPage < totalPages) {
            currentPage++;
            updatePagination();
            loadPageData(currentPage);
        }
    }

    function loadPageData(page) {
        // 🔥 Replace this with AJAX or backend call
        console.log("Loading data for page:", page);
        // Example: fetch(`/problems?page=${page}`).then(...)
    }

    // Initialize
    updatePagination();
</script>
 -->
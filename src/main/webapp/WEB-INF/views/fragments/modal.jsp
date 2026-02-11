<style>
    /* Overlay background */
    #modalOverlay {
        display: none;
        position: fixed;
        top: 0; left: 0;
        width: 100%; height: 100%;
        background: rgba(0,0,0,0.5);
        z-index: 999;
    }

    /* Modal box */
    #problemModal {
        display: none;
        position: fixed;
        top: 50%; left: 50%;
        transform: translate(-50%, -50%);
        width: 50%;
        max-width: 600px;
        background: #fff;
        border-radius: 10px;
        box-shadow: 0 8px 20px rgba(0,0,0,0.25);
        padding: 20px;
        z-index: 1000;
        animation: fadeIn 0.3s ease-out;
    }

    /* Header */
    #problemModal h3 {
        margin-top: 0;
        font-size: 20px;
        color: #2563eb;
        border-bottom: 1px solid #e5e7eb;
        padding-bottom: 10px;
    }

    /* Description */
    #problemModal p {
        margin: 15px 0;
        color: #374151;
        line-height: 1.5;
    }

    /* Footer buttons */
    .modal-footer {
        text-align: right;
        margin-top: 20px;
    }

    .modal-btn {
        padding: 8px 14px;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        font-size: 14px;
        transition: all 0.2s ease;
    }

    .close-btn {
        background: #ef4444;
        color: #fff;
    }
    .close-btn:hover {
        background: #dc2626;
    }

    .solve-btn {
        background: #2563eb;
        color: #fff;
        margin-right: 10px;
    }
    .solve-btn:hover {
        background: #1e40af;
    }

    /* Animation */
    @keyframes fadeIn {
        from { opacity: 0; transform: translate(-50%, -45%); }
        to { opacity: 1; transform: translate(-50%, -50%); }
    }
</style>

<!-- Overlay -->
<div id="modalOverlay" onclick="closeModal()"></div>


<!-- Modal -->
<div id="problemModal">
    <h3 id="modalTitle"></h3>
    <p id="modalDescription"></p>

    <div class="modal-footer">
        <button class="modal-btn solve-btn" onclick="goToEditor()">Solve In Editor</button>
        <button class="modal-btn close-btn" onclick="closeModal()">Close</button>
    </div>
</div>

<script>
    function openModal(title, description) {
        document.getElementById("modalTitle").innerText = title;
        document.getElementById("modalDescription").innerText = description;
        document.getElementById("modalOverlay").style.display = "block";
        document.getElementById("problemModal").style.display = "block";
    }

    function closeModal() {
        document.getElementById("modalOverlay").style.display = "none";
        document.getElementById("problemModal").style.display = "none";
    }

    function goToEditor() {
        alert("Redirect to problem editor...");
        // Example: window.location.href = "/solve/" + problemId;
        <a href="/solve/" class="action-btn solve-btn">Solve In Editor</a>
    }
</script>

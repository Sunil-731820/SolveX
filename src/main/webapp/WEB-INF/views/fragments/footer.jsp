<script>
function applyFilters() {

    let search = document.getElementById("searchInput").value.toLowerCase();
    let difficulty = document.getElementById("difficultyFilter").value;
    let tags = document.getElementById("tagFilter").value.toLowerCase();

    let rows = document.querySelectorAll("#problemTable tr");

    rows.forEach((row, index) => {
        if (index === 0) return;

        let title = row.dataset.title;
        let rowDifficulty = row.dataset.difficulty;
        let rowTags = row.dataset.tags;

        let show =
            title.includes(search) &&
            (difficulty === "" || rowDifficulty === difficulty) &&
            (tags === "" || rowTags.includes(tags));

        row.style.display = show ? "" : "none";
    });
}

function openModal(title, description) {
    document.getElementById("modalTitle").innerText = title;
    document.getElementById("modalDescription").innerText = description;
    document.getElementById("problemModal").style.display = "block";
}

function closeModal() {
    document.getElementById("problemModal").style.display = "none";
}


function markSolved(id){
    alert("Problem " + id + " marked as Solved");
	 fetch('/problem/solve',{
	  method:'POST',
	  headers:{'Content-Type':'application/x-www-form-urlencoded'},
	  body:'problemId='+id
	 }).then(()=>location.reload());
	}

	function toggleFavorite(id){
	    alert("Problem " + id + " added to Favorites");
	 fetch('/problem/favorite',{
	  method:'POST',
	  headers:{'Content-Type':'application/x-www-form-urlencoded'},
	  body:'problemId='+id
	 }).then(()=>location.reload());
	}
</script>

</body>
</html>
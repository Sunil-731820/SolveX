<style>
    .search-bar {
        display: flex;
        gap: 25px;
        margin-bottom: 20px;
        padding: 15px;
        background: #fff;
        border-radius: 8px;
        box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        align-items: flex-end;
    }

    .search-group {
        flex: 1;
        display: flex;
        flex-direction: column;
    }

    .search-group label {
        font-weight: 600;
        color: #374151;
        margin-bottom: 5px;
    }

    .search-group input,
    .search-group select {
        padding: 10px;
        border: 1px solid #d1d5db;
        border-radius: 6px;
        font-size: 14px;
        transition: border-color 0.2s, box-shadow 0.2s;
    }

    .search-group input:focus,
    .search-group select:focus {
        border-color: #2563eb;
        box-shadow: 0 0 0 2px rgba(37,99,235,0.2);
        outline: none;
    }

    /* Difficulty dropdown colors */
    #difficultyFilter option[value="Easy"] {
        color: #10b981; /* green */
    }
    #difficultyFilter option[value="Medium"] {
        color: #f59e0b; /* orange */
    }
    #difficultyFilter option[value="Hard"] {
        color: #ef4444; /* red */
    }
</style>

<div class="search-bar">
    <!-- Search -->
    <div class="search-group">
        <label><i class="fa fa-search"></i> Search</label>
        <input type="text" id="searchInput"
               placeholder="Search by title..."
               onkeyup="applyFilters()"/>
    </div>

    <!-- Difficulty -->
    <div class="search-group">
        <label><i class="fa fa-signal"></i> Difficulty</label>
        <select id="difficultyFilter" onchange="applyFilters()">
            <option value="">All</option>
            <option value="Easy"> Easy</option>
            <option value="Medium"> Medium</option>
            <option value="Hard">Hard</option>
        </select>
    </div>

    <!-- Tags -->
    <div class="search-group">
        <label><i class="fa fa-tags"></i> Tags</label>
        <input type="text" id="tagFilter"
               placeholder="Array, Stack..."
               onkeyup="applyFilters()"/>
    </div>
</div>

<hr/>

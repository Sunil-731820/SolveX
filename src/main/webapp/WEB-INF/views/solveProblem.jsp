<%@page import="com.java.real.entity.Example"%>
<%@page import="java.util.List"%>
<%@page import="com.java.real.entity.Problem"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Solved Problem</title>
    <style>
    body {
        margin: 0;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: #f9fafb;
    }

    .split-container {
        display: flex;
        height: 100vh;
        transition: all 0.3s ease;
    }

    /* Problem panel */
    .problem-card {
        flex: 0.35; /* default width */
        background: #fff;
        border-right: 1px solid #e5e7eb;
        padding: 20px;
        overflow-y: auto;
        transition: flex 0.3s ease;
    }
    .problem-card.collapsed {
        flex: 0; /* collapse to zero width */
        padding: 0;
        overflow: hidden;
    }

    .problem-id { font-size: 14px; color: #6b7280; font-weight: bold; }
    .problem-title { font-size: 20px; font-weight: 600; color: #2563eb; margin: 10px 0; }
    .difficulty-badge {
        padding: 4px 10px;
        border-radius: 12px;
        font-size: 12px;
        font-weight: bold;
        color: #fff;
    }
    .easy { background: #10b981; }
    .medium { background: #f59e0b; }
    .hard { background: #ef4444; }

    .problem-description {
        font-size: 14px;
        color: #374151;
        line-height: 1.6;
        margin-top: 15px;
        white-space: pre-wrap;
    }

    .tags { margin-top: 10px; font-size: 13px; color: #6b7280; }

    .problem-actions {
        margin-top: 20px;
        display: flex;
        gap: 10px;
        flex-wrap: wrap;
    }
    .action-btn {
        padding: 6px 12px;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        font-size: 13px;
        transition: all 0.2s ease;
    }
    .solve-btn { background: #2563eb; color: #fff; }
    .solve-btn:hover { background: #1e40af; }
    .favorite-btn { background: #f3f4f6; color: #f59e0b; border: 1px solid #f59e0b; }
    .favorite-btn:hover { background: #fef3c7; }
    .copy-btn { background: #10b981; color: #fff; }
    .copy-btn:hover { background: #059669; }

    /* Editor panel */
    .editor-section {
        flex: 0.65;
        display: flex;
        flex-direction: column;
        background: #111827;
        transition: flex 0.3s ease;
    }
    .editor-section.expanded {
        flex: 1; /* take full width when problem collapsed */
    }

    .editor-header {
        background: #1f2937;
        color: #fff;
        padding: 10px 15px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .editor-header select {
        background: #374151;
        color: #fff;
        border: none;
        padding: 6px 10px;
        border-radius: 4px;
    }
    #editor { flex: 1; }
    .editor-footer {
        background: #1f2937;
        padding: 10px;
        text-align: right;
    }
    .editor-footer button {
        background: #2563eb;
        color: #fff;
        border: none;
        padding: 8px 14px;
        border-radius: 6px;
        cursor: pointer;
        transition: background 0.2s;
    }
    .editor-footer button:hover { background: #1e40af; }

    /* #output {
        background: #111827;
        color: #10b981;
        padding: 15px;
        border-top: 1px solid #374151;
        font-family: monospace;
        white-space: pre-wrap;
        min-height: 100px;
    } */

    #output {
        background: #111827;       /* dark background */
        color: #10b981;            /* green text */
        padding: 15px;
        border-top: 5px solid #374151;
        font-family: monospace;
        white-space: pre;          /* preserve spacing, no wrapping */
        overflow-x: auto;          /* horizontal scrollbar */
        overflow-y: auto;          /* vertical scrollbar */
        min-height: 120px;         /* minimum height */
        max-height: 70vh;          /* prevent it from overtaking screen */
        resize: vertical;          /* ✅ allows user to resize vertically */
        border-radius: 6px;
        font-size: 14px;
    }

    /* Optional: custom scrollbar styling */
    #output::-webkit-scrollbar {
        height: 50px;
        width: 8px;
    }
    #output::-webkit-scrollbar-track {
        background: #1f2937;
    }
    #output::-webkit-scrollbar-thumb {
        background: #6b7280;
        border-radius: 4px;
    }
    #output::-webkit-scrollbar-thumb:hover {
        background: #9ca3af;
    }

    /* Toggle button */
    .toggle-btn {
        position: absolute;
        top: 10px;
        left: 10px;
        background: #f59e0b;
        color: #fff;
        border: none;
        padding: 6px 12px;
        border-radius: 6px;
        cursor: pointer;
        z-index: 2000;
    }
    .toggle-btn:hover { background: #d97706; }

/* Clear button style */
    .clear-btn {
        background: #ef4444; /* red */
    }
    .clear-btn:hover {
        background: #b91c1c;
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
    
    .problem-id,
.problem-title,
.difficulty-badge,
.problem-description,
.tags {
    font-weight: bold;
}
    
    

        /* body { font-family: Arial, sans-serif; margin: 20px; background-color: #f5f5f5; color: #333; }
        h2, p { color: #333; }
        #language { margin-bottom: 10px; padding: 5px; border-radius: 4px; }
        .editor-container { border: 2px solid #ccc; border-radius: 8px; background-color: #1e1e1e; box-shadow: 0 4px 12px rgba(0,0,0,0.2); overflow: hidden; }
        .editor-header { background-color: #2d2d2d; color: #fff; padding: 8px 12px; font-weight: bold; border-bottom: 1px solid #444; }
        #editor { height: 420px; }
        .editor-footer { background-color: #2d2d2d; padding: 8px 12px; border-top: 1px solid #444; text-align: right; }
        button { padding: 8px 14px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; cursor: pointer; }
        button:hover { background-color: #45a049; }
        #output { background: #fff; color: #333; padding: 10px; border-radius: 6px; margin-top: 12px; border: 1px solid #ccc; white-space: pre-wrap; } */
    </style>

    <!-- Monaco Editor via CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/monaco-editor/0.44.0/min/vs/loader.min.js"></script>
    <script>
        require.config({ paths: { 'vs': 'https://cdnjs.cloudflare.com/ajax/libs/monaco-editor/0.44.0/min/vs' }});
        require(['vs/editor/editor.main'], function() {
            window.editor = monaco.editor.create(document.getElementById('editor'), {
                value: "public class Main {\n    public static void main(String[] args) {\n        // Please write your code for the given problem here\n    }\n}",
                language: "java",
                theme: "vs-dark",
                automaticLayout: true,
                fontSize: 14
            });

            // Helper to insert import at the top without moving cursor
            function addImport(importLine) {
                const model = window.editor.getModel();
                const currentValue = model.getValue();

                // Skip if already present
                if (currentValue.includes(importLine)) return;

                // Save current cursor position
                const currentSelection = window.editor.getSelection();

                // Insert import at line 1, column 1
                model.pushEditOperations(
                    [],
                    [{
                        range: new monaco.Range(1,1,1,1),
                        text: importLine + "\n"
                    }],
                    () => null
                );

                // Adjust selection down by one line
                const newSelection = new monaco.Selection(
                    currentSelection.startLineNumber + 1,
                    currentSelection.startColumn,
                    currentSelection.endLineNumber + 1,
                    currentSelection.endColumn
                );

                window.editor.setSelection(newSelection);
            }

            // Register command to add imports
            monaco.editor.registerCommand('editor.action.addImport', function(_, importLine) {
                addImport(importLine);
            });

            // Completion provider with auto-import commands
            monaco.languages.registerCompletionItemProvider('java', {
                provideCompletionItems: () => ({
                    suggestions: [
                        {
                            label: 'LocalDateTime',
                            kind: monaco.languages.CompletionItemKind.Class,
                            insertText: 'LocalDateTime',
                            documentation: 'java.time.LocalDateTime',
                            command: { id: 'editor.action.addImport', title: 'Add Import', arguments: ['import java.time.LocalDateTime;'] }
                        },
                        {
                            label: 'DateTimeFormatter',
                            kind: monaco.languages.CompletionItemKind.Class,
                            insertText: 'DateTimeFormatter',
                            documentation: 'java.time.format.DateTimeFormatter',
                            command: { id: 'editor.action.addImport', title: 'Add Import', arguments: ['import java.time.format.DateTimeFormatter;'] }
                        },
                        {
                            label: 'List',
                            kind: monaco.languages.CompletionItemKind.Class,
                            insertText: 'List',
                            documentation: 'java.util.List',
                            command: { id: 'editor.action.addImport', title: 'Add Import', arguments: ['import java.util.List;'] }
                        },
                        {
                            label: 'Set',
                            kind: monaco.languages.CompletionItemKind.Class,
                            insertText: 'Set',
                            documentation: 'java.util.Set',
                            command: { 
                                id: 'editor.action.addImport', 
                                title: 'Add Import', 
                                arguments: ['import java.util.Set;'] 
                            }
                        },
                        {
                            label: 'HashSet',
                            kind: monaco.languages.CompletionItemKind.Class,
                            insertText: 'HashSet',
                            documentation: 'java.util.HashSet',
                            command: { 
                                id: 'editor.action.addImport', 
                                title: 'Add Import', 
                                arguments: ['import java.util.HashSet;'] 
                            }
                        },
                        {
                            label: 'Iterator',
                            kind: monaco.languages.CompletionItemKind.Class,
                            insertText: 'Iterator',
                            documentation: 'java.util.Iterator',
                            command: { 
                                id: 'editor.action.addImport', 
                                title: 'Add Import', 
                                arguments: ['import java.util.Iterator;'] 
                            }
                        },
                                                
                                                                                
                        {
                            label: 'Stream',
                            kind: monaco.languages.CompletionItemKind.Class,
                            insertText: 'Stream',
                            documentation: 'java.util.stream.Stream',
                            command: { id: 'editor.action.addImport', title: 'Add Import', arguments: ['import java.util.stream.Stream;'] }
                        },
                        {
                            label: 'Collectors',
                            kind: monaco.languages.CompletionItemKind.Class,
                            insertText: 'Collectors',
                            documentation: 'java.util.stream.Collectors',
                            command: { id: 'editor.action.addImport', title: 'Add Import', arguments: ['import java.util.stream.Collectors;'] }
                        },
                        {
                            label: 'IntStream',
                            kind: monaco.languages.CompletionItemKind.Class,
                            insertText: 'IntStream',
                            documentation: 'java.util.stream.IntStream',
                            command: { id: 'editor.action.addImport', title: 'Add Import', arguments: ['import java.util.stream.IntStream;'] }
                        },
                        {
                            label: 'Optional',
                            kind: monaco.languages.CompletionItemKind.Class,
                            insertText: 'Optional',
                            documentation: 'java.util.Optional',
                            command: { id: 'editor.action.addImport', title: 'Add Import', arguments: ['import java.util.Optional;'] }
                        },
                        {
                            label: 'Arrays',
                            kind: monaco.languages.CompletionItemKind.Class,
                            insertText: 'Arrays',
                            documentation: 'java.util.Arrays',
                            command: { id: 'editor.action.addImport', title: 'Add Import', arguments: ['import java.util.Arrays;'] }
                        },                                 
                        {
                            label: 'ArrayList',
                            kind: monaco.languages.CompletionItemKind.Class,
                            insertText: 'ArrayList',
                            documentation: 'java.util.ArrayList',
                            command: { id: 'editor.action.addImport', title: 'Add Import', arguments: ['import java.util.ArrayList;'] }
                        },
                        {
                            label: 'Map',
                            kind: monaco.languages.CompletionItemKind.Class,
                            insertText: 'Map',
                            documentation: 'java.util.Map',
                            command: { id: 'editor.action.addImport', title: 'Add Import', arguments: ['import java.util.Map;'] }
                        },
                        {
                            label: 'HashMap',
                            kind: monaco.languages.CompletionItemKind.Class,
                            insertText: 'HashMap',
                            documentation: 'java.util.HashMap',
                            command: { id: 'editor.action.addImport', title: 'Add Import', arguments: ['import java.util.HashMap;'] }
                        }
                        // Scanner intentionally omitted to avoid blocking input
                    ]
                })
            });
        });

        function changeLanguage() {
            const lang = document.getElementById("language").value;
            let monacoLang;
            switch (lang) {
                case "java": monacoLang = "java"; break;
                case "python": monacoLang = "python"; break;
                case "cpp": monacoLang = "cpp"; break;
                default: monacoLang = "plaintext";
            }
            monaco.editor.setModelLanguage(window.editor.getModel(), monacoLang);
        }
        document.getElementById("language").addEventListener("change", changeLanguage);

        async function runCode() {
            const code = window.editor.getValue();
            const outputEl = document.getElementById("output");
            outputEl.textContent = "Running...";
            try {
                const res = await fetch("<%= request.getContextPath() %>/run", {
                    method: "POST",
                    headers: { "Content-Type": "application/json" },
                    body: JSON.stringify({ "source": code })
                });
                const text = await res.text();
                outputEl.textContent = text;
            } catch (err) {
                outputEl.textContent = "Error calling backend: " + err.message;
            }
        }
        /* Code Submission Work is going on When user clicks on Submit Button Okay */
async function submitCode() {
    alert("Calling the Submit Code Okay:");

    const code = window.editor.getValue();
    const lang = document.getElementById("language").value;
    const elapsedTime = seconds; // captured from timer

    alert("The value of the code is: " + code);
    alert("The value of the lang is: " + lang);
    alert("The value of the elapsedTime is: " + elapsedTime);

    const res = await fetch("<%= request.getContextPath() %>/submissions", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
            userId: "USER123",          // from session
            problemId: "${problem.id}", // from JSP model
            code: code,
            language: lang,
            timeTakenSec: elapsedTime
        })
    });

    const result = await res.json();
    document.getElementById("output").textContent =
        "Submission Status: " + result.status +
        " | Time Taken: " + result.timeTakenSec + " sec";
}
         

/*         function copyDescription() {
            const desc = document.getElementById("problemDesc").innerText;
            navigator.clipboard.writeText(desc).then(() => {
                
            });
        }
 */
        function copyDescription() {
        	  // Get the text to copy
        	  const text = document.getElementById("problemDesc").innerText;

        	  // Copy to clipboard
        	  navigator.clipboard.writeText(text).then(() => {
        	    // Change button text to "Copied"
        	    const btn = document.getElementById("copyBtn");
        	    btn.innerText = "✅ Copied";

        	    // Optionally, revert back after 2 seconds
        	    setTimeout(() => {
        	      btn.innerText = "📋 Copy Statement";
        	    }, 2000);
        	  });
        	}
        	        

        function toggleProblemPanel() {
            const problemPanel = document.getElementById("problemPanel");
            const editorSection = document.getElementById("editorSection");
            if (problemPanel.classList.contains("collapsed")) {
                problemPanel.classList.remove("collapsed");
                editorSection.classList.remove("expanded");
            } else {
                problemPanel.classList.add("collapsed");
                editorSection.classList.add("expanded");
            }
        }

        function clearOutput() { 
            document.getElementById("output").textContent = ""; 
            if(document.getElementById("output").textContent ==""){
            	document.getElementById("output").textContent="";
                }else{
                	document.getElementById("output").textContent = "block";
                }
           }

       


        /*Timer for Solving the Problems  */
/*  function startTimer(seconds) {
        const mins = Math.floor(seconds / 60);
        const secs = seconds % 60;

        // Escape JSP EL by prefixing with a backslash
        document.getElementById("timer").textContent =
            `Time: \${String(mins).padStart(2, '0')}: \${String(secs).padStart(2, '0')}`;
    }
        
 */        
/* //Call startTimer when the page finishes loading

window.onload = () => {
	startTimer(120);
};  */



async function loadProblem(problemId) {
	alert("Calling the load problem Methods :=");
    try {
        const res = await fetch("<%= request.getContextPath() %>/problems/" + problemId);
        if (!res.ok) {
            alert("Problem not found!");
            return;
        }
        const problem = await res.json();

        document.getElementById("problem-title").textContent = problem.title;
        document.getElementById("problem-description").textContent = problem.description;

        const examplesDiv = document.getElementById("examples");
        examplesDiv.innerHTML = "";
        if (problem.examples && problem.examples.length > 0) {
            problem.examples.forEach(ex => {
                examplesDiv.innerHTML += `
                    <pre><b>Input:</b> ${ex.input}
<b>Output:</b> ${ex.output}
<b>Explanation:</b> ${ex.explanation}</pre>
                `;
            });
        } else {
            examplesDiv.innerHTML = "<i>No examples available</i>";
        }
    } catch (err) {
        console.error("Error loading problem:", err);
        alert("Error loading problem details");
    }
}

        
    </script>
</head>
<body>
<%
        Problem problem = (Problem) request.getAttribute("problem");
        if (problem != null) {
    %>

<!--  <div class="navbar">
    <h1>Adding New Features</h1>
</div>
 -->  
<div class="split-container">
    <!-- Left: Problem -->
    <div class="problem-card" id="problemPanel">
<!--          <div class="problem-id">Problem #${problem.id}</div>
 -->        <div class="problem-title">${problem.title}</div>
        <span class="difficulty-badge ${problem.difficulty.toLowerCase()}">${problem.difficulty}</span>

        <div class="problem-description" id="problemDesc">${problem.description}</div>

        <div class="tags">Tags: ${problem.tags}</div>
        <div id="timer" class="problem-description">Time: 00:00</div>
         <h3>Examples</h3>
        <%
            List<Example> examples = problem.getExamples();
            if (examples != null && !examples.isEmpty()) {
                for (Example ex : examples) {
        %>
                    <pre>
<b>Input:</b> <%= ex.getInput() %>
<b>Output:</b> <%= ex.getOutput() %>
<b>Explanation:</b> <%= ex.getExplanation() %>
                    </pre>
        <%
                }
            } else {
        %>
                <b>No Examples Available for this Given Problems. </b>
        <%
            }
        }
        else {
        %>
            <p>Problem not found.</p>
        <%
        }
    %>

        <div class="problem-actions">
            <button class="action-btn solve-btn" onclick="window.location.href='/solve/${problem.id}'">Solve In Editor</button>
            <button class="action-btn favorite-btn" onclick="window.location.href='/problems/favorite/${problem.id}'">★ Favorite</button>
            <button class="action-btn copy-btn" onclick="copyDescription()">📋 Copy Statement</button>
        </div>
    </div>

    <!-- Right: Editor -->
    <div class="editor-section" id="editorSection">
        <div class="editor-header">
            <span>Code Editor</span>
            <select id="language">
                <option value="java">Java</option>
                <option value="python">Python</option>
                <option value="cpp">C++</option> 
            </select>
        </div>
        <div id="editor"></div>
        <div class="editor-footer">
            <button onclick="submitCode()">Submit Code</button>        
            <button onclick="runCode()">Run Code</button>
            <button class="clear-btn" onclick="clearOutput()">Clear Output</button>
        </div>
        <pre id="output">Output will appear here...</pre>
    </div>
</div>
  

</body>
</html>

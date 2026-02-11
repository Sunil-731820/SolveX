<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>${problem.title}</title>
    <style>
        #editor { width: 100%; height: 400px; border: 1px solid #ccc; }
    </style>

    <!-- Monaco via CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/monaco-editor/0.44.0/min/vs/loader.min.js"></script>
    <script>
        require.config({ paths: { 'vs': 'https://cdnjs.cloudflare.com/ajax/libs/monaco-editor/0.44.0/min/vs' }});
        require(['vs/editor/editor.main'], function() {
            window.editor = monaco.editor.create(document.getElementById('editor'), {
                value: "public class Main {\n    public static void main(String[] args) {\n        // Write your solution here\n    }\n}",
                language: "java",
                theme: "vs-dark"
            });
        });

        function runCode() {
            const code = window.editor.getValue();
            fetch('/run', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ source: code })
            })
            .then(res => res.text())
            .then(output => document.getElementById("output").innerText = output);
        }
    </script>
</head>
<body>
    <h2>${problem.title}</h2>
    <p>${problem.description}</p>

    <div id="editor"></div>
    <button onclick="runCode()">Run Code</button>
    <pre id="output"></pre>
</body>
</html>

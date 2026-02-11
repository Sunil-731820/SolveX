package com.java.real.controller;
import org.springframework.web.bind.annotation.*;
import javax.tools.*;
import java.io.*;
import java.util.*;

import org.springframework.web.bind.annotation.*;
import javax.tools.*;
import java.io.*;
import java.util.*;

import org.springframework.web.bind.annotation.*;
import javax.tools.*;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.stream.Stream;

@RestController
public class RunController {

    @PostMapping("/run")
    public String runCode(@RequestBody Map<String, String> payload) {
        String source = payload.get("source");
        String className = "Main"; 
        Path tempDir = null;

        try {
            tempDir = Files.createTempDirectory("java-run-");
            Path sourceFile = tempDir.resolve(className + ".java");
            Files.writeString(sourceFile, source, StandardCharsets.UTF_8);

            JavaCompiler compiler = ToolProvider.getSystemJavaCompiler();
            if (compiler == null) {
                return "Error: JavaCompiler not available. Run with a JDK, not a JRE.";
            }

            DiagnosticCollector<JavaFileObject> diagnostics = new DiagnosticCollector<>();
            StandardJavaFileManager fileManager = compiler.getStandardFileManager(diagnostics, null, StandardCharsets.UTF_8);
            Iterable<? extends JavaFileObject> units = fileManager.getJavaFileObjectsFromFiles(List.of(sourceFile.toFile()));

            // Add full classpath
            String classpath = System.getProperty("java.class.path");
            List<String> options = Arrays.asList("-classpath", classpath, "-d", tempDir.toString());

            JavaCompiler.CompilationTask task = compiler.getTask(null, fileManager, diagnostics, options, null, units);
            boolean success = task.call();
            fileManager.close();

            if (!success) {
                StringBuilder errors = new StringBuilder("Compilation errors:\n");
                for (Diagnostic<? extends JavaFileObject> d : diagnostics.getDiagnostics()) {
                    errors.append("Line ").append(d.getLineNumber())
                          .append(": ").append(d.getMessage(Locale.ENGLISH))
                          .append("\n");
                }
                return errors.toString();
            }

            // Run compiled class
            ProcessBuilder pb = new ProcessBuilder("java", "-cp", tempDir.toString() + File.pathSeparator + classpath, className);
            pb.directory(tempDir.toFile());
            Process proc = pb.start();

            String stdout = new String(proc.getInputStream().readAllBytes(), StandardCharsets.UTF_8);
            String stderr = new String(proc.getErrorStream().readAllBytes(), StandardCharsets.UTF_8);

            return stdout + (stderr.isBlank() ? "" : "\nErrors:\n" + stderr);

        } catch (Exception e) {
            return "Error: " + e.getMessage();
        } finally {
            if (tempDir != null) {
                try (Stream<Path> walk = Files.walk(tempDir)) {
                    walk.sorted(Comparator.reverseOrder()).forEach(p -> {
                        try { Files.deleteIfExists(p); } catch (IOException ignored) {}
                    });
                } catch (IOException ignored) {}
            }
        }
    }
}

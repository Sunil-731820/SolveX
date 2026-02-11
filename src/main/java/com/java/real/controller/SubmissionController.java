package com.java.real.controller;

import org.springframework.web.bind.annotation.*;

import com.java.real.entity.Submission;
import com.java.real.service.SubmissionService;

import java.time.LocalDateTime;
import java.util.List;

@RestController
@RequestMapping("/submissions")
public class SubmissionController {
    private final SubmissionService submissionService;

    public SubmissionController(SubmissionService submissionService) {
        this.submissionService = submissionService;
    }

    @PostMapping
    public Submission submitCode(@RequestBody Submission submission) {
    	System.out.println("Calling the Submit Code Method Okay :=");
        // I am not evaluating the  test cases, set status/runtime/memory
    	submission.setSubmittedAt(LocalDateTime.now());
        submission.setStatus("Accepted"); // placeholder
        return submissionService.saveSubmission(submission);
    }

    @GetMapping("/user/{userId}")
    public List<Submission> getUserSubmissions(@PathVariable String userId) {
    	System.out.println("Calling the getUserSubmission Method okay:from the USER Table ");
        return submissionService.getSubmissionsByUser(userId);
    }

    @GetMapping("/problem/{problemId}")
    public List<Submission> getProblemSubmissions(@PathVariable String problemId) {
    	System.out.println("Calling the getUserSubmission Method okay:from the Problem Table in MongoDB ");
        return submissionService.getSubmissionsByProblem(problemId);
    }
}

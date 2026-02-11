package com.java.real.repository.jpa;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.java.real.entity.Submission;


public interface SubmissionRepository extends JpaRepository<Submission, Long> {
    List<Submission> findByUserId(String userId);
    List<Submission> findByProblemId(String problemId);
}

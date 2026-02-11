package com.java.real.entity;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "submission")
public class Submission {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String userId;       // from MySQL User table
    private String problemId;    // MongoDB Problem _id
    @Lob
    private String code;
    private String language;
    private String status;
    private Integer runtimeMs;
    private Integer memoryKb;
    private Integer timeTakenSec;
    private LocalDateTime submittedAt = LocalDateTime.now();
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getProblemId() {
		return problemId;
	}
	public void setProblemId(String problemId) {
		this.problemId = problemId;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Integer getRuntimeMs() {
		return runtimeMs;
	}
	public void setRuntimeMs(Integer runtimeMs) {
		this.runtimeMs = runtimeMs;
	}
	public Integer getMemoryKb() {
		return memoryKb;
	}
	public void setMemoryKb(Integer memoryKb) {
		this.memoryKb = memoryKb;
	}
	public Integer getTimeTakenSec() {
		return timeTakenSec;
	}
	public void setTimeTakenSec(Integer timeTakenSec) {
		this.timeTakenSec = timeTakenSec;
	}
	public LocalDateTime getSubmittedAt() {
		return submittedAt;
	}
	public void setSubmittedAt(LocalDateTime submittedAt) {
		this.submittedAt = submittedAt;
	}

    
}

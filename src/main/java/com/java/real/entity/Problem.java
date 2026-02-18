package com.java.real.entity;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.mongodb.core.mapping.Document;

import jakarta.persistence.Id;

@Document(collection = "problems")
public class Problem {

    @Id
    private String id;
    private String title;
    private String description;
    private String difficulty;
    private int popularity;

    private List<String> tags;
    private List<Example> examples;

    private boolean solved;
    private boolean favorite;

    private LocalDateTime dateAdded;
    private List<String> supportedLanguages; // e.g. ["java", "python", "cpp"]
    
    

	public List<String> getSupportedLanguages() {
		return supportedLanguages;
	}

	public void setSupportedLanguages(List<String> supportedLanguages) {
		this.supportedLanguages = supportedLanguages;
	}

	public String getId() {
		system.out.println("Getting ID: " + id);
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDifficulty() {
		return difficulty;
	}

	public void setDifficulty(String difficulty) {
		this.difficulty = difficulty;
	}

	public int getPopularity() {
		return popularity;
	}

	public void setPopularity(int popularity) {
		this.popularity = popularity;
	}

	public List<String> getTags() {
		return tags;
	}

	public void setTags(List<String> tags) {
		this.tags = tags;
	}

	public List<Example> getExamples() {
		return examples;
	}

	public void setExamples(List<Example> examples) {
		this.examples = examples;
	}

	public boolean isSolved() {
		return solved;
	}

	public void setSolved(boolean solved) {
		this.solved = solved;
	}

	public boolean isFavorite() {
		return favorite;
	}

	public void setFavorite(boolean favorite) {
		this.favorite = favorite;
	}

	public LocalDateTime getDateAdded() {
		return dateAdded;
	}

	public void setDateAdded(LocalDateTime dateAdded) {
		this.dateAdded = dateAdded;
	}

    
    
    
}

package com.java.real.repository.mongodb;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.java.real.entity.Problem;


@Repository
public interface ProblemRepository extends MongoRepository<Problem, String> {
    List<Problem> findByDifficulty(String difficulty);
    List<Problem> findByTagsContaining(String tag);
    
    List<Problem> findByTitleContainingIgnoreCase(String title);
    
    Page<Problem> findAll(Pageable pageable);
}

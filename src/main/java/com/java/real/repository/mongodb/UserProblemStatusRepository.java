package com.java.real.repository.mongodb;


import java.util.List;
import java.util.Optional;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.java.real.entity.UserProblemStatus;



public interface UserProblemStatusRepository
        extends MongoRepository<UserProblemStatus, String> {

    Optional<UserProblemStatus> findByUserEmailAndProblemId(
            String userEmail, String problemId);

    List<UserProblemStatus> findByUserEmailAndSolvedTrue(String userEmail);
    
    List<UserProblemStatus> findByUserEmailAndFavoriteTrue(String userEmail);

    long countByUserEmailAndSolvedTrue(String userEmail);
}

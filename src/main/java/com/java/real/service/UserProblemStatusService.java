package com.java.real.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.real.entity.UserProblemStatus;
import com.java.real.repository.mongodb.UserProblemStatusRepository;


@Service
public class UserProblemStatusService {

    @Autowired
	public UserProblemStatusRepository repo;

    public void markSolved(String email, String problemId) {
        UserProblemStatus status = repo
                .findByUserEmailAndProblemId(email, problemId)
                .orElse(new UserProblemStatus());

        status.setUserEmail(email);
        status.setProblemId(problemId);
        status.setSolved(true);

        repo.save(status);
    }

    public void toggleFavorite(String email, String problemId) {
        UserProblemStatus status = repo
                .findByUserEmailAndProblemId(email, problemId)
                .orElse(new UserProblemStatus());

        status.setUserEmail(email);
        status.setProblemId(problemId);
        status.setFavorite(!status.isFavorite());

        repo.save(status);
    }

    public long solvedCount(String email) {
        return repo.countByUserEmailAndSolvedTrue(email);
    }

    public List<UserProblemStatus> solvedProblems(String email) {
        return repo.findByUserEmailAndSolvedTrue(email);
    }

    public List<UserProblemStatus> favoriteProblems(String email) {
        return repo.findByUserEmailAndFavoriteTrue(email);
    }
}

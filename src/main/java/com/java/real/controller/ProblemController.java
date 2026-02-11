package com.java.real.controller;

import java.io.IOException;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.real.entity.Problem;
import com.java.real.repository.mongodb.ProblemRepository;
import com.java.real.service.ProblemService;
import com.java.real.service.UserProblemStatusService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@Controller
@RequestMapping("/problems")
public class ProblemController extends HttpServlet{

    @Autowired
    private ProblemRepository problemRepository;
    
    @Autowired
    private ProblemService problemService;
    
    @Autowired
    private UserProblemStatusService userProblemStatusService;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String sort = request.getParameter("sort");
        String order = request.getParameter("order");

        List<Problem> problems = problemService.getAllProblems(); // fetch from DB/service

        if (sort != null) {
            Comparator<Problem> comparator;
            switch (sort) {
                case "title":
                    comparator = Comparator.comparing(Problem::getTitle, String.CASE_INSENSITIVE_ORDER);
                    break;
                case "difficulty":
                    comparator = Comparator.comparing(Problem::getDifficulty, String.CASE_INSENSITIVE_ORDER);
                    break;
                case "tags":
                    comparator = Comparator.comparing(
                        p -> p.getTags() != null ? String.join(",", p.getTags()) : ""
                    );
                    break;
                default:
                    comparator = Comparator.comparing(Problem::getId);
            }
            if ("desc".equalsIgnoreCase(order)) {
                comparator = comparator.reversed();
            }
            problems.sort(comparator);
        }

        request.setAttribute("problems", problems);
        RequestDispatcher rd = request.getRequestDispatcher("/problems.jsp");
        rd.forward(request, response);
    }
    

    @GetMapping
    public String getProblems(Model model,HttpServletRequest req,HttpSession session) {
    	String email = (String) session.getAttribute("loggedInUserEmail");
    	 List<Problem> problems = problemService.getAllProblems();
    	 System.out.println("The Size of the List From Backend Side is :"+problems.size());
    	 for (Problem p : problems) {
    		 userProblemStatusService.repo
                 .findByUserEmailAndProblemId(email, p.getId())
                 .ifPresent(s -> {
                     p.setSolved(s.isSolved());
                     p.setFavorite(s.isFavorite());
                 });
         }
//        model.addAttribute("problems",problems);
//        String userEmail = (String) session.getAttribute("loggedInUserEmail");
//        System.out.println("The logged In user Email is :"+userEmail);
//        long solvedCount =
//                userProblemStatusService.solvedCount(userEmail);
//
//        int totalProblems = problems.size();
//
//        request.setAttribute("solvedCount", solvedCount);
//        request.setAttribute("totalProblems", totalProblems);
    	 req.setAttribute("problems", problems);
         req.setAttribute("solvedCount", userProblemStatusService.solvedCount(email));
         req.setAttribute("totalProblems", problems.size());
        return "problems"; // problems.jsp
    }

    
    @PostMapping("/solved")
    @ResponseBody
    public void solve(@RequestParam String problemId, HttpSession session) {
    	userProblemStatusService.markSolved(
            (String) session.getAttribute("loggedInUserEmail"), problemId);
    }
    
    @PostMapping("/favorite")
    @ResponseBody
    public void favorite(@RequestParam String problemId, HttpSession session) {
    	userProblemStatusService.toggleFavorite(
            (String) session.getAttribute("loggedInUserEmail"), problemId);
    }
    
    @GetMapping("/solved")
    public String solved(HttpSession session, HttpServletRequest req) {
        String email = (String) session.getAttribute("loggedInUserEmail");

        List<Problem> list = userProblemStatusService.solvedProblems(email).stream()
            .map(s -> problemService.getProblemById(s.getProblemId()))
            .toList();

        req.setAttribute("problems", list);
        return "solved";
    }
    
    
    @GetMapping("/favorites")
    public String favorites(HttpSession session, HttpServletRequest req) {
        String email = (String) session.getAttribute("loggedInUserEmail");

        List<Problem> list = userProblemStatusService.favoriteProblems(email).stream()
            .map(s -> problemService.getProblemById(s.getProblemId()))
            .toList();

        req.setAttribute("problems", list);
        return "favorites";
    }
    
    @GetMapping("/editor/{id}")
    public String editorPage(@PathVariable String id, Model model) {
        Problem problem = problemRepository.findById(id).orElse(null);
        model.addAttribute("problem", problem);
        return "editor"; // JSP page with Monaco + problem statement
    }
    
    
    @GetMapping("/{id}")
    public ResponseEntity<Problem> getProblem(@PathVariable String id) {
    	System.out.println("Calling the getproblem method for now :="+id);
        return problemRepository.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

	/*
	 * @GetMapping("/{id}") public Problem getProblem(@PathVariable String id) {
	 * return problemService.findById(id); }
	 */
    @PostMapping
    public Problem createProblem(@RequestBody Problem problem) {
    	System.out.println("Callling the create problem method while saving to the Mongo database okay :=");
        return problemService.saveProblem(problem);
    }


    

}

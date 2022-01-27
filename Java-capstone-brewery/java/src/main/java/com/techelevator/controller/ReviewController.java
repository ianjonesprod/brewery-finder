package com.techelevator.controller;

import com.techelevator.dao.ReviewDao;
import com.techelevator.model.Review;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@PreAuthorize("isAuthenticated()")
@RestController
@RequestMapping("/breweries")
@CrossOrigin
public class ReviewController {

    private ReviewDao dao;


    public ReviewController(ReviewDao dao){
        this.dao = dao;
    }

    @PreAuthorize("permitAll")
    @RequestMapping(path = "/review/{beerName}", method = RequestMethod.GET)
    public List<Review> getReview(@PathVariable String beerName) {
        return dao.getReviewByName(beerName);
    }

    @PreAuthorize("permitAll")
    @RequestMapping(path = "/beer/review", method = RequestMethod.POST)
    public void addReview(@RequestBody Review review) {
        dao.addReview(review.getBeerName(), review.getReview(), review.getRating(), review.getDate());
    }
}

package com.techelevator.dao;

import com.techelevator.model.Review;

import java.util.List;

public interface ReviewDao {

    List<Review> getReviewByName(String beerName);

    void addReview(String beerName, String review, String rating, String date);
}

package com.techelevator.dao;

import com.techelevator.model.Review;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcReviewDao implements ReviewDao{

    private JdbcTemplate jdbcTemplate;

    public JdbcReviewDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Review> getReviewByName(String beerName) {
        List<Review> reviewList = new ArrayList<>();
        String sql = "SELECT * FROM reviews WHERE beerName = ?;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, beerName);
        while (results.next()) {
            Review review = mapRowToReview(results);
            reviewList.add(review);
        }
        return reviewList;
    }

    @Override
    public void addReview(String beerName, String review, String rating, String date) {
        String sql = "INSERT INTO reviews (beerName, review, rating, date) VALUES (?, ?, ?, ?);";
        jdbcTemplate.update(sql, beerName, review, rating, date);

    }

    private Review mapRowToReview(SqlRowSet rs) {
        Review review = new Review();
        review.setBeerName(rs.getString("beerName"));
        review.setDate(rs.getString("date"));
        review.setReview(rs.getString("review"));
        review.setRating(rs.getString("rating"));
        return review;
    }



}

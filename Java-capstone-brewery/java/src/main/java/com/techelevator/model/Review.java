package com.techelevator.model;

public class Review {
    private String beerName;
    private String review;
    private String rating;
    private String date;

    public Review(String beerName, String review, String rating, String date) {
        this.beerName = beerName;
        this.review = review;
        this.rating = rating;
        this.date = date;
    }
    public Review(){};

    public String getBeerName() {
        return beerName;
    }

    public void setBeerName(String beerName) {
        this.beerName = beerName;
    }

    public String getReview() {
        return review;
    }

    public void setReview(String review) {
        this.review = review;
    }

    public String getRating() {
        return rating;
    }

    public void setRating(String rating) {
        this.rating = rating;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}

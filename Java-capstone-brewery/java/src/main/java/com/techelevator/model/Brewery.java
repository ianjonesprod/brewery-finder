package com.techelevator.model;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Brewery {
    @JsonProperty
    private String name;
    private String street;
    private String city;
    private String state;
    @JsonProperty("website_url")
    private String websiteUrl;
    private String phone;
    private String brewer;
    private String hours;
    private String days;
    private String contactInfo;
    private String history;
    private boolean active;
    private String imageUrl;
    private String stateAbbr;



    public Brewery(String name, String state, String street, String city, String websiteUrl, String phone, String brewer, String hours, String days, String history, boolean active, String imageUrl, String stateAbbr) {
        this.name = name;
        this.state = state;
        this.street = street;
        this.city = city;
        this.websiteUrl = websiteUrl;
        this.phone = phone;
        this.brewer = brewer;
        this.hours = hours;
        this.days = days;
        this.history = history;
        this.active = active;
        this.imageUrl = imageUrl;
        this.stateAbbr = stateAbbr;
    }

    public Brewery() {
        
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getWebsiteUrl() {
        return websiteUrl;
    }

    public void setWebsiteUrl(String websiteUrl) {
        this.websiteUrl = websiteUrl;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getBrewer() {
        return brewer;
    }

    public void setBrewer(String brewer) {
        this.brewer = brewer;
    }

    public String getHours() {
        return hours;
    }

    public void setHours(String hours) {
        this.hours = hours;
    }

    public String getDays() {
        return days;
    }

    public void setDays(String days) {
        this.days = days;
    }

    public String getContactInfo() {
        return contactInfo;
    }

    public void setContactInfo(String contactInfo) {
        this.contactInfo = contactInfo;
    }

    public String getHistory() {
        return history;
    }

    public void setHistory(String history) {
        this.history = history;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getStateAbbr() {
        return stateAbbr;
    }

    public void setStateAbbr(String stateAbbr) {
        this.stateAbbr = stateAbbr;
    }

    @Override
    public String toString(){
        return " \n Brewery Name: " +
                name + "\n City: " +
                city + "\n Street Address: " +
                street + "\n Website: " +
                websiteUrl + "\n Phone Number " +
                phone;
    }
}



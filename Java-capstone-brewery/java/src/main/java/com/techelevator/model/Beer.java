package com.techelevator.model;

public class Beer {
    private String name;
    private String imageUrl;
    private String description;
    private String abv;
    private String beerType;
    private String breweryName;



    public Beer(String name, String imageUrl, String description, String abv, String beerType, String breweryName) {
        this.name = name;
        this.imageUrl = imageUrl;
        this.description = description;
        this.abv = abv;
        this.beerType = beerType;
        this.breweryName = breweryName;
    }

    public Beer(){}

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAbv() {
        return abv;
    }

    public void setAbv(String abv) {
        this.abv = abv;
    }

    public String getBeerType() {
        return beerType;
    }

    public void setBeerType(String beerType) {
        this.beerType = beerType;
    }

    public String getBreweryName() {
        return breweryName;
    }

    public void setBreweryName(String brewerName) {
        this.breweryName = brewerName;
    }


}

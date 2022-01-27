package com.techelevator.dao;

import com.techelevator.model.Brewery;

import java.util.List;

public interface BreweryDao {



    List<Brewery> listByCity(String city);

    void createBrewery(String name, String city, String brewer);

    void updateBrewery(String name, String hoursOfOperation, String daysOfOperation, String contactInfo,
                       String address, String history, boolean active, String imageUrl);

    void createClaimedBrewery(String name, String city, String state, String stateAbbr, String brewer);

}

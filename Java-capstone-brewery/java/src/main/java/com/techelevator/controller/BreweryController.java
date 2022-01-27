package com.techelevator.controller;


import com.techelevator.dao.BreweryDao;
import com.techelevator.exception.CityDoesNotExist;
import com.techelevator.model.Brewery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import javax.validation.Valid;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@RestController

@RequestMapping("/breweries")
@CrossOrigin
public class BreweryController {
    private static final String API_BASE_URL = "https://api.openbrewerydb.org/breweries";
    private final RestTemplate restTemplate = new RestTemplate();


    @Autowired
    private BreweryDao dao;

    public BreweryController(BreweryDao dao) {
        this.dao = dao;
    }

    @PreAuthorize("permitAll")
    @RequestMapping(path = "/{city}/{state}", method = RequestMethod.GET)
    public List<Brewery> get(@PathVariable String city, @PathVariable String state) throws CityDoesNotExist {

        Brewery[] breweriesArray = restTemplate.getForObject(API_BASE_URL + "?by_city=" + formatEntry(city), Brewery[].class);

        List<Brewery> finalList = filteredList(breweriesArray, state, city);

        return finalList;
    }


    @RequestMapping(method = RequestMethod.POST)
    public void createBrewery(@Valid @RequestBody Brewery brewery) {
        dao.createBrewery(brewery.getName(), brewery.getCity(), brewery.getBrewer());
    }


    @RequestMapping(path = "/brewery", method = RequestMethod.POST)
    public void  createClaimedBrewery(Principal principal, @RequestBody Brewery brewery){
        dao.createClaimedBrewery(brewery.getName(), brewery.getCity(), brewery.getState(), brewery.getStateAbbr(), brewery.getName());
    }

    @RequestMapping(path = "/brewery", method = RequestMethod.PUT)
    public void updateBrewery(@RequestBody Brewery brewery) {
        dao.updateBrewery(brewery.getName(), brewery.getCity(), brewery.getDays(), brewery.getHours(), brewery.getStreet(), brewery.getPhone(), brewery.isActive(), brewery.getImageUrl());
    }


    public String formatEntry(String entry) {
        String result = "";
        if (entry.contains(" ")) {
            result = entry.replace(" ", "_");
        } else {
        result = entry;
    }
        return result.toLowerCase();
    }

    public List<Brewery> filteredList(Brewery[] list, String state, String city) {
        List<Brewery> result = new ArrayList<>();

        for(Brewery brewery : list) {
             if (formatEntry(brewery.getState()).equals(formatEntry(state))) {
                 if (formatEntry(city).equals(formatEntry(brewery.getCity()))){
                    result.add(brewery);
                 }
            }
        }
        return result;

    }

    //if (formatEntry(city).equals(formatEntry(brewery.getCity())){




}

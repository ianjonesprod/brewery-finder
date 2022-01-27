package com.techelevator.services;

import com.techelevator.model.Brewery;
import org.springframework.web.client.RestTemplate;

import java.util.Locale;

public class BreweryService {

    private static final String API_BASE_URL = "https://api.openbrewerydb.org/breweries";
    private final RestTemplate restTemplate = new RestTemplate();

    public Brewery[] getBreweries(String city) {
        return restTemplate.getForObject(API_BASE_URL + "?by_city=" + formatEntry(city), Brewery[].class);
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

}

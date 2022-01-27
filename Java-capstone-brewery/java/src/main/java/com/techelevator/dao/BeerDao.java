package com.techelevator.dao;

import com.techelevator.exception.BeerDoesNotExist;
import com.techelevator.model.Beer;

import java.util.List;

public interface BeerDao {

    List<Beer> beerList(String name);

    void addBeer(String name, String image, String description, String abv, String beerType, String brewery);

    void deleteBeer(String name) throws BeerDoesNotExist;
}

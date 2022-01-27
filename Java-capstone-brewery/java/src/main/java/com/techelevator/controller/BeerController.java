package com.techelevator.controller;

import com.techelevator.dao.BeerDao;
import com.techelevator.dao.BreweryDao;
import com.techelevator.exception.BeerDoesNotExist;
import com.techelevator.exception.CityDoesNotExist;
import com.techelevator.model.Beer;
import com.techelevator.model.Brewery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.security.Principal;
import java.util.List;

@PreAuthorize("isAuthenticated()")
@RestController
@RequestMapping("/breweries")
@CrossOrigin
public class BeerController {

    @Autowired
    private BeerDao dao;

    public BeerController(BeerDao dao) {
        this.dao = dao;
    }

    @PreAuthorize("permitAll")
    @RequestMapping(path = "/{name}/beer", method = RequestMethod.GET)
    public List<Beer> get(@PathVariable String name) throws BeerDoesNotExist {
        return dao.beerList(name);
    }


    @PreAuthorize("hasRole('ROLE_BREWER')")
    @RequestMapping(path = "/beer", method = RequestMethod.POST)
    public void addBeer(Principal principal, @Valid @RequestBody Beer beer){
        dao.addBeer(beer.getName(), beer.getImageUrl(), beer.getDescription(), beer.getAbv(), beer.getBeerType(), beer.getBreweryName());
    }

    @PreAuthorize("hasRole('ROLE_BREWER')")
    @RequestMapping(path = "/beer/{name}", method = RequestMethod.DELETE)
    public void deleteBeer(@Valid @PathVariable String name) throws BeerDoesNotExist{
        dao.deleteBeer(name);
    }
}
    //@PathVariable String name,@PathVariable String image,@PathVariable String description,@PathVariable String abv,@PathVariable String beerType
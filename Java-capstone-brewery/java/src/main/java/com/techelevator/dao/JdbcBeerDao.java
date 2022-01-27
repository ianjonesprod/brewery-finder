package com.techelevator.dao;

import com.techelevator.exception.BeerDoesNotExist;
import com.techelevator.model.Beer;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcBeerDao implements BeerDao{

    private JdbcTemplate jdbcTemplate;

    public JdbcBeerDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Beer> beerList(String brewerName) {
        List<Beer> beers = new ArrayList<>();
        String sql = "SELECT name, image_URL, description, abv, beerType FROM beers WHERE beers.brewerName = ? ORDER BY name, abv;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, brewerName);
        while (results.next()) {
            Beer beer = mapRowToBeer(results);
            beers.add(beer);
        }
        return beers;
    }

    @Override
    public void addBeer(String name, String imageUrl, String description, String abv, String beerType, String breweryName) {
        String addingBeer = "INSERT INTO beers (name, image_url, description, abv, beerType, brewerName) VALUES (?, ?, ?, ?, ?, ?);";
        jdbcTemplate.update(addingBeer, name, imageUrl, description, abv, beerType, breweryName);
    }

    @Override
    public void deleteBeer(String name) throws BeerDoesNotExist {
        String delete = "DELETE FROM beers WHERE name = ?;";
        jdbcTemplate.update(delete, name);
    }

    private Beer mapRowToBeer(SqlRowSet rs) {
        Beer beer = new Beer();
        beer.setName(rs.getString("name"));
        beer.setImageUrl(rs.getString("image_URL"));
        beer.setDescription(rs.getString("description"));
        beer.setAbv(rs.getString("abv"));
        beer.setBeerType(rs.getString("beerType"));
        return beer;
    }

}

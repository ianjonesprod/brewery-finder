package com.techelevator.dao;

import com.techelevator.model.Brewery;
import com.techelevator.model.User;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcBreweryDao implements BreweryDao {

    private JdbcTemplate jdbcTemplate;

    public JdbcBreweryDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }


    @Override
    public List<Brewery> listByCity(String city) {
        List<Brewery> breweries = new ArrayList<>();
        String sql = "SELECT name, city FROM breweries WHERE city = ?;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, city);
        while (results.next()) {
            Brewery brewery = mapRowToBrewery(results);
            breweries.add(brewery);
        }
        return breweries;
    }

    @Override
    public void createBrewery(String name, String city, String brewer) {

        String createBrewer = "INSERT INTO breweries (name, city, brewer) VALUES(?,?,?);";
        jdbcTemplate.update(createBrewer, name, city, brewer);
    }

    @Override
    public void createClaimedBrewery(String name, String city, String state, String stateAbbr, String brewer) {

        String sql = "INSERT INTO breweries (name, city, state, stateAbbr brewer) VALUES(?, ?, ?, ?, ?);";
        jdbcTemplate.update(sql, name, city, state, stateAbbr, brewer);
    }

    @Override
    public void updateBrewery(String name, String hoursOfOperation, String daysOfOperation,
                              String contactInfo, String address, String history, boolean active, String imageUrl) {
        String updateBrewery = "UPDATE breweries SET hours=?, days=?, contactInfo=?, address=?, history=?, active=?, imageUrl;" +
                " WHERE name = ?";

        jdbcTemplate.update(updateBrewery, hoursOfOperation, daysOfOperation, contactInfo, address, history, active, name);

    }

    private Brewery mapRowToBrewery(SqlRowSet rs) {
        Brewery brewery = new Brewery();
        brewery.setName(rs.getString("name"));
        brewery.setCity(rs.getString("city"));
        return brewery;
    }
}

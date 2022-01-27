package com.techelevator;

import com.techelevator.services.BreweryService;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.util.Arrays;

@SpringBootApplication
public class Application {

    public static void main(String[] args) {

        BreweryService service = new BreweryService();

        SpringApplication.run(Application.class, args);



    }

}

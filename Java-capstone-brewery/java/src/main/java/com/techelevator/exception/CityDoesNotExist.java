package com.techelevator.exception;


import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus (code = HttpStatus.NOT_FOUND, reason = "City does not exist.")
public class CityDoesNotExist extends Exception {
        private static long serialVersionUID = 1L;


        public CityDoesNotExist() { super("City does not exist.");}
    }


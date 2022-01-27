package com.techelevator.exception;


import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus (code = HttpStatus.NOT_FOUND, reason = "Beer does not exist.")
public class BeerDoesNotExist extends Exception{

    private static long serialVersionUID = 1L;


    public BeerDoesNotExist() { super("Beer does not exist.");}
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flooringmastery.service;

/**
 *
 * @author n0252282
 */
public class TaxException extends Exception {

    public TaxException(String message) {
        super(message);
    }

    public TaxException(String message,
            Throwable cause) {
        super(message, cause);
    }

}

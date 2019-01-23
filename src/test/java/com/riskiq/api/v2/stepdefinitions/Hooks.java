package com.riskiq.api.v2.stepdefinitions;

import cucumber.api.java.Before;
import io.restassured.RestAssured;

public class Hooks {
    @Before
    public void beforeScenario(){
            RestAssured.baseURI = "https://api.passivetotal.org/v2";
           // RestAssured.baseURI = "https://249fe275-c053-4f67-94b0-15b46cf73cd9.mock.pstmn.io/project";
    }
}

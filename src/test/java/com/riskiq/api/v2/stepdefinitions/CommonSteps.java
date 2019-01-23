package com.riskiq.api.v2.stepdefinitions;

import com.riskiq.api.v2.FlowData;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import org.junit.Assert;

import java.util.Map;

import static com.riskiq.api.v2.misc.Utils.matchJsonValue;
import static io.restassured.RestAssured.given;
import static io.restassured.module.jsv.JsonSchemaValidator.matchesJsonSchemaInClasspath;
import static org.hamcrest.Matchers.equalTo;

public class CommonSteps extends FlowData {

    @Given("^A user with user \"([^\"]*)\" and password \"([^\"]*)\"$")
    public void aUserWithUserAndPassword(String user, String password) {
        rs.set(given().auth().preemptive().basic(user, password));

    }

    @Given("^the apis up and running for \"([^\"}]*)\"$")
    public void theApisUpAndRunningFor(String url) throws Throwable {
        response.set(given().when().get(url));
        response.get().then().statusCode(200);
    }


    @Then("^the api should response with code (\\d+)$")
    public void theApiShouldResponseWithCode(Integer statusCode) {
        json =   response.get().then().statusCode(statusCode);

    }


    @And("Response includes the following$")
    public void response_equals(Map<String,String> responseFields){
        for (Map.Entry<String, String> field : responseFields.entrySet()) {
            matchJsonValue(field, json);
        }
    }

    @And("Check JSON schema \"([^\"}]*)\"$")
    public void response_equals(String schemeUrl){
        json.body(matchesJsonSchemaInClasspath("schemas/"+schemeUrl));
    }

}

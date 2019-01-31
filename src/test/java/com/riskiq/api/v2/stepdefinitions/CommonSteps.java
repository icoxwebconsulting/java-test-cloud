package com.riskiq.api.v2.stepdefinitions;

import com.riskiq.api.v2.FlowData;
import com.riskiq.api.v2.impl.BodyElement;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import org.apache.commons.lang3.StringUtils;
import org.junit.Assert;

import java.util.AbstractMap;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.riskiq.api.v2.misc.Utils.matchJsonValue;
import static io.restassured.RestAssured.given;
import static io.restassured.module.jsv.JsonSchemaValidator.matchesJsonSchemaInClasspath;
import static org.hamcrest.Matchers.equalTo;

public class CommonSteps extends FlowData {

    @Given("^a valid user and key from riskIQ platform$")
    public void aValidUserFromRiskIQPlatform() {
      rs.set(given().auth().preemptive().basic(System.getProperty("username"), System.getProperty("password")));
      //  rs.set(given().auth().preemptive().basic("mauro@icox.com", "316bf07182644307e9e5b459f3389b6f46de7efe29386c74857a13afd8aad9af"));
    }


    @Given("^a invalid user and invalid key from riskIQ platform$")
    public void aInvalidUserFromRiskIQPlatform() {
        //rs.set(given().auth().preemptive().basic(System.getProperty("username"), System.getProperty("password")));
        rs.set(given().auth().preemptive().basic("alejandrodavidsalazar@gmail.com", "316bf071826asdsad8aad9af"));
    }


    @Then("^the api should response with code (\\d+)$")
    public void theApiShouldResponseWithCode(Integer statusCode) {
        json =   response.get().then().statusCode(statusCode);

    }


    @And("Response includes the following$")
    public void response_equals(Map<String,String> responseFields){
        for (Map.Entry<String, String> field : responseFields.entrySet()) {

            if(StringUtils.containsIgnoreCase(field.getValue(), "##")){
                Map.Entry<String,String> entry =
                        new AbstractMap.SimpleEntry<String, String>(field.getKey(), field.getValue());
                entry = validateSpecificValue(entry);
                matchJsonValue(entry, json);
            }else{
                matchJsonValue(field, json);
            }

        }
    }




    @And("Check JSON schema \"([^\"}]*)\"$")
    public void response_equals(String schemeUrl){
        json.body(matchesJsonSchemaInClasspath("schemas/"+schemeUrl));
    }

}

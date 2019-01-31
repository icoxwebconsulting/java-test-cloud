package com.riskiq.api.v2.stepdefinitions.alerts;


import com.riskiq.api.v2.FlowData;
import com.riskiq.api.v2.impl.BodyElement;
import cucumber.api.DataTable;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import io.restassured.response.Response;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import java.util.Collections;

import static io.restassured.RestAssured.given;
import static org.hamcrest.Matchers.*;
import static org.hamcrest.core.Is.is;

public class AlertsSteps extends FlowData  {

    @When("^users want to get information of alerts without params$")
    public void usersWantToDeleteProjectWithoutValues() {
        response.set(rs.get().contentType(ContentType.JSON).get("/monitor"));
    }


    @And("^a created artifact with values$")
    public void aCreatedArtifactWithValues(DataTable dataTable) throws Throwable {
        rs.set(RestAssured.given().auth().preemptive().basic("alejandrodavidsalazar@gmail.com", "316bf07182644307e9e5b459f3389b6f46de7efe29386c74857a13afd8aad9af"));
        String data = dataTableToJson(dataTable.asList(BodyElement.class));
        JSONParser parser = new JSONParser();
        JSONObject jsonData = (JSONObject) parser.parse(data);
        query.set((String) jsonData.get("query"));
        System.out.println(jsonData);
        response.set(rs.get().contentType(ContentType.JSON).body(data).put("/artifact"));

    }

    @When("^users want to get information of alerts with the values$")
    public void usersWantToGetInformationOnTheProjectWithId(DataTable dataTable) {
        response.set(rs.get().contentType(ContentType.JSON).body(dataTableToJson(dataTable.asList(BodyElement.class))).get("/monitor"));
        System.out.println("============= RESPUIESTA===============");
        System.out.println(response.get().getBody().prettyPrint());
    }

}

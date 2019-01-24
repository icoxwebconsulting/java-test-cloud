package com.riskiq.api.v2.stepdefinitions.project;

import com.riskiq.api.v2.FlowData;
import com.riskiq.api.v2.impl.BodyElement;
import cucumber.api.DataTable;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.restassured.http.ContentType;

import static com.riskiq.api.v2.misc.Utils.dataTableToJson;
import static org.hamcrest.Matchers.equalTo;
import static org.hamcrest.Matchers.greaterThan;

public class FindSteps extends FlowData {


    @Given("^a project that already exists with values$")
    public void a_project_that_already_exists_with_values(DataTable dataTable) {
        response.set(rs.get().contentType(ContentType.JSON).body(dataTableToJson(dataTable.asList(BodyElement.class))).put());
        //response.get().then().extract().path("guid").toString();
    }

    @When("^users want to get information on the project with the values$")
    public void usersWantToGetInformationOnTheProjectWithId(DataTable dataTable) {
        response.set(rs.get().contentType(ContentType.JSON).body(dataTableToJson(dataTable.asList(BodyElement.class))).get("/project"));
    }

    @Then("^get proyectUUID from project created$")
    public void getProyectUUID() throws Throwable {
        System.out.println("===============================");
        System.out.println(json.extract().path("guid").toString());
        json.extract().path("project");
    }


}

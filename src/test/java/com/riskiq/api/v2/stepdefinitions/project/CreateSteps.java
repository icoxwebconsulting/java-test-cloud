package com.riskiq.api.v2.stepdefinitions.project;

import com.riskiq.api.v2.stepdefinitions.project.impl.Project;
import cucumber.api.java.en.Given;
import io.restassured.RestAssured;
import io.restassured.module.jsv.JsonSchemaValidator;

import com.riskiq.api.v2.FlowData;
import com.riskiq.api.v2.impl.BodyElement;
import cucumber.api.DataTable;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.restassured.http.ContentType;

import java.util.Collections;

import static com.riskiq.api.v2.misc.Utils.dataTableToJson;
import static org.hamcrest.Matchers.equalTo;
import static org.hamcrest.Matchers.greaterThan;
import static org.hamcrest.Matchers.nullValue;
import static org.hamcrest.core.Is.is;

public class CreateSteps extends FlowData {



    @When("^users want to get information of the all project$")
    public void users_want_to_get_information_of_the_all_project() throws Throwable {
        // Write code here that turns the phrase above into concrete actions
        response.set(rs.get().get("/project"));
    }

    @When("^users want to create project with the values$")
    public void usersWantToCreateProjectWithTheValues(DataTable dataTable) {
        response.set(rs.get().contentType(ContentType.JSON).body(dataTableToJson(dataTable.asList(BodyElement.class))).put());
    }

    @Then("^the requested data match with the schema \"([^\"]*)\"$")
    public void theRequestedDataMatchWithTheSchema(String schema) throws Throwable {
        // Write code here that turns the phrase above into concrete actions
        //throw new PendingException();
    }

    @And("^a created project with values$")
    public void aCreatedProjectWithValues(DataTable dataTable) throws Throwable {
        rs.set(RestAssured.given().auth().preemptive().basic("alejandrodavidsalazar@gmail.com", "316bf07182644307e9e5b459f3389b6f46de7efe29386c74857a13afd8aad9af"));
        projectId.set(rs.get().contentType(ContentType.JSON).body(dataTableToJson(dataTable.asList(BodyElement.class))).put("/project").then().extract().path("guid"));
    }

    @When("^users want to get information of the project by id$")
    public void usersWantToGetInformationOnTheProject() throws Throwable {
        response.set(rs.get().contentType(ContentType.JSON).body(dataTableToJson(Collections.singletonList(BodyElement.builder().key("project").value(projectId.get()).build()))).get("/project"));
    }

    @And("^the number of projects should be greater than (\\d+)$")
    public void theNumberOfProjectsShouldBeGreaterThan(int numberOfProjects) throws Throwable {
        response.get().then().body("results.size()", greaterThan(numberOfProjects));
    }

    @And("^the number of projects should be equal to (\\d+)$")
    public void theNumberOfProjectsShouldBeEqualTo(int numberOfProjects) throws Throwable {
        if (numberOfProjects == 1) {
            response.get().then().body("results", is(nullValue()));
        } else if (numberOfProjects > 1) {
            response.get().then().body("results.size()", equalTo(numberOfProjects));
        }
    }
}

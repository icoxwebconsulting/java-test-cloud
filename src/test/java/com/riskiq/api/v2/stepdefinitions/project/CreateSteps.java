package com.riskiq.api.v2.stepdefinitions.project;



import io.restassured.RestAssured;

import com.riskiq.api.v2.FlowData;
import com.riskiq.api.v2.impl.BodyElement;
import cucumber.api.DataTable;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.restassured.http.ContentType;
import io.restassured.response.Response;

import java.util.Collections;
import static org.hamcrest.Matchers.equalTo;
import static org.hamcrest.Matchers.greaterThan;
import static org.hamcrest.Matchers.nullValue;
import static org.hamcrest.core.Is.is;

public class CreateSteps extends FlowData  {



    @When("^users want to get information of the all project$")
    public void users_want_to_get_information_of_the_all_project() throws Throwable {
        // Write code here that turns the phrase above into concrete actions
        response.set(rs.get().get("/project"));
    }

    @When("^users want to create project with the values$")
    public void usersWantToCreateProjectWithTheValues(DataTable dataTable) {
        response.set(rs.get().contentType(ContentType.TEXT).body(dataTableToJson(dataTable.asList(BodyElement.class))).put("/project"));
        owner.set(response.get().path("owner"));
        projectId.set(response.get().path("guid"));
        creator.set(response.get().path("creator"));
        visibility.set(response.get().path("visibility"));
        organization.set(response.get().path("organization"));
        featured.set(response.get().path("featured"));
    }

    @Then("^the requested data match with the schema \"([^\"]*)\"$")
    public void theRequestedDataMatchWithTheSchema(String schema) throws Throwable {
        // Write code here that turns the phrase above into concrete actions
        //throw new PendingException();
    }

    @And("^a created project with values$")
    public void aCreatedProjectWithValues(DataTable dataTable) throws Throwable {
       // rs.set(RestAssured.given().auth().preemptive().basic("mauro@icox.com", "316bf07182644307e9e5b459f3389b6f46de7efe29386c74857a13afd8aad9af"));
        rs.set(RestAssured.given().auth().preemptive().basic(System.getProperty("username"), System.getProperty("password")));
        response.set(rs.get().contentType(ContentType.TEXT).body(dataTableToJson(dataTable.asList(BodyElement.class))).put("/project"));
        owner.set(response.get().path("owner"));
        projectId.set(response.get().path("guid"));
        creator.set(response.get().path("creator"));
        visibility.set(response.get().path("visibility"));
        organization.set(response.get().path("organization"));
        featured.set(response.get().path("featured"));
    }



    @When("^a created project with values with invalid credentials$")
    public void aCreatedProjectWithInvalidCredentials(DataTable dataTable) throws Throwable {
        response.set(rs.get().contentType(ContentType.JSON).body(dataTableToJson(dataTable.asList(BodyElement.class))).put("/project"));

    }


    @And("^a created project with values by user B$")
    public void aCreatedProjectWithValuesByUserB(DataTable dataTable) throws Throwable {
        rs.set(RestAssured.given().auth().preemptive().basic("robertm@icox.com", "434f651ed6a208d9cdedd7ab8d057d4214122cd64045a9d08d8768402f16749a"));
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

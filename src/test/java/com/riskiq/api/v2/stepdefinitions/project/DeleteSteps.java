package com.riskiq.api.v2.stepdefinitions.project;

import com.riskiq.api.v2.FlowData;
import com.riskiq.api.v2.impl.BodyElement;
import cucumber.api.DataTable;
import cucumber.api.java.en.When;
import io.restassured.RestAssured;
import io.restassured.http.ContentType;


public class DeleteSteps extends FlowData {

  @When("^users want to delete project with the values$")
  public void usersWantToDeleteProjectWithTheValues(DataTable dataTable) {
    response.set(rs.get().contentType(ContentType.JSON).body(dataTableToJson(dataTable.asList(BodyElement.class))).delete("/project"));
  }

  @When("^user A want to delete project created by user B$")
  public void userAWantToDeleteProjectCreatedByUserB(DataTable dataTable) {
    rs.set(RestAssured.given().auth().preemptive().basic("alejandrodavidsalazar@gmail.com", "316bf07182644307e9e5b459f3389b6f46de7efe29386c74857a13afd8aad9af"));
    response.set(rs.get().contentType(ContentType.JSON).body(dataTableToJson(dataTable.asList(BodyElement.class))).delete("/project"));

  }

    @When("^users want to delete project without values$")
    public void usersWantToDeleteProjectWithoutValues() {
        response.set(rs.get().contentType(ContentType.JSON).delete("/project"));
    }

  @When("^users want to delete a project with guid not existent$")
  public void usersWantToDeleteAProjectWithGuidNotExistent(DataTable dataTable) {
    //we make sure that the guid does not exist
    rs.get().contentType(ContentType.JSON).body(dataTableToJson(dataTable.asList(BodyElement.class))).delete("/project");
    response.set(rs.get().contentType(ContentType.JSON).body(dataTableToJson(dataTable.asList(BodyElement.class))).delete("/project"));
  }


}

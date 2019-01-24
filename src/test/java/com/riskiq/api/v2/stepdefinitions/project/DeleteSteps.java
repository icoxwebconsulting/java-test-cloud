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

/**
 * Created by Robert on 24/01/2019.
 */
public class DeleteSteps extends FlowData {

  @When("^users want to delete project with the values$")
  public void usersWantToDeleteProjectWithTheValues(DataTable dataTable) {
    response.set(rs.get().contentType(ContentType.JSON).body(dataTableToJson(dataTable.asList(BodyElement.class))).delete("/project"));
  }


  @Then("^get projectUUID from project created$")
  public void getProjectUUID() throws Throwable {
    System.out.println("===============================");
    System.out.println(json.extract().path("guid").toString());
    json.extract().path("project");
  }

}

package com.riskiq.api.v2;

import io.restassured.response.Response;
import io.restassured.response.ValidatableResponse;
import io.restassured.specification.RequestSpecification;

public class FlowData {

    protected static InheritableThreadLocal<RequestSpecification> rs = new InheritableThreadLocal<>();
    protected static InheritableThreadLocal<Response> response = new InheritableThreadLocal<>();
    protected static ValidatableResponse json;
}

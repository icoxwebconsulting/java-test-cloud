package com.riskiq.api.v2.misc;

import com.riskiq.api.v2.impl.BodyElement;
import io.restassured.response.ValidatableResponse;
import org.apache.commons.lang3.StringUtils;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicReference;
import static org.hamcrest.Matchers.equalTo;
import static org.hamcrest.collection.IsEmptyCollection.empty;
import static org.hamcrest.core.Is.is;
public class Utils {

    public synchronized static String dataTableToJson(List<BodyElement> bodyElements) {
        AtomicReference<String> json = new AtomicReference<>("");
        bodyElements.forEach(bodyElement -> {
            if ((bodyElement.getValue().equals("true") || bodyElement.getValue().equals("false")) && bodyElements.size() == bodyElements.indexOf(bodyElement) + 1) {
                json.set(String.join("", json.get(), String.format("\"%s\": %s", bodyElement.getKey(), bodyElement.getValue())));
            } else if ((bodyElement.getKey().equals("query") || bodyElement.getKey().equals("tags")) && bodyElements.size() != bodyElements.indexOf(bodyElement) + 1) {
                if (bodyElement.getValue() != null && !bodyElement.getValue().isEmpty() && !bodyElement.getValue().equals("[]")) {
                    bodyElement.setValue(String.format("[\"%s\"]", bodyElement.getValue().replace(",", "\",\"")));
                }
                json.set(String.join("", json.get(), String.format("\"%s\": %s,\n", bodyElement.getKey(), bodyElement.getValue())));
            } else if ((bodyElement.getKey().equals("query") || bodyElement.getKey().equals("tags")) && bodyElements.size() == bodyElements.indexOf(bodyElement) + 1) {
                if (bodyElement.getValue() != null && !bodyElement.getValue().isEmpty()&& !bodyElement.getValue().equals("[]")) {
                    bodyElement.setValue(String.format("[\"%s\"]", bodyElement.getValue().replace(",", "\",\"")));
                }
                json.set(String.join("", json.get(), String.format("\"%s\": %s\n", bodyElement.getKey(), bodyElement.getValue())));
            } else if ((bodyElement.getValue().equals("true") || bodyElement.getValue().equals("false")) && bodyElements.size() != bodyElements.indexOf(bodyElement) + 1) {
                json.set(String.join("", json.get(), String.format("\"%s\": %s,\n", bodyElement.getKey(), bodyElement.getValue())));
            } else if ((!bodyElement.getValue().equals("true") && !bodyElement.getValue().equals("false")) && bodyElements.size() == bodyElements.indexOf(bodyElement) + 1) {
                json.set(String.join("", json.get(), String.format("\"%s\": \"%s\"", bodyElement.getKey(), bodyElement.getValue())));
            } else if ((!bodyElement.getValue().equals("true") && !bodyElement.getValue().equals("false")) && bodyElements.size() != bodyElements.indexOf(bodyElement) + 1) {
                json.set(String.join("", json.get(), String.format("\"%s\": \"%s\",\n", bodyElement.getKey(), bodyElement.getValue())));
            }
        });
        return String.format("{%s}", json.get());
    }


    public synchronized static ValidatableResponse matchJsonValue(Map.Entry<String, String> field, ValidatableResponse json){
        if(StringUtils.isNumeric(field.getValue())){
            //value numeric
            return  json.body(field.getKey(), equalTo(Integer.parseInt(field.getValue())));
        }else if(json.extract().path(field.getKey()) instanceof Boolean){
            //value Boolean
            return json.body(field.getKey(), equalTo(Boolean.parseBoolean(field.getValue())));
        }else if(json.extract().path(field.getKey()) instanceof ArrayList){
            //value ArrayList
            List<String> arrayList = new ArrayList<String>(Arrays.asList(field.getValue().split(",")));
            if(((ArrayList) json.extract().path(field.getKey())).size() == 0){
                return   json.body(field.getKey(), is(empty()));
            }else{
                return   json.body(field.getKey(), equalTo(arrayList));
            }
        }
        else{
            //value String
            return json.body(field.getKey().toString(), equalTo(field.getValue()));
        }
    }
}

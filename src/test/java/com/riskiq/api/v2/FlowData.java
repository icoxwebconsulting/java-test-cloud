package com.riskiq.api.v2;

import com.riskiq.api.v2.impl.BodyElement;
import gherkin.deps.com.google.gson.Gson;
import gherkin.deps.com.google.gson.GsonBuilder;
import io.restassured.response.Response;
import io.restassured.response.ValidatableResponse;
import io.restassured.specification.RequestSpecification;
import org.apache.commons.lang3.StringUtils;

import java.util.List;
import java.util.concurrent.atomic.AtomicReference;

import static com.riskiq.api.v2.misc.Utils.createJson;
import static com.riskiq.api.v2.misc.Utils.generateRandomString;

public class FlowData  {

    protected static InheritableThreadLocal<RequestSpecification> rs = new InheritableThreadLocal<>();
    protected static InheritableThreadLocal<Response> response = new InheritableThreadLocal<>();
    protected static ValidatableResponse json;
    protected static InheritableThreadLocal<String> projectId = new InheritableThreadLocal<>();
    protected static AtomicReference<String> bodyJson = new AtomicReference<>("");


    public  String dataTableToJson(List<BodyElement> bodyElements) {
        this.bodyJson = new AtomicReference<>("");
        bodyElements.forEach(bodyElement -> {
            Boolean isLast = (bodyElements.size() == bodyElements.indexOf(bodyElement) + 1);

            //validate to random
            if(StringUtils.containsIgnoreCase(bodyElement.getValue(), "@@")){

                this.bodyJson =   createJson(validateRandomValue(bodyElement) , isLast, this.bodyJson);
            }else{
                //create json
                this.bodyJson =   createJson(bodyElement , isLast, this.bodyJson);
            }


        });
        System.out.println(String.format("{%s}", bodyJson.get()));
        return String.format("{%s}", bodyJson.get());
    }

    public BodyElement validateRandomValue(BodyElement bodyElement){

        if(!bodyElement.getKey().equalsIgnoreCase("tags") && !bodyElement.getKey().equalsIgnoreCase("query")){
            String[] value = bodyElement.getValue().split("@@");
           String random =  value[1];
            random += "_"+generateRandomString();
            bodyElement.setValue(random);
        }else{

            String[] value = bodyElement.getValue().split("@@randomTags");
            int numberTags = Integer.valueOf(value[1]);
            String random =  "";
            for(int i=0; i<numberTags; i++ ){
                if(numberTags > 1 && i != numberTags-1){
                    random += "Tag_"+generateRandomString() + " , ";
                }else{
                    random += "Tag_"+generateRandomString();
                }

            }
            bodyElement.setValue(random);
        }
        return bodyElement;
    }
}

package com.riskiq.api.v2;

import com.riskiq.api.v2.impl.BodyElement;
import com.riskiq.api.v2.stepdefinitions.project.impl.Project;
import gherkin.deps.com.google.gson.Gson;
import gherkin.deps.com.google.gson.GsonBuilder;
import io.restassured.response.Response;
import io.restassured.response.ValidatableResponse;
import io.restassured.specification.RequestSpecification;
import org.apache.commons.lang3.StringUtils;

import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicReference;

import static com.riskiq.api.v2.misc.Utils.createJson;
import static com.riskiq.api.v2.misc.Utils.generateRandomString;

public class FlowData  {

    protected static InheritableThreadLocal<RequestSpecification> rs = new InheritableThreadLocal<>();
    protected static InheritableThreadLocal<Response> response = new InheritableThreadLocal<>();
    protected static ValidatableResponse json;
    protected static InheritableThreadLocal<String> projectId = new InheritableThreadLocal<>();
    protected static InheritableThreadLocal<Project> project = new InheritableThreadLocal<>();
    protected static InheritableThreadLocal<String> owner = new InheritableThreadLocal<>();
    protected static InheritableThreadLocal<String> creator = new InheritableThreadLocal<>();
    protected static InheritableThreadLocal<String> visibility = new InheritableThreadLocal<>();
    protected static InheritableThreadLocal<String> organization = new InheritableThreadLocal<>();
    protected static InheritableThreadLocal<Boolean> featured = new InheritableThreadLocal<>();


    protected static InheritableThreadLocal<String> wrongGuid = new InheritableThreadLocal<>();
    protected static InheritableThreadLocal<String> noExistGuid = new InheritableThreadLocal<>();
    protected static InheritableThreadLocal<String> wrongOwner = new InheritableThreadLocal<>();
    protected static InheritableThreadLocal<String> wrongCreator = new InheritableThreadLocal<>();
    protected static InheritableThreadLocal<String> wrongOrganization = new InheritableThreadLocal<>();
    protected static InheritableThreadLocal<String> wrongVisibility = new InheritableThreadLocal<>();


    protected static AtomicReference<String> bodyJson = new AtomicReference<>("");
    protected static InheritableThreadLocal<String> query = new InheritableThreadLocal<>();

    public  String dataTableToJson(List<BodyElement> bodyElements) {
        this.bodyJson = new AtomicReference<>("");
        bodyElements.forEach(bodyElement -> {
            Boolean isLast = (bodyElements.size() == bodyElements.indexOf(bodyElement) + 1);

            //validate to random (Create)
            if(StringUtils.containsIgnoreCase(bodyElement.getValue(), "@@")){
                this.bodyJson =   createJson(validateRandomValue(bodyElement) , isLast, this.bodyJson);

            }else if(StringUtils.containsIgnoreCase(bodyElement.getValue(), "##")){
                //create json whit variable (find)
                this.bodyJson =   createJson(validateSpecificValue(bodyElement)  , isLast, this.bodyJson);
            }else{
                //create json
                this.bodyJson =   createJson(bodyElement , isLast, this.bodyJson);
            }


        });
       // return String.format("{  \"artifacts\": [ { %s  }  ] }", bodyJson.get());
        return String.format("{ %s }", bodyJson.get() );

    }

    public BodyElement validateRandomValue(BodyElement bodyElement){

        if(!bodyElement.getKey().equalsIgnoreCase("tags") ){
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

    public BodyElement validateSpecificValue(BodyElement bodyElement){

            String[] value = bodyElement.getValue().split("##");
            String key =  value[1];

        switch (key) {
            case "guid":
                bodyElement.setValue(String.valueOf(projectId.get()));
                break;
            case "owner":
                bodyElement.setValue(String.valueOf(owner.get()));
                break;
            case "creator":
                bodyElement.setValue(String.valueOf(creator.get()));
                break;
            case "visibility":
                bodyElement.setValue(String.valueOf(visibility.get()));
                break;
            case "organization":
                bodyElement.setValue(String.valueOf(organization.get()));
                break;
            case "featured":
                bodyElement.setValue(String.valueOf(featured.get()));
                break;
            case "wrongGuid":
                bodyElement.setValue(String.valueOf("279abfa2-9e97-0cb9-d2bb995bca7c5"));
                break;
            case "noExistGuid":
                bodyElement.setValue(String.valueOf("279bbfb2-9e97-0cb9-d2bb-995bca7c5909"));
                break;
            case "wrongOwner":
                bodyElement.setValue(String.valueOf("OtherOwner"));
                break;
            case "wrongCreator":
                bodyElement.setValue(String.valueOf("OtherCreator"));
                break;
            case "wrongOrganization":
                bodyElement.setValue(String.valueOf("OtherOrganization"));
                break;
            case "wrongVisibility":
                bodyElement.setValue(String.valueOf("OtherVisibility"));
                break;
            default:
                bodyElement.setValue("");
                break;
        }

        return bodyElement;
    }


    public  Map.Entry<String, String>  validateSpecificValue(Map.Entry<String, String> field){

        String[] value = field.getValue().split("##");
        String key =  value[1];
        System.out.println("========FIELD========");
        System.out.println(key);
        switch (key) {
            case "guid":
                field.setValue(projectId.get());
                break;
            case "owner":
                field.setValue(String.valueOf(owner.get()));
                break;
            case "creator":
                field.setValue(String.valueOf(creator.get()));
                break;
            default:
                field.setValue("");
                break;
        }

        System.out.println("========FIELD========");
        System.out.println(field);
        return field;
    }



    public  String dataTableToJsonBulkArtifact(List<BodyElement> bodyElements) {
        this.bodyJson = new AtomicReference<>("");
        bodyElements.forEach(bodyElement -> {
            Boolean isLast = (bodyElements.size() == bodyElements.indexOf(bodyElement) + 1);

            //validate to random (Create)
            if(StringUtils.containsIgnoreCase(bodyElement.getValue(), "@@")){
                this.bodyJson =   createJson(validateRandomValue(bodyElement) , isLast, this.bodyJson);

            }else if(StringUtils.containsIgnoreCase(bodyElement.getValue(), "##")){
                //create json whit variable (find)
                this.bodyJson =   createJson(validateSpecificValue(bodyElement)  , isLast, this.bodyJson);
            }else{
                //create json
                this.bodyJson =   createJson(bodyElement , isLast, this.bodyJson);
            }


        });

        //  System.out.println(String.format("{ %s }", bodyJson.get() ));

        return String.format("{  \"artifacts\": [ { %s  }  ] }", bodyJson.get());

    }
}

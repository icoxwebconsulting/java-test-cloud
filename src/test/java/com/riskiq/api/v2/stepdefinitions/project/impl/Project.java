package com.riskiq.api.v2.stepdefinitions.project.impl;

import com.riskiq.api.v2.impl.BodyElement;
import gherkin.deps.com.google.gson.Gson;
import gherkin.deps.com.google.gson.GsonBuilder;
import lombok.Builder;
import lombok.Data;
import static com.riskiq.api.v2.misc.Utils.createJson;

import java.util.List;
import java.util.concurrent.atomic.AtomicReference;

@Builder
@Data
public class Project {

    public InheritableThreadLocal<String> guid;






}

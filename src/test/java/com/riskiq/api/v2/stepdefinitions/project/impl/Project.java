package com.riskiq.api.v2.stepdefinitions.project.impl;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class Project {

    public InheritableThreadLocal<String> guid;

}

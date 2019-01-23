package com.riskiq.api.v2.impl;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class BodyElement {
    public String key;
    public String value;
}

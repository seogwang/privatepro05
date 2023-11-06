package com.chunjae.privatepro05.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum Role {
    ADMIN("ADMIN"), TEACHER("TEACHER"), USER("USER");
    private String value;
}

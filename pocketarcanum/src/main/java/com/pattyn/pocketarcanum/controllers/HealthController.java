package com.pattyn.pocketarcanum.controllers;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("health")
@RequiredArgsConstructor
public class HealthController {


    @GetMapping("/ping")
    public ResponseEntity<String> ping() {
        return new ResponseEntity<>("Healthy", HttpStatus.OK);
    }
}
package com.example.demo.controllers.root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RootControllerImpl implements RootController {

    @Override
    @GetMapping("/")
    public String showMessage() {
        return "Hello World - From Java Spring Boot";
    }

    
}
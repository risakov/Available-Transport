package com.mmdev.hackathon.controllers

import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController

@RestController
class MainController {

    @GetMapping("/main")
    fun main(): String {
        return "Hello, world!"
    }

}
package com.mmdev.hackathon.controllers

import com.mmdev.hackathon.domains.EntityBlank
import com.mmdev.hackathon.repositories.EntityBlankRepository
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/entity")
class EntityBlankController {

    @Autowired
    private lateinit var entityRepo: EntityBlankRepository

    @PostMapping("/add")
    fun addEntity(@RequestBody entityBlank: EntityBlank): String {
        entityRepo.save(entityBlank)
        return "Success POST!"
    }

    @GetMapping("/list")
    fun getEntities() = entityRepo.findAll()

}
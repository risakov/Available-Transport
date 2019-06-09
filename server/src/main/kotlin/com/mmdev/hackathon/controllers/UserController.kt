package com.mmdev.hackathon.controllers

import com.mmdev.hackathon.domains.User
import com.mmdev.hackathon.repositories.UserRepository
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/user")
class UserController {

    @Autowired
    private lateinit var userRepo: UserRepository

    @PostMapping("/add")
    fun addUser(@RequestBody user: User) =
            if (userRepo.existsByPhone(user.phone))
                0
            else {
                userRepo.save(user)
                1
            }

    @GetMapping("/{phone}")
    fun getUser(@PathVariable phone: String) = userRepo.findByPhone(phone)

    @GetMapping("/list")
    fun getUsers() = userRepo.findAll()

}
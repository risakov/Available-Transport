package com.mmdev.hackathon.services

import com.mmdev.hackathon.domains.User
import com.mmdev.hackathon.repositories.UserRepository
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service

@Service
class UserService {

    @Autowired
    private lateinit var userRepo: UserRepository

    fun save(user: User) = userRepo.save(user)

    fun findAll() = userRepo.findAll()

    fun findByPhone(phone: String) = userRepo.findByPhone(phone)

    fun existsByPhone(phone: String) = userRepo.existsByPhone(phone)

}
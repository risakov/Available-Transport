package com.mmdev.hackathon.repositories

import com.mmdev.hackathon.domains.User
import org.springframework.data.repository.CrudRepository

interface UserRepository : CrudRepository<User, Long> {

    fun findByPhone(phone: String): User?

    fun existsByPhone(phone: String): Boolean

}
package com.mmdev.hackathon.controllers

import com.mmdev.hackathon.domains.Session
import com.mmdev.hackathon.domains.User
import com.mmdev.hackathon.repositories.SessionRepository
import com.mmdev.hackathon.repositories.UserRepository
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.bind.annotation.*
import java.lang.Exception

@RestController
@RequestMapping("/session")
class SessionController {

    @Autowired
    private lateinit var sessionRepo: SessionRepository

    @Autowired
    private lateinit var userRepo: UserRepository

    @PostMapping("/add")
    fun addSession(@RequestBody session: Session): String {
        sessionRepo.save(session)
        return "Success POST!"
    }

    @PostMapping("/adduser")
    fun addUser(@RequestParam sessionId: Long, @RequestParam userId: Long): String {
        return try {
            val session = sessionRepo.findById(sessionId).get()
            val user = userRepo.findById(userId).get()
            val session_passengers = ArrayList(session.passengers)
            session_passengers.add(user)
            session.passengers = session_passengers.toList()
            sessionRepo.save(session)
            "Success POST!"
        } catch (e: Exception) {
            "Exception POST!"
        }
    }

}
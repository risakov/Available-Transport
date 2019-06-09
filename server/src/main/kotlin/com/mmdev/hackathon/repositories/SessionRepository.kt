package com.mmdev.hackathon.repositories

import com.mmdev.hackathon.domains.Session
import org.springframework.data.repository.CrudRepository

interface SessionRepository : CrudRepository<Session, Long>
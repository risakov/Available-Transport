package com.mmdev.hackathon

import com.mmdev.hackathon.domains.User
import com.mmdev.hackathon.services.UserService
import com.mmdev.hackathon.services.VehicleService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.context.event.ApplicationReadyEvent
import org.springframework.boot.runApplication
import org.springframework.context.event.EventListener

@SpringBootApplication
class HackathonApplication {

	@Autowired
	private lateinit var userService: UserService

	@Autowired
	private lateinit var vehicleService: VehicleService

	@EventListener(ApplicationReadyEvent::class)
	fun ready() {
		println("Hello, world!")
		userService.save(User("Huilo", "228"))
	}

}

fun main(args: Array<String>) {
	runApplication<HackathonApplication>(*args)
}

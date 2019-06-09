package com.mmdev.hackathon.controllers

import com.mmdev.hackathon.domains.Vehicle
import com.mmdev.hackathon.repositories.VehicleRepository
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/vehicle")
class VehicleController {

    @Autowired
    lateinit var vehicleRepo: VehicleRepository

    @GetMapping("/add")
    fun addVehicle(@RequestParam model: String): String {
        vehicleRepo.save(Vehicle(model))
        return "Vehicle success added!"
    }

    @GetMapping("/{model}")
    fun getByModel(@PathVariable model: String) = vehicleRepo.findByModel(model)

    @GetMapping("/list")
    fun getVehicles() = vehicleRepo.findAll()

    @GetMapping("/freedom")
    fun getFreedomVehicles() = vehicleRepo.findVehiclesByFreedom(true)

}
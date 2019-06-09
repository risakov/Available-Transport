package com.mmdev.hackathon.repositories

import com.mmdev.hackathon.domains.Vehicle
import org.springframework.data.repository.CrudRepository

interface VehicleRepository : CrudRepository<Vehicle, Long> {

    fun findByModel(model: String): List<Vehicle>

    fun findVehiclesByFreedom(freedom: Boolean): List<Vehicle>

}
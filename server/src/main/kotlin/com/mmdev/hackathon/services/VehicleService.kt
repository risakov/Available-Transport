package com.mmdev.hackathon.services

import com.mmdev.hackathon.domains.Vehicle
import com.mmdev.hackathon.repositories.VehicleRepository
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service

@Service
class VehicleService {

    @Autowired
    private lateinit var vehicleRepo: VehicleRepository

    fun save(user: Vehicle) = vehicleRepo.save(user)

    fun findAll() = vehicleRepo.findAll()

    fun findByModel(model: String) = vehicleRepo.findByModel(model)

}
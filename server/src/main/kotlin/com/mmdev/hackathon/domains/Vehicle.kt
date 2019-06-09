package com.mmdev.hackathon.domains

import javax.persistence.*

@Entity
@Table(name = "vehicles")
class Vehicle(

        val model: String,
        val rating: Int = 0,
        val trips: Int = 0,
        val fuel: Int = 0,
        var freedom: Boolean = true

) {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    var id: Long = 0
    var lng: Double = 0.0
    var lat: Double = 0.0

}
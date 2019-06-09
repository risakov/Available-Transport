package com.mmdev.hackathon.domains

import javax.persistence.*

@Entity
@Table(name = "users")
class User(

        val name: String,
        val phone: String,
        val experience: Int = 0

) {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    var id: Long = 0
    var lng: Double = 0.0
    var lat: Double = 0.0
}
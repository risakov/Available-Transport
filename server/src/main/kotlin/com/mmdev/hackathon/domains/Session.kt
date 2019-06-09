package com.mmdev.hackathon.domains

import javax.persistence.*

@Entity
@Table(name = "sessions")
class Session(

        val vehicleId: Long,
        val driverId: Long,

        @ElementCollection
        @CollectionTable(name = "session_passengers", joinColumns = [JoinColumn(name = "session_id")])
        var passengers: List<User>,
        var lng: DoubleArray,
        var lat: DoubleArray

) {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    var id: Long = 0

}
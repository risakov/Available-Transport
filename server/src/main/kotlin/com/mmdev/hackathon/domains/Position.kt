package com.mmdev.hackathon.domains

class Position() {

    var lng: Double = 0.0
    var lat: Double = 0.0

    constructor(lng: Double, lat: Double) : this() {
        this.lng = lng
        this.lat = lat
    }

}
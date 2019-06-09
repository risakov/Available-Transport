package com.mmdev.hackathon.domains

import javax.persistence.*

@Entity
@Table(name = "entity_blanks")
class EntityBlank(
    val fullname: String,
    val phone: String,
    val email: String,
    val corporation: String
) {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    var id: Long = 0

}

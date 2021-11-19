package models

import kotlinx.serialization.*

@Serializable
data class Users (
    val id:Int,
    val name:String,
    val email:String,
)
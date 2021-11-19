package models

import kotlinx.serialization.*

@Serializable
data class Review (
    val id:Int,
    val id_name:Int,
    val rating:Double,
    val comment:String,
    val id_game:Int
    )
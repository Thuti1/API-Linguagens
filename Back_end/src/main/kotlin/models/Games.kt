package models
import kotlinx.serialization.*

@Serializable
data class Games (
    val id:Int,
    val name:String,
    val desc:String,
    val image:String,)

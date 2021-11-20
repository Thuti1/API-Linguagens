import dao.GamesDAO
import dao.ReviewDAO
import dao.UsersDAO
import models.Games
import models.Review
import models.Users
import java.sql.DriverManager
import io.ktor.server.netty.*
import plugins.*
import io.ktor.application.*
import io.ktor.features.*
import io.ktor.http.*
import io.ktor.serialization.*
import io.ktor.server.engine.*

fun main(args: Array<String>) {
    embeddedServer(Netty, port = 8080, host = "0.0.0.0") {
        //Instala as dependencias para utilizar o objeto JSON

        install(ContentNegotiation){
            json()
        }
        install(CORS) {
            method(HttpMethod.Options)
            anyHost()
        }
        val reviewDao = ReviewDAO()
        reviewDao.deletar(1)
        reviewDao.deletar(2)
        reviewDao.deletar(3)

        val gamesDao = GamesDAO()
        gamesDao.deletar(5)
        gamesDao.deletar(6)
        gamesDao.deletar(7)
        gamesDao.deletar(8)
//        val gamesDao = GamesDAO()
//        gamesDao.inserirUm(Games(3, "limao", "uma fruta verde", "LMAO.lol"))
        configureRouting()
    }.start(wait = true)
    //Cria um DAO para os produtos


//    gamesDao.inserirUm(Games(3, "melancia", "uma fruta grande", "melan.cia"))
//    var games = gamesDao.pegarTodosSeguro()
//    for (game in games){
//       println(game)
//   }
    val userDao = UsersDAO()
//    userDao.inserirUm(Users(1, "max", "max@MAX"))

//    reviewDao.inserirUm(Review(2, 2, 10.01, "Bom Demais", 6))
//    var users = userDao.pegarTodosSeguro()
//    for (user in users){
//        println(user)
//    }
//    var reviews = reviewDao.pegarTodosSeguro()
//    for (review in reviews){
//        println(review)
//    }
    //gamesDao.atualizar(Games(8,"Samsung",350.0,2))
    //var games = GamesDAO.pegarTodosSeguro()
    //Intera pelo resultado obtido

    //produtosDao.inserirUm(Produto(0, "Agua", 5.0,12))
    //produtosDao.inserirVarios(listOf(
    //    Produto(0,"Clementine", 799.98, 1),
    //    Produto(0,"Listerine",15.99,80)))


}
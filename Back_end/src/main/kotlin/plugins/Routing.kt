package plugins

import io.ktor.routing.*
import io.ktor.application.*
import io.ktor.response.*
import dao.GamesDAO
import dao.ReviewDAO
import dao.UsersDAO
import io.ktor.http.*
import models.Games

fun Application.configureRouting() {
    routing {
        get("/") {
            call.respondText("Bem Vindo ao AvaliaJogos!")
        }
        get("/Jogos") {
            val gamesDao = GamesDAO()
            var games = gamesDao.pegarTodosSeguro()
            val game = games.lastIndex;
            repeat(game) {call.respond(games)}
        }
        get("/Usuarios") {
            val usersDao = UsersDAO()
            var users = usersDao.pegarTodosSeguro()
            val user = users.lastIndex;
            repeat(user) {call.respond(users)}
        }
        get("/Reviews") {
            val reviewsDao = ReviewDAO()
            var reviews = reviewsDao.pegarTodosSeguro()
            val review = reviews.lastIndex;
            repeat(review) {call.respond(reviews)}
        }
    }
}


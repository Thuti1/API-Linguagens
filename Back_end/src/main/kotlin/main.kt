import dao.GamesDAO
import dao.ReviewDAO
import dao.UsersDAO
import models.Games
import models.Review
import models.Users
import java.sql.DriverManager

fun main(args: Array<String>) {
    //Cria um DAO para os produtos
    val gamesDao = GamesDAO()
//    gamesDao.deletar(3)
//    gamesDao.deletar(4)

//    gamesDao.inserirUm(Games(3, "banana", "uma fruta", "fodase.png"))
//    var games = gamesDao.pegarTodosSeguro()
//    for (game in games){
//        println(game)
//    }
    val userDao = UsersDAO()
//    userDao.inserirUm(Users(1, "bob", "bob@BOBO"))
    val reviewDao = ReviewDAO()
//    reviewDao.deletar(1)
//    reviewDao.deletar(2)
//    reviewDao.inserirUm(Review(2, 1, 5.7, "Bem ruim", 5))
//    var games = GamesDAO.pegarTodosSeguro()
//    for (game in games){
//        println(game)
 //   }
    //gamesDao.atualizar(Games(8,"Samsung",350.0,2))
    //var games = GamesDAO.pegarTodosSeguro()
    //Intera pelo resultado obtido

    //produtosDao.inserirUm(Produto(0, "Agua", 5.0,12))
    //produtosDao.inserirVarios(listOf(
    //    Produto(0,"Clementine", 799.98, 1),
    //    Produto(0,"Listerine",15.99,80)))

}
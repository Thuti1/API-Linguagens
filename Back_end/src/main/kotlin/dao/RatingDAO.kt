package dao

import models.Games
import models.Rating
import shared.SharedPaths
import java.sql.DriverManager

class RatingDAO : GenericDAO{
    override fun pegarUm(id: Int): Any {
        //Cria uma conexão com o banco
        val connection = DriverManager.getConnection(SharedPaths.STRING_DE_CONEXAO_JDBC)
        //Cria um caminho para realizar queries sql no banco
        val sqlStatement = connection.createStatement()
        //Executa uma query de busca
        val resultSet = sqlStatement.executeQuery("SELECT * FROM Rating WHERE id_rating == ${id};")
        //Intera pelo resultado obtido
        var rating : Rating? = null
        while(resultSet.next()){
            rating = Rating(
                resultSet.getInt("id_rating"),
                resultSet.getInt("id_games"),
                resultSet.getInt("id_review"),
                resultSet.getInt("id_user"),

            )
            println("Game found: ${rating}")
        }
        resultSet.close()
        sqlStatement.close()
        connection.close()
        return rating!!
    }



    override fun pegarTodosSeguro(): List<Any> {
        val rating = mutableListOf<Rating>()
        var connection : ConnectionDAO? = null
        try {
            //Cria uma conexão com o banco
            connection = ConnectionDAO()
            val resultSet = connection.executeQuery("SELECT * FROM Games;")
            //Intera pelo resultado obtido
            while (resultSet?.next()!!) {
                rating.add(
                    Rating(
                        resultSet.getInt("id_rating"),
                        resultSet.getInt("id_games"),
                        resultSet.getInt("id_review"),
                        resultSet.getInt("id_user"),
                    )
                )
            }

        }
        catch (exception:Exception){
            exception.printStackTrace()
        }
        finally {
            connection?.close()
        }
        return rating
    }

    override fun inserirUm(objeto: Any) {
        val connectionDAO = ConnectionDAO()
        val preparedStatement = connectionDAO.getPreparedStatement("""
            INSERT INTO Rating 
            (id_rating,id_games,id_review,id_user) 
            VALUES (?,?,?,?);
            """.trimMargin())
        val rating = objeto as Rating
        preparedStatement?.setInt(1,rating.id_games)
        preparedStatement?.setInt(2,rating.id_review)
        preparedStatement?.setInt(3,rating.id_user)
        preparedStatement?.executeUpdate()
        //Banco já está em modo auto-commit
        //connectionDAO.commit()
        connectionDAO.close()
    }

    override fun inserirVarios(lista: List<Any>) {
        val connectionDAO = ConnectionDAO()
        val preparedStatement = connectionDAO.getPreparedStatement("""
            INSERT INTO Rating 
            (id_games,id_review,id_user) 
            VALUES (?,?,?);
            """.trimMargin())
        for (objeto in lista) {
            val rating = objeto as Rating
            preparedStatement?.setInt(1, rating.id_games)
            preparedStatement?.setInt(2, rating.id_review)
            preparedStatement?.setInt(3, rating.id_user)
            preparedStatement?.executeUpdate()
            //Banco já está em modo auto-commit
            //connectionDAO.commit()
        }
        connectionDAO.close()
    }

    override fun atualizar(objeto: Any) {
        val connectionDAO = ConnectionDAO()
        val preparedStatement = connectionDAO.getPreparedStatement("""
            UPDATE Rating 
            SET name = ?, developer = ? 
            WHERE id_games = ?;
            """.trimMargin())
        val game = objeto as Games
        preparedStatement?.setInt(1,game.id_games)
        preparedStatement?.setString(2,game.name)
        preparedStatement?.setString(3,game.developer)
        preparedStatement?.executeUpdate()
        //Banco já está em modo auto-commit
        //connectionDAO.commit()
        connectionDAO.close()
    }

    override fun deletar(id: Int) {
        val connectionDAO = ConnectionDAO()
        val preparedStatement = connectionDAO.getPreparedStatement("""
            DELETE FROM Rating  
            WHERE id_rating = ?;
            """.trimMargin())
        preparedStatement?.setInt(1,id)
        preparedStatement?.executeUpdate()
        //Banco já está em modo auto-commit
        //connectionDAO.commit()
        connectionDAO.close()
    }

}
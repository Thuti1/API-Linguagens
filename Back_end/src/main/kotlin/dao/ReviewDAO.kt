package dao

import models.Games
import models.Review
import shared.SharedPaths
import java.sql.DriverManager

class ReviewDAO : GenericDAO {
    override fun pegarUm(id: Int): Any {
        //Cria uma conexão com o banco
        val connection = DriverManager.getConnection(SharedPaths.STRING_DE_CONEXAO_JDBC)
        //Cria um caminho para realizar queries sql no banco
        val sqlStatement = connection.createStatement()
        //Executa uma query de busca
        val resultSet = sqlStatement.executeQuery("SELECT * FROM Reviews WHERE id == ${id};")
        //Intera pelo resultado obtido
        var review : Review? = null
        while(resultSet.next()){
            review = Review(
                resultSet.getInt("id"),
                resultSet.getInt("id_name"),
                resultSet.getDouble("rating"),
                resultSet.getString("comment"),
                resultSet.getInt("id_game"),
            )
            println("Game found: ${review}")
        }
        resultSet.close()
        sqlStatement.close()
        connection.close()
        return review!!
    }



    override fun pegarTodosSeguro(): List<Any> {
        val review = mutableListOf<Review>()
        var connection : ConnectionDAO? = null
        try {
            //Cria uma conexão com o banco
            connection = ConnectionDAO()
            val resultSet = connection.executeQuery("SELECT * FROM Reviews;")
            //Intera pelo resultado obtido
            while (resultSet?.next()!!) {
                review.add(
                    Review(
                        resultSet.getInt("id"),
                        resultSet.getInt("id_name"),
                        resultSet.getDouble("rating"),
                        resultSet.getString("comment"),
                        resultSet.getInt("id_game"),
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
        return review
    }

    override fun inserirUm(objeto: Any) {
        val connectionDAO = ConnectionDAO()
        val preparedStatement = connectionDAO.getPreparedStatement("""
            INSERT INTO Reviews
            (id_name, rating, comment, id_game ) 
            VALUES (?,?,?,?);
            """.trimMargin())
        val review = objeto as Review
        preparedStatement?.setInt(1,review.id_name)
        preparedStatement?.setDouble(2,review.rating)
        preparedStatement?.setString(3,review.comment)
        preparedStatement?.setInt(4,review.id_game)
        preparedStatement?.executeUpdate()
        //Banco já está em modo auto-commit
        //connectionDAO.commit()
        connectionDAO.close()
    }

    override fun inserirVarios(lista: List<Any>) {
        val connectionDAO = ConnectionDAO()
        val preparedStatement = connectionDAO.getPreparedStatement("""
            INSERT INTO Reviews
            (id_name, rating, comment, id_game ) 
            VALUES (?,?,?,?);
            """.trimMargin())
        for (objeto in lista) {
            val review = objeto as Review
            preparedStatement?.setInt(1,review.id_name)
            preparedStatement?.setDouble(2,review.rating)
            preparedStatement?.setString(3,review.comment)
            preparedStatement?.setInt(4,review.id_game)
            preparedStatement?.executeUpdate()
            //Banco já está em modo auto-commit
            //connectionDAO.commit()
        }
        connectionDAO.close()
    }

    override fun atualizar(objeto: Any) {
        val connectionDAO = ConnectionDAO()
        val preparedStatement = connectionDAO.getPreparedStatement("""
            UPDATE Reviews 
            SET id_name = ?, rating = ?, comment = ?, id_game = ?
            WHERE id = ?;
            """.trimMargin())
        val review = objeto as Review
        preparedStatement?.setInt(1,review.id_name)
        preparedStatement?.setDouble(2,review.rating)
        preparedStatement?.setString(3,review.comment)
        preparedStatement?.setInt(4,review.id_game)
        preparedStatement?.executeUpdate()
        //Banco já está em modo auto-commit
        //connectionDAO.commit()
        connectionDAO.close()
    }

    override fun deletar(id: Int) {
        val connectionDAO = ConnectionDAO()
        val preparedStatement = connectionDAO.getPreparedStatement("""
            DELETE FROM Reviews  
            WHERE id = ?;
            """.trimMargin())
        preparedStatement?.setInt(1,id)
        preparedStatement?.executeUpdate()
        //Banco já está em modo auto-commit
        //connectionDAO.commit()
        connectionDAO.close()
    }
}
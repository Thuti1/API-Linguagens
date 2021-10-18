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
        val resultSet = sqlStatement.executeQuery("SELECT * FROM Review WHERE id_review == ${id};")
        //Intera pelo resultado obtido
        var review : Review? = null
        while(resultSet.next()){
            review = Review(
                resultSet.getInt("id_review"),
                resultSet.getDouble("classification"),
                resultSet.getString("comments"),
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
            val resultSet = connection.executeQuery("SELECT * FROM Review;")
            //Intera pelo resultado obtido
            while (resultSet?.next()!!) {
                review.add(
                    Review(
                        resultSet.getInt("id_review"),
                        resultSet.getDouble("classification"),
                        resultSet.getString("comments"),
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
            INSERT INTO Review
            (classification, comments) 
            VALUES (?,?);
            """.trimMargin())
        val review = objeto as Review
        preparedStatement?.setDouble(1,review.classification)
        preparedStatement?.setString(2,review.comments)
        preparedStatement?.executeUpdate()
        //Banco já está em modo auto-commit
        //connectionDAO.commit()
        connectionDAO.close()
    }

    override fun inserirVarios(lista: List<Any>) {
        val connectionDAO = ConnectionDAO()
        val preparedStatement = connectionDAO.getPreparedStatement("""
            INSERT INTO Review
            (classification,comments) 
            VALUES (?,?);
            """.trimMargin())
        for (objeto in lista) {
            val review = objeto as Review
            preparedStatement?.setDouble(1, review.classification)
            preparedStatement?.setString(2, review.comments)
            preparedStatement?.executeUpdate()
            //Banco já está em modo auto-commit
            //connectionDAO.commit()
        }
        connectionDAO.close()
    }

    override fun atualizar(objeto: Any) {
        val connectionDAO = ConnectionDAO()
        val preparedStatement = connectionDAO.getPreparedStatement("""
            UPDATE Review 
            SET classification = ?, comments = ? 
            WHERE id_review = ?;
            """.trimMargin())
        val review = objeto as Review
        preparedStatement?.setInt(1,review.id_review)
        preparedStatement?.setDouble(2, review.classification)
        preparedStatement?.setString(3, review.comments)
        preparedStatement?.executeUpdate()
        //Banco já está em modo auto-commit
        //connectionDAO.commit()
        connectionDAO.close()
    }

    override fun deletar(id: Int) {
        val connectionDAO = ConnectionDAO()
        val preparedStatement = connectionDAO.getPreparedStatement("""
            DELETE FROM Review  
            WHERE id_review = ?;
            """.trimMargin())
        preparedStatement?.setInt(1,id)
        preparedStatement?.executeUpdate()
        //Banco já está em modo auto-commit
        //connectionDAO.commit()
        connectionDAO.close()
    }
}
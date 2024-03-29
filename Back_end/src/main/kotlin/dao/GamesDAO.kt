package dao

import models.Games
import shared.SharedPaths
import shared.SharedPaths.Companion.STRING_DE_CONEXAO_JDBC
import java.sql.DriverManager

class GamesDAO : GenericDAO {
    override fun pegarUm(id: Int): Any {
        //Cria uma conexão com o banco
        val connection = DriverManager.getConnection(STRING_DE_CONEXAO_JDBC)
        //Cria um caminho para realizar queries sql no banco
        val sqlStatement = connection.createStatement()
        //Executa uma query de busca
        val resultSet = sqlStatement.executeQuery("SELECT * FROM Games WHERE id == ${id};")
        //Intera pelo resultado obtido
        var games : Games? = null
        while(resultSet.next()){
            games = Games(
                resultSet.getInt("id"),
                resultSet.getString("name"),
                resultSet.getString("desc"),
                resultSet.getString("image"),
            )
            println("Game found: ${games}")
        }
        resultSet.close()
        sqlStatement.close()
        connection.close()
        return games!!
    }



    override fun pegarTodosSeguro(): List<Any> {
        val games = mutableListOf<Games>()
        var connection : ConnectionDAO? = null
        try {
            //Cria uma conexão com o banco
            connection = ConnectionDAO()
            val resultSet = connection.executeQuery("SELECT * FROM Games;")
            //Intera pelo resultado obtido
            while (resultSet?.next()!!) {
                games.add(
                    Games(
                        resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getString("desc"),
                        resultSet.getString("image"),
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
        return games
    }

    override fun inserirUm(objeto: Any) {
        val connectionDAO = ConnectionDAO()
        val preparedStatement = connectionDAO.getPreparedStatement("""
            INSERT INTO Games 
            (name, desc, image) 
            VALUES (?,?,?);
            """.trimMargin())
        val games = objeto as Games
        preparedStatement?.setString(1,games.name)
        preparedStatement?.setString(2,games.desc)
        preparedStatement?.setString(3,games.image)
        preparedStatement?.executeUpdate()
        //Banco já está em modo auto-commit
        //connectionDAO.commit()
        connectionDAO.close()
    }

    override fun inserirVarios(lista: List<Any>) {
        val connectionDAO = ConnectionDAO()
        val preparedStatement = connectionDAO.getPreparedStatement("""
            INSERT INTO Games 
            (name, desc, image) 
            VALUES (?,?,?);
            """.trimMargin())
        for (objeto in lista) {
            val games = objeto as Games
            preparedStatement?.setString(1, games.name)
            preparedStatement?.setString(2,games.desc)
            preparedStatement?.setString(3, games.image)
            preparedStatement?.executeUpdate()
            //Banco já está em modo auto-commit
            //connectionDAO.commit()
        }
        connectionDAO.close()
    }

    override fun atualizar(objeto: Any) {
        val connectionDAO = ConnectionDAO()
        val preparedStatement = connectionDAO.getPreparedStatement("""
            UPDATE Games 
            SET name = ?, desc = ?, image = ? 
            WHERE id = ?;
            """.trimMargin())
        val game = objeto as Games
        preparedStatement?.setInt(1,game.id)
        preparedStatement?.setString(2,game.name)
        preparedStatement?.setString(3,game.desc)
        preparedStatement?.setString(4,game.image)
        preparedStatement?.executeUpdate()
        //Banco já está em modo auto-commit
        //connectionDAO.commit()
        connectionDAO.close()
    }

    override fun deletar(id: Int) {
        val connectionDAO = ConnectionDAO()
        val preparedStatement = connectionDAO.getPreparedStatement("""
            DELETE FROM Games  
            WHERE id = ?;
            """.trimMargin())
        preparedStatement?.setInt(1,id)
        preparedStatement?.executeUpdate()
        //Banco já está em modo auto-commit
        //connectionDAO.commit()
        connectionDAO.close()
    }
}
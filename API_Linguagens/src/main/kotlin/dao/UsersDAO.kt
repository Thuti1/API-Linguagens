package dao

import models.Users
import models.Rating
import shared.SharedPaths
import java.sql.DriverManager

class UsersDAO : GenericDAO {
    override fun pegarUm(id: Int): Any {
        //Cria uma conexão com o banco
        val connection = DriverManager.getConnection(SharedPaths.STRING_DE_CONEXAO_JDBC)
        //Cria um caminho para realizar queries sql no banco
        val sqlStatement = connection.createStatement()
        //Executa uma query de busca
        val resultSet = sqlStatement.executeQuery("SELECT * FROM Users WHERE id_users == ${id};")
        //Intera pelo resultado obtido
        var users : Users? = null
        while(resultSet.next()){
            users = Users(
                resultSet.getInt("id_users"),
                resultSet.getString("username"),
                resultSet.getDouble("game_time")
            )
            println("Users Found: ${users}")
        }
        resultSet.close()
        sqlStatement.close()
        connection.close()
        return users!!
    }


    override fun pegarTodosSeguro(): List<Any> {
        val users = mutableListOf<Users>()
        var connection : ConnectionDAO? = null
        try {
            //Cria uma conexão com o banco
            connection = ConnectionDAO()
            val resultSet = connection.executeQuery("SELECT * FROM Users;")
            //Intera pelo resultado obtido
            while (resultSet?.next()!!) {
                users.add(
                    Users(
                        resultSet.getInt("id_users"),
                        resultSet.getString("username"),
                        resultSet.getDouble("game_time")
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
        return users
    }

    override fun inserirUm(objeto: Any) {
        val connectionDAO = ConnectionDAO()
        val preparedStatement = connectionDAO.getPreparedStatement("""
            INSERT INTO Users 
            (username, game_time) 
            VALUES (?,?);
            """.trimMargin())
        val users = objeto as Users
        preparedStatement?.setString(1,users.username)
        preparedStatement?.setDouble(2,users.game_time)
        preparedStatement?.executeUpdate()
        //Banco já está em modo auto-commit
        //connectionDAO.commit()
        connectionDAO.close()
    }

    override fun inserirVarios(lista: List<Any>) {
        val connectionDAO = ConnectionDAO()
        val preparedStatement = connectionDAO.getPreparedStatement("""
            INSERT INTO Users 
            (username, game_time) 
            VALUES (?,?);
            """.trimMargin())
        for (objeto in lista) {
            val users = objeto as Users
            preparedStatement?.setString(1, users.username)
            preparedStatement?.setDouble(2, users.game_time)
            preparedStatement?.executeUpdate()
            //Banco já está em modo auto-commit
            //connectionDAO.commit()
        }
        connectionDAO.close()
    }

    override fun atualizar(objeto: Any) {
        val connectionDAO = ConnectionDAO()
        val preparedStatement = connectionDAO.getPreparedStatement("""
            UPDATE Users 
            SET username = ?, game_time = ? 
            WHERE id_users = ?;
            """.trimMargin())
        val users = objeto as Users
        preparedStatement?.setString(1,users.username)
        preparedStatement?.setDouble(2, users.game_time)
        preparedStatement?.executeUpdate()
        //Banco já está em modo auto-commit
        //connectionDAO.commit()
        connectionDAO.close()
    }

    override fun deletar(id: Int) {
        val connectionDAO = ConnectionDAO()
        val preparedStatement = connectionDAO.getPreparedStatement("""
            DELETE FROM Users  
            WHERE id = ?;
            """.trimMargin())
        preparedStatement?.setInt(1,id)
        preparedStatement?.executeUpdate()
        //Banco já está em modo auto-commit
        //connectionDAO.commit()
        connectionDAO.close()
    }
}
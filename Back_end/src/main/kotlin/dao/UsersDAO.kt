package dao

import models.Users
//import models.Rating
import shared.SharedPaths
import java.sql.DriverManager

class UsersDAO : GenericDAO {
    override fun pegarUm(id: Int): Any {
        //Cria uma conexão com o banco
        val connection = DriverManager.getConnection(SharedPaths.STRING_DE_CONEXAO_JDBC)
        //Cria um caminho para realizar queries sql no banco
        val sqlStatement = connection.createStatement()
        //Executa uma query de busca
        val resultSet = sqlStatement.executeQuery("SELECT * FROM Users WHERE id == ${id};")
        //Intera pelo resultado obtido
        var users : Users? = null
        while(resultSet.next()){
            users = Users(
                resultSet.getInt("id"),
                resultSet.getString("name"),
                resultSet.getString("email")
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
                        resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getString("email")
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
            (name, email) 
            VALUES (?,?);
            """.trimMargin())
        val users = objeto as Users
        preparedStatement?.setString(1,users.name)
        preparedStatement?.setString(2,users.email)
        preparedStatement?.executeUpdate()
        //Banco já está em modo auto-commit
        //connectionDAO.commit()
        connectionDAO.close()
    }

    override fun inserirVarios(lista: List<Any>) {
        val connectionDAO = ConnectionDAO()
        val preparedStatement = connectionDAO.getPreparedStatement("""
            INSERT INTO Users 
            (name, email) 
            VALUES (?,?);
            """.trimMargin())
        for (objeto in lista) {
            val users = objeto as Users
            preparedStatement?.setString(1, users.name)
            preparedStatement?.setString(2, users.email)
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
            SET name = ?, email = ? 
            WHERE id = ?;
            """.trimMargin())
        val users = objeto as Users
        preparedStatement?.setString(1,users.name)
        preparedStatement?.setString(2, users.email)
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
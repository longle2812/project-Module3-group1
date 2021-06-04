package dao.user;

import dao.SQLConnection;
import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class UserDAO implements IUserDAO {

    public static final String CREATE_NEW_USER = "insert into user (email, password, name, dob, phoneNumber,avatarURL) values (?,?,?,?,?,'')";

    @Override
    public boolean createNew(User user) {
        Connection connection = SQLConnection.getConnection();
        int rowInserted = 0;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(CREATE_NEW_USER);
            preparedStatement.setString(1, user.getEmail());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3, user.getName());
            preparedStatement.setString(4, user.getdOb());
            preparedStatement.setString(5, user.getPhoneNumber());
            rowInserted = preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            return rowInserted!=0;
        }
        return rowInserted!=0;
    }

    @Override
    public boolean update(int id, User user) {
        return false;
    }

    @Override
    public boolean delete(int id) {
        return false;
    }

    @Override
    public List<User> findAll() {
        return null;
    }

    public boolean signIn(String email, String password) {
        Connection connection = SQLConnection.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from User where email = ? AND password =?");
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return true;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
}

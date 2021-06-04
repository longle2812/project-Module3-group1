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
    public boolean update(int id, User user) {
        Connection connection = SQLConnection.getConnection();
        int rowUpdate = 0;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("update user set name=?,dOB=?,phoneNumber=?,avatarURL=? where id=?");
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getdOb());
            preparedStatement.setString(3, user.getPhoneNumber());
            preparedStatement.setString(4, user.getAvatarURL());
            preparedStatement.setInt(5, id);
            rowUpdate = preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return rowUpdate != 0;
    }

    @Override
    public boolean delete(int id) {
        return false;
    }

    @Override
    public List<User> findAll() {
        return null;
    }

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
            return rowInserted != 0;
        }
        return rowInserted != 0;
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

    @Override
    public User findUserByEmail(String email) {
        Connection connection = SQLConnection.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from user where email = ?");
            preparedStatement.setString(1, email);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String email1 = resultSet.getString("email");
                String password = resultSet.getString("password");
                String name = resultSet.getString("name");
                String dob = resultSet.getString("dob");
                String phoneNumber = resultSet.getString("phoneNumber");
                String avatarURL = resultSet.getString("avatarURL");
                User user = new User(id, email1, password, name, dob, phoneNumber, avatarURL);
                return user;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    public boolean changePassword(User user, String newPassword) {
        Connection connection = SQLConnection.getConnection();
        String email = user.getEmail();
        int rowUpdated = 0;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("update user set password = ? where email = ?");
            preparedStatement.setString(1, newPassword);
            preparedStatement.setString(2, email);
            rowUpdated = preparedStatement.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return rowUpdated != 0;
    }

    @Override
    public User findUserById(int id) {
        Connection connection = SQLConnection.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from user where id = ?");
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id1 = resultSet.getInt("id");
                String email1 = resultSet.getString("email");
                String password = resultSet.getString("password");
                String name = resultSet.getString("name");
                String dob = resultSet.getString("dob");
                String phoneNumber = resultSet.getString("phoneNumber");
                String avatarURL = resultSet.getString("avatarURL");
                User user = new User(id1, email1, password, name, dob, phoneNumber, avatarURL);
                return user;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
}
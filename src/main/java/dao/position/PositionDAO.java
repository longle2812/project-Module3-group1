package dao.position;

import dao.SQLConnection;
import model.Position;

import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PositionDAO implements IPositionDAO {
    @Override
    public boolean createNew(Position position) {
        Connection connection = SQLConnection.getConnection();
        int rowInserted = 0;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("insert into shelf (name, description, capacity, userId) value (?, ?, ?,?)");
            preparedStatement.setString(1, position.getName());
            preparedStatement.setString(2, position.getDescription());
            preparedStatement.setInt(3, position.getCapacity());
            preparedStatement.setInt(4, position.getUserID());
            rowInserted = preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return rowInserted != 0;
    }

    @Override
    public boolean update(int shelfId, Position position) {
        Connection connection = SQLConnection.getConnection();
        int rowUpdated = 0;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("update shelf set name=?, description=?,capacity=? where id =?");
            preparedStatement.setString(1, position.getName());
            preparedStatement.setString(2,position.getDescription());
            preparedStatement.setInt(3, position.getCapacity());
            preparedStatement.setInt(4, shelfId);
            rowUpdated = preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return rowUpdated!= 0;
    }

    @Override
    public boolean delete(int id) {
        Connection connection = SQLConnection.getConnection();
        int rowDeleted = 0;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("delete from shelf where id = ?");
            preparedStatement.setInt(1, id);
            rowDeleted = preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            try {
                PreparedStatement preparedStatement = connection.prepareStatement("delete from changelog where shelfId = ?");
                preparedStatement.setInt(1,id);
                preparedStatement.executeUpdate();
                delete(id);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return rowDeleted != 0;
    }

    @Override
    public List<Position> findAll() {
        return null;
    }

    public List<Position> findAllByID(int userID) {
        Connection connection = SQLConnection.getConnection();
        List<Position> positionList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from shelf where userId = ?");
            preparedStatement.setInt(1, userID);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String description = resultSet.getString("description");
                int inUse = resultSet.getInt("inUse");
                int capacity = resultSet.getInt("capacity");
                Position position = new Position(id, name, description, inUse, capacity);
                positionList.add(position);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return positionList;

    }

    public Position findShelfByID(int shelfID) {
        Connection connection = SQLConnection.getConnection();
        Position position = new Position();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from shelf where id = ?");
            preparedStatement.setInt(1, shelfID);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                String descripton = resultSet.getString("description");
                int inUse = resultSet.getInt("inUse");
                int capacity = resultSet.getInt("capacity");
                position = new Position(shelfID, name, descripton, inUse, capacity);

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return position;
    }

    public boolean deleteBookFromShelf(int shelfId, int bookId) {
        Connection connection = SQLConnection.getConnection();
        int rowDeleted = 0;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("delete from changelog where bookId =? and shelfId =?");
            preparedStatement.setInt(1, bookId);
            preparedStatement.setInt(2, shelfId);
            rowDeleted = preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return rowDeleted!=0;
    }
}

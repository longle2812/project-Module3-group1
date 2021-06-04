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
    public boolean update(int id, Position position) {
        return false;
    }

    @Override
    public boolean delete(int id) {
        return false;
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
            while(resultSet.next()){
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
}

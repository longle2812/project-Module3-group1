package DAO.Book;

import DAO.SQLConnection;
import Model.Book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BookDAO implements iBookDAO {

    public static final String SELECT_ALL_BOOK = "select * from book";
    public static final String SELECT_ALL_CATEGORY = "select * from category;";

    @Override
    public boolean createNew(Book book) {
        return false;
    }

    @Override
    public boolean update(int id, Book book) {
        return false;
    }

    @Override
    public boolean delete(int id) {
        return false;
    }

    @Override
    public List<Book> findAll() {
        List<Book> bookList = new ArrayList<>();
        Connection connection = SQLConnection.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_BOOK);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String description = resultSet.getString("description");
                String imgURL = resultSet.getString("imgURL");
                String status = resultSet.getString("status");
                int category_id = resultSet.getInt("category_id");
                String publisher = resultSet.getString("publisher");
                bookList.add(new Book(id, name, description, imgURL, status, category_id, publisher));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return bookList;
    }

    public Map<Integer, String> getCategoryName() {
        Map<Integer, String > categoryList = new HashMap<>();
        Connection connection = SQLConnection.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CATEGORY);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name =resultSet.getString("name");
                categoryList.put(id, name);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return categoryList;
    }
}

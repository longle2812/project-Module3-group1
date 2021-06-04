package dao.book;

import dao.SQLConnection;
import model.Book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BookDAO implements IBookDAO {
    public static final String UPDATE_BOOK_BY_ID = "update book set name= ?,description=?,imgURL=?,status=?,category_id=?,publisher=? where id =?";
    public static final String SELECT_ALL_BOOK = "select * from book";
    public static final String SELECT_ALL_CATEGORY = "select * from category;";
    public static final String INSERT_NEW_BOOK = "insert into book (name, description, imgURL, status,category_id,  publisher) values(?,?,?,?,?,?)";
    public static final String SELECT_BOOK_BY_ID = "select * from book where id = ?";
    public static final String DELETE_BOOK_BY_ID = "delete from book where id =?";
    public static final String SELECT_BOOK_BY_NAME = "select * from book where name like ?";
    public static final String SELECT_BOOK_BY_USERID_SHELFID = "select * from book \n" +
            "         join changelog c on book.id = c.bookId\n" +
            "         join shelf s on c.shelfId = s.id\n" +
            "where shelfId = ? & c.userId = ?";

    @Override
    public boolean createNew(Book book) {
        Connection connection = SQLConnection.getConnection();
        PreparedStatement preparedStatement = null;
        int rowInserted = 0;
        try {
            preparedStatement = connection.prepareStatement(INSERT_NEW_BOOK);
            preparedStatement.setString(1, book.getName());
            preparedStatement.setString(2, book.getDescription());
            preparedStatement.setString(3, book.getImgURL());
            preparedStatement.setString(4, book.getStatus());
            preparedStatement.setInt(5, book.getCategory_id());
            preparedStatement.setString(6, book.getPublisher());
            rowInserted = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowInserted != 0;
    }

    @Override
    public boolean update(int id, Book book) {
        Connection connection = SQLConnection.getConnection();
        int rowUpdated = 0;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_BOOK_BY_ID);
            preparedStatement.setString(1, book.getName());
            preparedStatement.setString(2, book.getDescription());
            preparedStatement.setString(3, book.getImgURL());
            preparedStatement.setString(4, book.getStatus());
            preparedStatement.setInt(5, book.getCategory_id());
            preparedStatement.setString(6, book.getPublisher());
            preparedStatement.setInt(7, id);
            rowUpdated = preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return rowUpdated != 0;
    }

    @Override
    public boolean delete(int id) {
        Connection connection = SQLConnection.getConnection();
        int rowDeleted = 0;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_BOOK_BY_ID);
            preparedStatement.setInt(1, id);
            rowDeleted = preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return rowDeleted != 0;
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

    @Override
    public Map<Integer, String> getCategoryName() {
        Map<Integer, String> categoryList = new HashMap<>();
        Connection connection = SQLConnection.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CATEGORY);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                categoryList.put(id, name);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return categoryList;
    }

    @Override
    public Book findByID(int id) {
        Book book = null;
        Connection connection = SQLConnection.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BOOK_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                String description = resultSet.getString("description");
                String imgURL = resultSet.getString("imgURL");
                String status = resultSet.getString("status");
                int category_id = resultSet.getInt("category_id");
                String publisher = resultSet.getString("publisher");
                book = new Book(name, description, imgURL, status, category_id, publisher);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return book;
    }

    @Override
    public List<Book> searchByName(String name) {
        List<Book> bookList = new ArrayList<>();
        Connection connection = SQLConnection.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BOOK_BY_NAME);
            preparedStatement.setString(1, "%" + name + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name1 = resultSet.getString("name");
                String description = resultSet.getString("description");
                String imgURL = resultSet.getString("imgURL");
                String status = resultSet.getString("status");
                int category_id = resultSet.getInt("category_id");
                String publisher = resultSet.getString("publisher");
                bookList.add(new Book(id, name1, description, imgURL, status, category_id, publisher));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return bookList;
    }

    public List<Book> findBookByUserID(int userID, int shelfID) {
        List<Book> bookList = new ArrayList<>();
        Connection connection = SQLConnection.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BOOK_BY_USERID_SHELFID);
            preparedStatement.setInt(1, shelfID);
            preparedStatement.setInt(2, userID);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("book.id");
                String name = resultSet.getString("book.name");
                String description = resultSet.getString("book.description");
                String imgURL = resultSet.getString("imgURL");
                String status = resultSet.getString("status");
                int categoryId = resultSet.getInt("category_id");
                String publisher = resultSet.getString("publisher");
                Book book = new Book(id, name, description, imgURL, status, categoryId, publisher);
                bookList.add(book);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return bookList;
    }
}

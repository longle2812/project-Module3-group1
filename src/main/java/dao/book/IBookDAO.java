package dao.book;

import dao.IGeneralDAO;
import model.Book;

import java.util.List;
import java.util.Map;

public interface IBookDAO extends IGeneralDAO<Book> {
    Map<Integer, String> getCategoryName();
    Book findByID(int id);
    List<Book> searchByName(String name);
    List<Book> searchByCategory(int category_id);
}

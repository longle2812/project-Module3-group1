package service.book;

import model.Book;
import service.IGeneralService;

import java.util.List;
import java.util.Map;

public interface IBookService extends IGeneralService<Book> {
    Map<Integer, String> getCategoryName();
    Book findByID(int id);
    List<Book> searchByName(String name);
    List<Book> searchByCategory(int category_id);
}

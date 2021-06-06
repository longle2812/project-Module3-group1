package service.book;

import dao.book.BookDAO;
import model.Book;

import java.util.List;
import java.util.Map;

public class BookService implements IBookService {
    BookDAO bookDAO = new BookDAO();

    @Override
    public boolean createNew(Book book) {
        return bookDAO.createNew(book);
    }

    @Override
    public boolean update(int id, Book book) {
        return bookDAO.update(id,book);
    }

    @Override
    public boolean delete(int id) {
        return bookDAO.delete(id);
    }

    @Override
    public List<Book> findAll() {
        return bookDAO.findAll();
    }

    @Override
    public Map<Integer, String> getCategoryName() {
        return bookDAO.getCategoryName();
    }

    @Override
    public Book findByID(int id) {
        return bookDAO.findByID(id);
    }

    @Override
    public List<Book> searchByName(String name) {
        return bookDAO.searchByName(name);
    }

    @Override
    public List<Book> searchByCategory(int category_id) {
        return bookDAO.searchByCategory(category_id);
    }

    public List<Book> findBookById(int userID, int shelfID){
        return bookDAO.findBookByUserID(userID, shelfID);
    }
}

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
}

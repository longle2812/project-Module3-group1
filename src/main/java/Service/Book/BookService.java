package Service.Book;

import DAO.Book.BookDAO;
import Model.Book;

import java.util.List;
import java.util.Map;

public class BookService implements iBookService {
    BookDAO bookDAO = new BookDAO();

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
        return bookDAO.findAll();
    }
    public Map<Integer, String> getCategoryName() {
        return bookDAO.getCategoryName();
    }
}

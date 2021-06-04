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

    public List<Book> findBookById(int userID, int shelfID){
        return bookDAO.findBookByUserID(userID, shelfID);
    }
}

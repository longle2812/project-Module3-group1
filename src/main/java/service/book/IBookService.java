package service.book;

import model.Book;
import service.IGeneralService;

public interface IBookService extends IGeneralService<Book> {
    @Override
    default boolean createNew(Book book) {
        return false;
    }

    @Override
    default void update() {

    }

    @Override
    default void delete() {

    }

    @Override
    default void findAll() {

    }
}

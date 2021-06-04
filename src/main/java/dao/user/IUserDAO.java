package dao.user;

import dao.IGeneralDAO;
import model.User;

public interface IUserDAO extends IGeneralDAO<User> {

    @Override
    default void update() {

    }

    @Override
    default void delete() {

    }

    @Override
    default void findAll() {

    }
    @Override
    boolean createNew(User user);

    User findUserByEmail(String email);
}
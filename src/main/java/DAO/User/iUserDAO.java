package DAO;

import Model.User;

public interface iUserDAO extends iGeneralDAO<User>{

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
}

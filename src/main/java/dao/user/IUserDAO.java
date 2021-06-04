package dao.user;

import dao.IGeneralDAO;
import model.User;

public interface IUserDAO extends IGeneralDAO<User> {


    User findUserByEmail(String email);

    boolean changePassword(User user, String newPassword);
    boolean signIn(String email, String password);

    User findUserById(int id);
}
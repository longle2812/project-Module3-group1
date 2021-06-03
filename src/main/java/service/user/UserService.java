package service.user;

import dao.user.UserDAO;
import model.User;

import java.util.ArrayList;
import java.util.List;

public class UserService implements IUserService {
    List<User> users = new ArrayList<>();
    UserDAO userDAO = new UserDAO();
    @Override
    public boolean createNew(User user) {
        return userDAO.createNew(user);
    }

    @Override
    public void update() {

    }

    @Override
    public void delete() {

    }

    @Override
    public void findAll() {

    }

    @Override
    public boolean signIn(String email, String password) {
        return userDAO.signIn(email, password);
    }

    @Override
    public User findUserByEmail(String email) {
        return userDAO.findUserByEmail(email);
    }

    public boolean changePassword(User user, String newPassword) {
        return userDAO.changePassword(user, newPassword);
    }
}

package Service.User;

import DAO.User.UserDAO;
import Model.User;
import Service.User.iUserService;

import java.util.ArrayList;
import java.util.List;

public class UserService implements iUserService {
    List<User> users = new ArrayList<>();
    UserDAO userDAO = new UserDAO();
    @Override
    public boolean createNew(User user) {
        return userDAO.createNew(user);
    }

    @Override
    public boolean update(int id, User user) {
        return false;
    }

    @Override
    public boolean delete(int id) {
        return false;
    }

    @Override
    public List<User> findAll() {
        return null;
    }


    @Override
    public boolean signIn(String email, String password) {
        return userDAO.signIn(email, password);
    }


}

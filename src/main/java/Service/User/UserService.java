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


}

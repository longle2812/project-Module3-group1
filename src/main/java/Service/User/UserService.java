package Service;

import DAO.UserDAO;
import Model.User;

import java.util.ArrayList;
import java.util.List;

public class UserService implements iUserService{
    List<User> users = new ArrayList<>();
    UserDAO userDAO = new UserDAO();
    @Override
    public boolean signUp(String email, String  password, String name, String dob, String phoneNumber) {
        User user = new User(email, password, name, dob, phoneNumber);
        return userDAO.createNew(user);
    }

    @Override
    public boolean signIn(String email, String password) {
        return userDAO.signIn(email, password);
    }

    @Override
    public void signOut() {
    }

    @Override
    public void createNewBook() {

    }

    @Override
    public void createNewPosition() {

    }

    @Override
    public void changePosition() {

    }

    @Override
    public void deletePosition() {

    }

    @Override
    public void deleteBook() {

    }

    @Override
    public void showBookList() {

    }

    @Override
    public void updateBookDetail() {

    }

    @Override
    public void searchBook() {

    }

    @Override
    public void changePassword() {

    }

    @Override
    public void updateUserInfo() {

    }

    @Override
    public void showListByName() {

    }

    @Override
    public void showBookDetail() {

    }

    @Override
    public void showPositionDetail() {

    }

    @Override
    public void showListByStatus() {

    }

    @Override
    public void showListByPosition() {

    }
}

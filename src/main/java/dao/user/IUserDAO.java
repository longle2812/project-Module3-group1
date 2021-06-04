package dao.user;

import dao.IGeneralDAO;
import model.User;

public interface IUserDAO extends IGeneralDAO<User> {
    User findUserByEmail(String email);


}

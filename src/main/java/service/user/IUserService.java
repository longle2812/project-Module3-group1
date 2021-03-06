package service.user;

import model.User;
import service.IGeneralService;

public interface IUserService extends IGeneralService<User> {
    boolean createNew(User user);
    boolean signIn(String email, String password);
    User findUserById(int id);
    User findUserByEmail(String email);
}

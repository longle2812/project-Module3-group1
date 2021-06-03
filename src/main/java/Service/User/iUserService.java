package Service.User;

import Model.User;
import Service.iGeneralService;

public interface iUserService extends iGeneralService<User> {
    boolean createNew(User user);
    boolean signIn(String email, String password);
}

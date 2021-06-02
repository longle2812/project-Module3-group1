package Service;

public interface iUserService {
    void signUp(String email, String password, String name, String dob);
    boolean signIn(String email, String password);
    void signOut();
    void createNewBook();
    void createNewPosition();
    void changePosition();
    void deletePosition();
    void deleteBook();
    void showBookList();
    void updateBookDetail();
    void searchBook();
    void changePassword();
    void updateUserInfo();
    void showListByName();
    void showBookDetail();
    void showPositionDetail();
    void showListByStatus();
    void showListByPosition();

}

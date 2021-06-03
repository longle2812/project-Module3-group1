package Service;

public interface iGeneralService<T> {
    boolean createNew(T t);
    void update();
    void delete();
    void findAll();
}

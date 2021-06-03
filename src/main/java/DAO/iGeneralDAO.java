package DAO;

public interface iGeneralDAO<T> {
    boolean createNew(T t);
    void update();
    void delete();
    void findAll();
}

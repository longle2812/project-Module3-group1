package dao;

public interface IGeneralDAO<T> {
    boolean createNew(T t);
    void update();
    void delete();
    void findAll();
}

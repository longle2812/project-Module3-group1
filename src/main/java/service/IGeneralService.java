package service;

public interface IGeneralService<T> {
    boolean createNew(T t);
    void update();
    void delete();
    void findAll();
}

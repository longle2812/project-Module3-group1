package dao;

import java.util.List;

public interface IGeneralDAO<T> {
    boolean createNew(T t);
    boolean update(int id, T t);
    boolean delete(int id);
    List<T> findAll();
}

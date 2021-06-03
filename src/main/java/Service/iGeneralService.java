package Service;

import java.util.List;

public interface iGeneralService<T> {
    boolean createNew(T t);
    boolean update(int id, T t);
    boolean delete(int id);
    List<T> findAll();
}

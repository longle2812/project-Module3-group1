package dao.position;

import dao.IGeneralDAO;
import model.Position;

public interface IPositionDAO extends IGeneralDAO<Position> {
    @Override
    default boolean createNew(Position position) {
        return false;
    }

    @Override
    default void update() {

    }

    @Override
    default void delete() {

    }

    @Override
    default void findAll() {

    }
}

package service.position;

import model.Position;

import java.util.List;

public class PositionService implements IPositionService {


    @Override
    public boolean createNew(Position position) {
        return false;
    }

    @Override
    public boolean update(int id, Position position) {
        return false;
    }

    @Override
    public boolean delete(int id) {
        return false;
    }

    @Override
    public List<Position> findAll() {
        return null;
    }
}

package service.position;

import dao.position.PositionDAO;
import model.Position;

import java.util.List;

public class PositionService implements IPositionService {

    PositionDAO positionDAO = new PositionDAO();
    @Override
    public boolean createNew(Position position) {
        return positionDAO.createNew(position);
    }

    @Override
    public boolean update(int id, Position position) {
        return positionDAO.update(id, position);
    }

    @Override
    public boolean delete(int id) {
        return positionDAO.delete(id);
    }

    public List<Position> findAllByID(int userId) {
        return positionDAO.findAllByID(userId);
    }

    @Override
    public List<Position> findAll() {
        return null;
    }

    public Position findShelfByID(int shelfID) {
        return positionDAO.findShelfByID(shelfID);
    }
}

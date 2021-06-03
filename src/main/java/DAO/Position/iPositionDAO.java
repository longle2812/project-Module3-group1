package DAO.Position;

import DAO.iGeneralDAO;
import Model.Position;

import java.util.ArrayList;
import java.util.List;

public class iPositionDAO implements iGeneralDAO<Position> {
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
        List<Position> positionList = new ArrayList<>();
        return positionList;
    }
}

package DAO.Position;

import DAO.iGeneralDAO;
import Model.Position;

public class iPositionDAO implements iGeneralDAO<Position> {
    @Override
    public boolean createNew(Position position) {
        return false;
    }

    @Override
    public void update() {

    }

    @Override
    public void delete() {

    }

    @Override
    public void findAll() {

    }
}

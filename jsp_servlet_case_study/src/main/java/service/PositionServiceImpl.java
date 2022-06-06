package service;

import repository.PositionRepo;
import repository.PositionRepoImpl;
import model.Position;

import java.util.List;

public class PositionServiceImpl implements PositionService{
    PositionRepo positionRepo = new PositionRepoImpl();
    @Override
    public List<Position> selectAllPosition() {
        return positionRepo.selectAllPosition();
    }
}

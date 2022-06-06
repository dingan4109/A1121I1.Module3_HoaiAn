package repository;

import model.Position;

import java.util.List;

public interface PositionRepo {
    List<Position> selectAllPosition();
}

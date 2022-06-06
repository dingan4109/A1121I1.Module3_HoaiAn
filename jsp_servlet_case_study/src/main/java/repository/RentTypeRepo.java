package repository;

import model.RentType;

import java.util.List;

public interface RentTypeRepo {
    List<RentType> selectRentTypes();
    boolean insertRentType(RentType rentType);
}

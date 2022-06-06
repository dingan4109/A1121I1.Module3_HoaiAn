package service;

import repository.RentTypeRepo;
import repository.RentTypeRepoImpl;
import model.RentType;

import java.util.List;

public class RentTypeServiceImpl implements RentTypeService{
    RentTypeRepo rentTypeRepo = new RentTypeRepoImpl();
    @Override
    public List<RentType> selectRentTypes() {
        return rentTypeRepo.selectRentTypes();
    }

    @Override
    public boolean insertRentType(RentType rentType) {
        return rentTypeRepo.insertRentType(rentType);
    }
}

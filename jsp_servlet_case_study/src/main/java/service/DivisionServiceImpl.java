package service;

import repository.DivisionRepo;
import repository.DivisionRepoImpl;
import model.Division;

import java.util.List;

public class DivisionServiceImpl implements DivisionService{
    DivisionRepo divisionRepo = new DivisionRepoImpl();
    @Override
    public List<Division> selectAllDivision() {
        return divisionRepo.selectAllDivision();
    }
}

package service;

import repository.EducationDegreeRepo;
import repository.EducationDegreeRepoImpl;
import model.EducationDegree;

import java.util.List;

public class EducationDegreeServiceImpl implements EducationDegreeService {
    EducationDegreeRepo educationDegreeRepo = new EducationDegreeRepoImpl();
    @Override
    public List<EducationDegree> selectAllEducationDegree() {
        return educationDegreeRepo.selectAllEducationDegree();
    }
}

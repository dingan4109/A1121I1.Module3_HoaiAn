package service;

import repository.ServiceTypeRepo;
import repository.ServiceTypeRepoImpl;
import model.ServiceType;

import java.util.List;

public class ServiceTypeServiceImpl implements ServiceTypeService{
    ServiceTypeRepo serviceTypeRepo = new ServiceTypeRepoImpl();
    @Override
    public List<ServiceType> selectServiceTypes() {
        return serviceTypeRepo.selectServiceTypes();
    }

    @Override
    public boolean insertServiceType(ServiceType serviceType) {
        return serviceTypeRepo.insertServiceType(serviceType);
    }
}

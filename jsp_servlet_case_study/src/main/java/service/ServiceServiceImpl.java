package service;

import repository.ServiceRepo;
import repository.ServiceRepoImpl;
import model.Service;

import java.sql.SQLException;
import java.util.List;

public class ServiceServiceImpl implements ServiceService{
    ServiceRepo serviceRepo = new ServiceRepoImpl();
    @Override
    public List<Service> selectAllService() {
        return serviceRepo.selectAllService();
    }

    @Override
    public boolean insertService(Service service) throws SQLException {
        return serviceRepo.insertService(service);
    }
}

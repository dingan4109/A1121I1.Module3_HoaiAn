package repository;

import model.ServiceType;

import java.util.List;

public interface ServiceTypeRepo {
    List<ServiceType> selectServiceTypes();
    boolean insertServiceType(ServiceType serviceType);
}

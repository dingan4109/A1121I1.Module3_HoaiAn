package service;

import repository.CustomerTypeRepo;
import repository.CustomerTypeRepoImpl;
import model.CustomerType;

import java.util.List;

public class CustomerTypeServiceImpl implements CustomerTypeService {
    CustomerTypeRepo customerTypeRepo = new CustomerTypeRepoImpl();

    @Override
    public List<CustomerType> selectCustomerTypes() {
        return customerTypeRepo.selectCustomerTypes();
    }

    @Override
    public boolean insertCustomerType(CustomerType customerType) {
        return customerTypeRepo.insertCustomerType(customerType);
    }
}

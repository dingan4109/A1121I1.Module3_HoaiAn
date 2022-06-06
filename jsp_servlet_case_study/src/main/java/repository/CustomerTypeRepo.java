package repository;

import model.CustomerType;

import java.util.List;

public interface CustomerTypeRepo {
    List<CustomerType> selectCustomerTypes();
    boolean insertCustomerType(CustomerType customerType);
}

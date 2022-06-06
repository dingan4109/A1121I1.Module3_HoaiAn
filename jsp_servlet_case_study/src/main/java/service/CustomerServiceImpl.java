package service;

import repository.CustomerRepo;
import repository.CustomerRepoImpl;
import model.Customer;

import java.sql.SQLException;
import java.util.List;

public class CustomerServiceImpl implements CustomerService{
    CustomerRepo customerRepo = new CustomerRepoImpl();

    @Override
    public List<Customer> selectAllCustomer(int currentPage) throws SQLException {
        List<Customer> customerList = customerRepo.selectAllCustomer(currentPage);

        return customerList;
    }

    @Override
    public Customer selectCustomerById(int id) throws SQLException {
        return customerRepo.selectCustomerById(id);
    }

    @Override
    public boolean insertCustomer(Customer customer) throws SQLException {
        return customerRepo.insertCustomer(customer);
    }

    @Override
    public boolean updateCustomer(Customer customer) throws SQLException {
        return customerRepo.updateCustomer(customer);
    }

    @Override
    public boolean deleteCustomer(int id) throws SQLException {
        return customerRepo.deleteCustomer(id);
    }

    @Override
    public void insertCustomerList(List<Customer> list) {
        customerRepo.insertCustomerList(list);
    }

    @Override
    public int countCustomers() throws SQLException {
        return customerRepo.countCustomers();
    }

    @Override
    public List<Customer> searchCustomers(String name, String address, String type) throws SQLException {
        return customerRepo.searchCustomers(name,address,type);
    }


}

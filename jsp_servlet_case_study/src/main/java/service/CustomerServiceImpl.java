package service;

import dao.CustomerDAO;
import dao.CustomerDAOImpl;
import model.Customer;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerServiceImpl implements CustomerService{
    CustomerDAO customerDAO = new CustomerDAOImpl();

    @Override
    public List<Customer> selectAllCustomer() throws SQLException {
        List<Customer> customerList = new ArrayList<>();
        customerList = customerDAO.selectAllCustomer();

        return customerList;
    }

    @Override
    public Customer selectCustomerById(int id) {
        return null;
    }

    @Override
    public boolean insertCustomer(Customer customer) throws SQLException {
        return customerDAO.insertCustomer(customer);
    }

    @Override
    public boolean updateCustomer(int id) throws SQLException {
        return false;
    }

    @Override
    public boolean deleteCustomer(int id) throws SQLException {
        return false;
    }
}

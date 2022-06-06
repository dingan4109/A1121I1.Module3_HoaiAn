package repository;

import model.Customer;

import java.sql.SQLException;
import java.util.List;

public interface CustomerRepo {
    List<Customer> selectAllCustomer(int currentPage) throws SQLException;
    Customer selectCustomerById(int id) throws SQLException;
    boolean insertCustomer(Customer customer) throws SQLException;
    boolean updateCustomer(Customer customer) throws SQLException;
    boolean deleteCustomer(int id) throws SQLException;

    void insertCustomerList(List<Customer> list);
    int countCustomers() throws SQLException;
    List<Customer> searchCustomers(String name,String address,String type) throws SQLException;
}

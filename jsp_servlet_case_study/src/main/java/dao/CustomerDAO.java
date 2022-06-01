package dao;

import model.Customer;

import java.sql.SQLException;
import java.util.List;

public interface CustomerDAO {
    List<Customer> selectAllCustomer() throws SQLException;
    Customer selectCustomerById(int id);
    boolean insertCustomer(Customer customer) throws SQLException;
    boolean updateCustomer(int id) throws SQLException;
    boolean deleteCustomer(int id) throws SQLException;
}

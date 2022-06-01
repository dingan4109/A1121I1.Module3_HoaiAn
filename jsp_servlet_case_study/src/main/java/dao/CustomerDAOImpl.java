package dao;

import model.Customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class CustomerDAOImpl implements CustomerDAO{
    private final static String SELECT_ALL_CUSTOMER = "SELECT * FROM customer";
    private final static String INSERT_CUSTOMER = "INSERT INTO customer(customer_name,customer_birthday," +
            "customer_gender,customer_id_card,customer_phone,customer_email,customer_address) VALUES(?,?,?,?,?,?,?)";

    @Override
    public List<Customer> selectAllCustomer() throws SQLException {
        //connect to database
        Connection connection = ConnectionObject.getConnection();

        List<Customer> customerList = new ArrayList<>();
        PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMER);
        ResultSet rs = preparedStatement.executeQuery();

        while (rs.next()) {
            int customerId = rs.getInt("customer_id");
            String customerName = rs.getString("customer_name");
            Date customerBirthday = rs.getDate("customer_birthday");
            int customerGender = rs.getInt("customer_gender");
            String customerIdCard = rs.getString("customer_id_card");
            String customerPhone = rs.getString("customer_phone");
            String customerEmail = rs.getString("customer_email");
            String customerAddress = rs.getString("customer_address");

            Customer customer = new Customer(customerId,customerName,customerBirthday,customerGender,customerIdCard,
                    customerPhone,customerEmail,customerAddress);
            customerList.add(customer);
        }
        return customerList;
    }

    @Override
    public Customer selectCustomerById(int id) {
        return null;
    }

    @Override
    public boolean insertCustomer(Customer customer) throws SQLException {
        Connection connection = ConnectionObject.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CUSTOMER);
        java.sql.Date sqlBod = new java.sql.Date(customer.getCustomerBirthday().getTime());

        preparedStatement.setInt(1,customer.getCustomerTypeId());
        preparedStatement.setString(1,customer.getCustomerName());
        preparedStatement.setDate(2, sqlBod);
        preparedStatement.setInt(3,customer.getCustomerGender());
        preparedStatement.setString(4,customer.getCustomerIdCard());
        preparedStatement.setString(5,customer.getCustomerPhone());
        preparedStatement.setString(6,customer.getCustomerEmail());
        preparedStatement.setString(7,customer.getCustomerAddress());

        boolean check = preparedStatement.executeUpdate()>0;
        connection.close();

        return check;
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

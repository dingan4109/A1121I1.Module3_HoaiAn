package repository;

import model.Employee;

import java.sql.SQLException;
import java.util.List;

public interface EmployeeRepo {
    List<Employee> selectAllEmployee(int currentPage) throws SQLException;
    Employee selectEmployeeById(int id) throws SQLException;
    boolean insertEmployee(Employee employee) throws SQLException;
    boolean updateEmployee(Employee employee) throws SQLException;
    boolean deleteEmployee(int id) throws SQLException;

    int countEmployees() throws SQLException;
    void insertEmployeeList(List<Employee> list);
    List<Employee> searchEmployees(String name, String address, String position) throws SQLException;
}

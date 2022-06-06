package service;

import dao.EmployeeDAO;
import dao.EmployeeDAOImpl;
import model.Employee;

import java.sql.SQLException;
import java.util.List;

public class EmployeeServiceImpl implements EmployeeService{
    EmployeeDAO employeeDAO = new EmployeeDAOImpl();
    @Override
    public List<Employee> selectAllEmployee(int currentPage) throws SQLException {
        return employeeDAO.selectAllEmployee(currentPage);
    }

    @Override
    public Employee selectEmployeeById(int id) throws SQLException {
        return employeeDAO.selectEmployeeById(id);
    }

    @Override
    public boolean insertEmployee(Employee employee) throws SQLException {
        return employeeDAO.insertEmployee(employee);
    }

    @Override
    public boolean updateEmployee(Employee employee) throws SQLException {
        return employeeDAO.updateEmployee(employee);
    }

    @Override
    public boolean deleteEmployee(int id) throws SQLException {
        return employeeDAO.deleteEmployee(id);
    }

    @Override
    public int countEmployees() throws SQLException {
        return employeeDAO.countEmployees();
    }

    @Override
    public void insertEmployeeList(List<Employee> list) {
        employeeDAO.insertEmployeeList(list);
    }
}

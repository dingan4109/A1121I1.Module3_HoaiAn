package service;

import repository.EmployeeRepo;
import repository.EmployeeRepoImpl;
import model.Employee;

import java.sql.SQLException;
import java.util.List;

public class EmployeeServiceImpl implements EmployeeService{
    EmployeeRepo employeeRepo = new EmployeeRepoImpl();
    @Override
    public List<Employee> selectAllEmployee(int currentPage) throws SQLException {
        return employeeRepo.selectAllEmployee(currentPage);
    }

    @Override
    public Employee selectEmployeeById(int id) throws SQLException {
        return employeeRepo.selectEmployeeById(id);
    }

    @Override
    public boolean insertEmployee(Employee employee) throws SQLException {
        return employeeRepo.insertEmployee(employee);
    }

    @Override
    public boolean updateEmployee(Employee employee) throws SQLException {
        return employeeRepo.updateEmployee(employee);
    }

    @Override
    public boolean deleteEmployee(int id) throws SQLException {
        return employeeRepo.deleteEmployee(id);
    }

    @Override
    public int countEmployees() throws SQLException {
        return employeeRepo.countEmployees();
    }

    @Override
    public void insertEmployeeList(List<Employee> list) {
        employeeRepo.insertEmployeeList(list);
    }
}

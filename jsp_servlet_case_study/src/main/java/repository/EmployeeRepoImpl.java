package repository;

import model.Employee;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class EmployeeRepoImpl implements EmployeeRepo {
    private final static String SELECT_ALL_EMPLOYEE = "SELECT * FROM employee LIMIT ?,?";
    private final static String SELECT_ALL_EMPLOYEE_UNLIMIT = "SELECT * FROM employee ";
    private final static String SELECT_EMPLOYEE_BY_ID = "SELECT * FROM employee WHERE employee_id =?";
    private final static String COUNT_EMPLOYEE = "SELECT COUNT(employee_id) FROM employee";
    private final static String INSERT_EMPLOYEE = "INSERT INTO employee(employee_name,employee_birthday," +
            "employee_id_card,employee_salary,employee_phone,employee_email,employee_address,position_id," +
            "education_degree_id,division_id,username) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
    private final static String DELETE_EMPLOYEE = "DELETE FROM employee WHERE employee_id =?";
    private final static String UPDATE_EMPLOYEE = "UPDATE employee SET employee_name =?,employee_birthday =?," +
            "employee_id_card =?,employee_salary =?,employee_phone =?,employee_email =?,employee_address =?,position_id =?," +
            "education_degree_id =?,division_id =?,username =? WHERE employee_id=?";
    private final static String SEARCH_EMPLOYEE = "SELECT * FROM employee WHERE employee_name LIKE ? AND " +
            "employee_address LIKE ? AND position_id LIKE ? ";
    @Override
    public List<Employee> selectAllEmployee(int currentPage) throws SQLException {
        //connect to database
        Connection connection = ConnectionObject.getConnection();
        int recordsPerPage = 5;
        int startIndex = currentPage * recordsPerPage - recordsPerPage;

        List<Employee> employeeList = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        if(currentPage==-1) {
            preparedStatement = connection.prepareStatement(SELECT_ALL_EMPLOYEE_UNLIMIT);
        }else {
            preparedStatement = connection.prepareStatement(SELECT_ALL_EMPLOYEE);
            preparedStatement.setInt(1,startIndex);
            preparedStatement.setInt(2,recordsPerPage);
        }

        ResultSet rs = preparedStatement.executeQuery();

        while(rs.next()) {
            Employee employee = getEmployee(rs);
            employeeList.add(employee);
        }
        connection.close();

        return employeeList;
    }

    private Employee getEmployee(ResultSet rs) throws SQLException {
        int employeeId = rs.getInt(1);
        String employeeName = rs.getString(2);
        Date employeeBirthday = rs.getDate(3);
        String employeeIdCard = rs.getString(4);
        double employeeSalary = rs.getDouble(5);
        String employeePhone = rs.getString(6);
        String employeeEmail = rs.getString(7);
        String employeeAddress = rs.getString(8);
        int positionId = Integer.parseInt(rs.getString(9));
        int educationDegreeId = Integer.parseInt(rs.getString(10));
        int divisionId = Integer.parseInt(rs.getString(11));
        String username = rs.getString(12);

        return new Employee(employeeId,employeeName,employeeBirthday,employeeIdCard,employeeSalary,
                employeePhone,employeeEmail,employeeAddress,positionId,educationDegreeId,divisionId,username);
    }

    @Override
    public Employee selectEmployeeById(int id) throws SQLException {
        Connection connection = ConnectionObject.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EMPLOYEE_BY_ID);
        preparedStatement.setInt(1,id);

        ResultSet rs = preparedStatement.executeQuery();
        Employee employee = null;
        if(rs.next()){
            employee = getEmployee(rs);
        }
        connection.close();

        return employee;
    }

    @Override
    public boolean insertEmployee(Employee employee) throws SQLException {
        Connection connection = ConnectionObject.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(INSERT_EMPLOYEE);
        java.sql.Date sqlBod = new java.sql.Date(employee.getEmployeeBirthday().getTime());

        preparedStatement.setString(1,employee.getEmployeeName());
        preparedStatement.setDate(2, sqlBod);
        preparedStatement.setString(3,employee.getEmployeeIdCard());
        preparedStatement.setDouble(4,employee.getEmployeeSalary());
        preparedStatement.setString(5,employee.getEmployeePhone());
        preparedStatement.setString(6,employee.getEmployeeEmail());
        preparedStatement.setString(7,employee.getEmployeeAddress());
        preparedStatement.setInt(8,employee.getPositionId());
        preparedStatement.setInt(9,employee.getEducationDegreeId());
        preparedStatement.setInt(10,employee.getDivisionId());
        preparedStatement.setString(11,employee.getUsername());


        boolean check = preparedStatement.executeUpdate()>0;
        connection.close();

        return check;
    }

    @Override
    public boolean updateEmployee(Employee employee) throws SQLException {
        Connection connection = ConnectionObject.getConnection();

        PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_EMPLOYEE);
        java.sql.Date sqlBod = new java.sql.Date(employee.getEmployeeBirthday().getTime());

        preparedStatement.setString(1,employee.getEmployeeName());
        preparedStatement.setDate(2, sqlBod);
        preparedStatement.setString(3,employee.getEmployeeIdCard());
        preparedStatement.setDouble(4,employee.getEmployeeSalary());
        preparedStatement.setString(5,employee.getEmployeePhone());
        preparedStatement.setString(6,employee.getEmployeeEmail());
        preparedStatement.setString(7,employee.getEmployeeAddress());
        preparedStatement.setInt(8,employee.getPositionId());
        preparedStatement.setInt(9,employee.getEducationDegreeId());
        preparedStatement.setInt(10,employee.getDivisionId());
        preparedStatement.setString(11,employee.getUsername());
        preparedStatement.setInt(12,employee.getEmployeeId());


        boolean check = preparedStatement.executeUpdate()>0;
        connection.close();

        return check;
    }

    @Override
    public boolean deleteEmployee(int id) throws SQLException {
        Connection connection = ConnectionObject.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(DELETE_EMPLOYEE);
        preparedStatement.setInt(1,id);

        boolean check = preparedStatement.executeUpdate() > 0;
        connection.close();

        return check;
    }

    @Override
    public int countEmployees() throws SQLException {
        Connection connection = ConnectionObject.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(COUNT_EMPLOYEE);

        ResultSet rs = preparedStatement.executeQuery();
        int noOfEmployees = 0;
        if(rs.next())
            noOfEmployees = rs.getInt(1);

        connection.close();
        return noOfEmployees;
    }

    @Override
    public void insertEmployeeList(List<Employee> list) {
        for(int i = 0;i<list.size();i++) {
            try {
                boolean check = insertEmployee(list.get(i));
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public List<Employee> searchEmployees(String name, String address, String position) throws SQLException {
        Connection connection = ConnectionObject.getConnection();
        List<Employee> employeeList = new ArrayList<>();
        PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_EMPLOYEE);

        preparedStatement.setString(1,"%"+name+"%");
        preparedStatement.setString(2,"%"+address+"%");
        preparedStatement.setString(3,"%"+position+"%");

        ResultSet rs = preparedStatement.executeQuery();
        while(rs.next()) {
            Employee employee = getEmployee(rs);
            employeeList.add(employee);
        }
        connection.close();

        return employeeList;
    }
}

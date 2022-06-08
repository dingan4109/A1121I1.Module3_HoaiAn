package repository;

import model.Contract;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ContractRepoImpl implements ContractRepo{
    private static final String INSERT_CONTRACT = "INSERT INTO contract(contract_start_date," +
            "contract_end_date,contract_deposit,contract_total_money,employee_id,customer_id,service_id) VALUES (?,?," +
            "?,?,?,?,?) ";
    private final static String COUNT_CONTRACT = "SELECT COUNT(contract_id) FROM contract ";
    private final static String SELECT_ALL_CONTRACT = "SELECT * FROM contract LIMIT ?,?";
    @Override
    public List<Contract> selectAllContract(int currentPage) throws SQLException {
        Connection connection = ConnectionObject.getConnection();
        int recordsPerPage = 5;
        int startIndex = currentPage * recordsPerPage - recordsPerPage;

        List<Contract> contractList = new ArrayList<>();
        PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CONTRACT);
        preparedStatement.setInt(1,startIndex);
        preparedStatement.setInt(2,recordsPerPage);
        ResultSet rs = preparedStatement.executeQuery();

        while(rs.next()) {
            int contractId = rs.getInt(1);
            Date contractStartDate = rs.getDate(2);
            Date contractEndDate = rs.getDate(3);
            double contractDeposit = rs.getDouble(4);
            double contractTotalMoney = rs.getDouble(5);
            int employeeId = rs.getInt(6);
            int customerId = rs.getInt(7);
            int serviceId = rs.getInt(8);
            Contract contract = new Contract(contractId,contractStartDate,contractEndDate,contractDeposit,
                    contractTotalMoney,employeeId,customerId,serviceId);
            contractList.add(contract);
        }
        connection.close();

        return contractList;
    }

    @Override
    public Contract selectContractById(int id) throws SQLException {
        return null;
    }

    @Override
    public boolean insertContract(Contract contract) throws SQLException {
        Connection connection = ConnectionObject.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CONTRACT);
        Date sqlStartDate = new Date(contract.getContractStartDate().getTime());
        Date sqlEndDate = new Date(contract.getContractEndDate().getTime());

        preparedStatement.setDate(1,sqlStartDate);
        preparedStatement.setDate(2,sqlEndDate);
        preparedStatement.setDouble(3,contract.getContractDeposit());
        preparedStatement.setDouble(4,contract.getContractTotalMoney());
        preparedStatement.setInt(5,contract.getEmployeeId());
        preparedStatement.setInt(6,contract.getCustomerId());
        preparedStatement.setInt(7,contract.getServiceId());

        boolean check = preparedStatement.executeUpdate() >0;
        connection.close();

        return check;
    }

    @Override
    public boolean updateContract(Contract contract) throws SQLException {
        return false;
    }

    @Override
    public boolean deleteContract(int id) throws SQLException {
        return false;
    }

    @Override
    public void insertContractList(List<Contract> list) {

    }

    @Override
    public int countContract() throws SQLException {
        Connection connection = ConnectionObject.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(COUNT_CONTRACT);

        ResultSet rs = preparedStatement.executeQuery();
        int noOfContracts = 0;
        if(rs.next())
            noOfContracts = rs.getInt(1);

        connection.close();
        return noOfContracts;
    }
}

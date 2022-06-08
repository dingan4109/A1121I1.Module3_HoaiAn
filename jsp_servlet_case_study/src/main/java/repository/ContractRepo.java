package repository;


import model.Contract;

import java.sql.SQLException;
import java.util.List;

public interface ContractRepo {
    List<Contract> selectAllContract(int currentPage) throws SQLException;
    Contract selectContractById(int id) throws SQLException;
    boolean insertContract(Contract contract) throws SQLException;
    boolean updateContract(Contract contract) throws SQLException;
    boolean deleteContract(int id) throws SQLException;

    void insertContractList(List<Contract> list);
    int countContract() throws SQLException;
}

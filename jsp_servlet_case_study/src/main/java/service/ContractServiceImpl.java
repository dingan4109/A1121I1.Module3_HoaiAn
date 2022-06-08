package service;

import model.Contract;
import repository.ContractRepo;
import repository.ContractRepoImpl;

import java.sql.SQLException;
import java.util.List;

public class ContractServiceImpl implements ContractService {
    ContractRepo contractRepo = new ContractRepoImpl();
    @Override
    public List<Contract> selectAllContract(int currentPage) throws SQLException {
        return contractRepo.selectAllContract(currentPage);
    }

    @Override
    public Contract selectContractById(int id) throws SQLException {
        return null;
    }

    @Override
    public boolean insertContract(Contract contract) throws SQLException {
        return contractRepo.insertContract(contract);
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
        return contractRepo.countContract();
    }
}

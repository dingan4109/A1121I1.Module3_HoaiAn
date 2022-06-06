package repository;

import model.Division;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DivisionRepoImpl implements DivisionRepo {
    private static final String SELECT_ALL_DIVISION = "SELECT * FROM division";
    @Override
    public List<Division> selectAllDivision() {
        Connection connection = ConnectionObject.getConnection();
        List<Division> divisionList = new ArrayList<>();
        try{
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_DIVISION);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int divisionId = rs.getInt(1);
                String divisionName = rs.getString(2);

                Division division = new Division(divisionId,divisionName);
                divisionList.add(division);
            }
            connection.close();
        }catch (SQLException e) {
            e.getStackTrace();
        }
        return divisionList;
    }
}

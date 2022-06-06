package repository;

import model.EducationDegree;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EducationDegreeRepoImpl implements EducationDegreeRepo {
    private static final String SELECT_ALL_EDUCATION_DEGREE = "SELECT * FROM education_degree";
    @Override
    public List<EducationDegree> selectAllEducationDegree() {
        Connection connection = ConnectionObject.getConnection();
        List<EducationDegree> educationDegreeList = new ArrayList<>();
        try{
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_EDUCATION_DEGREE);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int educationDegreeId = rs.getInt(1);
                String educationDegreeName = rs.getString(2);

                EducationDegree educationDegree = new EducationDegree(educationDegreeId,educationDegreeName);
                educationDegreeList.add(educationDegree);
            }
            connection.close();
        }catch (SQLException e) {
            e.getStackTrace();
        }
        return educationDegreeList;
    }
}

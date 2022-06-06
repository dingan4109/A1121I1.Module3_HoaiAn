package repository;


import model.Service;

import java.sql.SQLException;
import java.util.List;

public interface ServiceRepo {
    List<Service> selectAllService();
    boolean insertService(Service service) throws SQLException;
}

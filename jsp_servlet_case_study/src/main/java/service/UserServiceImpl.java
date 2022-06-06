package service;

import repository.UserRepo;
import repository.UserRepoImpl;
import model.User;

public class UserServiceImpl implements UserService{
    UserRepo userRepo = new UserRepoImpl();
    @Override
    public boolean insertUser(User user) {
        return userRepo.insertUser(user);
    }
}

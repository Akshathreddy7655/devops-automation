package com.project.grocery.service;

import com.project.grocery.models.User;
import com.project.grocery.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    UserRepository userRepository;
    public User saveUser(User user) {

        User save = userRepository.save(user);
        return save;
    }

    public String Login(String email,String password){
        User customer=userRepository.findFirstByEmailAndPassword(email,password);
        if(customer!=null){
            return "Success";
        }
        return "Fail";
    }
}

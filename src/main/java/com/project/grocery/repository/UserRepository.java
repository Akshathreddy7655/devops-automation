package com.project.grocery.repository;

import com.project.grocery.models.User;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends MongoRepository<User, String>{
    User findFirstByEmailAndPassword(String email, String password);

}

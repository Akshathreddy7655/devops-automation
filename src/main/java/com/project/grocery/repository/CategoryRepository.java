package com.project.grocery.repository;

import com.project.grocery.models.Category;
import com.project.grocery.models.User;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoryRepository extends MongoRepository<Category, String> {
    Category findTopByName(String name);

}

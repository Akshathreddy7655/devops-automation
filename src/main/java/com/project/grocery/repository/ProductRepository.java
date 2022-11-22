package com.project.grocery.repository;

import com.project.grocery.dao.ProductDao;
import com.project.grocery.models.Category;
import com.project.grocery.models.Product;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends MongoRepository<Product, String>, ProductDao {

    List<Product> findAllByCategory(String category);
}

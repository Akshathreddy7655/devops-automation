package com.project.grocery.dao;

import com.project.grocery.models.Product;

public interface ProductDao {
    public Product update(String id, Product product);
}

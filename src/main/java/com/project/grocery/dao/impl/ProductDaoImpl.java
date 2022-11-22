package com.project.grocery.dao.impl;

import com.project.grocery.dao.ProductDao;
import com.project.grocery.models.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;

public class ProductDaoImpl implements ProductDao {
    @Autowired
    MongoTemplate mongoTemplate;

    @Override
    public Product update(String id, Product product) {
        Query query = new Query();
        query.addCriteria(Criteria.where("id").is(id));
        Update update = new Update();
        update.set("description", product.getDescription());
        update.set("name", product.getName());
        update.set("price", product.getPrice());
        update.set("category", product.getCategory());
        update.set("imgUrl", product.getImgUrl());
        return mongoTemplate.findAndModify(query,update,Product.class);
    }
}

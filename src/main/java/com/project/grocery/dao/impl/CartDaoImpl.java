package com.project.grocery.dao.impl;

import com.project.grocery.dao.CartDao;
import com.project.grocery.models.Cart;
import org.bson.Document;
import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.aggregation.Aggregation;
import org.springframework.data.mongodb.core.aggregation.AggregationOperation;
import org.springframework.data.mongodb.core.query.Criteria;

import java.util.ArrayList;
import java.util.List;

public class CartDaoImpl implements CartDao {

    @Autowired
    MongoTemplate mongoTemplate;

    public List<Cart> findByCartId(String id){

        List<AggregationOperation> operations = new ArrayList<>();
        operations.add(Aggregation.match(Criteria.where("_id").is(id)));
        Aggregation aggregation = Aggregation.newAggregation(operations.toArray(new AggregationOperation[0]));
        List<Document> documentList = mongoTemplate
                .aggregate(aggregation, "cart", Document.class).getMappedResults();

        return new ArrayList<>();
    }
}

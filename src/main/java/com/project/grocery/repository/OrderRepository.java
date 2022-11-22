package com.project.grocery.repository;

import com.project.grocery.Dto.OrderDto;
import com.project.grocery.models.Category;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderRepository extends MongoRepository<OrderDto, String> {

    List<OrderDto> findAllByUser(String user);
}

package com.project.grocery.repository;

import com.project.grocery.Dto.OrderDto;
import com.project.grocery.Dto.PaymentDto;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PaymentRepository extends MongoRepository<PaymentDto, String> {
}
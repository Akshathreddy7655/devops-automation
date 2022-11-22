package com.project.grocery.repository;

import com.project.grocery.dao.CartDao;
import com.project.grocery.models.Cart;
import com.project.grocery.models.Category;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CartRepository extends MongoRepository<Cart, String> , CartDao {

    List<Cart> findAllByUserAndPaymentId(String user,String paymentId);

    List<Cart> findAllByUserAndPaymentIdAndProductId(String user,String paymentId,String productId);

    Cart findTopById(String id);

    List<Cart> findAllByOrderId(String orderId);


}

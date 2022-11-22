package com.project.grocery.dao;

import com.project.grocery.models.Cart;

import java.util.List;

public interface CartDao {
    public List<Cart> findByCartId(String id);
}

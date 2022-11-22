package com.project.grocery.Dto;

import com.project.grocery.models.Cart;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class OrdersResponseDto {

    String orderId;
     List<Cart> cartList;
     Long sum;
     String status;
     String returnStatus;
}

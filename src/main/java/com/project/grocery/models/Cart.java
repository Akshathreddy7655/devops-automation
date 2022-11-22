package com.project.grocery.models;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(value = "cart")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class    Cart {

    private  String productname;
    @Id
    private  String id;

    private Long quantity;

    private String productId;

    private  String user;


    private String orderId;

    private String paymentId;

    public Cart(Long quantity, String productId, String user, String orderId,String paymentId,String productname) {
        this.quantity = quantity;
        this.productId = productId;
        this.user = user;
        this.orderId = orderId;
        this.paymentId=paymentId;
        this.productname=productname;
    }
}

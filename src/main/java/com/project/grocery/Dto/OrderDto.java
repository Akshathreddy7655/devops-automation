package com.project.grocery.Dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.web.multipart.MultipartFile;

@Document("order")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class OrderDto {

    @Id
    String id;

    String cartId;
    Long quantity;

    String name;

    String productId;

    String user;

    Long cost;

    String paymentId;

    String status;

    String returnStatus;

}


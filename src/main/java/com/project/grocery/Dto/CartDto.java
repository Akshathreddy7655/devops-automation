package com.project.grocery.Dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.data.annotation.Id;
import org.springframework.web.multipart.MultipartFile;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class CartDto {

    private  String id;

    Long quantity;

    String productId;

    String user;

    String productName;

    Long cost;

    String imgUrl;
}


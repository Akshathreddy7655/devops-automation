package com.project.grocery.models;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(value = "product")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Product {

    @Id
    private  String id;


    @Indexed(unique = true)
    private String name;

    private String imgUrl;

    private String description;

    private String category;

    private Long price;

    public Product(String name, String imgUrl, String description, String category, Long price) {
        this.name = name;
        this.imgUrl = imgUrl;
        this.description = description;
        this.category = category;
        this.price = price;
    }
}

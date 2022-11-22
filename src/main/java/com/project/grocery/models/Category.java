package com.project.grocery.models;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(value = "category")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Category {

    @Id
    private  String id;


    @Indexed(unique = true)
    private String name;

    private String imgUrl;

    public Category(String name, String imgUrl) {
        this.name = name;
        this.imgUrl = imgUrl;
    }
}

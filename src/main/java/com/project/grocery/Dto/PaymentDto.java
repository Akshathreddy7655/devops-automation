package com.project.grocery.Dto;

import jdk.nashorn.internal.ir.annotations.Ignore;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.data.mongodb.core.mapping.Document;

@Document("payment")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PaymentDto {

    @Ignore
    String id;
    String orderId;
    String firstName;
    String emailId;
    String cardNo;
    Long price;
    Long cvv;
}

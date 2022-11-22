package com.project.grocery.service;

import com.project.grocery.Dto.CartDto;
import com.project.grocery.Dto.OrderDto;
import com.project.grocery.Dto.OrdersResponseDto;
import com.project.grocery.Dto.PaymentDto;
import com.project.grocery.models.Cart;
import com.project.grocery.models.Category;
import com.project.grocery.models.Product;
import com.project.grocery.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class ProductsService {

    @Autowired
    OrderRepository orderRepository;
    @Autowired
    CategoryRepository categoryRepository;

    @Autowired
    ProductRepository productRepository;

    @Autowired
    CartRepository cartRepository;

    @Autowired
    PaymentRepository paymentRepository;

    public String addCategory(Category category) {

        if (categoryRepository.findTopByName(category.getName()) == null) {
            Category save = categoryRepository.save(category);
            if (save != null) {
                return "category created";
            } else {
                return "insertion failed";
            }
        } else {
            return "Company with name already exists";
        }
    }

    public List<Category> getDistinctCategoryList() {
        List<Category> all = categoryRepository.findAll();
        return all;
    }


    public String addProduct(Product product) {


        Product save = productRepository.save(product);
        if (save != null) {
            return "Product created";
        } else {
            return "insertion failed";
        }
    }


    public List<Product> getProductsByCategory(String category) {
        List<Product> list = productRepository.findAllByCategory(category);
        return list;
    }

    public Product getProductById(String id) {
        Optional<Product> byId = productRepository.findById(id);
        Product product = byId.get();
        return product;
    }

    public String updateProduct(String id, Product product) {


        Product save = productRepository.update(id, product);
        if (save != null) {
            return "Product updated";
        } else {
            return "updation failed";
        }
    }

    public void deleteByID(String id) {
        productRepository.deleteById(id);
    }

    public String addToCart(Cart cart) {
        List<Cart> allByUserAndPaymentIdAAndAndProductId = cartRepository.findAllByUserAndPaymentIdAndProductId(cart.getUser().trim(), null, cart.getProductId());
        if(allByUserAndPaymentIdAAndAndProductId.size()>0){
            for (Cart item:
                 allByUserAndPaymentIdAAndAndProductId) {
                cartRepository.deleteById(item.getId());
            }
        }
        String user = cart.getUser();
        cart.setUser(user.trim());

        Cart save = cartRepository.save(cart);
        if (save != null) {
            return "Added to Cart ";
        } else {
            return "insertion failed";
        }

    }

    public List<CartDto> getCartItems(String name) {
        List<Cart> allByUser = cartRepository.findAllByUserAndPaymentId(name, null);
        List<CartDto> cartDtoList = new ArrayList<>();
        for (Cart cart : allByUser) {
            Optional<Product> byId = productRepository.findById(cart.getProductId());
            Product product = byId.get();

            CartDto cartDto = new CartDto(cart.getId(), cart.getQuantity(), cart.getProductId(), cart.getUser(), product.getName(), product.getPrice(), product.getImgUrl());
            cartDtoList.add(cartDto);

        }
        return cartDtoList;

    }


    public String saveOrders(List<OrderDto> orderDtoList) {
        OrderDto save = orderRepository.save(orderDtoList.get(0));

        orderDtoList.forEach(element -> {


            // Optional<Cart> byId = cartRepository.findById(new ObjectId(element.getCartId()));
            Optional<Cart> byId = cartRepository.findById(element.getCartId().trim());

            Cart cart = byId.get();
            if (cart.getOrderId() != null) {
                orderRepository.deleteById(cart.getOrderId().trim());
            }
            cart.setQuantity(element.getQuantity());
            cart.setOrderId(save.getId());
            cart.setPaymentId(null);

            cartRepository.save(cart);


        });
        System.out.println("kk");
        return save.getId();
    }

    public String savePayment(PaymentDto paymentDto) {
        PaymentDto save = paymentRepository.save(paymentDto);
        Optional<OrderDto> byId = orderRepository.findById(paymentDto.getOrderId());
        OrderDto orderDto = byId.get();
        orderDto.setPaymentId(save.getId());
        orderDto.setReturnStatus("return");
        orderDto.setStatus("Waiting for confirmation");
        orderRepository.save(orderDto);
        List<Cart> allByOrderId = cartRepository.findAllByOrderId(paymentDto.getOrderId());

        allByOrderId.forEach(element -> {
            element.setPaymentId(paymentDto.getId());
            cartRepository.save(element);
        });

        return "saved";
    }

    public List<OrdersResponseDto> getOrders(String user) {
        List<OrderDto> allByUser = orderRepository.findAllByUser(user);

        List<OrdersResponseDto> ordersResponseDtos = new ArrayList<>();
        for (OrderDto orderDto : allByUser
        ) {if(orderDto.getPaymentId()!=null){




            List<Cart> byCartId = cartRepository.findAllByOrderId(orderDto.getId());
            long sum = 0;
            for (Cart cart :
                    byCartId) {
                Product product = productRepository.findById(cart.getProductId()).get();


                sum = sum + cart.getQuantity() * product.getPrice();


            }

            ordersResponseDtos.add(new OrdersResponseDto(orderDto.getId(), byCartId, sum, orderDto.getStatus(),orderDto.getReturnStatus()));
        }
        }
        System.out.println(ordersResponseDtos);
        return ordersResponseDtos;
    }


    public long getPrice(String orderId) {


        List<Cart> byCartId = cartRepository.findAllByOrderId(orderId);
        long sum = 0;
        for (Cart cart :
                byCartId) {
            Product product = productRepository.findById(cart.getProductId()).get();


            sum = sum + cart.getQuantity() * product.getPrice();


        }

        return sum;


    }


    public List<OrdersResponseDto> getAllOrders() {
        List<OrderDto> allByUser = orderRepository.findAll();

        List<OrdersResponseDto> ordersResponseDtos = new ArrayList<>();
        for (OrderDto orderDto : allByUser
        ) {


            List<Cart> byCartId = cartRepository.findAllByOrderId(orderDto.getId());
            long sum = 0;
            for (Cart cart :
                    byCartId) {
                Product product = productRepository.findById(cart.getProductId()).get();


                sum = sum + cart.getQuantity() * product.getPrice();


            }

            ordersResponseDtos.add(new OrdersResponseDto(orderDto.getId(), byCartId, sum, orderDto.getStatus(),orderDto.getReturnStatus()));

        }
        System.out.println(ordersResponseDtos);
        return ordersResponseDtos;
    }

    public String updateStatus(String orderId, String status) {
        OrderDto orderDto = orderRepository.findById(orderId).get();
        orderDto.setStatus(status);
        orderRepository.save(orderDto);
        return "updated";
    }

    public String updateReturnStatus(String orderId) {
        OrderDto orderDto = orderRepository.findById(orderId).get();
        orderDto.setReturnStatus("Returned");
        orderDto.setStatus("Returned");
        orderRepository.save(orderDto);
        return "updated";
    }
}

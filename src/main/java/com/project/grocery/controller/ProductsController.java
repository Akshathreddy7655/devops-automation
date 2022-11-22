package com.project.grocery.controller;

import com.project.grocery.Dto.*;
import com.project.grocery.models.Cart;
import com.project.grocery.models.Category;
import com.project.grocery.models.Product;
import com.project.grocery.service.ProductsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/products")
public class ProductsController {

    @Autowired
    ProductsService productsService;
    public  static  String uploadDirectory=System.getProperty("user.dir")+"/uploads";

    @RequestMapping(value = "/addCategory", method = RequestMethod.GET)
    public String addCategory(Model model) {
        model.addAttribute("category", new CategoryDto());
        return "addCategory";
    }

    @RequestMapping(value = "saveCategory", method = RequestMethod.POST)
    public String saveCategory(@ModelAttribute("category") CategoryDto category, Model model) {
        System.out.println(category);

        String filename = category.getImgUrl().getOriginalFilename();

        System.out.println("/images" + " " + filename);
        try {
            byte barr[] = category.getImgUrl().getBytes();
            int index=filename.lastIndexOf(".");
            String extension=filename.substring(index);
            System.out.println(extension);
            String fullFileName =  System.currentTimeMillis() + extension;
            String path= Paths.get(uploadDirectory,fullFileName).toString();
            System.out.println(path);
            BufferedOutputStream bout = new BufferedOutputStream(
                    new FileOutputStream(path));
            bout.write(barr);
            bout.flush();
            bout.close();

            Category category1 = new Category(category.getName(), fullFileName);
            String s = productsService.addCategory(category1);

            model.addAttribute("error", s);
            model.addAttribute("category", new CategoryDto());
        } catch (Exception e) {
            System.out.println(e);
        }


        return "addCategory";

    }

    @ResponseBody
    @GetMapping("/getdistinct")
    public List<Category> getDistinctCategories() {
        List<Category> distinctCategoryList = productsService.getDistinctCategoryList();
        return distinctCategoryList;


    }


    @RequestMapping(value = "/addProduct", method = RequestMethod.GET)
    public String addProduct(Model model) {
        model.addAttribute("product", new Product());
        return "addProduct";
    }

    @RequestMapping(value = "saveProduct", method = RequestMethod.POST)
    public String saveProduct(@ModelAttribute("product") ProductDto productDto, Model model) {
        System.out.println(productDto);

        String filename = productDto.getImgUrl().getOriginalFilename();

        System.out.println("/resources/images" + " " + filename);
        try {
            byte barr[] = productDto.getImgUrl().getBytes();

            int index=filename.lastIndexOf(".");
            String extension=filename.substring(index);
            System.out.println(extension);
            String fullFileName =  System.currentTimeMillis() + extension;
            String path= Paths.get(uploadDirectory,fullFileName).toString();
            System.out.println(path);
            BufferedOutputStream bout = new BufferedOutputStream(
                    new FileOutputStream(path));
            bout.write(barr);
            bout.flush();
            bout.close();

            Product product = new Product(productDto.getName(), fullFileName, productDto.getDescription(), productDto.getCategory(), productDto.getPrice());
            String s = productsService.addProduct(product);

            model.addAttribute("error", s);
            model.addAttribute("product", new Product());
        } catch (Exception e) {
            System.out.println(e);
        }


        return "addProduct";

    }


    @RequestMapping(value = "/adminHome", method = RequestMethod.GET)
    public String getAdminHome(Model model) {
        List<Category> distinctCategoryList = productsService.getDistinctCategoryList();
        model.addAttribute("categoryList", distinctCategoryList);

        return "adminHome";


    }

    @GetMapping("/showList/{category}")
    public String showList(@PathVariable String category, Model model) {
        List<Product> productList = productsService.getProductsByCategory(category);
        model.addAttribute("productsList", productList);
        return "productsList";
    }

    @GetMapping("/viewProduct/{id}")
    public String viewProduct(@PathVariable String id, Model model) {
        Product productList = productsService.getProductById(id);
        model.addAttribute("error", "");
        model.addAttribute("product", productList);
        return "productItem";
    }


    @RequestMapping(value = "updateProduct", method = RequestMethod.POST)
    public String updateProduct(@ModelAttribute("product") ProductDto productDto, Model model) {
        System.out.println(productDto);

        String filename = productDto.getImgUrl().getOriginalFilename();
        String view="productItem";
        System.out.println("/images" + " " + filename);
        try {
            byte barr[] = productDto.getImgUrl().getBytes();
            int index=filename.lastIndexOf(".");
            String extension=filename.substring(index);
            System.out.println(extension);
            String fullFileName =  System.currentTimeMillis() + extension;
            String path= Paths.get(uploadDirectory,fullFileName).toString();
            System.out.println(path);
            BufferedOutputStream bout = new BufferedOutputStream(
                    new FileOutputStream(path));
            bout.write(barr);
            bout.flush();
            bout.close();

            Product product = new Product(productDto.getName(), fullFileName, productDto.getDescription(), productDto.getCategory(), productDto.getPrice());
            String s = productsService.updateProduct(productDto.getId(), product);

            model.addAttribute("error", s);
            model.addAttribute("product", new Product());


            if (s.equals("Product updated")) {
                view="redirect:/products/adminHome";
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return view;

    }

    @ResponseBody
    @GetMapping("/delete/{id}")
    public String deleteProduct( @PathVariable String id ) {
        productsService.deleteByID(id);
        return "Success";
    }


    @GetMapping("/home/{email}")
    public String getHome( @PathVariable String email,Model model) {
        List<Category> distinctCategoryList = productsService.getDistinctCategoryList();
        model.addAttribute("categoryList", distinctCategoryList);
       model.addAttribute("email",email);
        return "home";


    }

    @GetMapping("/userShowList/{email}/{category}")
    public String userShowList(@PathVariable String email,@PathVariable String category, Model model) {
        List<Product> productList = productsService.getProductsByCategory(category);
        model.addAttribute("productsList", productList);
        model.addAttribute("email", email);
        System.out.println(email);
        return "userProductList";
    }


    @GetMapping("/userViewProduct/{email}/{id}")
    public String userViewProduct(@PathVariable String email,@PathVariable String id, Model model) {
        Product productList = productsService.getProductById(id);
        model.addAttribute("product", productList);
        model.addAttribute(email);
        return "userViewProduct";
    }

    @ResponseBody
    @PostMapping("/cart")
    public ResponseEntity<?> addToCart(@RequestBody Cart cart) {

        System.out.println(cart);
        String s = productsService.addToCart(cart);
        return ResponseEntity.ok(s);
    }

    @GetMapping("/userCart/{email}")
    public String userCart(@PathVariable String email, Model model) {
        System.out.println(email);
        List<CartDto> cartItems = productsService.getCartItems(email);
        model.addAttribute("cart", cartItems);
        model.addAttribute(email);
        return "viewCart";
    }

    @ResponseBody
    @PostMapping("/order")
    public String order(@RequestBody List<OrderDto> orderList) {

        System.out.println(orderList);
        String s = productsService.saveOrders(orderList);
        return s;
    }

    @GetMapping("/payment/{email}/{orderId}")
    public String paymentPage(@PathVariable String email,@PathVariable String orderId, Model model) {

        model.addAttribute("email",email);
        model.addAttribute("orderId",orderId);
        long price = productsService.getPrice(orderId);
        model.addAttribute("price",price);
        return "paymentPage";
    }


    @ResponseBody
    @PostMapping("/orderpayment")
    public String orderPayment(@RequestBody PaymentDto paymentDto) {

        System.out.println(paymentDto);
     String s = productsService.savePayment(paymentDto);
        return s;
    }
    @GetMapping("/myorders/{email}")
    public String myOrders(@PathVariable String email, Model model) {


        model.addAttribute("email",email);


        List<OrdersResponseDto> orders = productsService.getOrders(email);
        model.addAttribute("orders",orders);
        return "myorders";
    }


    @GetMapping("/adminViewOrders")
    public String adminViewOrders(Model model) {


        HashMap<String,String> statusList=new HashMap<>();
        statusList.put("Waiting for confirmation","Waiting for confirmation");
        statusList.put("Order Accepted","Order Accepted");
        statusList.put("Available for curbside pickup","Available for curbside pickup");
        statusList.put("Available at warehouse","Available at warehouse");
        statusList.put("Order Delivered","Order Delivered");

        List<OrdersResponseDto> orders = productsService.getAllOrders();
        model.addAttribute("orders",orders);
        model.addAttribute("statusList",statusList);

        return "adminvieworders";
    }

    @ResponseBody
    @GetMapping("/updateStatus/{orderId}/{status}")
    public String adminViewOrders(@PathVariable String orderId,@PathVariable String status ) {

        String s = productsService.updateStatus(orderId, status);
        return s;
    }


    @ResponseBody
    @GetMapping("/addreturn/{orderId}")
    public String adminViewOrders(@PathVariable String orderId ) {

        String s = productsService.updateReturnStatus(orderId);
        return s;
    }
}

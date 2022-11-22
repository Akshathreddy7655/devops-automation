package com.project.grocery.controller;

import com.project.grocery.models.User;
import com.project.grocery.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserService userService;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginPage() {

        return "login";
    }


    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(ModelMap map, @RequestParam String email, @RequestParam String password) {

        if(email.equals("admin") && password.equals("admin")){
            return "redirect:/products/adminHome";
        }
        else if (userService.Login(email, password).equals("Success")) {
            return "redirect:/products/home/"+email;

        } else {
            map.put("errorMsg", "failed to login");
            return "login";
        }

    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    @PostMapping("/addUser")
    public String addUser(@ModelAttribute("user") User user) {
        System.out.println(
                user
        );
        userService.saveUser(user);
        return "redirect:/user/login";
    }





}

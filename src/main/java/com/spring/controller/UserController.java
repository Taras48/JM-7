package com.spring.controller;

import com.spring.model.User;
import com.spring.service.RoleService;
import com.spring.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;

@Controller
@ComponentScan(basePackages = "com.spring.service")
public class UserController {

    private UserService userService;
    private RoleService roleService;

    @Autowired
    public UserController(UserService userService, RoleService roleService) {
        this.userService = userService;
        this.roleService = roleService;
    }

    @GetMapping(value = "/login")
    public String getIndexGet() {
        return "login";
    }


    @GetMapping(value = "/helloUser")
    public String getUserGet() {
        return "helloUser";
    }


    @PostMapping(value = "/admin/add")
    public ModelAndView addUserPost(User messageUser, String role) {
        ModelAndView modelAndView = new ModelAndView();
        messageUser.setRoles(roleService.getRoleByString(role));
        userService.addUser(messageUser);
        modelAndView.setViewName("redirect:/admin");
        return modelAndView;
    }

    @PostMapping(value = "/admin/delete")
    public ModelAndView deleteUsersPost(Long id) {
        ModelAndView modelAndView = new ModelAndView();
        userService.deleteUser(id);
        modelAndView.setViewName("redirect:/admin");
        return modelAndView;
    }

    @PostMapping(value = "/admin/update")
    public ModelAndView updateUsersPost(User messageUser, String role) {
        ModelAndView modelAndView = new ModelAndView();
        User user = userService.getUserById(messageUser.getId());
        user.setRoles(roleService.getRoleByString(role));
        user.setMessage(messageUser.getMessage());
        user.setName(messageUser.getName());
        userService.updateUser(user);
        modelAndView.setViewName("redirect:/admin");
        return modelAndView;
    }

    @GetMapping(value = "/admin")
    public ModelAndView allUsers(ModelAndView modelAndView) {
        modelAndView.addObject("list", userService.getAllUsers());
        modelAndView.setViewName("admin/allUsers");
        return modelAndView;
    }

    @GetMapping(value = "/admin/add")
    public ModelAndView addUser() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("admin/addUser");
        return modelAndView;
    }

    @GetMapping(value = "/admin/delete")
    public ModelAndView deleteUsers() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("admin/deleteUser");
        return modelAndView;
    }

    @GetMapping(value = "/admin/update")
    public ModelAndView updateUsers() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("admin/updateUser");
        return modelAndView;
    }

}

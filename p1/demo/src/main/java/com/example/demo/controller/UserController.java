package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.model.User;
import com.example.demo.service.UserService;

@RestController
@RequestMapping("/api")
public class UserController {

    @Autowired
    private UserService userService;

    
    public List <User> getAllUsers () {
        return userService.getAllUsers();
    }
    
    
    public ResponseEntity <User> getUserById(@PathVariable Long id) {
        return userService.getUserById(id).map(
            ResponseEntity::ok
        ).orElse(ResponseEntity.notFound().build());
    }

    public User createUser (@RequestBody User user) {
        return userService.createUser(user);
    }

    public ResponseEntity <User> updateUser (@PathVariable Long id, @RequestBody User user) {
        return userService.updateUser(id, user).map(
            ResponseEntity::ok
        ).orElse(ResponseEntity.notFound().build());
    }

    public void deleteUser (@PathVariable Long id) {
        userService.deleteUser(id);
    }



}

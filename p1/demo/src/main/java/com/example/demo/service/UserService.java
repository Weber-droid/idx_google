package com.example.demo.service;

import java.util.List;
import java.util.Optional;

import com.example.demo.model.User;

public interface UserService {

    List <User> getAllUsers() ;

    Optional <User> getUserById(Long id);

    User createUser (User user);

    Optional <User> updateUser (Long id, User userDetails);

    void deleteUser (Long id) ;

}

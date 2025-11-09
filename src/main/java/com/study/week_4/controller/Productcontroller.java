package com.study.week_4.controller;

import com.study.week_4.model.Products;
import com.study.week_4.repositories.Productrepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/products")
public class Productcontroller {

    @Autowired
    private Productrepo productrepo;

    @GetMapping
    public List<Products> get(){
        return productrepo.findAll();
    }

    @PostMapping
    public Products post(@RequestBody Products product){
        return productrepo.save(product);
    }
    @DeleteMapping("/{id}")
    public String delete(@PathVariable Long id ){
         productrepo.deleteById(id);
        return "product with id : "+id+" deleted succewsfully";
    }
}

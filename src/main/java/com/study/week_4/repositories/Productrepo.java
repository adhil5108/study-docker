package com.study.week_4.repositories;

import com.study.week_4.model.Products;
import org.springframework.data.jpa.repository.JpaRepository;

public interface Productrepo extends JpaRepository<Products,Long> {
}

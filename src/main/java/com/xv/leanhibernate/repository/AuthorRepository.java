package com.xv.leanhibernate.repository;


import com.xv.leanhibernate.entity.Author;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AuthorRepository extends JpaRepository<Author,Integer> {
}

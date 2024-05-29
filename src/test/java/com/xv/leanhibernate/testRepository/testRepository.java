package com.xv.leanhibernate.testRepository;

import com.xv.leanhibernate.repository.AuthorRepository;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;

@SpringBootTest
public class testRepository {


    @Resource
    private AuthorRepository authorRepository;
    @Test
    public void testSql1(){
        System.out.println(authorRepository.findById(1));
    }
}

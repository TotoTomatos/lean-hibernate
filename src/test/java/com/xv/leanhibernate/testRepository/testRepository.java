package com.xv.leanhibernate.testRepository;

import com.xv.leanhibernate.entity.Article;
import com.xv.leanhibernate.entity.Author;
import com.xv.leanhibernate.repository.ArticleRepository;
import com.xv.leanhibernate.repository.AuthorRepository;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@SpringBootTest
public class testRepository {


    @Resource
    private AuthorRepository authorRepository;

    @Resource
    private ArticleRepository articleRepository;

    @Test
    public void testSql1() {
        System.out.println(authorRepository.findById(1));
    }

    /**
     * 测试一对多保存的方式
     * 新增作者1 -- one
     * 作者1下新增文章1 -- many
     * 作者1下新增文章2 -- many
     */
    @Test
//    @Transactional(rollbackFor = Exception.class)
    public void testSql2() {
        Author author = new Author();
        author.setPassword(String.valueOf(123));
        author.setUsername("admin111");
        Author save = authorRepository.save(author);

        Article article1 = new Article();
        article1.setAuthor(save);
        article1.setContent("活着");
        articleRepository.save(article1);

        Article article2 = new Article();
        article2.setAuthor(save);
        article2.setContent("皮囊");
        articleRepository.save(article2);

    }

    @Test
    public void testSql3() {
        Article article = new Article();
        article.setContent("三体");
        Author author = new Author();
        author.setId(1);
        article.setAuthor(author);
        articleRepository.save(article);
    }


}

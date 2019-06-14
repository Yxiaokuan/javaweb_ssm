package com.xiaokuan.ssm.test;

import com.xiaokuan.ssm.mapper.ItemsMapper;
import com.xiaokuan.ssm.pojo.Items;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class UserMapperTest {
    private ApplicationContext ac ;

    @Before
    public void setUp() throws Exception {
         ac = new ClassPathXmlApplicationContext("Bean.xml");
    }
    @Test
    public void findUserById() {
        ItemsMapper mapper = (ItemsMapper) ac.getBean("itemsMapper");
        List<Items> list = mapper.findAll();
        System.out.println(list.toString());
    }



}

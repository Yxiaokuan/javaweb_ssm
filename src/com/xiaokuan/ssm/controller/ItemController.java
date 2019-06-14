package com.xiaokuan.ssm.controller;

import com.xiaokuan.ssm.mapper.ItemsMapper;
import com.xiaokuan.ssm.pojo.Items;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/items")
public class ItemController {
    private static ApplicationContext ac ;
    private static ItemsMapper mapper;
    static {
        ac= new ClassPathXmlApplicationContext("Bean.xml");
       mapper = (ItemsMapper) ac.getBean("itemsMapper");
    }
    @RequestMapping("findAll")
    public String find(Model model){

    /*    ItemsExample itemsExample = new ItemsExample();
        ItemsExample.Criteria criteria = itemsExample.createCriteria();
        criteria.andIdIsNotNull();
        List<Items> itemsList = mapper.selectByExample(itemsExample);
        System.out.println(itemsList.toString());*/
        List<Items> itemsList = mapper.findAll();
        model.addAttribute("itemsList",itemsList);
        return "itemsList";
    }

    @RequestMapping("edit")
    public String edit(Integer id,Model model){
        Items items = mapper.selectByPrimaryKey(id);
        model.addAttribute("item",items);
        return "editItem";
    }
    @RequestMapping("updateItem")
    public String updateItem(Items items){
        mapper.updateByPrimaryKey(items);
        return  "redirect:/items/findAll.do";
    }
    @RequestMapping("delete")
    public String delete(Integer id){
        mapper.deleteByPrimaryKey(id);
        return "redirect:/items/findAll.do";
    }
    //跳转到添加页面
    @RequestMapping("add")
    public String add(){
        return "add";
    }
    @RequestMapping("addItem")
    public String addItem(Items items){
        mapper.insert(items);
        return  "redirect:/items/findAll.do";
    }

    @RequestMapping("deletePart")
    public  String deletePart( @RequestBody Integer[] ids){
        for (int i = 0; i <ids.length ; i++) {
         mapper.deleteByPrimaryKey(ids[i]);
        }
        return "redirect:/items/findAll.do";
    }

}

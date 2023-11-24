package com.chunjae.privatepro05.per;

import com.chunjae.privatepro05.entity.Item;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ItemMapper {
    List<Item> itemList();
    List<Item> itemList2(String cate);
    List<Item> searchItemList(String sq);
    Item getItem(int ino);
    int itemInsert(Item item);
    int itemUpdate(Item item);
    int itemDelete(int ino);
}

package com.chunjae.privatepro05.biz;

import com.chunjae.privatepro05.entity.Item;

import java.util.List;

public interface ItemService {
    public List<Item> itemList();
    public List<Item> itemList2(String cate);
    public List<Item> searchItemList(String sq);
    public Item getItem(int ino);
    public int itemInsert(Item item);
    public int itemUpdate(Item item);
    public int itemDelete(int ino);
}

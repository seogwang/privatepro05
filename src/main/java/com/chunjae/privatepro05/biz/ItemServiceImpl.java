package com.chunjae.privatepro05.biz;

import com.chunjae.privatepro05.entity.Item;
import com.chunjae.privatepro05.per.ItemMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ItemServiceImpl implements ItemService{

    @Autowired
    private ItemMapper itemMapper;

    @Override
    public List<Item> itemList() {
        return itemMapper.itemList();
    }
    @Override
    public List<Item> itemList2(String cate) {
        return itemMapper.itemList2(cate);
    }

    @Override
    public List<Item> searchItemList(String sq) {
        return itemMapper.searchItemList(sq);
    }

    @Override
    public Item getItem(int ino) {
        return itemMapper.getItem(ino);
    }

    @Override
    public int itemInsert(Item item) {
        return itemMapper.itemInsert(item);
    }

    @Override
    public int itemUpdate(Item item) {
        return itemMapper.itemUpdate(item);
    }

    @Override
    public int itemDelete(int ino) {
        return itemMapper.itemDelete(ino);
    }
}

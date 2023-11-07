package com.chunjae.privatepro05.biz;

import com.chunjae.privatepro05.entity.Free;

import java.util.List;

public interface FreeService {
    public List<Free> freeList();
    public Free freeDetail(int no);
    public int freeInsert(Free free);
    public int freeUpdate(Free free);
    public int freeDelete(int no);
}

package com.chunjae.privatepro05.per;

import org.apache.ibatis.annotations.Mapper;
import com.chunjae.privatepro05.entity.Free;

import java.util.List;

@Mapper
public interface FreeMapper {
    List<Free> freeList();
    Free freeDetail(int no);
    int freeInsert(Free free);
    int freeUpdate(Free free);
    int freeDelete(int no);
    int visitCount(int no);
}

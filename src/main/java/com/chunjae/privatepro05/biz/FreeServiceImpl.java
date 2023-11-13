package com.chunjae.privatepro05.biz;

import com.chunjae.privatepro05.entity.Free;
import com.chunjae.privatepro05.per.FreeMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class FreeServiceImpl implements FreeService {
    @Autowired
    private FreeMapper freeMapper;

    @Override
    public List<Free> freeList() {
        return freeMapper.freeList();
    }

    @Override
    public Free freeDetail(int no) {
        freeMapper.visitCount(no);
        return freeMapper.freeDetail(no);
    }

    @Override
    public int freeInsert(Free free) {
        log.info("service free : "+free);
        return freeMapper.freeInsert(free);
    }

    @Override
    public int freeUpdate(Free free) {
        return freeMapper.freeUpdate(free);
    }

    @Override
    public int freeDelete(int no) {
        return freeMapper.freeDelete(no);
    }
}

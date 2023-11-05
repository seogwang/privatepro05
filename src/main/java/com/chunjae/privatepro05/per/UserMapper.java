package com.chunjae.privatepro05.per;

import com.chunjae.privatepro05.entity.Kuser;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserMapper {
    List<Kuser> userList();
    Kuser userDetail(String name);
    int userInsert(Kuser kuser);
    int userUpdate(Kuser kuser);
    int userDelete(String name);
    Kuser emailLogin(Kuser kuser);
    Kuser idLogin(String name);
    Kuser pkLogin(Kuser kuser);
    Kuser findId(Kuser kuser);
    Kuser findPw(Kuser kuser);
    Kuser setWithdraw(String id);
    Kuser setActivate(String name);
    Kuser setDormant(String name);
    int udLev(Kuser kuser);
}

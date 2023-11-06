package com.chunjae.privatepro05.per;

import com.chunjae.privatepro05.entity.Kuser;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserMapper {
    List<Kuser> userList();
    Kuser userDetail(String name);
    int userInsert(Kuser kuser);
    int userUpdateExPw(Kuser kuser);
    int userUpdate(Kuser kuser);
    int userDelete(String name);
    Kuser emailLogin(Kuser kuser);
    Kuser idLogin(String name);
    Kuser getUserByPk(Integer id);
    Kuser getUserByEmail(String email);
    Kuser findId(Kuser kuser);
    Kuser findPw(Kuser kuser);
    int getWithdraw(Integer id);
    int getActivate(String name);
    int getDormant(String name);
    int udLev(String name, String lev);
}

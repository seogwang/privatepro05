package com.chunjae.privatepro05.biz;

import com.chunjae.privatepro05.entity.Kuser;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.List;

public interface UserService {
    public List<Kuser> userList();
    public Kuser userDetail(String name);
    public int userInsert(Kuser kuser);
    public int userUpdateExPw(Kuser kuser);
    public int userUpdate(Kuser kuser);
    public int userDelete(String name);
    public Kuser emailLogin(Kuser kuser);
    public Kuser idLogin(String name);
    public Kuser getUserByPk(Integer id);
    public Kuser getUserByEmail(String email);
    public Kuser findId(Kuser kuser);
    public Kuser findPw(Kuser kuser);
    public int getWithdraw(Integer id);
    public int getActivate(String name);
    public int getDormant(String name);
    public int udLev(String name, String lev);
    public PasswordEncoder passwordEncoder();
}

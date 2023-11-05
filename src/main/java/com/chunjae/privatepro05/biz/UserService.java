package com.chunjae.privatepro05.biz;

import com.chunjae.privatepro05.entity.Kuser;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.List;

public interface UserService {
    public List<Kuser> userList();
    public Kuser userDetail(String name);
    public int userInsert(Kuser kuser);
    public int userUpdate(Kuser kuser);
    public int userDelete(String name);
    public Kuser emailLogin(Kuser kuser);
    public Kuser idLogin(String name);
    public Kuser pkLogin(Kuser kuser);
    public Kuser findId(Kuser kuser);
    public Kuser findPw(Kuser kuser);
    public Kuser setWithdraw(String id);
    public Kuser setActivate(String name);
    public Kuser setDormant(String name);
    public int udLev(Kuser kuser);
    public PasswordEncoder passwordEncoder();
}

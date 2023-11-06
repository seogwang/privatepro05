package com.chunjae.privatepro05.biz;

import com.chunjae.privatepro05.entity.Kuser;
import com.chunjae.privatepro05.per.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    private final PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    @Override
    public List<Kuser> userList() {
        return userMapper.userList();
    }

    @Override
    public Kuser userDetail(String name) {
        return userMapper.userDetail(name);
    }

    @Override
    public int userInsert(Kuser kuser) {
        kuser.setPassword(passwordEncoder.encode(kuser.getPassword()));
        return userMapper.userInsert(kuser);
    }

    @Override
    public int userUpdateExPw(Kuser kuser) {
        return userMapper.userUpdateExPw(kuser);
    }

    @Override
    public int userUpdate(Kuser kuser) {
        kuser.setPassword(passwordEncoder.encode(kuser.getPassword()));
        return userMapper.userUpdate(kuser);
    }

    @Override
    public int userDelete(String name) {
        return userMapper.userDelete(name);
    }

    @Override
    public Kuser emailLogin(Kuser kuser) {
        return userMapper.emailLogin(kuser);
    }

    @Override
    public Kuser idLogin(String name) {
        return userMapper.idLogin(name);
    }

    @Override
    public Kuser getUserByPk(Integer id) {
        return userMapper.getUserByPk(id);
    }

    @Override
    public Kuser getUserByEmail(String email) {
        return userMapper.getUserByEmail(email);
    }

    @Override
    public Kuser findId(Kuser kuser) {
        return userMapper.findId(kuser);
    }

    @Override
    public Kuser findPw(Kuser kuser) {
        return userMapper.findPw(kuser);
    }

    @Override
    public int getWithdraw(Integer id) {
        return userMapper.getWithdraw(id);
    }

    @Override
    public int getActivate(String name) {
        return userMapper.getActivate(name);
    }

    @Override
    public int getDormant(String name) {
        return userMapper.getDormant(name);
    }

    @Override
    public int udLev(String name, String lev) {
        return userMapper.udLev(name, lev);
    }

    @Override
    public PasswordEncoder passwordEncoder() {
        return this.passwordEncoder;
    }
}

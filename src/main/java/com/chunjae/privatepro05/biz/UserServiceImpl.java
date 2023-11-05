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
    public Kuser pkLogin(Kuser kuser) {
        return userMapper.pkLogin(kuser);
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
    public Kuser setWithdraw(String id) {
        return userMapper.setWithdraw(id);
    }

    @Override
    public Kuser setActivate(String name) {
        return userMapper.setActivate(name);
    }

    @Override
    public Kuser setDormant(String name) {
        return userMapper.setDormant(name);
    }

    @Override
    public int udLev(Kuser kuser) {
        return userMapper.udLev(kuser);
    }

    @Override
    public PasswordEncoder passwordEncoder() {
        return this.passwordEncoder;
    }
}

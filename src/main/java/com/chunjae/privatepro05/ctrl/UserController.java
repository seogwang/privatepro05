package com.chunjae.privatepro05.ctrl;

import com.chunjae.privatepro05.biz.ItemService;
import com.chunjae.privatepro05.biz.UserService;
import com.chunjae.privatepro05.entity.Item;
import com.chunjae.privatepro05.entity.Kuser;
import com.chunjae.privatepro05.excep.NoSuchDataException;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.security.Principal;
import java.util.List;

@Slf4j
@Controller
@CrossOrigin("http://localhost:8085")
public class UserController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private UserService userService;

    @Autowired
    HttpSession session;

    @GetMapping("/userList")
    public String userList(Model model){
        List<Kuser> userList = userService.userList();
        if(userList.isEmpty()){
            throw new NoSuchDataException("No Such List");
        }
        model.addAttribute("msg", "회원목록 로딩");
        model.addAttribute("userList", userList);
        return "admin/userList";
    }

    @GetMapping("/userDetail")
    public String userDetail(@RequestParam String name, HttpSession session, Model model) {
        Kuser user = userService.userDetail(name);
        if(user == null) {
            throw new NoSuchDataException("No Such Data");
        }
        model.addAttribute("user", user);
        return "admin/userDetail";
    }

    @GetMapping("/myPage")
    public String getMyPage(HttpSession session, Model model) {
        String name = (String) session.getAttribute("sname");
        Kuser user = userService.userDetail(name);
        if(user == null) {
            throw new NoSuchDataException("No Such Data");
        }
        model.addAttribute("user", user);
        return "userUpdate";
    }

    @GetMapping("/join")
    public String userInsertForm() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication instanceof AnonymousAuthenticationToken)
            return "join";
        return "redirect:/";
    }

    @PostMapping("/userInsertPro")
    public String userInsert(Kuser kuser, Model model) {
        int cnt = userService.userInsert(kuser);
        if(cnt == 0) {
            throw new NoSuchDataException("No Insert Process Data");
        }
        return "redirect:/";
    }

    @PostMapping("/idCheck")
    @ResponseBody
    public boolean idCheckAjax(@RequestBody Kuser test) {
        logger.info("*************** name : " + test.getName());
        boolean result = false;
        Kuser user = userService.userDetail(test.getName());
        if(user != null) {
            result = false;
        } else {
            result = true;
        }
        return result;
    }

    @PostMapping("/emailCheck")
    @ResponseBody
    public boolean emailCheckAjax(@RequestParam("email") String email){
        Kuser user = userService.getUserByEmail(email);
        System.out.println("user : "+user);
        if(user!=null){
            return false;
        } else {
            return true;
        }
    }

    @GetMapping("/login")
    public String login(HttpSession session, Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if(authentication instanceof AnonymousAuthenticationToken)
            return "login";
        return "redirect:/";
    }

    @PostMapping("/idLogin")
    public String idLoginPro(@RequestParam("name") String name, @RequestParam("password") String password, HttpSession session, Model model) {
        Kuser user = userService.idLogin(name);
        if(user != null) {
            if (user.getPassword().equals(password)) {
                model.addAttribute("msg", "로그인 성공");
                session.setAttribute("sname", user.getName());
                session.setAttribute("slevel", user.getLev());
                System.out.println("sname"+session.getAttribute("sname"));
                System.out.println("slevel"+session.getAttribute("slevel"));
            } else {
                model.addAttribute("msg", "로그인 실패");
                session.invalidate();
            }
        } else {
            model.addAttribute("msg", "해당 아이디를 가진 회원이 존재하지 않습니다.");
            session.invalidate();
        }
        return "redirect:/";
    }

    @GetMapping("/withdraw")
    public String widthdraw(@RequestParam("id") Integer id, Model model) {
        int cnt = userService.getWithdraw(id);
        return "redirect:/";
    }

    @GetMapping("/userUpdateFm")
    public String userUpdateForm(@RequestParam("id") Long id, Model model) {
        Kuser user = userService.getUserByPk(id);
        model.addAttribute("msg", "회원정보 수정 가능");
        model.addAttribute("user", user);
        return "user/userUpdate";
    }

    @PostMapping("userUpdatePro")
    public String userUpdatePro(Kuser user, Model model) {
        Kuser kuser = userService.getUserByPk(user.getId());
        int cnt = 0;
        if(user.getPassword().equals(kuser.getPassword())){
            cnt = userService.userUpdateExPw(user);
        } else {
            cnt = userService.userUpdate(user);
        }
        if(cnt == 0) {
            throw new NoSuchDataException("No Update Process Data");
        }
        model.addAttribute("msg", "회원정보 수정 완료");
        return "redirect:/";
    }

    @GetMapping("/userDelete/{name}")
    public String userDelete(@PathVariable("name") String name) {
        int cnt = userService.userDelete(name);
        if(cnt == 0) {
            throw new NoSuchDataException("No Delete Process Data");
        }
        return "admin/userList";
    }

    @PostMapping("/updateLev")
    public String updateLev(@RequestParam("name") String name, @RequestParam("lev") String lev, Model model) {
        int cnt = userService.udLev(name, lev);
        model.addAttribute("msg", "회원등급 변경 완료");
        return "redirect:/";
    }
}

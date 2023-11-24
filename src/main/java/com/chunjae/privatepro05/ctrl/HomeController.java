package com.chunjae.privatepro05.ctrl;

import com.chunjae.privatepro05.biz.ItemService;
import com.chunjae.privatepro05.biz.UserService;
import com.chunjae.privatepro05.entity.Item;
import com.chunjae.privatepro05.entity.Kuser;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.security.Principal;
import java.util.List;

@Controller
@Slf4j
@CrossOrigin("http://localhost:8085")
public class HomeController {
    @Autowired
    private UserService userService;

    @Autowired
    private ItemService itemService;

    @Autowired
    HttpSession session;

    @GetMapping("")
    public String index(Principal principal, Model model){
        if(principal!=null) {
            Long pk = Long.parseLong(principal.getName());
            Kuser userDTO = userService.getUserByPk(pk);
            log.info("----- MyInfo -----");
            log.info(String.valueOf(userDTO));
            session.setAttribute("username",userDTO.getUsername());
            session.setAttribute("name",userDTO.getName());
        }
        List<Item> itemList = itemService.itemList();
        log.info("-------item List--------");
        log.info(itemList.toString());
        model.addAttribute("itemList", itemList);
        return "index";
    }

    @PostMapping("/mainSearch")
    public String mainSearch(@RequestParam("squery") String squery, Model model) {
        String sq = "%"+squery+"%";
        List<Item> itemList = itemService.searchItemList(sq);
        model.addAttribute("itemList", itemList);
        return "index";
    }

}

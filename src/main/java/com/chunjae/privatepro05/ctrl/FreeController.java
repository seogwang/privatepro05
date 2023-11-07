package com.chunjae.privatepro05.ctrl;

import com.chunjae.privatepro05.biz.FreeService;
import com.chunjae.privatepro05.entity.Free;
import com.chunjae.privatepro05.excep.NoSuchDataException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/free/")
public class FreeController {
    @Autowired
    private FreeService freeService;

    @GetMapping("list")
    public String freeList(Model model) {
        List<Free> freeList = freeService.freeList();
        if(freeList.isEmpty()){
            throw new NoSuchDataException("No Such List");
        }
        model.addAttribute("msg", "자유게시판 목록 로딩");
        model.addAttribute("freeList", freeList);
        return "/free/freeList";
    }

    @GetMapping("freeDetail")
    public String freeDetail(HttpServletRequest request, Model model) {
        int no = Integer.parseInt(request.getParameter("no"));
        Free free = freeService.freeDetail(no);
        model.addAttribute("free", free);
        System.out.println(free);
        return "/free/freeDetail";
    }

    @GetMapping("freeInsertFm")
    public String freeInsertForm(){
        return "free/freeInsertFm";
    }

    @PostMapping("freeInsertPro")
    public String freeInsert(Free free, Model model) {
        int cnt = freeService.freeInsert(free);
        if(cnt == 0) {
            throw new NoSuchDataException("No Insert Process Data");
        }
        return "redirect:free/list";
    }
}

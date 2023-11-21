package com.chunjae.privatepro05.ctrl;

import com.chunjae.privatepro05.biz.ItemService;
import com.chunjae.privatepro05.entity.Item;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/item/")
public class ItemController {
    @Autowired
    private ItemService itemService;

    @GetMapping("list")
    public String itemList() {
        itemService.itemList();
        return "item/itemList";
    }


    @GetMapping("itemInsert")
    public String itemInsert(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        String fileName = request.getParameter("file");
        System.out.println(fileName);
        log.info(fileName);
        return "index";
    }

    @GetMapping("itemInsertFm")
    public String itemInsertForm(){
        return "/item/itemInsert";
    }

    @PostMapping("itemInsertPro")
    public String itemInsertPro(Item item, HttpServletRequest request, List<MultipartFile> files, Model model) throws Exception {
        log.info("files 매개변수 : " + files);
        if(files!=null){
            log.info("업로드 파일개수 : " + files.size());
        }
        ServletContext application = request.getSession().getServletContext();
        String path = "/resources/item/upload";
        String realPath = application.getRealPath(path);
        log.info("realPath : " + realPath);
        File uploadPath = new File(realPath);
        if(!uploadPath.exists()){
            uploadPath.mkdirs();
        }
        String[] fileName = {"","","","","","","","","",""};
        int cnt = 0;
        for (MultipartFile multipartFile : files){
            if(multipartFile.isEmpty()){
                continue;
            }
            String uploadFilename = multipartFile.getOriginalFilename();
            multipartFile.transferTo(new File(uploadPath, uploadFilename));
            fileName[cnt] = uploadFilename;
            cnt++;
        }
        item.setImg1(fileName[0]);
        item.setImg2(fileName[1]);
        item.setImg3(fileName[2]);
        item.setImg4(fileName[3]);
        item.setImg5(fileName[4]);
        item.setImg6(fileName[5]);
        item.setImg7(fileName[6]);
        item.setImg8(fileName[7]);
        item.setImg9(fileName[8]);
        item.setImg10(fileName[9]);
        itemService.itemInsert(item);
        return "redirect:list";
    }
}

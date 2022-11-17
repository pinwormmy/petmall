package com.mall.petshop;

import com.mall.petshop.product.LikeItDTO;
import com.mall.petshop.product.ProductDTO;
import com.mall.petshop.product.ProductService;
import com.mall.petshop.util.PageDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Slf4j
@Controller
public class HomeController {

    @Autowired
    ProductService productService;

    // rest 하게 가려면 경로 어떻게 짜나?
    @RequestMapping(value = "/")
    public String home(Model model, PageDTO page) throws Exception{
        model.addAttribute("page", productService.pageSetting(page));
        model.addAttribute("productList", productService.showProductList(page));
        log.info("메인 화면 진입");
        return "index";
    }

    @RequestMapping(value = "/home")
    public String home2(Model model, PageDTO page) throws Exception{
        model.addAttribute("page", productService.pageSetting(page));
        model.addAttribute("productList", productService.showProductList(page));
        log.info("메인 화면 진입");
        log.debug(page.toString());
        return "index";
    }


}

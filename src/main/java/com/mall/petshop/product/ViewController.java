package com.mall.petshop.product;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Slf4j
@Controller
public class ViewController {

    // 페이지 이동만 구현하면 됨?
    // 데이터 부분은 뷰안에서 rest api호출로 처리
    @Autowired
    ProductService productService;

    @GetMapping(value = "/products/form")
    public String addProduct() throws Exception {
        log.info("상품 등록 페이지");
        return "addProduct";
    }

    @GetMapping(value = "/products/form/{productNum}")
    public String addProduct(Model model, @PathVariable int productNum) throws Exception {
        log.info("{}번 상품 수정 페이지", productNum);
        //model.addAttribute("product", productService.readProduct(productNum));
        // 해당 부분 컨트롤러로 받는 것이 아니라, 페이지 내에서 fetch api로 받기
        return "modifyProduct";
    }

    @GetMapping(value = "/likeList")
    public String likeList(String id, Model model) throws Exception {
        model.addAttribute("likeList", productService.showLikeList(id));
        log.info("찜한 목록 페이지");
        return "likeList";
    }

    @GetMapping(value = "/popup")
    public String popup() throws Exception {
        log.info("팝업 띄우기");
        return "popup";
    }
}

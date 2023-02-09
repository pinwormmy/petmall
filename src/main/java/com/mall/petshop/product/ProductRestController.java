package com.mall.petshop.product;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Slf4j
public class ProductRestController {

    @Value("${path.upload.detail}")
    String uploadPath;

    @Autowired
    ProductService productService;

    // 컨트롤러 굳이 안 나눠도 되나? Rest가 문제가 아니라, 기능별로 분류해야 할듯하다
    @RequestMapping(value = "/checkLike")
    public int checkLike(String id, int productNum) throws Exception {
        log.info("찜 확인하기 발동====");
        return productService.checkLike(id, productNum);
    }

    @RequestMapping(value = "/switchToLike")
    public void switchToLike(@RequestBody LikeItDTO likeItDTO) throws Exception {
        log.info("해당상품 찜하기로 함 : {}", likeItDTO);
        productService.switchToLike(likeItDTO);
    }

    @RequestMapping(value = "/switchToUnlike")
    public void switchToUnlike(String id, int productNum) throws Exception {
        log.info("해당상품 찜 취소하기로 함 : {} {}", id, productNum);
        productService.switchToUnlike(id, productNum);
    }
}

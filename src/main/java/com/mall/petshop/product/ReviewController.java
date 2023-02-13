package com.mall.petshop.product;

import com.mall.petshop.util.PageDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@RestController
public class ReviewController {

    @Autowired
    ProductService productService; // 추후 ReviewService로 따로 정리하기

    @PostMapping(value="/reviews")
    public void addReview(@RequestBody ReviewDTO reviewDTO) throws Exception {
        log.debug("리뷰 인수 확인 : {}", reviewDTO.getContent());
        productService.addReview(reviewDTO);
    }

    @PostMapping(value = "/reviews/page") // 페이지세팅문 이렇게 둬도 되나?
    public PageDTO reviewPageSetting(@RequestBody PageDTO page) throws Exception {
        return productService.pageSetting(page);
    }

    @GetMapping(value= "/reviews/{productNum}") // PathVariable에선 오히려 카멜케이스 권장. 어차피 JSON에서 DTO기준으로 떠서 카멜로 뜨게됨
    public List<ReviewDTO> showReviewList(@PathVariable int productNum) throws Exception {
        log.debug("리뷰 컨트롤러 작동 확인 : {}", productNum); // 비동기로 하면 인텔리제이 로그에 안뜸
        return productService.showReviewList(productNum);
    }

    @DeleteMapping(value="/reviews/{reivewNum}")
    public void deleteReview(@PathVariable int reivewNum) throws Exception {
        productService.deleteReview(reivewNum);
    }

    @PutMapping(value = "/reviews/count/{productNum}")
    public void updateReviewCount(@PathVariable int productNum) throws Exception {
        log.debug("댓글수업데이트 컨트롤러 작동 확인");
        productService.updateReviewCount(productNum);
    }
}

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

    @GetMapping(value= "/reviews/{productnum}")
    public List<ReviewDTO> showReviewList(@PathVariable int productnum) throws Exception {
        log.debug("리뷰 컨트롤러 작동 확인 : {}", productnum);
        return productService.showReviewList(productnum);
    }

    @DeleteMapping(value="/reviews/{reviewnum}")
    public void deleteReview(@PathVariable int reviewnum) throws Exception {
        productService.deleteReview(reviewnum);
    }

    @PutMapping(value = "/reviews/count/{productnum}")
    public void updateReviewCount(@PathVariable int productnum) throws Exception {
        log.debug("댓글수업데이트 컨트롤러 작동 확인");
        productService.updateReviewCount(productnum);
    }
}

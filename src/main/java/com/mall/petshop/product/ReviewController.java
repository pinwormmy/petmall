package com.mall.petshop.product;

import com.mall.petshop.util.PageDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
public class ReviewController {

    @Autowired
    ProductService productService; // 코드 정리부터해야하는거 아니니? 폴더랑 파일 따로 뺄지 검토하기

    @PostMapping(value="/reviews")
    public void addReview(@RequestBody ReviewDTO reviewDTO) throws Exception {
        log.debug("리뷰 인수 확인 : {}", reviewDTO.getContent());
        productService.addReview(reviewDTO);
    }

    @RequestMapping(value = "/reviewPageSetting") // url 명 다시 짓기
    @ResponseBody
    public PageDTO reviewPageSetting(@RequestBody PageDTO page) throws Exception {
        return productService.pageSetting(page);
    }

    @GetMapping(value= "/reviews")
    public List<ReviewDTO> showReviewList(@RequestBody PageDTO page) throws Exception {
        return productService.showReviewList(page);
    }

    @DeleteMapping(value="/reviews/{review-num}") // 파라미터명도 어떻게 짓는지 찾아보기
    public void deleteReview(int reviewNum) throws Exception {
        productService.deleteReview(reviewNum);
    }

    @RequestMapping(value = "/updateReviewCount")
    @ResponseBody
    public void updateReviewCount(int productNum) throws Exception {
        productService.updateReviewCount(productNum);
    }
}

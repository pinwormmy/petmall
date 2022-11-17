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
    ProductService productService; // 상품서비스에 둘지 따로뺄지?

    @PostMapping(value="/reviews")
    public void addReview(@RequestBody ReviewDTO reviewDTO) throws Exception {
        log.debug("리뷰 인수 확인 : {}", reviewDTO.getContent());
        productService.addReview(reviewDTO);
    }

    @GetMapping(value = "/reviews/page") // 페이지세팅문 이렇게 둬도 되나?
    public PageDTO reviewPageSetting(@RequestBody PageDTO page) throws Exception {
        return productService.pageSetting(page);
    }

    @GetMapping(value= "/reviews")
    public List<ReviewDTO> showReviewList(@RequestBody PageDTO page) throws Exception {
        return productService.showReviewList(page);
    }

    // a태그 쓰면 겹쳐서 안된다. fetch api 써야하는듯? 좀더 찾아보기
    @DeleteMapping(value="/reviews/{reviewnum}")
    public void deleteReview(@PathVariable int reviewnum) throws Exception {
        productService.deleteReview(reviewnum);
    }

    @PutMapping(value = "/reviews/count/{productnum}")
    public void updateReviewCount(@PathVariable int productnum) throws Exception {
        productService.updateReviewCount(productnum);
    }
}

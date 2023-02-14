package com.mall.petshop.product;

import com.mall.petshop.util.PageDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.CollectionModel;
import org.springframework.hateoas.EntityModel;
import org.springframework.hateoas.Link;
import org.springframework.hateoas.MediaTypes;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

@Slf4j
@RestController
@RequestMapping(produces = MediaTypes.HAL_JSON_VALUE)
public class ReviewController {

    @Autowired
    ProductService productService; // 추후 ReviewService로 따로 정리하기


    @PostMapping(value="/reviews")
    public void addReview(@RequestBody ReviewDTO reviewDTO) {
        log.debug("리뷰 인수 확인 : {}", reviewDTO.getContent());
        productService.addReview(reviewDTO);
    }

    @PostMapping(value = "/reviews/page") // 페이징 처리 방식을 아예 바꿔야함
    public PageDTO reviewPageSetting(@RequestBody PageDTO page) throws Exception {
        return productService.pageSetting(page);
    }

    // CollectionModel의 경우, 낱개로 가져오는 api를 뭉쳐서 목록 api 구성하는 방식인데, 리뷰는 낱개로 불러오지않는다. 나중에 다시 테스트
    @GetMapping(value= "/reviews/{productNum}") // PathVariable에선 오히려 카멜케이스 권장. 어차피 JSON에서 DTO기준으로 떠서 카멜로 뜨게됨
    public CollectionModel<EntityModel<ReviewDTO>> showReviewList(@PathVariable int productNum) {
        log.debug("리뷰 컨트롤러 작동 확인 : {}", productNum); // 비동기로 하면 인텔리제이 로그에 안뜸
        List<EntityModel<ReviewDTO>> reviewList = productService.showReviewList(productNum).stream().map(reviewDTO -> {
            return EntityModel.of(reviewDTO,
                    linkTo(methodOn(ReviewController.class).showReviewList(productNum)).withSelfRel());
        }).collect(Collectors.toList());

        // 엔티티 모델들과 별개로 listAll 메서드 링크 추가.
        return CollectionModel.of(reviewList,
                linkTo(methodOn(ReviewController.class).showReviewList(productNum)).withSelfRel());
    }

    @DeleteMapping(value="/reviews/{reivewNum}")
    public void deleteReview(@PathVariable int reivewNum) {
        productService.deleteReview(reivewNum);
    }

    @PutMapping(value = "/reviews/count/{productNum}")
    public void updateReviewCount(@PathVariable int productNum) {
        log.debug("댓글수업데이트 컨트롤러 작동 확인");
        productService.updateReviewCount(productNum);
    }
}

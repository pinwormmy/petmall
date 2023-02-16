package com.mall.petshop.product;

import com.mall.petshop.util.EntityToModelConverter;
import com.mall.petshop.util.PageDTO;
import com.sun.jndi.toolkit.url.Uri;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.EntityModel;
import org.springframework.hateoas.MediaTypes;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.net.URI;
import java.util.List;
import java.util.stream.Collectors;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;

@Slf4j
@RestController
@RequestMapping(value="/reviews", produces = MediaTypes.HAL_JSON_VALUE)
public class ReviewController {

    @Autowired
    ProductService productService; // 추후 ReviewService로 따로 정리하기
    @Autowired
    EntityToModelConverter entityToModelConverter;

// Self-Descriptive Messasge는 그냥 Api명세 링크를 같이 포함시켜버리는게 제일 확실해보임
// 그래서 다음 단계는 Swagger배우기
    
    @PostMapping
    public ResponseEntity addReview(@RequestBody ReviewDTO reviewDTO) {
        log.info("댓글 추가");
        productService.addReview(reviewDTO);
        URI uri = linkTo(ReviewController.class).slash(showReviewList(reviewDTO.getProductNum())).toUri();
        EntityModel<ReviewDTO> entityModel = EntityModel.of(
                reviewDTO,
                linkTo(ReviewController.class).withRel("reviewList")
        );
        return ResponseEntity.created(uri).body(entityModel);
    }


    @PostMapping(value = "/page") // 페이징 처리 방식을 아예 바꿔야함
    public PageDTO reviewPageSetting(@RequestBody PageDTO page) throws Exception {
        return productService.pageSetting(page);
    }

    // CollectionModel의 경우, 낱개로 가져오는 api를 뭉쳐서 목록 api 구성하는 방식인데, 리뷰는 낱개로 불러오지않는다. 나중에 다시 테스트
    @GetMapping(value= "/{productNum}") // PathVariable에선 오히려 카멜케이스 권장. 어차피 JSON에서 DTO기준으로 떠서 카멜로 뜨게됨
    public List<EntityModel<ReviewDTO>> showReviewList(@PathVariable int productNum) {
        log.debug("리뷰 컨트롤러 작동 확인 : {}", productNum); // 비동기로 하면 인텔리제이 로그에 안뜸
        return productService.showReviewList(productNum)
                .stream()
                .map(entityToModelConverter::toModel)
                .collect(Collectors.toList());
    }

    @DeleteMapping(value="/{reivewNum}")
    public void deleteReview(@PathVariable int reivewNum) {
        productService.deleteReview(reivewNum);
    }

    @PutMapping(value = "/count/{productNum}")
    public void updateReviewCount(@PathVariable int productNum) {
        log.debug("댓글수업데이트 컨트롤러 작동 확인");
        productService.updateReviewCount(productNum);
    }
}

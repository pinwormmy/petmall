package com.mall.petshop.product;

import com.mall.petshop.util.EntityToModelConverter;
import com.mall.petshop.util.PageDTO;
import com.sun.jndi.toolkit.url.Uri;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.EntityModel;
import org.springframework.hateoas.MediaTypes;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.net.URI;
import java.util.List;
import java.util.stream.Collectors;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

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
        EntityModel<ReviewDTO> entityModel =
                EntityModel.of(reviewDTO, linkTo(ReviewController.class).withRel("reviewList"));
        return ResponseEntity.created(uri).body(entityModel);
    }


    // rest api에서 페이징 처리 어떻게 하는지 알아보기. 아마 기존 내가 구현한 api는 버려야할듯??
    @PostMapping(value = "/page") // 페이징 처리 방식을 아예 바꿔야함
    public PageDTO reviewPageSetting(@RequestBody PageDTO page) throws Exception {
        return productService.pageSetting(page);
    }

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

    @PatchMapping(value = "/count/{productNum}") // PATCH는 지원 안하는 브라우저가 많다. 이상있으면 PUT으로 변경
    public ResponseEntity updateReviewCount(@PathVariable int productNum) {  // 난해한 부분 : json 어디까지 써야하나? 링크는 뭐라고 해야하나?
        log.info("댓글수업데이트");
        int updateResult = productService.updateReviewCount(productNum); // 사실 메인화면 상품목록에 리뷰갯수 표시 안해서 컬럼 자체가 필요없었음
        // 덕분에 코드가 좀 복잡해지지만 확장가능성 고려하면 둬도 굳이 수정할 필요도 없겠다 싶어서 둠
        if(updateResult == 0)
            return new ResponseEntity("댓글수 업데이트 DB 오류", HttpStatus.BAD_GATEWAY); // 502에러. DB 쪽에서 헛소리한다는 의미로
        ProductDTO productDTO = productService.getReviewCount(productNum); // 여기서 다른 쿼리문까지 쓰는게 맞나? 단일책임원칙 위반 아닌가?
        EntityModel<ProductDTO> entityModel =
                EntityModel.of(productDTO, // FM으로 구현한다치고, 한게시물에 대한 DTO(JSON) 다 포함시킴
                        linkTo(methodOn(ReviewController.class).updateReviewCount(productNum)).withSelfRel(),
                        linkTo(methodOn(ReviewController.class).showReviewList(productNum)).withRel("reviewList"));
        return ResponseEntity.ok().body(entityModel);
    }
}

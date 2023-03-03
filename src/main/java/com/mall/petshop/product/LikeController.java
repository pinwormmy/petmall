package com.mall.petshop.product;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.EntityModel;
import org.springframework.hateoas.Link;
import org.springframework.hateoas.MediaTypes;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.net.URI;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

@Slf4j
@RestController
@RequestMapping(produces = MediaTypes.HAL_JSON_VALUE)
public class LikeController {
    @Autowired
    ProductService productService;

    @GetMapping(value = "/products/{productNum}/likers/{id}")
    public ResponseEntity checkLike(@PathVariable String id, @PathVariable int productNum) throws Exception {
        log.info("해당 상품에 찜 눌렀는지 확인");
        LikeItDTO likeItDTO = productService.checkLike(id, productNum);
        EntityModel entityModel =
                EntityModel.of(linkTo(methodOn(LikeController.class).checkLike(id, productNum)).withSelfRel());
        if(likeItDTO != null) // 204써도 되냐 말이 많지만, 있다없다만 파악하면 되기에, 굳이 JSON 표기 안해도 되는 것으로 봄.
            new ResponseEntity(entityModel, HttpStatus.NO_CONTENT);
        else
            ResponseEntity.notFound();
        return new ResponseEntity(entityModel, HttpStatus.NOT_FOUND);
    }

    @PostMapping(value = "/products/{productNum}/likers/{id}")
    public ResponseEntity addToLikedProduct(@PathVariable String id, @PathVariable int productNum) throws Exception {
        log.info("해당상품 찜하기로 함. 상품번호 : {}", productNum);
        productService.addToLikedProduct(id, productNum);
        LikeItDTO likeItDTO = productService.checkLike(id, productNum);
        URI uri = Link.of("/products" + productNum).toUri(); // 대상이 뷰랑 붙어있어서 하드코딩 형태로 짰는데, 추후에 linkTo 형식으로 변경하기
        EntityModel<LikeItDTO> entityModel =
                // 이건 그냥 methodOn 안쓰고 짜봄;
                EntityModel.of(likeItDTO, linkTo(LikeController.class)
                        .slash("products").slash(productNum)
                        .slash("likers").slash(id).withSelfRel());
        return ResponseEntity.created(uri).body(entityModel);
    }

    @RequestMapping(value = "/switchToUnlike")
    public void switchToUnlike(String id, int productNum) throws Exception {
        log.info("해당상품 찜 취소하기로 함 : {} {}", id, productNum);
        productService.switchToUnlike(id, productNum);
    }

    @RequestMapping(value = "/deleteLike")
    public String deleteLike(int productNum, String id) throws Exception {
        productService.deleteLike(productNum, id);
        log.info("찜한 목록 페이지 내에서 상품 삭제");
        return "redirect:/likeList?id=" + id;
    }
}

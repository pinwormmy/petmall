package com.mall.petshop.product;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.EntityModel;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

@Slf4j
@RestController
public class LikeController {
    @Autowired
    ProductService productService;

    @GetMapping(value = "/like/{id}/{productNum}")
    public ResponseEntity checkLike(@PathVariable String id, @PathVariable int productNum) throws Exception {
        log.info("해당 상품에 찜 눌렀는지 확인");
        LikeItDTO likeItDTO = productService.checkLike(id, productNum);
        EntityModel<LikeItDTO> entityModel =
                EntityModel.of(likeItDTO, linkTo(methodOn(LikeController.class).checkLike(id, productNum)).withSelfRel());
        return ResponseEntity.ok().body(entityModel);
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

    @RequestMapping(value = "/deleteLike")
    public String deleteLike(int productNum, String id) throws Exception {
        productService.deleteLike(productNum, id);
        log.info("찜한 목록 페이지 내에서 상품 삭제");
        return "redirect:/likeList?id=" + id;
    }
}

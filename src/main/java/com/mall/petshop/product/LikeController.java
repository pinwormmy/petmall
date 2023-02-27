package com.mall.petshop.product;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.EntityModel;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.net.URI;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;

@Slf4j
@RestController
public class LikeController {
    @Autowired
    ProductService productService;

    @GetMapping(value = "/like/{id}/{productNum}")
    public ResponseEntity checkLike(LikeItDTO likeItDTO) throws Exception {
        log.info("해당 상품에 찜 눌렀는지 확인");
        int result = productService.checkLike(likeItDTO.getId(), likeItDTO.getProductNum());
        if(result == 0) {
            ResponseEntity.ok().body("ddd");
        }
        EntityModel<LikeItDTO> entityModel =
                EntityModel.of(likeItDTO, linkTo(LikeController.class).withSelfRel());
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

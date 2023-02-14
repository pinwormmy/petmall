package com.mall.petshop.util;

import com.mall.petshop.product.ReviewController;
import com.mall.petshop.product.ReviewDTO;
import org.springframework.hateoas.EntityModel;
import org.springframework.hateoas.server.RepresentationModelAssembler;
import org.springframework.stereotype.Component;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

// 일단 리뷰에 대해서만 작성됨.
@Component
public class EntityToModelConverter implements RepresentationModelAssembler<ReviewDTO, EntityModel<ReviewDTO>> {
    @Override
    public EntityModel<ReviewDTO> toModel(ReviewDTO reviewDTO) {
        return EntityModel.of(reviewDTO,
                linkTo(methodOn(ReviewController.class).addReview(reviewDTO)).withRel("addReview"),
                linkTo(methodOn(ReviewController.class).showReviewList(reviewDTO.getProductNum())).withRel("reviewList"));
    }
}

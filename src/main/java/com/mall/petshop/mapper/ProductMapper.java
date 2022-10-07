package com.mall.petshop.mapper;

import com.mall.petshop.member.MemberDTO;
import com.mall.petshop.product.LikeItDTO;
import com.mall.petshop.product.ProductDTO;
import com.mall.petshop.product.ReviewDTO;
import com.mall.petshop.util.PageDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductMapper {

    void searchProduct(String keyword) throws Exception;

    List<ProductDTO> showProductList(PageDTO pageDTO) throws Exception;

    void addProduct(ProductDTO productDTO) throws Exception;

    ProductDTO readProduct(int productNum) throws Exception;

    void deleteProduct(int productNum) throws Exception;

    void addLikeProduct(LikeItDTO likeItDTO) throws Exception;

    int checkLike(@Param("id") String id, @Param("productNum") int productNum) throws Exception;

    List<LikeItDTO> loadLikeList(String id) throws Exception;

    int countTotalPost(PageDTO page) throws Exception;

    void switchToLike(LikeItDTO likeItDTO) throws Exception;

    void switchToUnlike(String id, int productNum) throws Exception;

    void addReview(ReviewDTO reviewDTO) throws Exception;

    List<ReviewDTO> showReviewList(PageDTO page) throws Exception;

    void deleteReview(int reviewNum) throws Exception;

    void updateReviewCount(int postNum) throws Exception;

    int countTotalReview(PageDTO page) throws Exception;
}

package com.mall.petshop.mapper;

import com.mall.petshop.member.MemberDTO;
import com.mall.petshop.product.*;
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

    void addReview(ReviewDTO reviewDTO);

    List<ReviewDTO> showReviewList(int productNum);

    void deleteReview(int reviewNum);

    void updateReviewCount(int postNum);

    int countTotalReview(PageDTO page);

    void buyProduct(ProductOrderDTO order) throws Exception;

    ProductOrderDTO readOrder(ProductOrderDTO order) throws Exception;

    void addCart(CartDTO cart) throws Exception;

    List<CartDTO> showCartList(String id) throws Exception;

    void deleteCart(int cartNum) throws Exception;

    List<LikeItDTO> showLikeList(String id) throws Exception;

    void deleteLike(@Param("productNum") int productNum, @Param("id") String id) throws Exception;

    void resetCart(String id) throws Exception;

    void modifyProduct(ProductDTO productDTO) throws Exception;

}

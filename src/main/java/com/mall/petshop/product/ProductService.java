package com.mall.petshop.product;

import com.mall.petshop.util.PageDTO;

import java.util.List;

public interface ProductService {

    void searchProduct(String keyword) throws Exception;

    List<ProductDTO> showProductList(PageDTO pageDTO) throws Exception;

    void addProduct(ProductDTO productDTO) throws Exception;

    ProductDTO readProduct(int productNum) throws Exception;

    void deleteProduct(int productNum) throws Exception;

    int checkLike(String id, int productNum) throws Exception;

    List<LikeItDTO> loadLikeList(String id) throws Exception;

    PageDTO pageSetting(PageDTO page) throws Exception;

    int countTotalPost(PageDTO page) throws Exception;

    void switchToLike(LikeItDTO likeItDTO) throws Exception;

    void switchToUnlike(String id, int productNum) throws Exception;

    void addReview(ReviewDTO review) throws Exception;

    List<ReviewDTO> showReviewList(PageDTO page) throws Exception;

    void deleteReview(int reviewNum) throws Exception;

    void updateReviewCount(int postNum) throws Exception;

    void buyProduct(ProductOrderDTO order) throws Exception;
}

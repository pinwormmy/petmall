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

    void addReview(ReviewDTO review);

    List<ReviewDTO> showReviewList(int productNum);

    void deleteReview(int reviewNum) ;

    int updateReviewCount(int postNum);

    void buyProduct(ProductOrderDTO order) throws Exception;

    ProductOrderDTO readOrder(ProductOrderDTO order) throws Exception;

    void addCart(CartDTO cart) throws Exception;

    List<CartDTO> showCartList(String id) throws Exception;

    void deleteCart(int cartNum) throws Exception;

    List<LikeItDTO> showLikeList(String id) throws Exception;

    void deleteLike(int productNum, String id) throws Exception;

    void resetCart(String id) throws Exception;

    void modifyProduct(ProductDTO productDTO) throws Exception;

    ProductDTO getReviewCount(int productNum);
}

package com.mall.petshop.product;

import com.mall.petshop.mapper.ProductMapper;
import com.mall.petshop.util.PageDTO;
import com.mall.petshop.util.PageService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    ProductMapper productMapper;

    @Override
    public void searchProduct(String keyword) throws Exception {
        productMapper.searchProduct(keyword);
    }

    @Override
    public List<ProductDTO> showProductList(PageDTO pageDTO) throws Exception {
        return productMapper.showProductList(pageDTO);
    }

    @Override
    public void addProduct(ProductDTO productDTO) throws Exception {
        productMapper.addProduct(productDTO);
    }

    @Override
    public ProductDTO readProduct(int productNum) throws Exception {
        return productMapper.readProduct(productNum);
    }

    @Override
    public void deleteProduct(int productNum) throws Exception {
        productMapper.deleteProduct(productNum);
    }

    @Override
    public int checkLike(String id, int productNum) throws Exception {
        return productMapper.checkLike(id, productNum);
    }

    @Override
    public List<LikeItDTO> loadLikeList(String id) throws Exception {
        return productMapper.loadLikeList(id);
    }

    @Override
    public PageDTO pageSetting(PageDTO page) throws Exception {
        checkPageAndKeyword(page);
        return utilLoadingForPage(page);
    }

    private void checkPageAndKeyword(PageDTO page) {
        if(page.getRecentPage() < 1) { page.setRecentPage(1); }
        if(page.getSortType() == null) { page.setSortType("recent"); }
        if(page.getKeyword() == null) { page.setKeyword("고양이용품"); }
        if(page.getFreeShipping() != 1) { page.setFreeShipping(0);}
        if(page.getOnDiscount() != 1) { page.setOnDiscount(0);}
    }

    private PageDTO utilLoadingForPage(PageDTO page) throws Exception {
        log.debug("서비스단계에서 검색어 확인 : {}", page.getKeyword());
        page.setTotalPostCount(countTotalPost(page));
        PageService util = initPageUtil();
        return util.calculatePage(page);
    }

    @Override
    public int countTotalPost(PageDTO page) throws Exception {
        return productMapper.countTotalPost(page);
    }

    @Override
    public void switchToLike(LikeItDTO likeItDTO) throws Exception {
        productMapper.switchToLike(likeItDTO);
    }

    @Override
    public void switchToUnlike(String id, int productNum) throws Exception {
        productMapper.switchToUnlike(id, productNum);
    }

    private PageService initPageUtil() {
        PageService util = new PageService();
        util.setDISPLAY_POST_LIMIT(20);
        util.setPAGESET_LIMIT(10);
        return util;
    }

    @Override
    public void addReview(ReviewDTO reviewDTO) {
        productMapper.addReview(reviewDTO);
    }

    @Override
    public List<ReviewDTO> showReviewList(int ProductNum) {
        return productMapper.showReviewList(ProductNum);
    }

    @Override
    public void deleteReview(int reviewNum) {
        productMapper.deleteReview(reviewNum);
    }

    @Override
    public int updateReviewCount(int postNum) {
        productMapper.updateReviewCount(postNum);
        return postNum;
    }

    @Override
    public void buyProduct(ProductOrderDTO order) throws Exception {
        productMapper.buyProduct(order);
    }

    @Override
    public ProductOrderDTO readOrder(ProductOrderDTO order) throws Exception {
        return productMapper.readOrder(order);
    }

    @Override
    public void addCart(CartDTO cart) throws Exception {
        productMapper.addCart(cart);
    }

    @Override
    public List<CartDTO> showCartList(String id) throws Exception {
        return productMapper.showCartList(id);
    }

    @Override
    public void deleteCart(int cartNum) throws Exception {
        productMapper.deleteCart(cartNum);
    }

    @Override
    public List<LikeItDTO> showLikeList(String id) throws Exception {

        return productMapper.showLikeList(id);
    }

    @Override
    public void deleteLike(int productNum, String id) throws Exception {
        productMapper.deleteLike(productNum, id);
    }

    @Override
    public void resetCart(String id) throws Exception {
        productMapper.resetCart(id);
    }

    @Override
    public void modifyProduct(ProductDTO productDTO) throws Exception {
        productMapper.modifyProduct(productDTO);
    }

    @Override
    public int getReviewCount(int productNum) {
        return productMapper.getReviewCount(productNum);
    }
}

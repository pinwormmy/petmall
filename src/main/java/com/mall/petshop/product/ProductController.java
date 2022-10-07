package com.mall.petshop.product;

import com.mall.petshop.util.PageDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.ArrayList;
import java.util.List;



@Slf4j
@Controller
public class ProductController {

    @Value("${spring.servlet.multipart.location}")
    String uploadPath;

    @Autowired
    ProductService productService;

    @RequestMapping(value = "/searchProduct")
    public String searchProduct(String keyword) throws Exception {
        productService.searchProduct(keyword);
        return "index";
    }

    @GetMapping(value = "/readProduct")
    public String readProduct(Model model, int productNum) throws Exception {
        log.info("{}번 상품 조회", productNum);
        model.addAttribute("product", productService.readProduct(productNum));
        return "readProduct";
    }

    @GetMapping(value = "/addProduct")
    public String addProduct() throws Exception {
        log.info("상품 등록 페이지");
        return "addProduct";
    }

    @RequestMapping(value = "/submitAddProduct", method = RequestMethod.POST)
    public String submitProduct(ProductDTO productDTO, MultipartFile file) throws Exception {
        String imgUploadPath = uploadPath;
        String ymdPath = ThumbnailController.calcPath(imgUploadPath);
        String fileName = null;
        if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
            fileName = ThumbnailController.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
            productDTO.setThumbnail(File.separator + "img" + ymdPath + File.separator + fileName);
        } else {
            fileName = File.separator + "img" + File.separator + "none.jpg";
            productDTO.setThumbnail(fileName);
        }
        productService.addProduct(productDTO);
        return "redirect:/";
    }

    @RequestMapping(value = "/deleteProduct")
    public String deleteProduct(int productNum) throws Exception {
        productService.deleteProduct(productNum);
        return "redirect:/";
    }

    @RequestMapping(value = "/checkLike")
    @ResponseBody
    public int checkLike(String id, int productNum) throws Exception {
        log.info("찜 확인하기 발동====");
        return productService.checkLike(id, productNum);
    }

    @RequestMapping(value = "/switchToLike")
    @ResponseBody
    public void switchToLike(@RequestBody LikeItDTO likeItDTO) throws Exception {
        log.info("해당상품 찜하기로 함 : {}", likeItDTO);
        productService.switchToLike(likeItDTO);
    }

    @RequestMapping(value = "/switchToUnlike")
    @ResponseBody
    public void switchToUnlike(String id, int productNum) throws Exception {
        log.info("해당상품 찜 취소하기로 함 : {} {}", id, productNum);
        productService.switchToUnlike(id, productNum);
    }

    @RequestMapping(value = "/addReview")
    @ResponseBody
    public void addReview(@RequestBody ReviewDTO reviewDTO) throws Exception {
        log.debug("리뷰 인수 확인 : {}", reviewDTO.getContent());
        productService.addReview(reviewDTO);
    }

    @RequestMapping(value = "/reviewPageSetting")
    @ResponseBody
    public PageDTO reviewPageSetting(@RequestBody PageDTO page) throws Exception {
        return productService.pageSetting(page);
    }

    @RequestMapping(value = "/showReviewList")
    @ResponseBody
    public List<ReviewDTO> showReviewList(@RequestBody PageDTO page) throws Exception {
        return productService.showReviewList(page);
    }

    @RequestMapping(value = "/deleteReview")
    @ResponseBody
    public void deleteReview(int reviewNum) throws Exception {
        productService.deleteReview(reviewNum);
    }

    @RequestMapping(value = "/updateReviewCount")
    @ResponseBody
    public void updateReviewCount(int productNum) throws Exception {
        productService.updateReviewCount(productNum);
    }

    @RequestMapping(value = "/cart")
    public String cart() throws Exception {
        log.info("장바구니 페이지");
        return "cart";
    }
}

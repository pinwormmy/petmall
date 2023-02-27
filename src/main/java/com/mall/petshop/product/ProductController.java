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
import java.io.File;
import java.util.Objects;

@Slf4j
@Controller
public class ProductController {

    @Value("${path.upload.detail}")
    String uploadPath;

    @Autowired
    ProductService productService;

    // jsp로 페이지 이동을 처리하는 컨트롤러와
    // 데이터 전달을 위한 Rest컨트롤러를 분리해서 작성 필요.
    
//    @GetMapping(value = "/products")
//    public String searchProuct(PageDTO page, Model model) throws Exception {
//        productService.searchProduct(page.getKeyword());
//        model.addAttribute("page", productService.pageSetting(page));
//        model.addAttribute("productList", productService.showProductList(page));
//        log.info("상품목록 페이지");
//        return "index";
//    }

    @GetMapping(value = "/products/{productNum}")
    public String readProduct(Model model, @PathVariable int productNum) throws Exception {
        log.info("{}번 상품 조회", productNum);
        model.addAttribute("product", productService.readProduct(productNum));
        return "readProduct";
    }

    @PostMapping(value = "/products")
    public String submitProduct(ProductDTO productDTO, MultipartFile file) throws Exception {
        String imgUploadPath = uploadPath;
        String ymdPath = ThumbnailController.calcPath(imgUploadPath);
        String fileName = null;
        if (file.getOriginalFilename() != null || file.getOriginalFilename().equals("") ) {
            fileName = ThumbnailController.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
            log.debug("썸네일 업로드 완료");
            productDTO.setThumbnail(File.separator + "img" + ymdPath + File.separator + fileName);
        } else {
            fileName = File.separator + "img" + File.separator + "none.jpg";
            log.debug("썸네일없음 그림 생성");
            productDTO.setThumbnail(fileName);
        }
        productService.addProduct(productDTO);
        return "redirect:/";
    }

    @PutMapping(value = "/products/{productNum}")
    public String submitModifyProduct(ProductDTO productDTO, MultipartFile file) throws Exception {
        log.info("상품 수정해서 업로드 처리 중..");
        // 근데 여기서 썸네일 변동사항 없으면 이거 처리할 필요가 없다.
        // 애초에 썸네일 수정할때만 돌아가게 하면 되지..
        // 추후수정
        String imgUploadPath = uploadPath;
        String ymdPath = ThumbnailController.calcPath(imgUploadPath);
        String fileName = null;
        if (file.getOriginalFilename() != null && !Objects.equals(file.getOriginalFilename(), "")) {
            log.debug("썸네일 이미지 확인 후, 업로드 준비중...");
            fileName = ThumbnailController.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
            log.debug("썸네일 업로드 완료");
            productDTO.setThumbnail(File.separator + "img" + ymdPath + File.separator + fileName);
        } else {
            fileName = File.separator + "img" + File.separator + "none.jpg";
            log.debug("썸네일없음 그림 생성");
            productDTO.setThumbnail(fileName);
        }
        productService.modifyProduct(productDTO);
        return "redirect:/";
    }

    @DeleteMapping(value = "/products/{productNum}")
    public String deleteProduct(@PathVariable int productNum) throws Exception {
        productService.deleteProduct(productNum);
        return "redirect:/";
    }



    @RequestMapping(value = "/cart")
    public String cart(String id, Model model) throws Exception {
        model.addAttribute("cartList", productService.showCartList(id));
        log.info("장바구니 페이지");
        return "cart";
    }

    @PostMapping(value = "/payment")
    public String payment(ProductOrderDTO order, Model model) throws Exception {
        productService.buyProduct(order);
        ProductOrderDTO orderSet = productService.readOrder(order);
        productService.resetCart(order.getId());
        model.addAttribute("order", orderSet);
        log.info("결제 페이지 : {}", order);
        return "payment";
    }

    @RequestMapping(value = "/finishPayment")
    public String finishPayment(HttpServletRequest request) throws Exception {
        log.info("결제완료 메세지");
        return alertMsgAndGoUrl(request, "결제가 완료되었습니다. 구매해주셔서 감사합니다.", "home");
    }

    @RequestMapping(value = "/addCart")
    @ResponseBody
    public void addCart(@RequestBody CartDTO cart) throws Exception {
        productService.addCart(cart);
        log.debug("카트 담기 : {}", cart);
    }

    @RequestMapping(value = "/deleteCart")
    public String deleteCart(int cartNum, String id) throws Exception {
        productService.deleteCart(cartNum);
        return "redirect:/cart?id=" + id;
    }



    // alert.jsp 연결문 정리
    private String alertMsgAndGoUrl(HttpServletRequest request, String msg, String url) {
        request.setAttribute("msg", msg);
        request.setAttribute("url", url);
        return "alert";
    }
}

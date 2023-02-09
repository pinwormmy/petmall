package com.mall.petshop.product;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;

@Slf4j
@Controller
public class ProductController {

    @Value("${path.upload.detail}")
    String uploadPath;

    @Autowired
    ProductService productService;

    @GetMapping(value = "/products")
    public String searchProduct(String keyword) throws Exception {
        productService.searchProduct(keyword);
        return "index";
    }

    @GetMapping(value = "/products/{productNum}")
    public String readProduct(Model model, @PathVariable int productNum) throws Exception {
        log.info("{}번 상품 조회", productNum);
        model.addAttribute("product", productService.readProduct(productNum));
        return "readProduct";
    }

    // 컨트롤러로 페이지 이동까지 하는 것이 Rest API는 아닌데, 일단 이 정도 선까지 해서 정리하고
    // 그 다음에 페이지 이동이랑 데이터 처리를 분할
    // 근데 HATEOAS 적용하려면 httpEntity를 써야하는데, 그러려면, RestContoller 기준으로 써야함
    // 그래서 일괄 적용차원으로 댓글 기능까지 http메소드 양식으로 정리하고 나서 댓글 기능에 먼저 적용해보기

    @GetMapping(value = "/products/form")
    public String addProduct() throws Exception {
        log.info("상품 등록 페이지");
        return "addProduct";
    }

    @PostMapping(value = "/products")
    public String submitProduct(ProductDTO productDTO, MultipartFile file) throws Exception {
        String imgUploadPath = uploadPath;
        String ymdPath = ThumbnailController.calcPath(imgUploadPath);
        String fileName = null;
        if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
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

    @GetMapping(value = "/products/form/{productNum}")
    public String addProduct(Model model, @PathVariable int productNum) throws Exception {
        log.info("{}번 상품 수정 페이지", productNum);
        model.addAttribute("product", productService.readProduct(productNum));
        return "modifyProduct";
    }

    @PutMapping(value = "/products/{productNum}") // 이거 되나?
    public String submitModifyProduct(ProductDTO productDTO, MultipartFile file) throws Exception {
        log.info("상품 수정해서 업로드 처리 중..");
        // 근데 여기서 썸네일 변동사항 없으면 이거 처리할 필요가 없다.
        // 애초에 썸네일 수정할때만 돌아가게 하면 되지..
        // 추후수정
        String imgUploadPath = uploadPath;
        String ymdPath = ThumbnailController.calcPath(imgUploadPath);
        String fileName = null;
        if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
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

    @GetMapping(value = "/likeList")
    public String likeList(String id, Model model) throws Exception {
        model.addAttribute("likeList", productService.showLikeList(id));
        log.info("찜한 목록 페이지");
        return "likeList";
    }

    @GetMapping(value = "/popup")
    public String popup() throws Exception {
        log.info("팝업 띄우기");
        return "popup";
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

    @RequestMapping(value = "/deleteLike")
    public String deleteLike(int productNum, String id) throws Exception {
        productService.deleteLike(productNum, id);
        return "redirect:/likeList?id=" + id;
    }

    // alert.jsp 연결문 정리
    private String alertMsgAndGoUrl(HttpServletRequest request, String msg, String url) {
        request.setAttribute("msg", msg);
        request.setAttribute("url", url);
        return "alert";
    }
}

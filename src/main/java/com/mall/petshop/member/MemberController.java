package com.mall.petshop.member;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Slf4j
@Controller
public class MemberController {

    // autowired 사용 자제하라는 거에 대해 찾아보기 
    @Autowired 
    MemberService memberService;

    // rest api 적용 준비
    @RequestMapping(value = "/login")
    public String login(HttpServletRequest request) throws Exception{
        log.info("로그인 페이지");
        // 로그인 이전 페이지 정보 세션에 저장
        request.getSession().setAttribute("pageBeforeLogin", request.getHeader("Referer"));
        return "login";
    }

    @RequestMapping(value = "/submitLogin", method = RequestMethod.POST)
    public String submitLogin(MemberDTO member, HttpServletRequest request) throws Exception {
        MemberDTO loginData = memberService.submitLogin(member);
        if (loginData == null) // 비밀번호 틀리면 null값 들어옴
            return alertMsgAndGoUrl(request, "로그인 오류! ID와 비밀번호를 확인해주세요~!!", "login");
        HttpSession session = request.getSession();
        session.setAttribute("member", loginData);
        return "redirect:" + session.getAttribute("pageBeforeLogin");
    }

    @RequestMapping(value = "/loginForDemo")
    public String loginForDemo(HttpServletRequest request) throws Exception {
        request.getSession().setAttribute("pageBeforeLogin", request.getHeader("Referer"));
        MemberDTO member = new MemberDTO();
        member.setId("midori"); // midori는 시연용 일반계정입니다.
        member.setPw("1111");
        MemberDTO loginData = memberService.submitLogin(member);
        HttpSession session = request.getSession();
        session.setAttribute("member", loginData);
        log.info("(시연용) 일반로그인 성공 : {}", loginData);
        return "redirect:" + session.getAttribute("pageBeforeLogin");
    }

    @RequestMapping(value = "/loginForDemoAsAdmin")
    public String loginForDemoAsAdmin(HttpServletRequest request) throws Exception {
        request.getSession().setAttribute("pageBeforeLogin", request.getHeader("Referer"));
        MemberDTO member = new MemberDTO();
        member.setId("admin"); // midori는 시연용 관리자계정입니다.
        member.setPw("1111");
        MemberDTO loginData = memberService.submitLogin(member);
        HttpSession session = request.getSession();
        session.setAttribute("member", loginData);
        log.info("(시연용) 관리자로그인 성공 : {}", loginData);
        return "redirect:" + session.getAttribute("pageBeforeLogin");
    }

    // alert.jsp 연결문 정리
    private String alertMsgAndGoUrl(HttpServletRequest request, String msg, String url) {
        request.setAttribute("msg", msg);
        request.setAttribute("url", url);
        return "alert";
    }

    @RequestMapping(value = "/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    @RequestMapping(value = "/signUp")
    public String signUp() {
        return "signUp";
    }

    @RequestMapping(value = "/submitSignUp", method = RequestMethod.POST)
    public String submitSignUp(MemberDTO member, HttpServletRequest request) throws Exception {
        memberService.submitSignUp(member);
        loginWithSession(member, request); // 가입한 아이디로 로그인도 해주기
        return alertMsgAndGoUrl(request, "회원가입되었습니다.", "home");
    }

    private void loginWithSession(MemberDTO member, HttpServletRequest request) throws Exception {
        MemberDTO loginData = memberService.submitLogin(member);
        HttpSession session = request.getSession();
        session.setAttribute("member", loginData);
    }

    @GetMapping(value = "/myPage")
    public String myPage() {
        return "myPage";
    }
}

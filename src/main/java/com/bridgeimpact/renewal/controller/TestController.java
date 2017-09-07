package com.bridgeimpact.renewal.controller;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bridgeimpact.renewal.dto.MemberVO;
import com.bridgeimpact.renewal.service.MemberService;
import com.fasterxml.jackson.databind.ObjectMapper;

 
/**
 * Handles requests for the application home page.
 */
@Controller
public class TestController {
    
    private static final Logger logger = LoggerFactory.getLogger(TestController.class);
    
    @Autowired
    private MemberService memberService;
    
    /**
     * Simply selects the home view to render by returning its name.
     */
    
    

    @RequestMapping("/login")
    public String login(HttpServletRequest request){
        String returnURL = "";
        //웹페이지에서받은 아이디,패스워드 일치시 admin 세션key 생성
        if(request.getParameter("id").equals("admin") && request.getParameter("password").equals("1234")) {
            Map<String, Object> map = new HashMap<String,Object>();
            map.put("admin_id", "admin");
            map.put("admin_name", "관리자");
            request.getSession().setAttribute("admin", map);
            returnURL = "redirect:/admin_main";
        //일치하지 않으면 로그인페이지 재이동
        }else {
            returnURL = "/";
        }
        return returnURL;
    }
       

    /**
     * 관리자메인 컨트롤러
     * @return
     */
    @RequestMapping("/admin_main")
    public String admin_main(){
        return "admin_main";
    }



}



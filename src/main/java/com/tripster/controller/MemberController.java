package com.tripster.controller;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.tripster.domain.MemberVO;
import com.tripster.dto.LoginDTO;
import com.tripster.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Inject
	private MemberService service;

	// 로그인 화면 접근
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") LoginDTO dto) {

	}

	// 로그인 처리
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void loginPOST(LoginDTO dto, HttpSession session, Model model, RedirectAttributes rttr) throws Exception {

		MemberVO vo = service.login(dto);

		if (vo == null) {

			return;
		}
		model.addAttribute("memberVO", vo);

		if (dto.isUseCookie()) {
			int amount = 60 * 60 * 24;

			Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));

			service.keepLogin(vo.getMemberID(), session.getId(), sessionLimit);

		}

	}

	// 회원가입 화면 접근
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET(MemberVO vo, Model model) throws Exception {

	}

	// 회원가입 처리
	@RequestMapping(value = "/registerPost", method = RequestMethod.POST)
	public String registerPost(MemberVO vo, RedirectAttributes rttr) throws Exception {

		logger.info("회원 등록");
		logger.info(vo.toString());

		service.register(vo);

		rttr.addFlashAttribute("msg", "success");

		return "redirect:/";
	}

	// 이메일 인증
	@RequestMapping(value = "/emailConfirm", method = RequestMethod.GET)
	public String emailConfirm(String memberEmail, Model model) throws Exception {
		service.authMember(memberEmail);
		model.addAttribute("memberEmail", memberEmail);

		return "/member/emailConfirm";
	}

	// 이메일 중복확인(j-query validation)
	@RequestMapping(value = "/repeatChk", method = RequestMethod.GET)
	public @ResponseBody String repeatChk(@RequestParam("memberEmail") String memberEmail) throws Exception {

		if (service.repeatChk(memberEmail) == true) {
			return "true";
		} else {
			return "false";
		}
	}

	// 비밀번호 찾기 화면 접근
	@RequestMapping(value = "/findPassword", method = RequestMethod.GET)
	public void findPasswordGET(MemberVO vo, Model model) throws Exception {

	}

	// 비밀번호 찾기 메일 전송
	@RequestMapping(value = "/findPassword", method = RequestMethod.POST)
	public String findPasswordPost(MemberVO vo, RedirectAttributes rttr) throws Exception {
		service.findPassword(vo);

		rttr.addFlashAttribute("msg", "findPassword");

		return "redirect:/";
	}

	/*
	 * //이메일 중복확인(중복확인 버튼 활용)
	 * 
	 * @RequestMapping(value = "/repeatChk" , method = RequestMethod.POST, produces
	 * = "application/json; charset=utf-8") public @ResponseBody String
	 * repeatChkPost(HttpServletResponse response, @RequestParam("memberEmail")
	 * String memberEmail, Model model)throws Exception {
	 * 
	 * String chkResponse;
	 * 
	 * if(service.repeatChk(memberEmail) == true) { chkResponse =
	 * "{\"msg\":\""+"사용가능한 이메일 입니다."+"\"}"; }else { chkResponse =
	 * "{\"msg\":\""+"이미 가입된 이메일 입니다."+"\"}"; }
	 * 
	 * 
	 * URLEncoder.encode(chkResponse , "UTF-8");
	 * 
	 * 
	 * // model.addAttribute("msg", service.authenticate(email)); return
	 * chkResponse;
	 * 
	 * }
	 */

	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception {

		Object obj = session.getAttribute("login");

		if (obj != null) {
			MemberVO vo = (MemberVO) obj;

			session.removeAttribute("login");
			session.invalidate();

			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");

			if (loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);

				service.keepLogin(vo.getMemberID(), session.getId(), new Date());
			}
		}
		return "member/logout";
	}

	// 마이페이지 조회
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public void mypage(MemberVO vo, HttpSession session, Model model) throws Exception {

		Object obj = session.getAttribute("login");
		MemberVO memVO = (MemberVO) obj;
		
		logger.info(memVO.toString());
		service.viewMypage(memVO.getMemberEmail());

		model.addAttribute(service.viewMypage(memVO.getMemberEmail()));
		
	}

	// 대시보드형 마이페이지
	@RequestMapping(value = "/mypage2", method = RequestMethod.GET)
	public void mypage2(MemberVO vo, HttpSession session, Model model) throws Exception {

		Object obj = session.getAttribute("login");
		MemberVO memVO = (MemberVO) obj;

		service.mypage(memVO.getMemberID());

		model.addAttribute(service.mypage(memVO.getMemberID()));
	}

	// 비밀번호 수정
	@RequestMapping(value = "/changePassword", method = RequestMethod.POST)
	public String changePassword(MemberVO vo, HttpSession session, HttpServletRequest request, RedirectAttributes rttr)
			throws Exception {

		Object obj = session.getAttribute("login");
		MemberVO memVO = (MemberVO) obj;
		vo.setMemberID(memVO.getMemberID());

		System.out.println(vo);

		service.changePassword(vo);

		rttr.addFlashAttribute("msg", "success");

		return "redirect:/member/mypage2";
	}

	// 기존 비밀번호 확인(j-query validation)
	@RequestMapping(value = "/passwordChk", method = RequestMethod.GET)
	public @ResponseBody String passwordChk(MemberVO vo, HttpSession session, String curMemberPassword) throws Exception {

		Object obj = session.getAttribute("login");
		MemberVO memVO = (MemberVO) obj;
		memVO.setMemberPassword(curMemberPassword);
		
		System.out.println(curMemberPassword);
		System.out.println(memVO);
		
		if (service.passwordChk(memVO) == true) {
			return "true";
		} else {
			return "false";
		}
	}

	// 회원정보 수정페이지 조회
	@RequestMapping(value = "/updateMember", method = RequestMethod.GET)
	public void updateGET(MemberVO vo, HttpSession session, Model model) throws Exception {

		Object obj = session.getAttribute("login");
		MemberVO memVO = (MemberVO) obj;

		service.viewMypage(memVO.getMemberEmail());

		model.addAttribute(service.viewMypage(memVO.getMemberEmail()));
	}

	// 회원정보 수정
	@RequestMapping(value = "/updateMember", method = RequestMethod.POST)
	public String updatePost(MemberVO vo, HttpServletRequest request, RedirectAttributes rttr) throws Exception {

		HttpSession session = request.getSession();
		MemberVO memVO = (MemberVO) session.getAttribute("login");

		logger.info("회원정보 수정");

		String newNick = vo.getMemberName();
		memVO.setMemberName(newNick);

		service.updateMember(vo);

		rttr.addFlashAttribute("msg", "success");

		return "redirect:/member/mypage";
	}

	// 회원 탈퇴
	@RequestMapping(value = "/dropMember", method = RequestMethod.POST)
	public String remove(MemberVO vo, HttpServletRequest request, HttpServletResponse response, HttpSession session,
			RedirectAttributes rttr) throws Exception {

		Object obj = session.getAttribute("login");
		MemberVO memVo = (MemberVO) obj;

		if (obj != null) {
			session.removeAttribute("login");
			session.invalidate();

			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");

			if (loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
			}
		}

		service.dropMember(memVo.getMemberID());

		rttr.addFlashAttribute("msg", "delete");

		return "redirect:/";
	}

	// 유저 추천페이지 위한 설문(수정도 됨)페이지 제공
	@RequestMapping(value = "/register/detail", method = RequestMethod.GET)
	public String userDetail(MemberVO vo, Model model) throws Exception {

		return "member/userDetail";
	}

}

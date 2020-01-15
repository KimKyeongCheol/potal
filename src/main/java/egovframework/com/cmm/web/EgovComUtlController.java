package egovframework.com.cmm.web;

import egovframework.com.cmm.LoginVO;
import egovframework.let.sym.mnu.mpm.service.EgovMenuManageService;
import egovframework.let.sym.mnu.mpm.service.MenuManageVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.fdl.security.userdetails.util.EgovUserDetailsHelper;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 공통유틸리티성 작업을 위한 Controller 클래스
 * @author 공통 서비스 개발팀 JJY
 * @since 2009.03.02
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2009.03.02  JJY            최초 생성
 *  2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성
 *
 *  </pre>
 */
@Controller
public class EgovComUtlController {

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	/** EgovMenuManageService */
	@Resource(name = "meunManageService")
    private EgovMenuManageService menuManageService;

	/**
	 * JSP 호출작업만 처리하는 공통 함수
	 * 관리자용 메뉴 링크
	 */
	@RequestMapping(value = "/EgovPageLink.do")
	public String moveToPage(@RequestParam("link") String linkPage, HttpSession session, @RequestParam(value = "menuNo", required = false) String menuNo) {
		String link = linkPage;
		
		// service 사용하여 리턴할 결과값 처리하는 부분은 생략하고 단순 페이지 링크만 처리함
		if (linkPage == null || linkPage.equals("")) {
			link = "cmm/egovError";
		} else {
			if (link.indexOf(",") > -1) {
				link = link.substring(0, link.indexOf(","));
			}
		}
		// 선택된 메뉴정보를 세션으로 등록한다. // 뒤로가기기시 양식세로제출 출력 안하도록 삭제 .2019.11.08 
		if (menuNo != null && !menuNo.equals("")) {
			session.setAttribute("menuNo", menuNo);
		}
		return link;
	}
	
	/**
	 * JSP 호출작업만 처리하는 공통 함수
	 * @throws Exception 
	 * 사용자용 메뉴링크
	 */
	@RequestMapping(value = "/EgovPageLink_usr.do")
	public String moveToPage_usr(@ModelAttribute("menuManageVO") MenuManageVO menuManageVO, @RequestParam(value="link",  required = false) String linkPage, HttpSession session, @RequestParam(value = "menuNo", required = false) String menuNo, Model model) throws Exception {
		String link = linkPage;
		// service 사용하여 리턴할 결과값 처리하는 부분은 생략하고 단순 페이지 링크만 처리함
		if (linkPage == null || linkPage.equals("")) {
			// link 파라미터 없이 EgovPageLink_user.do 주소로 바로 접근시 처리    19.11.22
			String sessMenu = (String)session.getAttribute("menuNo");
		    int intMenu = Integer.parseInt(sessMenu);
			menuManageVO.setMenuNo(intMenu);
			
			link=(String)session.getAttribute("linkPage");
			
			
			//세션에 현재 페이지 url(linkPage)가 없을 경우 처리
			//link = "cmm/egovError";
		} else {
			if (link.indexOf(",") > -1) {
				link = link.substring(0, link.indexOf(","));
			}
		}
		/* 2019.11.11 콘텐츠페이지 수정 */
		String temp = "";
		
		temp = link.substring(link.indexOf(":") + 1);
		
		if(temp.startsWith("/EgovPageLink_usr.do")) {
			//현재 페이지 url 을 세션에 저장 19.11.22
			session.setAttribute("linkPage", linkPage);
			
			model.addAttribute("list", menuManageService.selectContentRoot());
			model.addAttribute("url", temp);
			
			return "/content";
		}else {
			
			return link;
		}
		/* 2019.11.11 콘텐츠페이지 수정 */
	}
	
	/**
	 *
	 * @throws Exception 
	 * 컨텐츠 이동 처리
	 */
	@RequestMapping(value = "/usr/contents.do")
public String moveContents(@ModelAttribute("menuManageVO") MenuManageVO menuManageVO, @RequestParam(value="url",  required = false) String url, HttpSession session, @RequestParam(value = "menuNo", required = false) String menuNo, Model model) throws Exception {
	

		session.setAttribute("url", url);
		
		model.addAttribute("list", menuManageService.selectContentRoot());
		model.addAttribute("url", url);		
		return "/content";
		
	}


	/**
	 * JSP 호출작업만 처리하는 공통 함수
	 */
	@RequestMapping(value = "/EgovPageLink.action")
	public String moveToPageAction(@RequestParam("link") String linkPage) {
		String link = linkPage;
		// service 사용하여 리턴할 결과값 처리하는 부분은 생략하고 단순 페이지 링크만 처리함
		if (linkPage == null || linkPage.equals("")) {
			link = "cmm/egovError";
		}
		return link;
	}

	/**
	 * validation rule dynamic java script
	 */
	@RequestMapping("/validator.do")
	public String validate() {
		return "cmm/validator";
	}

}
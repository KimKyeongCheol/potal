package egovframework.let.main.web;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.List;

import java.util.Map;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.LoginVO;
import egovframework.let.cop.bbs.service.BoardVO;
import egovframework.let.cop.bbs.service.EgovBBSManageService;
import egovframework.let.sym.cal.service.EgovCalRestdeManageService;
import egovframework.let.sym.cal.service.Restde;
import egovframework.let.sym.cal.service.RestdeVO;
import egovframework.let.sym.mnu.mpm.service.EgovMenuManageService;
import egovframework.let.sym.mnu.mpm.service.MenuManageVO;
import egovframework.let.uat.uia.service.EgovLoginService;
import egovframework.let.uss.ion.msi.service.EgovMainImageService;
import egovframework.let.uss.ion.msi.service.MainImageVO;
import egovframework.let.uss.ion.pwm.service.EgovPopupManageService;
import egovframework.let.uss.olh.faq.service.EgovFaqManageService;
import egovframework.let.uss.olh.faq.service.FaqManageDefaultVO;
import egovframework.let.uss.olp.qri.service.EgovQustnrRespondInfoService;

import egovframework.rte.fdl.security.userdetails.util.EgovUserDetailsHelper;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;


import egovframework.let.uss.ion.pwm.service.PopupManageVO;
/**
 * 템플릿 메인 페이지 컨트롤러 클래스(Sample 소스)
 * @author 실행환경 개발팀 JJY
 * @since 2011.08.31
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2011.08.31  JJY            최초 생성
 *
 * </pre>
 */
@Controller@SessionAttributes(types = ComDefaultVO.class)
public class EgovMainController {

	/**
	 * EgovBBSManageService
	 */
	@Resource(name = "EgovBBSManageService")
    private EgovBBSManageService bbsMngService;

	/** EgovMenuManageService */
	@Resource(name = "meunManageService")
    private EgovMenuManageService menuManageService;

	/** FaqManageService */
	@Resource(name = "FaqManageService")
    private EgovFaqManageService faqManageService;

	/** egovQustnrRespondInfoService */
	@Resource(name = "egovQustnrRespondInfoService")
	private EgovQustnrRespondInfoService egovQustnrRespondInfoService;

    @Resource(name = "egovMainImageService")
    private EgovMainImageService egovMainImageService;
	/** RestdeManageService */
	@Resource(name = "RestdeManageService")
    private EgovCalRestdeManageService restdeManageService;
	
	/** EgovPopupManageService */
	@Resource(name = "egovPopupManageService")
	private EgovPopupManageService egovPopupManageService;
	

	/** EgovLoginService */
	@Resource(name = "loginService")
	private EgovLoginService loginService;
	
	
	/**
	 * 메인 페이지에서 각 업무 화면으로 연계하는 기능을 제공한다.
	 *
	 * @param request
	 * @param commandMap
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/cmm/forwardPage.do")
	public String forwardPageWithMenuNo(HttpServletRequest request, @RequestParam Map<String, Object> commandMap)
	  throws Exception{
		return "";
	}

	/**
	 * 템플릿 메인 페이지 조회
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/mainPage.do")
	public String getMgtMainPage(HttpServletRequest request, ModelMap model)
	  throws Exception{
		
		BoardVO boardVO = new BoardVO();
		PaginationInfo paginationInfo = new PaginationInfo();
		// 게시판 전체글 메인 컨텐츠 조회 시작 ---------------------------------

		boardVO.setPageUnit(5);
		boardVO.setPageSize(10);

	

		paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
		paginationInfo.setPageSize(boardVO.getPageSize());

		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		Map<String, Object> all = bbsMngService.selectBoardAlls(boardVO);
		model.addAttribute("allList", all.get("resultList"));

		
		// 공지사항 메인 컨텐츠 조회 시작 ---------------------------------
	
		boardVO.setPageUnit(5);
		boardVO.setPageSize(10);
		boardVO.setBbsId("BBSMSTR_AAAAAAAAAAAA");

	

		paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
		paginationInfo.setPageSize(boardVO.getPageSize());

		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(3);

		Map<String, Object> map = bbsMngService.selectBoardArticles(boardVO, "BBSA02");
		model.addAttribute("notiList", map.get("resultList"));


		// 공지사항 메인컨텐츠 조회 끝 -----------------------------------

		//사업단소식 메인 컨텐츠 조회 시작 ---------------------------------
		boardVO.setPageUnit(9);
		boardVO.setPageSize(10);
		boardVO.setBbsId("BBSMSTR_000000000041");

		paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
		paginationInfo.setPageSize(boardVO.getPageSize());

		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(3);

		model.addAttribute("NewsList", bbsMngService.selectBoardArticles(boardVO, "BBSA02").get("resultList"));

		// 사업단소식 메인컨텐츠 조회 끝 -----------------------------------
		//언론보도 메인 컨텐츠 조회 시작 ---------------------------------
		boardVO.setPageUnit(9);
		boardVO.setPageSize(10);
		boardVO.setBbsId("BBSMSTR_000000000042");

		paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
		paginationInfo.setPageSize(boardVO.getPageSize());

		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(3);

		model.addAttribute("Press_releaseList", bbsMngService.selectBoardArticles(boardVO, "BBSA02").get("resultList"));

		//언론보도 메인컨텐츠 조회 끝 -----------------------------------
		
		//갤러리 메인 컨텐츠 조회 시작 ---------------------------------
		boardVO.setPageUnit(9);
		boardVO.setPageSize(10);
		boardVO.setBbsId("BBSMSTR_000000000021");

		paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
		paginationInfo.setPageSize(boardVO.getPageSize());

		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(3);

		model.addAttribute("GalleryList", bbsMngService.selectBoardArticles(boardVO, "BBSA02").get("resultList"));

		//갤러리 메인컨텐츠 조회 끝 -----------------------------------


		// FAQ 메인 컨텐츠 조회 시작 ---------------------------------
		/** EgovPropertyService.SiteList */
		FaqManageDefaultVO searchVO = new FaqManageDefaultVO();
		searchVO.setPageUnit(3);
    	searchVO.setPageSize(10);

    	/** pageing */
    	paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(6);

        model.addAttribute("faqList", faqManageService.selectFaqList(searchVO));

		// FAQ 메인 컨텐츠 조회 끝 -----------------------------------


     // 설문참여 메인 컨텐츠 조회 끝 -----------------------------------
        
        MainImageVO mainImageVO = new MainImageVO();
		List<MainImageVO> fileList = egovMainImageService.selectMainImageResult(mainImageVO);
		model.addAttribute("fileList", fileList);
		List<MainImageVO> fileSubList = egovMainImageService.selectSubImageResult(mainImageVO);
		model.addAttribute("fileSubList", fileSubList);
		
      // 달력 메인 컨텐츠 조회 시작 -----------------------------------       
        
        Restde restde= new Restde();

    	RestdeVO searchVO1 = new RestdeVO();
		Calendar cal = Calendar.getInstance();

		if(restde.getYear()==null || restde.getYear().equals("")){
			restde.setYear(Integer.toString(cal.get(Calendar.YEAR)));
		}
		if(restde.getMonth()==null || restde.getMonth().equals("")){
			restde.setMonth(Integer.toString(cal.get(Calendar.MONTH)+1));
		}
		int iYear  = Integer.parseInt(restde.getYear());
		int iMonth = Integer.parseInt(restde.getMonth());

		if (iMonth<1){
			iYear--;
			iMonth = 12;
		}
		if (iMonth>12){
			iYear++;
			iMonth = 1;
		}
		if (iYear<1){
			iYear = 1;
			iMonth = 1;
		}
		if (iYear>9999){
			iYear = 9999;
			iMonth = 12;
		}
		restde.setYear(Integer.toString(iYear));
		restde.setMonth(Integer.toString(iMonth));
		
		cal.set(iYear,iMonth-1,1);
		
		restde.setStartWeekMonth(cal.get(Calendar.DAY_OF_WEEK));
		restde.setLastDayMonth(cal.getActualMaximum(Calendar.DATE));

/*        model.addAttribute("resultList", restdeManageService.selectNormalRestdePopup(restde));
        model.addAttribute("RestdeList", restdeManageService.selectNormalMonthRestde(restde));
*/
		String dYear=Integer.toString(cal.get(Calendar.YEAR));
		String NextYear=Integer.toString(cal.get(Calendar.YEAR)+1);
		String prevYear=Integer.toString(cal.get(Calendar.YEAR)-1);
		String PrevMonth = Integer.toString(cal.get(Calendar.MONTH));
		String NextMonth = Integer.toString(cal.get(Calendar.MONTH)+2);
		String Month = Integer.toString(cal.get(Calendar.MONTH)+1);
		String PrevDay = "";
		String NextDay = "";
		
		String NextYM="";
		String PrevYM="";
		
		if(Month.equals(Integer.toString(12))) {
	
			NextMonth = Integer.toString(1);
			
			if(PrevDay == "") {
				cal.set(Integer.parseInt(dYear), Integer.parseInt(PrevMonth),1);
				PrevDay =Integer.toString(cal.get(Calendar.DAY_OF_MONTH));
			}
			if(NextDay == "") {
				cal.set(Integer.parseInt(dYear), Integer.parseInt(NextMonth),1);
				NextDay=Integer.toString(cal.getActualMaximum(Calendar.DATE)) ;
				
			}
			 NextYM=dYear+"-"+NextMonth+"-"+NextDay;
			 PrevYM=dYear+"-"+PrevMonth+"-"+PrevDay;
		}else if (Month.equals(Integer.toString(1))){
			
			
			PrevMonth = Integer.toString(12);
			
			if(PrevDay == "") {
				cal.set(Integer.parseInt(dYear), Integer.parseInt(PrevMonth),1);
				PrevDay =Integer.toString(cal.get(Calendar.DAY_OF_MONTH));
			}
			if(NextDay == "") {
				cal.set(Integer.parseInt(dYear), Integer.parseInt(NextMonth),1);
				NextDay=Integer.toString(cal.getActualMaximum(Calendar.DATE)) ;
				
			}
			 NextYM=dYear+"-"+NextMonth+"-"+NextDay;
			 PrevYM=dYear+"-"+PrevMonth+"-"+PrevDay;
			
		}else{
			if(PrevDay == "") {
				cal.set(Integer.parseInt(dYear), Integer.parseInt(PrevMonth),1);
				PrevDay =Integer.toString(cal.get(Calendar.DAY_OF_MONTH));
			}
			if(NextDay == "") {
				cal.set(Integer.parseInt(dYear), Integer.parseInt(NextMonth),1);
				NextDay=Integer.toString(cal.getActualMaximum(Calendar.DATE)) ;
				
			}
			
		 NextYM=dYear+"-"+NextMonth+"-"+NextDay;
		 PrevYM=dYear+"-"+PrevMonth+"-"+PrevDay;
		}
		
		searchVO1.setNextYM(NextYM);
		searchVO1.setPrevYM(PrevYM);

	
	
        List<?> CalInfoList = restdeManageService.selectMainCalList(searchVO1);


        List<?> NormalMonthRestdeList = restdeManageService.selectNormalMonthRestde(restde);
		PopupManageVO popupManageVO = new PopupManageVO();
		List<?> reusltList = egovPopupManageService.selectPopupMainList(popupManageVO );
		model.addAttribute("popupList", reusltList);

      model.addAttribute("calList", CalInfoList);
        model.addAttribute("RestdeList", NormalMonthRestdeList);
        model.addAttribute("toDay",cal.get(Calendar.DATE));
     // 달력 메인 컨텐츠 조회 끝 -----------------------------------  
        
		return "usr/EgovMainView";
	}
	
	/**
	 * 템플릿 관리자 메인페이지
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/AdminPage.do")
	public String getAdminMainPage(HttpServletRequest request, ModelMap model, HttpSession session, HttpServletResponse response)
	  throws Exception{
		
		LoginVO user =	EgovUserDetailsHelper.isAuthenticated()? (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser():null;
	   
		
		
		if(user != null) {
			 
			LoginVO loginVO =  new LoginVO();
			
			loginVO.setId(user.getId());
			loginVO.setUniqId(user.getUniqId());
			
			LoginVO resultVO =  new LoginVO();
			
			 resultVO = loginService.admin_chk(loginVO);
			 
			 if("ROLE_ADMIN".equals(resultVO.getCode())) {
		if(EgovUserDetailsHelper.isAuthenticated() && user!=null){


		// 공지사항 메인 컨텐츠 조회 시작 ---------------------------------
		BoardVO boardVO = new BoardVO();
		boardVO.setPageUnit(5);
		boardVO.setPageSize(10);
		boardVO.setBbsId("BBSMSTR_AAAAAAAAAAAA");

		PaginationInfo paginationInfo = new PaginationInfo();

		paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
		paginationInfo.setPageSize(boardVO.getPageSize());

		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		Map<String, Object> map = bbsMngService.selectBoardArticles(boardVO, "BBSA02");
		model.addAttribute("notiList", map.get("resultList"));


		// 공지사항 메인컨텐츠 조회 끝 -----------------------------------

		// 자유게시판 메인 컨텐츠 조회 시작 ---------------------------------
		boardVO.setPageUnit(9);
		boardVO.setPageSize(10);
		boardVO.setBbsId("BBSMSTR_BBBBBBBBBBBB");

		paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
		paginationInfo.setPageSize(boardVO.getPageSize());

		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		model.addAttribute("bbsList", bbsMngService.selectBoardArticles(boardVO, "BBSA02").get("resultList"));

		// 자유게시판 메인컨텐츠 조회 끝 -----------------------------------



		// FAQ 메인 컨텐츠 조회 시작 ---------------------------------
		/** EgovPropertyService.SiteList */
		FaqManageDefaultVO searchVO = new FaqManageDefaultVO();
		searchVO.setPageUnit(3);
    	searchVO.setPageSize(10);

    	/** pageing */
    	paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        model.addAttribute("faqList", faqManageService.selectFaqList(searchVO));

		// FAQ 메인 컨텐츠 조회 끝 -----------------------------------

        // 설문참여 메인 컨텐츠 조회 시작 -----------------------------------
        ComDefaultVO qVO = new ComDefaultVO();
    	qVO.setPageUnit(1);
    	qVO.setPageSize(10);

    	/** pageing */
		paginationInfo.setCurrentPageNo(qVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(qVO.getPageUnit());
		paginationInfo.setPageSize(qVO.getPageSize());

		qVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		qVO.setLastIndex(paginationInfo.getLastRecordIndex());
		qVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        model.addAttribute("qriList", egovQustnrRespondInfoService.selectQustnrRespondInfoManageList(qVO));

     // 설문참여 메인 컨텐츠 조회 끝 -----------------------------------
       /* HttpSession session=request.getSession();*/
		session.setAttribute("menuNo", 5000000);
		
		/*20191112 관리자 메인 페이지 이동주소  수정*/
		return "redirect:/uss/umt/mber/EgovMberManage.do";
		/*return "admin/EgovMainView";*/
	    	}else{
	    return "uat/uia/EgovLoginAdmin";
	    	}
			 }else {
					return "cmm/error/Authority_check";
				 
			 }
	    }else {
	    	return "uat/uia/EgovLoginAdmin";
	    }
	}

	/**
	 * 템플릿 단당자 메인 페이지
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/ManagerPage.do")
	public String getManagerMainPage(HttpServletRequest request, ModelMap model)
	  throws Exception{

		// 공지사항 메인 컨텐츠 조회 시작 ---------------------------------
		BoardVO boardVO = new BoardVO();
		boardVO.setPageUnit(5);
		boardVO.setPageSize(10);
		boardVO.setBbsId("BBSMSTR_AAAAAAAAAAAA");

		PaginationInfo paginationInfo = new PaginationInfo();

		paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
		paginationInfo.setPageSize(boardVO.getPageSize());

		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		Map<String, Object> map = bbsMngService.selectBoardArticles(boardVO, "BBSA02");
		model.addAttribute("notiList", map.get("resultList"));


		// 공지사항 메인컨텐츠 조회 끝 -----------------------------------

		// 자유게시판 메인 컨텐츠 조회 시작 ---------------------------------
		boardVO.setPageUnit(9);
		boardVO.setPageSize(10);
		boardVO.setBbsId("BBSMSTR_BBBBBBBBBBBB");

		paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
		paginationInfo.setPageSize(boardVO.getPageSize());

		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		model.addAttribute("bbsList", bbsMngService.selectBoardArticles(boardVO, "BBSA02").get("resultList"));

		// 자유게시판 메인컨텐츠 조회 끝 -----------------------------------



		// FAQ 메인 컨텐츠 조회 시작 ---------------------------------
		/** EgovPropertyService.SiteList */
		FaqManageDefaultVO searchVO = new FaqManageDefaultVO();
		searchVO.setPageUnit(3);
    	searchVO.setPageSize(10);

    	/** pageing */
    	paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        model.addAttribute("faqList", faqManageService.selectFaqList(searchVO));

		// FAQ 메인 컨텐츠 조회 끝 -----------------------------------

        // 설문참여 메인 컨텐츠 조회 시작 -----------------------------------
        ComDefaultVO qVO = new ComDefaultVO();
    	qVO.setPageUnit(1);
    	qVO.setPageSize(10);

    	/** pageing */
		paginationInfo.setCurrentPageNo(qVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(qVO.getPageUnit());
		paginationInfo.setPageSize(qVO.getPageSize());

		qVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		qVO.setLastIndex(paginationInfo.getLastRecordIndex());
		qVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        model.addAttribute("qriList", egovQustnrRespondInfoService.selectQustnrRespondInfoManageList(qVO));

     // 설문참여 메인 컨텐츠 조회 끝 -----------------------------------
  

		return "manager/EgovMainView";
	}
	

    /**
     * Head메뉴를 조회한다.
     * @param menuManageVO MenuManageVO
     * @return 출력페이지정보 "main_headG", "main_head"
     * @exception Exception
     */
    @RequestMapping(value="/sym/mms/EgovMainMenuHead.do")
    public String selectMainMenuHead(
    		@ModelAttribute("menuManageVO") MenuManageVO menuManageVO,
    		@RequestParam(value="flag", required=false) String flag,
    		ModelMap model, HttpServletRequest request)
            throws Exception {

    	LoginVO user =
    		EgovUserDetailsHelper.isAuthenticated()? (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser():null;
    	if(EgovUserDetailsHelper.isAuthenticated() && user!=null){
    		menuManageVO.setTmp_Id(user.getId());
        	menuManageVO.setTmp_Password(user.getPassword());
        	menuManageVO.setTmp_UserSe(user.getUserSe());
        	menuManageVO.setTmp_Name(user.getName());
        	menuManageVO.setTmp_Email(user.getEmail());
        	menuManageVO.setTmp_OrgnztId(user.getOrgnztId());
        	menuManageVO.setTmp_UniqId(user.getUniqId());
/*        	menuManageVO.setAuthorCode(user.);*/
/*    		model.addAttribute("list_headmenu", menuManageService.selectMainMenuHead(menuManageVO));*/
    		model.addAttribute("list_headmenu", menuManageService.selectMainMenuHead(menuManageVO));
    		model.addAttribute("list_menulist", menuManageService.selectMainMenuLeft(menuManageVO));
    		model.addAttribute("list_submenu", menuManageService.selectMainSubMenuHeadByUser(menuManageVO));

    	}else{
    		menuManageVO.setAuthorCode("ROLE_ANONYMOUS");
    		model.addAttribute("list_headmenu", menuManageService.selectMainMenuHeadByUser(menuManageVO));
    		model.addAttribute("list_menulist", menuManageService.selectMainMenuLeftByAuthor(menuManageVO));
    		model.addAttribute("list_submenu", menuManageService.selectSubMenuHeadByUser(menuManageVO));
    	}
		
	    	if(flag==null){
	    		return "usr/inc/EgovIncSubHeader"; // 서브화면의 상단메뉴 화면
	    	}else if(flag.equals("MAIN")){
	    		return "usr/inc/EgovIncHeader"; // 메인화면의 상단메뉴 화면
	    	}else{
	    		return "usr/inc/EgovIncSubHeader"; //  서브화면의 상단메뉴 화면
	    	}
    }
    
    /**
     * 관리자 페이지 Head메뉴를 조회한다.
     * @param menuManageVO MenuManageVO
     * @return 출력페이지정보 "main_headG", "main_head"
     * @exception Exception
     */
    @RequestMapping(value="/sym/mms/EgovMainMenuHeadAdmin.do")
    public String selectMainMenuHeadAdmin(
    		@ModelAttribute("menuManageVO") MenuManageVO menuManageVO,
    		@RequestParam(value="flag", required=false) String flag,
    		ModelMap model, HttpServletRequest request)
            throws Exception {
    	LoginVO user =
    		EgovUserDetailsHelper.isAuthenticated()? (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser():null;

    		if(EgovUserDetailsHelper.isAuthenticated() && user!=null){

    	
    		menuManageVO.setTmp_Id(user.getId());
        	menuManageVO.setTmp_Password(user.getPassword());
        	menuManageVO.setTmp_UserSe(user.getUserSe());
        	menuManageVO.setTmp_Name(user.getName());
        	menuManageVO.setTmp_Email(user.getEmail());
        	menuManageVO.setTmp_OrgnztId(user.getOrgnztId());
        	menuManageVO.setTmp_UniqId(user.getUniqId());
    		model.addAttribute("list_headmenu", menuManageService.selectMainMenuHead(menuManageVO));
    		model.addAttribute("list_menulist", menuManageService.selectMainMenuLeft(menuManageVO));

    	}else{
    	
   		/*menuManageVO.setAuthorCode("ROLE_ANONYMOUS");
    		model.addAttribute("list_headmenu", menuManageService.selectMainMenuHeadByAuthor(menuManageVO));
    		model.addAttribute("list_menulist", menuManageService.selectMainMenuLeftByAuthor(menuManageVO));*/
 
    		return "admin/inc/EgovIncSubHeader";
    	}
    	
		
	    	if(flag==null){
	    		return "admin/inc/EgovIncSubHeader"; // 업무화면의 상단메뉴 화면
	    	}else if(flag.equals("MAIN")){
	    		return "admin/inc/EgovIncHeader"; // 메인화면의 상단메뉴 화면
	    	}else{
	    		return "admin/inc/EgovIncSubHeader"; // 업무화면의 상단메뉴 화면
	    	}
    }

    /**
     * 담당자 페이지 Head메뉴를 조회한다.
     * @param menuManageVO MenuManageVO
     * @return 출력페이지정보 "main_headG", "main_head"
     * @exception Exception
     */
    @RequestMapping(value="/sym/mms/EgovMainMenuHeadManager.do")
    public String selectMainMenuHeadManager(
    		@ModelAttribute("menuManageVO") MenuManageVO menuManageVO,
    		@RequestParam(value="flag", required=false) String flag,
    		ModelMap model, HttpServletRequest request)
            throws Exception {

    	LoginVO user =
    		EgovUserDetailsHelper.isAuthenticated()? (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser():null;
    	if(EgovUserDetailsHelper.isAuthenticated() && user!=null){
    		menuManageVO.setTmp_Id(user.getId());
        	menuManageVO.setTmp_Password(user.getPassword());
        	menuManageVO.setTmp_UserSe(user.getUserSe());
        	menuManageVO.setTmp_Name(user.getName());
        	menuManageVO.setTmp_Email(user.getEmail());
        	menuManageVO.setTmp_OrgnztId(user.getOrgnztId());
        	menuManageVO.setTmp_UniqId(user.getUniqId());
    		model.addAttribute("list_headmenu", menuManageService.selectMainMenuHead(menuManageVO));
    		model.addAttribute("list_menulist", menuManageService.selectMainMenuLeft(menuManageVO));

    	}else{
    		menuManageVO.setAuthorCode("ROLE_ANONYMOUS");
    		model.addAttribute("list_headmenu", menuManageService.selectMainMenuHeadByAuthor(menuManageVO));
    		model.addAttribute("list_menulist", menuManageService.selectMainMenuLeftByAuthor(menuManageVO));
    	}
		
	    	if(flag==null){
	    		return "manaer/inc/EgovIncSubHeader"; // 업무화면의 상단메뉴 화면
	    	}else if(flag.equals("MAIN")){
	    		return "manager/inc/EgovIncHeader"; // 메인화면의 상단메뉴 화면
	    	}else{
	    		return "manager/inc/EgovIncSubHeader"; // 업무화면의 상단메뉴 화면
	    	}
    }

    /**
     * 좌측메뉴를 조회한다.
     * @param menuManageVO MenuManageVO
     * @param vStartP      String
     * @return 출력페이지정보 "main_left"
     * @exception Exception
     */
    @RequestMapping(value="/sym/mms/EgovMainMenuLeft.do")
    public String selectMainMenuLeft(
    		ModelMap model)
            throws Exception {

    	//LoginVO user = EgovUserDetailsHelper.isAuthenticated()? (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser():null;

    	//LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
    	if(EgovUserDetailsHelper.isAuthenticated()){
    		//인증된 경우 처리할 사항 추가 ...
    		model.addAttribute("lastLogoutDateTime", "로그아웃 타임: 2011-11-10 11:30");
    		//최근 로그아웃 시간 등에 대한 확보 후 메인 컨텐츠로 활용
    	}

      	return "admin/inc/EgovIncLeftmenu";
    }
    
    /**
     * 기타메뉴(이용안내, mypage 출력을)
     * @param menuManageVO MenuManageVO
     * @return 출력페이지정보 "main_headG", "main_head"
     * @exception Exception
     */
    @RequestMapping(value="/OtherMenu.do")
    public String other_menu_user(
    		@ModelAttribute("menuManageVO") MenuManageVO menuManageVO,
    		ModelMap model, HttpServletRequest request)
            throws Exception {

    	LoginVO user =
    		EgovUserDetailsHelper.isAuthenticated()? (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser():null;
    		
    		menuManageVO.setTmp_Id(user.getId());
        	menuManageVO.setTmp_Password(user.getPassword());
        	menuManageVO.setTmp_UserSe(user.getUserSe());
        	menuManageVO.setTmp_Name(user.getName());
        	menuManageVO.setTmp_Email(user.getEmail());
        	menuManageVO.setTmp_OrgnztId(user.getOrgnztId());
        	menuManageVO.setTmp_UniqId(user.getUniqId());
        	
/*        	menuManageVO.setAuthorCode(user.);*/
/*    		model.addAttribute("list_headmenu", menuManageService.selectMainMenuHead(menuManageVO));*/
    		model.addAttribute("list_headmenu", menuManageService.selectMainMenuHead(menuManageVO));
    		model.addAttribute("list_menulist", menuManageService.selectMainMenuLeft(menuManageVO));
    		model.addAttribute("list_submenu", menuManageService.selectMainSubMenuHeadByUser(menuManageVO));


	    		return "usr/other_menu_page"; //  서브화면의 상단메뉴 화면

    }
    
    
    @RequestMapping(value="/selectPopUp.do")
    private String selectPopUp(@ModelAttribute("Code") String Code) {

    	System.out.println("Code :" +Code);
    	String url="";
    	if(Code.equals("Privacy")) {
    		url="usr/umt/Privacy_popup";
    	}else if(Code.equals("Terms_of_Use")){
    		url="usr/umt/Terms_of_Use_popup";
    	}
    	
    		  return url;

	}
   
    
}
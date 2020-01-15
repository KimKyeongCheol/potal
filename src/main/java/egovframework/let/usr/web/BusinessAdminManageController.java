/* 2019.12.10 사업신청 추가 */
package egovframework.let.usr.web;

import java.util.*;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.let.usr.service.BusinessAdminManageService;
import egovframework.let.usr.dto.BusinessVO;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.fdl.security.userdetails.util.EgovUserDetailsHelper;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class BusinessAdminManageController {

	@Resource(name = "BusinessAdminManageService")
	private BusinessAdminManageService bms;

	@Resource(name = "EgovFileMngService")
	private EgovFileMngService fileMngService;

	@Resource(name = "EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertyService;

	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	protected String unscript(String data) {
		if (data == null || data.trim().equals("")) {
			return "";
		}

		String ret = data;

		ret = ret.replaceAll("<(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "&lt;script");
		ret = ret.replaceAll("</(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "&lt;/script");

		ret = ret.replaceAll("<(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "&lt;object");
		ret = ret.replaceAll("</(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "&lt;/object");

		ret = ret.replaceAll("<(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "&lt;applet");
		ret = ret.replaceAll("</(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "&lt;/applet");

		ret = ret.replaceAll("<(E|e)(M|m)(B|b)(E|e)(D|d)", "&lt;embed");
		ret = ret.replaceAll("</(E|e)(M|m)(B|b)(E|e)(D|d)", "&lt;embed");

		ret = ret.replaceAll("<(F|f)(O|o)(R|r)(M|m)", "&lt;form");
		ret = ret.replaceAll("</(F|f)(O|o)(R|r)(M|m)", "&lt;form");

		return ret;
	}
	
	//목록
	@RequestMapping("/business_admin_list.do")
	public String selectBoardArticles_user(@ModelAttribute("searchVO") BusinessVO bVO, ModelMap model,
			HttpServletRequest request) throws Exception {

		LoginVO user;
		if (EgovUserDetailsHelper.isAuthenticated()) {
			user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		} else {
			user = new LoginVO();
			user.setUniqId("anonymous");
		}
		
		bVO.setW_name(user.getName());

		bVO.setPageUnit(propertyService.getInt("pageUnit"));
		bVO.setPageSize(propertyService.getInt("pageSize"));
		
		PaginationInfo paginationInfo = new PaginationInfo();

		paginationInfo.setCurrentPageNo(bVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(bVO.getPageUnit());
		paginationInfo.setPageSize(bVO.getPageSize());

		bVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		bVO.setLastIndex(paginationInfo.getLastRecordIndex());
		bVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		Map<String, Object> map = bms.selectList(bVO);
		int totCnt = Integer.parseInt((String) map.get("resultCnt"));

		paginationInfo.setTotalRecordCount(totCnt);

		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("paginationInfo", paginationInfo);		
		
		System.out.println("getSearchType : " + bVO.getSearchType());
		System.out.println("getSearchWord : " + bVO.getSearchWord());

		return "usr/business/AdminList";

	}

	//상세
	@RequestMapping("/business_admin_view.do")
	public String selectBoardArticle(@ModelAttribute("searchVO") BusinessVO bVO, ModelMap model,
			HttpServletRequest request) throws Exception {

		LoginVO user = new LoginVO();
		if (EgovUserDetailsHelper.isAuthenticated()) {
			user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		}
		
		String seq = request.getParameter("seq");
		
		if(!seq.equals("")) {
			bVO.setSeq(Integer.parseInt(seq));
		}

		BusinessVO vo = bms.selectView(bVO);

		model.addAttribute("result", vo);

		return "usr/business/AdminView";
	}

	//수정
	@RequestMapping("/updateBusiness_admin.do")
	public String updateBusiness(@ModelAttribute("searchVO") BusinessVO bVO, ModelMap model, HttpServletRequest request) throws Exception {

		BusinessVO vo = bms.selectView(bVO);

		model.addAttribute("result", vo);

		return "usr/business/AdminUpdt";
	}
	
	//수정프로세스
	@RequestMapping("/updateBusiness_admin_proc.do")
	public String updateBusinessProc(final MultipartHttpServletRequest multiRequest,
			@ModelAttribute("searchVO") BusinessVO bVO, ModelMap model)
			throws Exception {

		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		String atchFileId = bVO.getAtchFileId();

		if (isAuthenticated) {
			final Map<String, MultipartFile> files = multiRequest.getFileMap();
			if (!files.isEmpty()) {
				if ("".equals(atchFileId)) {
					List<FileVO> result = fileUtil.parseFileInf(files, "BBS_", 0, atchFileId, "");
					atchFileId = fileMngService.insertFileInfs(result);
					bVO.setFile(atchFileId);
				} else {
					FileVO fvo = new FileVO();
					fvo.setAtchFileId(atchFileId);
					int cnt = fileMngService.getMaxFileSN(fvo);
					List<FileVO> _result = fileUtil.parseFileInf(files, "BBS_", cnt, atchFileId, "");
					fileMngService.updateFileInfs(_result);
				}
			}

			bms.updateBusiness(bVO);
		}

		return "redirect:/business_admin_view.do?seq=" + bVO.getSeq();
	}
	
	//삭제프로세스
	@RequestMapping("/deleteBusiness_admin_proc.do")
	public String deleteBusiness(@ModelAttribute("searchVO") BusinessVO bVO, ModelMap model) throws Exception {

		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		if (isAuthenticated) {
			bms.deleteBusiness(bVO);
		}

		return "redirect:/business_admin_list.do";
	}

}
/* 2019.12.10 사업신청 추가 */
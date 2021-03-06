/* 2019.12.10 사업신청 추가 */
package egovframework.let.usr.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.let.usr.dao.BusinessManageDAO;
import egovframework.let.usr.dto.BusinessVO;
import egovframework.let.usr.service.BusinessManageService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.property.EgovPropertyService;

@Service("BusinessManageService")
public class BusinessManageServiceImpl extends EgovAbstractServiceImpl implements BusinessManageService {

	@Resource(name = "BusinessManageDAO")
	private BusinessManageDAO bmd;

	@Resource(name = "EgovFileMngService")
	private EgovFileMngService fileService;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertyService;

	public void insert(BusinessVO bVO) throws Exception {
		bmd.insert(bVO);
	}
	
	public Map<String, Object> selectList(BusinessVO bVO) throws Exception {
		List<BusinessVO> list = bmd.selectList(bVO);
		List<BusinessVO> result = new ArrayList<BusinessVO>();
		result = list;
		
		int cnt = bmd.selectListCnt(bVO);
		
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("resultList", result);
		map.put("resultCnt", Integer.toString(cnt));

		return map;
	}
	
	public BusinessVO selectView(BusinessVO bVO) throws Exception {		
		return bmd.selectView(bVO);
	}
	
	public void updateBusiness(BusinessVO bVO) throws Exception {
		bmd.updateBusiness(bVO);
	}
	
	public void deleteBusiness(BusinessVO bVO) throws Exception {
		bmd.deleteBusiness(bVO);
	}
	
	public String getCert(String w_name) throws Exception {
		String name = bmd.getCert(w_name);
		return name;
	}

}
/* 2019.12.10 사업신청 추가 */
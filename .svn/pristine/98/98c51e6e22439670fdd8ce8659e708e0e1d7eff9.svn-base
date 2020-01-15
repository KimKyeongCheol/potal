/* 2019.12.10 사업신청 추가 */
package egovframework.let.usr.dao;

import egovframework.let.usr.dto.BusinessVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository("BusinessManageDAO")
public class BusinessManageDAO extends EgovAbstractDAO {

	public void insert(BusinessVO bVO) throws Exception {
		insert("BusinessManageDAO.insert", bVO);
	}

	@SuppressWarnings("unchecked")
	public List<BusinessVO> selectList(BusinessVO bVO) throws Exception {
		return (List<BusinessVO>) list("BusinessManageDAO.selectList", bVO);
	}

	public int selectListCnt(BusinessVO bVO) throws Exception {
		return (Integer) select("BusinessManageDAO.selectListCnt", bVO);
	}

	public BusinessVO selectView(BusinessVO bVO) throws Exception {
		return (BusinessVO) select("BusinessManageDAO.selectView", bVO);
	}
	
	public void updateBusiness(BusinessVO bVO) throws Exception {
		update("BusinessManageDAO.updateBusiness", bVO);
	}
	
	public void deleteBusiness(BusinessVO bVO) throws Exception {
		update("BusinessManageDAO.deleteBusiness", bVO);
	}
	
	public String getCert(String w_name) throws Exception {
		String name = (String) select("BusinessManageDAO.getCert", w_name);
		return name;
	}

}
/* 2019.12.10 사업신청 추가 */
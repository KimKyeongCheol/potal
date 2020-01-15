/* 2019.12.10 사업신청 추가 */
package egovframework.let.usr.dao;

import egovframework.let.usr.dto.BusinessVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository("BusinessAdminManageDAO")
public class BusinessAdminManageDAO extends EgovAbstractDAO {

	public void insert(BusinessVO bVO) throws Exception {
		insert("BusinessAdminManageDAO.insert", bVO);
	}

	@SuppressWarnings("unchecked")
	public List<BusinessVO> selectList(BusinessVO bVO) throws Exception {
		return (List<BusinessVO>) list("BusinessAdminManageDAO.selectList", bVO);
	}

	public int selectListCnt(BusinessVO bVO) throws Exception {
		return (Integer) select("BusinessAdminManageDAO.selectListCnt", bVO);
	}

	public BusinessVO selectView(BusinessVO bVO) throws Exception {
		return (BusinessVO) select("BusinessAdminManageDAO.selectView", bVO);
	}
	
	public void updateBusiness(BusinessVO bVO) throws Exception {
		update("BusinessAdminManageDAO.updateBusiness", bVO);
	}
	
	public void deleteBusiness(BusinessVO bVO) throws Exception {
		update("BusinessAdminManageDAO.deleteBusiness", bVO);
	}

}
/* 2019.12.10 사업신청 추가 */
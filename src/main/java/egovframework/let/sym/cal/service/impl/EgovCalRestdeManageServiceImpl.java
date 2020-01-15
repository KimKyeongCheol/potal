package egovframework.let.sym.cal.service.impl;

import java.util.List;

import egovframework.let.sym.cal.service.EgovCalRestdeManageService;
import egovframework.let.sym.cal.service.Restde;
import egovframework.let.sym.cal.service.RestdeVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;



/**
 *
 * 일정에 대한 서비스 구현클래스를 정의한다
 * @author 공통서비스 개발팀 이중호
 * @since 2009.04.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.04.01  이중호          최초 생성
 *
 * </pre>
 */
@Service("RestdeManageService")
public class EgovCalRestdeManageServiceImpl extends EgovAbstractServiceImpl implements EgovCalRestdeManageService {

    @Resource(name="RestdeManageDAO")
    private RestdeManageDAO restdeManageDAO;

	/**
	 * 일반달력 팝업 정보를 조회한다.
	 */
    @Override
	public List<?> selectNormalRestdePopup(Restde restde) throws Exception {
		return restdeManageDAO.selectNormalRestdePopup(restde);
	}

	/**
	 * 행정달력 팝업 정보를 조회한다.
	 */
    @Override
	public List<?> selectAdministRestdePopup(Restde restde) throws Exception {
		return restdeManageDAO.selectAdministRestdePopup(restde);
	}

	/**
	 * 일반달력 일간 정보를 조회한다.
	 */
    @Override
	public List<?> selectNormalDayCal(Restde restde) throws Exception {
		return restdeManageDAO.selectNormalDayCal(restde);
	}

	/**
	 * 일반달력 일간 일정을 조회한다.
	 */
    @Override
	public List<?> selectNormalDayRestde(Restde restde) throws Exception {
		return restdeManageDAO.selectNormalDayRestde(restde);
	}

	/**
	 * 일반달력 월간 일정을 조회한다.
	 */
    @Override
	public List<?> selectNormalMonthRestde(Restde restde) throws Exception {
		return restdeManageDAO.selectNormalMonthRestde(restde);
	}

	/**
	 * 행정달력 일간 정보를 조회한다.
	 */
    @Override
	public List<?> selectAdministDayCal(Restde restde) throws Exception {
		return restdeManageDAO.selectAdministDayCal(restde);
	}

	/**
	 * 행정달력 일간 일정을 조회한다.
	 */
    @Override
	public List<?> selectAdministDayRestde(Restde restde) throws Exception {
		return restdeManageDAO.selectAdministDayRestde(restde);
	}

    /**
	 * 행정달력 월간 일정을 조회한다.
	 */
    @Override
	public List<?> selectAdministMonthRestde(Restde restde) throws Exception {
		return restdeManageDAO.selectAdministMonthRestde(restde);
	}

    /**
	 * 일정을 삭제한다.
	 */
	@Override
	public void deleteRestde(Restde restde) throws Exception {
		restdeManageDAO.deleteRestde(restde);
	}

	/**
	 * 일정을 등록한다.
	 */
	@Override
	public void insertRestde(Restde restde) throws Exception {
    	restdeManageDAO.insertRestde(restde);
	}

	/**
	 * 일정 상세항목을 조회한다.
	 */
	@Override
	public Restde selectRestdeDetail(Restde restde) throws Exception {
    	Restde ret = restdeManageDAO.selectRestdeDetail(restde);
    	return ret;
	}

	/**
	 * 일정 목록을 조회한다.
	 */
	@Override
	public List<?> selectRestdeList(RestdeVO searchVO) throws Exception {
        return restdeManageDAO.selectRestdeList(searchVO);
	}

	/**
	 * 일정 총 갯수를 조회한다.
	 */
	@Override
	public int selectRestdeListTotCnt(RestdeVO searchVO) throws Exception {
        return restdeManageDAO.selectRestdeListTotCnt(searchVO);
	}

	/**
	 * 일정을 수정한다.
	 */
	@Override
	public void updateRestde(Restde restde) throws Exception {
		restdeManageDAO.updateRestde(restde);
	}
	
	/**
	 * 메인화면 일정 목록을 조회한다.
	 */
	@Override
	public List<?> selectMainCalList(RestdeVO searchVO) throws Exception {
        return restdeManageDAO.selectMainCalList(searchVO);
	}

}

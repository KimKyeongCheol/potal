package egovframework.let.sym.schdule.service.impl;

import java.util.List;

import egovframework.let.sym.schdule.service.Schedule;
import egovframework.let.sym.schdule.service.ScheduleVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

import org.springframework.stereotype.Repository;

/**
 *
 * 일정에 대한 데이터 접근 클래스를 정의한다
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
 *   2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성
 *
 * </pre>
 */
@Repository("ScheduleManageDAO")
public class ScheduleManageDAO extends EgovAbstractDAO {

	/**
	 * 일반달력 팝업 정보를 조회한다.
	 * @param schedule
	 * @return List(일반달력 팝업 날짜정보)
	 * @throws Exception
	 */
    public List<?> selectNormalSchedulePopup(Schedule schedule) throws Exception {
        return list("ScheduleManageDAO.selectNormalSchedulePopup", schedule);
	}

	/**
	 * 행정달력 팝업 정보를 조회한다.
	 * @param schedule
	 * @return List(행정달력 팝업 날짜정보)
	 * @throws Exception
	 */
    public List<?> selectAdministSchedulePopup(Schedule schedule) throws Exception {
        return list("ScheduleManageDAO.selectAdministSchedulePopup", schedule);
	}

	/**
	 * 일반달력 일간 정보를 조회한다.
	 * @param schedule
	 * @return List(일반달력 일간 날짜정보)
	 * @throws Exception
	 */
    public List<?> selectNormalDayCal(Schedule schedule) throws Exception {
        return list("ScheduleManageDAO.selectNormalDayCal", schedule);
	}

	/**
	 * 일반달력 일간 일정을 조회한다.
	 * @param schedule
	 * @return List(일반달력 일간 일정정보)
	 * @throws Exception
	 */
    public List<?> selectNormalDaySchedule(Schedule schedule) throws Exception {
        return list("ScheduleManageDAO.selectNormalDaySchedule", schedule);
	}

	/**
	 * 일반달력 월간 일정을 조회한다.
	 * @param schedule
	 * @return List(일반달력 월간 일정정보)
	 * @throws Exception
	 */
    public List<?> selectNormalMonthSchedule(Schedule schedule) throws Exception {
        return list("ScheduleManageDAO.selectNormalMonthSchedule", schedule);
	}

	/**
	 * 행정달력 일간 정보를 조회한다.
	 * @param schedule
	 * @return List(행정달력 일간 날짜정보)
	 * @throws Exception
	 */
    public List<?> selectAdministDayCal(Schedule schedule) throws Exception {
        return list("ScheduleManageDAO.selectAdministDayCal", schedule);
	}

	/**
	 * 행정달력 일간 일정을 조회한다.
	 * @param schedule
	 * @return List(행정달력 일간 일정정보)
	 * @throws Exception
	 */
    public List<?> selectAdministDaySchedule(Schedule schedule) throws Exception {
        return list("ScheduleManageDAO.selectAdministDaySchedule", schedule);
	}

	/**
	 * 행정달력 월간 일정을 조회한다.
	 * @param schedule
	 * @return List(행정달력 월간 일정정보)
	 * @throws Exception
	 */
    public List<?> selectAdministMonthSchedule(Schedule schedule) throws Exception {
        return list("ScheduleManageDAO.selectAdministMonthSchedule", schedule);
	}

	/**
	 * 일정을 삭제한다.
	 * @param schedule
	 * @throws Exception
	 */
	public void deleteSchedule(Schedule schedule) throws Exception {
		delete("ScheduleManageDAO.deleteSchedule", schedule);
	}


	/**
	 * 일정을 등록한다.
	 * @param schedule
	 * @throws Exception
	 */
	public void insertSchedule(Schedule schedule) throws Exception {
        insert("ScheduleManageDAO.insertSchedule", schedule);
	}

	/**
	 * 일정 상세항목을 조회한다.
	 * @param schedule
	 * @return Schedule(일정)
	 * @throws Exception
	 */
	public Schedule selectScheduleDetail(Schedule schedule) throws Exception {
		return (Schedule) select("ScheduleManageDAO.selectScheduleDetail", schedule);
	}


    /**
     * 일정 목록을 조회한다.
     * @param searchVO
	 * @return List(일정 목록)
     * @throws Exception
     */
    public List<?> selectScheduleList(ScheduleVO searchVO) throws Exception {
        return list("ScheduleManageDAO.selectScheduleList", searchVO);
    }

    /**
     * 글 총 갯수를 조회한다.
     * @param searchVO
     * @return int(일정 총 갯수)
     * @throws Exception
     */
    public int selectScheduleListTotCnt(ScheduleVO searchVO) throws Exception {
        return (Integer)select("ScheduleManageDAO.selectScheduleListTotCnt", searchVO);
    }

	/**
	 * 일정을 수정한다.
	 * @param schedule
	 * @throws Exception
	 */
	public void updateSchedule(Schedule schedule) throws Exception {
		update("ScheduleManageDAO.updateSchedule", schedule);
	}

}

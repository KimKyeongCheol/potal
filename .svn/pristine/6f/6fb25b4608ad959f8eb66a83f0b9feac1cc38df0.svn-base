package egovframework.let.sym.schdule.service.impl;

import java.util.List;


import egovframework.let.sym.schdule.service.Schedule;
import egovframework.let.sym.schdule.service.ScheduleManageService;
import egovframework.let.sym.schdule.service.ScheduleVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

/**
 *
 * 휴일에 대한 서비스 구현클래스를 정의한다
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
@Service("ScheduleManageService")
public class ScheduleManageServiceImpl extends EgovAbstractServiceImpl implements ScheduleManageService {

    @Resource(name="ScheduleManageDAO")
    private ScheduleManageDAO scheduleManageDAO;
	
	@Override
	public List<?> selectNormalSchedulePopup(Schedule schedule) throws Exception {

		return scheduleManageDAO.selectNormalSchedulePopup(schedule);
	}

	@Override
	public List<?> selectAdministSchedulePopup(Schedule schedule) throws Exception {
		return scheduleManageDAO.selectAdministSchedulePopup(schedule);
	}

	@Override
	public List<?> selectNormalDayCal(Schedule schedule) throws Exception {
		return scheduleManageDAO.selectNormalDayCal(schedule);
	}

	@Override
	public List<?> selectNormalDaySchedule(Schedule schedule) throws Exception {
		return scheduleManageDAO.selectNormalDaySchedule(schedule);
	}

	@Override
	public List<?> selectNormalMonthSchedule(Schedule schedule) throws Exception {
		return scheduleManageDAO.selectNormalMonthSchedule(schedule);
	}

	@Override
	public List<?> selectAdministDayCal(Schedule schedule) throws Exception {
		return scheduleManageDAO.selectAdministDayCal(schedule);
	}

	@Override
	public List<?> selectAdministDaySchedule(Schedule schedule) throws Exception {
		return scheduleManageDAO.selectAdministDaySchedule(schedule);
	}

	@Override
	public List<?> selectAdministMonthSchedule(Schedule schedule) throws Exception {
		return scheduleManageDAO.selectAdministMonthSchedule(schedule);
	}

	@Override
	public void deleteSchedule(Schedule schedule) throws Exception {
		scheduleManageDAO.deleteSchedule(schedule);
		
	}

	@Override
	public void insertSchedule(Schedule schedule) throws Exception {
		scheduleManageDAO.insertSchedule(schedule);
		
	}

	@Override
	public Schedule selectScheduleDetail(Schedule schedule) throws Exception {
		Schedule sche = scheduleManageDAO.selectScheduleDetail(schedule);
    	return sche;
	}

	@Override
	public List<?> selectScheduleList(ScheduleVO searchVO) throws Exception {
		 return scheduleManageDAO.selectScheduleList(searchVO);
	}

	@Override
	public int selectScheduleListTotCnt(ScheduleVO searchVO) throws Exception {
		  return scheduleManageDAO.selectScheduleListTotCnt(searchVO);
	}

	@Override
	public void updateSchedule(Schedule schedule) throws Exception {
		scheduleManageDAO.updateSchedule(schedule);
		
	}


}

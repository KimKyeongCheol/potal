package egovframework.let.sym.schdule.web;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.let.sym.schdule.service.Schedule;
import egovframework.let.sym.schdule.service.ScheduleManageService;
import egovframework.let.sym.schdule.service.ScheduleVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import javax.annotation.Resource;

import org.apache.commons.collections.map.ListOrderedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springmodules.validation.commons.DefaultBeanValidator;


/**
 * 
 * 일정 관한 요청을 받아 서비스 클래스로 요청을 전달하고 서비스클래스에서 처리한 결과를 웹 화면으로 전달을 위한 Controller를 정의한다
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
@Controller
public class ScheduleManageController {

	/** RestdeManageService */
	@Resource(name = "ScheduleManageService")
    private ScheduleManageService scheduleManageService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    /** EgovCmmUseService */
	@Resource(name="EgovCmmUseService")
	private EgovCmmUseService cmmUseService;
	
	@Resource(name="egovRestDeIdGnrService")
	private EgovIdGnrService idgenService;

	/** beanValidator */
	@Autowired
	private DefaultBeanValidator beanValidator;

	/**
	 * 달력 메인창을 호출한다.
	 * @param model
	 * @return "/cmm/sym/cal/EgovNormalCalPopup"
	 * @throws Exception
	 */
	@RequestMapping(value="/callCalPopup.do")
 	public String callCalendar (ModelMap model
 			) throws Exception {
		return "/sym/cal/EgovCalPopup";
	}    
	
	/**
	 * 달력을 호출한다.
	 * @param model
	 * @return "/cmm/sym/cal/EgovNormalCalPopup"
	 * @throws Exception
	 */
	@RequestMapping(value="/callCal.do")
 	public String callCal (Schedule schedule
 			, ModelMap model
 			) throws Exception {

		Calendar cal = Calendar.getInstance();

		if(schedule.getYear()==null || schedule.getYear().equals("")){
			schedule.setYear(Integer.toString(cal.get(Calendar.YEAR)));
		}
		if(schedule.getMonth()==null || schedule.getMonth().equals("")){
			schedule.setMonth(Integer.toString(cal.get(Calendar.MONTH)+1));
		}
		int iYear  = Integer.parseInt(schedule.getYear());
		int iMonth = Integer.parseInt(schedule.getMonth());

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
		
		cal.set(iYear,iMonth-1,1);
		
		int firstWeek = cal.get(Calendar.DAY_OF_WEEK);
		int lastDay   = cal.getActualMaximum(Calendar.DATE);
		int week      = cal.get(Calendar.DAY_OF_WEEK);
		
		String year   = Integer.toString(iYear);
		String month  = Integer.toString(iMonth);
		//String day    = Integer.toString(cal.get(Calendar.DAY_OF_MONTH));
		
		schedule.setStartWeekMonth(firstWeek);
		schedule.setLastDayMonth(lastDay);
		schedule.setYear(year);
		schedule.setMonth(month);
		
		List<ListOrderedMap> CalInfoList = new ArrayList<ListOrderedMap>();
		String tmpDay = "";
		
		/**
		 * 계산... START
		 */
		for(int i=0; i<42;i++) {
			ListOrderedMap  map   = new ListOrderedMap();
			int cc = i + 1;
			int dd = cc-firstWeek+1;

			if (dd > 0 && dd <= lastDay) {
				tmpDay = Integer.toString(dd);
			} else {
				tmpDay = "";
			}
			
			map.put("year",		year);
	        map.put("month",	month);
	        map.put("day",		tmpDay);
	        map.put("cellNum",	cc);
	        map.put("weeks",	(cc - 1) / 7 + 1);
	        map.put("week",		(week-1) % 7 + 1);
	        map.put("restAt",	((week-1) % 7 + 1==1) ? "Y" : "N");

	    	if (dd > 0 && dd <= lastDay) {
				week ++;
			}    	
	    	CalInfoList.add(map);

		}
		/**
		 * 계산... END		
		 */
		
        model.addAttribute("resultList", CalInfoList);
		
		return "/sym/cal/EgovCalendar";
	}    
	
	/**
	 * 일반달력 팝업 메인창을 호출한다.
	 * @param model
	 * @return "/cmm/sym/cal/EgovNormalCalPopup"
	 * @throws Exception
	 */
	@RequestMapping(value="/EgovNormalCalPopup.do")
 	public String callNormalCalPopup (ModelMap model
 			) throws Exception {
		return "/sym/cal/EgovNormalCalPopup";
	}    

	/**
	 * 일반달력 팝업 정보를 조회한다.
	 * @param restde
	 * @param model
	 * @return "/cmm/sym/cal/EgovNormalCalendar"
	 * @throws Exception
	 */
	@RequestMapping(value="/selectNormalCalendar.do")
 	public String selectNormalRestdePopup (Schedule schedule
 			, ModelMap model
 			) throws Exception {

		Calendar cal = Calendar.getInstance();

		if(schedule.getYear()==null || schedule.getYear().equals("")){
			schedule.setYear(Integer.toString(cal.get(Calendar.YEAR)));
		}
		if(schedule.getMonth()==null || schedule.getMonth().equals("")){
			schedule.setMonth(Integer.toString(cal.get(Calendar.MONTH)+1));
		}
		int iYear  = Integer.parseInt(schedule.getYear());
		int iMonth = Integer.parseInt(schedule.getMonth());

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
		
		/* DB를 사용할 경우 처리
		schedule.setYear(Integer.toString(iYear));
		schedule.setMonth(Integer.toString(iMonth));
		
		cal.set(iYear,iMonth-1,1);
		
		schedule.setStartWeekMonth(cal.get(Calendar.DAY_OF_WEEK));
		schedule.setLastDayMonth(cal.getActualMaximum(Calendar.DATE));

        List CalInfoList = scheduleManageService.selectNormalRestdePopup(schedule);
        */
		
		cal.set(iYear,iMonth-1,1);
		 
        int firstWeek = cal.get(Calendar.DAY_OF_WEEK);
        int lastDay   = cal.getActualMaximum(Calendar.DATE);
        int week      = cal.get(Calendar.DAY_OF_WEEK);
 
        String year   = Integer.toString(iYear);
        String month  = Integer.toString(iMonth);
        //String day    = Integer.toString(cal.get(Calendar.DAY_OF_MONTH));
 
        schedule.setStartWeekMonth(firstWeek);
        schedule.setLastDayMonth(lastDay);
        schedule.setYear(year);
        schedule.setMonth(month);
 
        List<ListOrderedMap> CalInfoList = new ArrayList<ListOrderedMap>();
        String tmpDay = "";
 
        /**
         * 계산... START
         */
        for(int i=0; i<42;i++) {
            ListOrderedMap  map   = new ListOrderedMap();
            int cc = i + 1;
            int dd = cc-firstWeek+1;
 
            if (dd > 0 && dd <= lastDay) {
                tmpDay = Integer.toString(dd);
            } else {
                tmpDay = "";
            }
 
            map.put("year",     year);
            map.put("month",    month);
            map.put("day",      tmpDay);
            map.put("cellNum",  cc);
            map.put("weeks",    (cc - 1) / 7 + 1);
            map.put("week",     (week-1) % 7 + 1);
            map.put("restAt",   ((week-1) % 7 + 1==1) ? "Y" : "N");
 
            if (dd > 0 && dd <= lastDay) {
                week ++;
            }
            CalInfoList.add(map);
 
        }
        /**
         * 계산... END
         */
		
		
        model.addAttribute("resultList", CalInfoList);
		return "/sym/cal/EgovNormalCalendar";
	}
	
	
	/**
	 * 행정달력 팝업 메인창을 호출한다.
	 * @param model
	 * @return "/cmm/sym/cal/EgovAdministCalPopup"
	 * @throws Exception
	 */
	@RequestMapping(value="/EgovAdministCalPopup.do")
 	public String callAdministCalPopup (ModelMap model
 			) throws Exception {
		return "/sym/cal/EgovAdministCalPopup";
	}    
	
	/**
	 * 행정달력 팝업 정보를 조회한다.
	 * @param restde
	 * @param model
	 * @return "/cmm/sym/cal/EgovAdministCalendar"
	 * @throws Exception
	 */
	@RequestMapping(value="/selectAdministCalendar.do")
 	public String selectAdministRestdePopup (Schedule schedule
 			, ModelMap model
 			) throws Exception {

		Calendar cal = Calendar.getInstance();

		if(schedule.getYear()==null || schedule.getYear().equals("")){
			schedule.setYear(Integer.toString(cal.get(Calendar.YEAR)));
		}
		if(schedule.getMonth()==null || schedule.getMonth().equals("")){
			schedule.setMonth(Integer.toString(cal.get(Calendar.MONTH)+1));
		}
		int iYear  = Integer.parseInt(schedule.getYear());
		int iMonth = Integer.parseInt(schedule.getMonth());

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
		schedule.setYear(Integer.toString(iYear));
		schedule.setMonth(Integer.toString(iMonth));
		
		cal.set(iYear,iMonth-1,1);
		
		schedule.setStartWeekMonth(cal.get(Calendar.DAY_OF_WEEK));
		schedule.setLastDayMonth(cal.getActualMaximum(Calendar.DATE));

        model.addAttribute("resultList", scheduleManageService.selectAdministSchedulePopup(schedule));
		
		return "/sym/cal/EgovAdministCalendar";
	}

	/**
	 * 일반달력 일간
	 * @param restde
	 * @param model
	 * @return "/cmm/sym/cal/EgovNormalDayCalendar"
	 * @throws Exception
	 */
	@RequestMapping(value="/ScheduleNormalDayCalendar.do")
 	public String selectNormalDayCalendar (Schedule schedule
 			, ModelMap model
 			) throws Exception {

		Calendar cal = Calendar.getInstance();


		if(schedule.getYear()==null || schedule.getYear().equals("")){
			schedule.setYear(Integer.toString(cal.get(Calendar.YEAR)));
		}
		if(schedule.getMonth()==null || schedule.getMonth().equals("")){
			schedule.setMonth(Integer.toString(cal.get(Calendar.MONTH)+1));
		}
		if(schedule.getDay()==null || schedule.getDay().equals("")){
			schedule.setDay(Integer.toString(cal.get(Calendar.DATE)));
		}

		int iYear  = Integer.parseInt(schedule.getYear());
		int iMonth = Integer.parseInt(schedule.getMonth());
		int iDay   = Integer.parseInt(schedule.getDay());
		
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
		schedule.setYear(Integer.toString(iYear));
		schedule.setMonth(Integer.toString(iMonth));
		
		cal.set(iYear,iMonth-1,iDay);
		schedule.setStartWeekMonth(cal.get(Calendar.DAY_OF_WEEK));

		cal.set(iYear,iMonth-1,Integer.parseInt(schedule.getDay()));
		schedule.setLastDayMonth(cal.getActualMaximum(Calendar.DAY_OF_MONTH));

		schedule.setYear(Integer.toString(cal.get(Calendar.YEAR)));
		schedule.setMonth(Integer.toString(cal.get(Calendar.MONTH)+1));
		schedule.setDay(Integer.toString(cal.get(Calendar.DAY_OF_MONTH)));
		schedule.setWeek(cal.get(Calendar.DAY_OF_WEEK));
		schedule.setLastDayMonth(cal.getActualMaximum(Calendar.DATE));
		
		//List CalInfoList          = scheduleManageService.selectNormalDayCal(schedule);
        //List NormalWeekRestdeList = scheduleManageService.selectNormalDayRestde(schedule);

        model.addAttribute("resultList", scheduleManageService.selectNormalDayCal(schedule));
        model.addAttribute("RestdeList", scheduleManageService.selectNormalDaySchedule(schedule));
        
		return "/sym/cal/EgovNormalDayCalendar";
	}
	
	/**
	 * 일반달력 주간
	 * @param restde
	 * @param model
	 * @return "/cmm/sym/cal/EgovNormalWeekCalendar"
	 * @throws Exception
	 */
	@RequestMapping(value="/ScheduleNormalWeekCalendar.do")
 	public String selectNormalWeekCalendar (Schedule schedule
 			, ModelMap model
 			) throws Exception {

		Calendar cal = Calendar.getInstance();

		if(schedule.getYear()==null || schedule.getYear().equals("")){
			schedule.setYear(Integer.toString(cal.get(Calendar.YEAR)));
		}
		if(schedule.getMonth()==null || schedule.getMonth().equals("")){
			schedule.setMonth(Integer.toString(cal.get(Calendar.MONTH)+1));
		}
		if(schedule.getDay()==null || schedule.getDay().equals("")){
			schedule.setDay(Integer.toString(cal.get(Calendar.DATE)));
		}

		int iYear  = Integer.parseInt(schedule.getYear());
		int iMonth = Integer.parseInt(schedule.getMonth());
		
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
		schedule.setYear(Integer.toString(iYear));
		schedule.setMonth(Integer.toString(iMonth));
		
		cal.set(iYear,iMonth-1,1);
		schedule.setStartWeekMonth(cal.get(Calendar.DAY_OF_WEEK));

		cal.set(iYear,iMonth-1,Integer.parseInt(schedule.getDay()));
		schedule.setLastDayMonth(cal.getActualMaximum(Calendar.DAY_OF_MONTH));

		int iStartWeek = schedule.getStartWeekMonth(); 
		int iLastDate  = schedule.getLastDayMonth();
		int iDayWeek  = cal.get(Calendar.DAY_OF_WEEK);
		
		int iMaxWeeks = (int)Math.floor(iLastDate/7);
		iMaxWeeks = iMaxWeeks + (int)Math.ceil(((iLastDate - iMaxWeeks * 7) + iStartWeek - 1) / 7.0);
		schedule.setMaxWeeks(iMaxWeeks);
		
		if (iMaxWeeks < schedule.getWeeks()) {
			schedule.setWeeks(iMaxWeeks);
		}
		
		Schedule vo = new Schedule();
		Calendar weekCal = Calendar.getInstance();
		weekCal.setTime(cal.getTime());
		
		if(schedule.getWeeks()!=0){
			weekCal.set(Calendar.DATE, (schedule.getWeeks() - 1) * 7 + 1);
			if(schedule.getWeeks()>1){
				iDayWeek  = weekCal.get(Calendar.DAY_OF_WEEK);
				weekCal.add(Calendar.DATE, (-1)*(iDayWeek-1));
			}
			schedule.setDay(Integer.toString(weekCal.get(Calendar.DAY_OF_MONTH)+1));
		}

		iDayWeek  = weekCal.get(Calendar.DAY_OF_WEEK);

		// 일요일
		weekCal.add(Calendar.DATE, (-1)*(iDayWeek-1));
		vo.setYear(Integer.toString(weekCal.get(Calendar.YEAR)));
		vo.setMonth(Integer.toString(weekCal.get(Calendar.MONTH)+1));
		vo.setDay(Integer.toString(weekCal.get(Calendar.DAY_OF_MONTH)));
		vo.setWeek(weekCal.get(Calendar.DAY_OF_WEEK));
		model.addAttribute("resultList_1", scheduleManageService.selectNormalDayCal(vo));
        model.addAttribute("RestdeList_1", scheduleManageService.selectNormalDaySchedule(vo));
        
		// 월요일
		weekCal.add(Calendar.DATE, 1);
		vo.setYear(Integer.toString(weekCal.get(Calendar.YEAR)));
		vo.setMonth(Integer.toString(weekCal.get(Calendar.MONTH)+1));
		vo.setDay(Integer.toString(weekCal.get(Calendar.DAY_OF_MONTH)));
		vo.setWeek(weekCal.get(Calendar.DAY_OF_WEEK));
        model.addAttribute("resultList_2", scheduleManageService.selectNormalDayCal(vo));
        model.addAttribute("RestdeList_2", scheduleManageService.selectNormalDaySchedule(vo));

        // 화요일
		weekCal.add(Calendar.DATE, 1);
		vo.setYear(Integer.toString(weekCal.get(Calendar.YEAR)));
		vo.setMonth(Integer.toString(weekCal.get(Calendar.MONTH)+1));
		vo.setDay(Integer.toString(weekCal.get(Calendar.DAY_OF_MONTH)));
		vo.setWeek(weekCal.get(Calendar.DAY_OF_WEEK));
        model.addAttribute("resultList_3", scheduleManageService.selectNormalDayCal(vo));
        model.addAttribute("RestdeList_3", scheduleManageService.selectNormalDaySchedule(vo));

        // 수요일
		weekCal.add(Calendar.DATE, 1);
		vo.setYear(Integer.toString(weekCal.get(Calendar.YEAR)));
		vo.setMonth(Integer.toString(weekCal.get(Calendar.MONTH)+1));
		vo.setDay(Integer.toString(weekCal.get(Calendar.DAY_OF_MONTH)));
		vo.setWeek(weekCal.get(Calendar.DAY_OF_WEEK));
		//List CalInfoList_4          = scheduleManageService.selectNormalDayCal(vo);
        //List NormalWeekRestdeList_4 = scheduleManageService.selectNormalDayRestde(vo);
        model.addAttribute("resultList_4", scheduleManageService.selectNormalDayCal(vo));
        model.addAttribute("RestdeList_4", scheduleManageService.selectNormalDaySchedule(vo));

        // 목요일
		weekCal.add(Calendar.DATE, 1);
		vo.setYear(Integer.toString(weekCal.get(Calendar.YEAR)));
		vo.setMonth(Integer.toString(weekCal.get(Calendar.MONTH)+1));
		vo.setDay(Integer.toString(weekCal.get(Calendar.DAY_OF_MONTH)));
		vo.setWeek(weekCal.get(Calendar.DAY_OF_WEEK));
        model.addAttribute("resultList_5", scheduleManageService.selectNormalDayCal(vo));
        model.addAttribute("RestdeList_5", scheduleManageService.selectNormalDaySchedule(vo));

        // 금요일
		weekCal.add(Calendar.DATE, 1);
		vo.setYear(Integer.toString(weekCal.get(Calendar.YEAR)));
		vo.setMonth(Integer.toString(weekCal.get(Calendar.MONTH)+1));
		vo.setDay(Integer.toString(weekCal.get(Calendar.DAY_OF_MONTH)));
		vo.setWeek(weekCal.get(Calendar.DAY_OF_WEEK));
        model.addAttribute("resultList_6", scheduleManageService.selectNormalDayCal(vo));
        model.addAttribute("RestdeList_6", scheduleManageService.selectNormalDaySchedule(vo));
		
        // 토요일
		weekCal.add(Calendar.DATE, 1);
		vo.setYear(Integer.toString(weekCal.get(Calendar.YEAR)));
		vo.setMonth(Integer.toString(weekCal.get(Calendar.MONTH)+1));
		vo.setDay(Integer.toString(weekCal.get(Calendar.DAY_OF_MONTH)));
		vo.setWeek(weekCal.get(Calendar.DAY_OF_WEEK));
        model.addAttribute("resultList_7", scheduleManageService.selectNormalDayCal(vo));
        model.addAttribute("RestdeList_7", scheduleManageService.selectNormalDaySchedule(vo));

        model.addAttribute("resultList", scheduleManageService.selectNormalDayCal(schedule));
        
        return "/sym/cal/EgovNormalWeekCalendar";
	}	

	/**
	 * 일반달력 월간
	 * @param restde
	 * @param model
	 * @return "/cmm/sym/cal/EgovNormalMonthCalendar"
	 * @throws Exception
	 */
	@RequestMapping(value="/ScheduleNormalMonthCalendar.do")
 	public String selectNormalMonthCalendar (Schedule schedule
 			, ModelMap model
 			) throws Exception {

		Calendar cal = Calendar.getInstance();

		if(schedule.getYear()==null || schedule.getYear().equals("")){
			schedule.setYear(Integer.toString(cal.get(Calendar.YEAR)));
		}
		if(schedule.getMonth()==null || schedule.getMonth().equals("")){
			schedule.setMonth(Integer.toString(cal.get(Calendar.MONTH)+1));
		}
		int iYear  = Integer.parseInt(schedule.getYear());
		int iMonth = Integer.parseInt(schedule.getMonth());

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
		schedule.setYear(Integer.toString(iYear));
		schedule.setMonth(Integer.toString(iMonth));
		
		cal.set(iYear,iMonth-1,1);
		
		schedule.setStartWeekMonth(cal.get(Calendar.DAY_OF_WEEK));
		schedule.setLastDayMonth(cal.getActualMaximum(Calendar.DATE));

/*        model.addAttribute("resultList", scheduleManageService.selectNormalRestdePopup(schedule));
        model.addAttribute("RestdeList", scheduleManageService.selectNormalMonthRestde(schedule));
*/
        List<?> CalInfoList = scheduleManageService.selectNormalSchedulePopup(schedule);


        List<?> NormalMonthRestdeList = scheduleManageService.selectNormalMonthSchedule(schedule);

        model.addAttribute("resultList", CalInfoList);
        model.addAttribute("RestdeList", NormalMonthRestdeList);
        return "/sym/cal/EgovNormalMonthCalendar";
	}	
	
	
	
	/**
	 * 일반달력 연간
	 * @param schedule
	 * @param model
	 * @return "/cmm/sym/cal/EgovNormalYearCalendar"
	 * @throws Exception
	 */
	@RequestMapping(value="/ScheduleNormalYearCalendar.do")
 	public String selectNormalYearCalendar (Schedule schedule
 			, ModelMap model
 			) throws Exception {

		Calendar cal = Calendar.getInstance();

		if(schedule.getYear()==null || schedule.getYear().equals("")){
			schedule.setYear(Integer.toString(cal.get(Calendar.YEAR)));
		}
		if(schedule.getMonth()==null || schedule.getMonth().equals("")){
			schedule.setMonth(Integer.toString(cal.get(Calendar.MONTH)+1));
		}
		int iYear  = Integer.parseInt(schedule.getYear());
		int iMonth = Integer.parseInt(schedule.getMonth());

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
		schedule.setYear(Integer.toString(iYear));
		
		/* 월별확인 */

		/* 1월 */
		iMonth = 1;
		schedule.setMonth(Integer.toString(iMonth));
		cal.set(iYear,iMonth-1,1);
		schedule.setStartWeekMonth(cal.get(Calendar.DAY_OF_WEEK));
		schedule.setLastDayMonth(cal.getActualMaximum(Calendar.DATE));
        model.addAttribute("resultList_1" , scheduleManageService.selectNormalSchedulePopup(schedule) );
        model.addAttribute("RestdeList_1" , scheduleManageService.selectNormalMonthSchedule(schedule) );

		/* 2월 */
		iMonth = 2;
		schedule.setMonth(Integer.toString(iMonth));
		cal.set(iYear,iMonth-1,1);
		schedule.setStartWeekMonth(cal.get(Calendar.DAY_OF_WEEK));
		schedule.setLastDayMonth(cal.getActualMaximum(Calendar.DATE));
        model.addAttribute("resultList_2" , scheduleManageService.selectNormalSchedulePopup(schedule) );
        model.addAttribute("RestdeList_2" , scheduleManageService.selectNormalMonthSchedule(schedule) );

		/* 3월 */
		iMonth = 3;
		schedule.setMonth(Integer.toString(iMonth));
		cal.set(iYear,iMonth-1,1);
		schedule.setStartWeekMonth(cal.get(Calendar.DAY_OF_WEEK));
		schedule.setLastDayMonth(cal.getActualMaximum(Calendar.DATE));
        model.addAttribute("resultList_3" , scheduleManageService.selectNormalSchedulePopup(schedule) );
        model.addAttribute("RestdeList_3" , scheduleManageService.selectNormalMonthSchedule(schedule) );

		/* 4월 */
		iMonth = 4;
		schedule.setMonth(Integer.toString(iMonth));
		cal.set(iYear,iMonth-1,1);
		schedule.setStartWeekMonth(cal.get(Calendar.DAY_OF_WEEK));
		schedule.setLastDayMonth(cal.getActualMaximum(Calendar.DATE));
        model.addAttribute("resultList_4" , scheduleManageService.selectNormalSchedulePopup(schedule) );
        model.addAttribute("RestdeList_4" , scheduleManageService.selectNormalMonthSchedule(schedule) );

		/* 5월 */
		iMonth = 5;
		schedule.setMonth(Integer.toString(iMonth));
		cal.set(iYear,iMonth-1,1);
		schedule.setStartWeekMonth(cal.get(Calendar.DAY_OF_WEEK));
		schedule.setLastDayMonth(cal.getActualMaximum(Calendar.DATE));
        model.addAttribute("resultList_5" , scheduleManageService.selectNormalSchedulePopup(schedule) );
        model.addAttribute("RestdeList_5" , scheduleManageService.selectNormalMonthSchedule(schedule) );

		/* 6월 */
		iMonth = 6;
		schedule.setMonth(Integer.toString(iMonth));
		cal.set(iYear,iMonth-1,1);
		schedule.setStartWeekMonth(cal.get(Calendar.DAY_OF_WEEK));
		schedule.setLastDayMonth(cal.getActualMaximum(Calendar.DATE));
        model.addAttribute("resultList_6" , scheduleManageService.selectNormalSchedulePopup(schedule) );
        model.addAttribute("RestdeList_6" , scheduleManageService.selectNormalMonthSchedule(schedule) );

		/* 7월 */
		iMonth = 7;
		schedule.setMonth(Integer.toString(iMonth));
		cal.set(iYear,iMonth-1,1);
		schedule.setStartWeekMonth(cal.get(Calendar.DAY_OF_WEEK));
		schedule.setLastDayMonth(cal.getActualMaximum(Calendar.DATE));
        model.addAttribute("resultList_7" , scheduleManageService.selectNormalSchedulePopup(schedule) );
        model.addAttribute("RestdeList_7" , scheduleManageService.selectNormalMonthSchedule(schedule) );

		/* 8월 */
		iMonth = 8;
		schedule.setMonth(Integer.toString(iMonth));
		cal.set(iYear,iMonth-1,1);
		schedule.setStartWeekMonth(cal.get(Calendar.DAY_OF_WEEK));
		schedule.setLastDayMonth(cal.getActualMaximum(Calendar.DATE));
        model.addAttribute("resultList_8" , scheduleManageService.selectNormalSchedulePopup(schedule) );
        model.addAttribute("RestdeList_8" , scheduleManageService.selectNormalMonthSchedule(schedule) );

		/* 9월 */
		iMonth = 9;
		schedule.setMonth(Integer.toString(iMonth));
		cal.set(iYear,iMonth-1,1);
		schedule.setStartWeekMonth(cal.get(Calendar.DAY_OF_WEEK));
		schedule.setLastDayMonth(cal.getActualMaximum(Calendar.DATE));
        model.addAttribute("resultList_9" , scheduleManageService.selectNormalSchedulePopup(schedule) );
        model.addAttribute("RestdeList_9" , scheduleManageService.selectNormalMonthSchedule(schedule) );

		/* 10월 */
		iMonth = 10;
		schedule.setMonth(Integer.toString(iMonth));
		cal.set(iYear,iMonth-1,1);
		schedule.setStartWeekMonth(cal.get(Calendar.DAY_OF_WEEK));
		schedule.setLastDayMonth(cal.getActualMaximum(Calendar.DATE));
        model.addAttribute("resultList_10", scheduleManageService.selectNormalSchedulePopup(schedule));
        model.addAttribute("RestdeList_10", scheduleManageService.selectNormalMonthSchedule(schedule));

		/* 11월 */
		iMonth = 11;
		schedule.setMonth(Integer.toString(iMonth));
		cal.set(iYear,iMonth-1,1);
		schedule.setStartWeekMonth(cal.get(Calendar.DAY_OF_WEEK));
		schedule.setLastDayMonth(cal.getActualMaximum(Calendar.DATE));
        model.addAttribute("resultList_11", scheduleManageService.selectNormalSchedulePopup(schedule));
        model.addAttribute("RestdeList_11", scheduleManageService.selectNormalMonthSchedule(schedule));

		/* 12월 */
		iMonth = 12;
		schedule.setMonth(Integer.toString(iMonth));
		cal.set(iYear,iMonth-1,1);
		schedule.setStartWeekMonth(cal.get(Calendar.DAY_OF_WEEK));
		schedule.setLastDayMonth(cal.getActualMaximum(Calendar.DATE));
        model.addAttribute("resultList_12", scheduleManageService.selectNormalSchedulePopup(schedule));
        model.addAttribute("RestdeList_12", scheduleManageService.selectNormalMonthSchedule(schedule));

        return "/sym/cal/EgovNormalYearCalendar";
	}	
	

	/**
	 * 행정달력 일간
	 * @param schedule
	 * @param model
	 * @return "/ScheduleDayCalendar"
	 * @throws Exception
	 */
	@RequestMapping(value="/ScheduleDayCalendar.do")
 	public String selectAdministDayCalendar (Schedule schedule
 			, ModelMap model
 			) throws Exception {

		Calendar cal = Calendar.getInstance();


		if(schedule.getYear()==null || schedule.getYear().equals("")){
			schedule.setYear(Integer.toString(cal.get(Calendar.YEAR)));
		}
		if(schedule.getMonth()==null || schedule.getMonth().equals("")){
			schedule.setMonth(Integer.toString(cal.get(Calendar.MONTH)+1));
		}
		if(schedule.getDay()==null || schedule.getDay().equals("")){
			schedule.setDay(Integer.toString(cal.get(Calendar.DATE)));
		}

		int iYear  = Integer.parseInt(schedule.getYear());
		int iMonth = Integer.parseInt(schedule.getMonth());
		int iDay   = Integer.parseInt(schedule.getDay());
		
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
		schedule.setYear(Integer.toString(iYear));
		schedule.setMonth(Integer.toString(iMonth));
		
		cal.set(iYear,iMonth-1,iDay);
		schedule.setStartWeekMonth(cal.get(Calendar.DAY_OF_WEEK));

		cal.set(iYear,iMonth-1,Integer.parseInt(schedule.getDay()));
		schedule.setLastDayMonth(cal.getActualMaximum(Calendar.DAY_OF_MONTH));

		schedule.setYear(Integer.toString(cal.get(Calendar.YEAR)));
		schedule.setMonth(Integer.toString(cal.get(Calendar.MONTH)+1));
		schedule.setDay(Integer.toString(cal.get(Calendar.DAY_OF_MONTH)));
		schedule.setWeek(cal.get(Calendar.DAY_OF_WEEK));
		schedule.setLastDayMonth(cal.getActualMaximum(Calendar.DATE));
		
        model.addAttribute("resultList", scheduleManageService.selectAdministDayCal(schedule));
        model.addAttribute("RestdeList", scheduleManageService.selectAdministDaySchedule(schedule));
        
		return "/sym/cal/EgovAdministDayCalendar";
	}
	

	/**
	 * 행정달력 주간
	 * @param schedule
	 * @param model
	 * @return "/ScheduleWeekCalendar"
	 * @throws Exception
	 */
	@RequestMapping(value="/ScheduleWeekCalendar.do")
 	public String selectAdministWeekCalendar (Schedule schedule
 			, ModelMap model
 			) throws Exception {

		Calendar cal = Calendar.getInstance();

		if(schedule.getYear()==null || schedule.getYear().equals("")){
			schedule.setYear(Integer.toString(cal.get(Calendar.YEAR)));
		}
		if(schedule.getMonth()==null || schedule.getMonth().equals("")){
			schedule.setMonth(Integer.toString(cal.get(Calendar.MONTH)+1));
		}
		if(schedule.getDay()==null || schedule.getDay().equals("")){
			schedule.setDay(Integer.toString(cal.get(Calendar.DATE)));
		}

		int iYear  = Integer.parseInt(schedule.getYear());
		int iMonth = Integer.parseInt(schedule.getMonth());
		
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
		schedule.setYear(Integer.toString(iYear));
		schedule.setMonth(Integer.toString(iMonth));
		
		cal.set(iYear,iMonth-1,1);
		schedule.setStartWeekMonth(cal.get(Calendar.DAY_OF_WEEK));

		cal.set(iYear,iMonth-1,Integer.parseInt(schedule.getDay()));
		schedule.setLastDayMonth(cal.getActualMaximum(Calendar.DAY_OF_MONTH));

		int iStartWeek = schedule.getStartWeekMonth(); 
		int iLastDate  = schedule.getLastDayMonth();
		int iDayWeek  = cal.get(Calendar.DAY_OF_WEEK);
		
		int iMaxWeeks = (int)Math.floor(iLastDate/7);
		iMaxWeeks = iMaxWeeks + (int)Math.ceil(((iLastDate - iMaxWeeks * 7) + iStartWeek - 1) / 7.0);
		schedule.setMaxWeeks(iMaxWeeks);
		
		if (iMaxWeeks < schedule.getWeeks()) {
			schedule.setWeeks(iMaxWeeks);
		}

		Schedule vo = new Schedule();
		Calendar weekCal = Calendar.getInstance();
		weekCal.setTime(cal.getTime());
		
		if(schedule.getWeeks()!=0){
			weekCal.set(Calendar.DATE, (schedule.getWeeks() - 1) * 7 + 1);
			if(schedule.getWeeks()>1){
				iDayWeek  = weekCal.get(Calendar.DAY_OF_WEEK);
				weekCal.add(Calendar.DATE, (-1)*(iDayWeek-1));
			}
			schedule.setDay(Integer.toString(weekCal.get(Calendar.DAY_OF_MONTH)+1));
		}
		//List CalInfoList = scheduleManageService.selectAdministDayCal(schedule);
		model.addAttribute("resultList", scheduleManageService.selectAdministDayCal(schedule));
		
		iDayWeek  = weekCal.get(Calendar.DAY_OF_WEEK);

		// 일요일
		weekCal.add(Calendar.DATE, (-1)*(iDayWeek-1));
		vo.setYear(Integer.toString(weekCal.get(Calendar.YEAR)));
		vo.setMonth(Integer.toString(weekCal.get(Calendar.MONTH)+1));
		vo.setDay(Integer.toString(weekCal.get(Calendar.DAY_OF_MONTH)));
		vo.setWeek(weekCal.get(Calendar.DAY_OF_WEEK));
		//List CalInfoList_1          = scheduleManageService.selectAdministDayCal(vo);
        //List AdministWeekRestdeList_1 = scheduleManageService.selectAdministDayRestde(vo);
        model.addAttribute("resultList_1", scheduleManageService.selectAdministDayCal(vo));
        model.addAttribute("RestdeList_1", scheduleManageService.selectAdministDaySchedule(schedule));
        
		// 월요일
		weekCal.add(Calendar.DATE, 1);
		vo.setYear(Integer.toString(weekCal.get(Calendar.YEAR)));
		vo.setMonth(Integer.toString(weekCal.get(Calendar.MONTH)+1));
		vo.setDay(Integer.toString(weekCal.get(Calendar.DAY_OF_MONTH)));
		vo.setWeek(weekCal.get(Calendar.DAY_OF_WEEK));
        model.addAttribute("resultList_2", scheduleManageService.selectAdministDayCal(vo));
        model.addAttribute("RestdeList_2", scheduleManageService.selectAdministDaySchedule(vo));

		// 화요일
		weekCal.add(Calendar.DATE, 1);
		vo.setYear(Integer.toString(weekCal.get(Calendar.YEAR)));
		vo.setMonth(Integer.toString(weekCal.get(Calendar.MONTH)+1));
		vo.setDay(Integer.toString(weekCal.get(Calendar.DAY_OF_MONTH)));
		vo.setWeek(weekCal.get(Calendar.DAY_OF_WEEK));
        model.addAttribute("resultList_3", scheduleManageService.selectAdministDayCal(vo));
        model.addAttribute("RestdeList_3", scheduleManageService.selectAdministDaySchedule(vo));

		// 수요일
		weekCal.add(Calendar.DATE, 1);
		vo.setYear(Integer.toString(weekCal.get(Calendar.YEAR)));
		vo.setMonth(Integer.toString(weekCal.get(Calendar.MONTH)+1));
		vo.setDay(Integer.toString(weekCal.get(Calendar.DAY_OF_MONTH)));
		vo.setWeek(weekCal.get(Calendar.DAY_OF_WEEK));
        model.addAttribute("resultList_4", scheduleManageService.selectAdministDayCal(vo));
        model.addAttribute("RestdeList_4", scheduleManageService.selectAdministDaySchedule(vo));

		// 목요일
		weekCal.add(Calendar.DATE, 1);
		vo.setYear(Integer.toString(weekCal.get(Calendar.YEAR)));
		vo.setMonth(Integer.toString(weekCal.get(Calendar.MONTH)+1));
		vo.setDay(Integer.toString(weekCal.get(Calendar.DAY_OF_MONTH)));
		vo.setWeek(weekCal.get(Calendar.DAY_OF_WEEK));
        model.addAttribute("resultList_5", scheduleManageService.selectAdministDayCal(vo));
        model.addAttribute("RestdeList_5", scheduleManageService.selectAdministDaySchedule(vo));

		// 금요일
		weekCal.add(Calendar.DATE, 1);
		vo.setYear(Integer.toString(weekCal.get(Calendar.YEAR)));
		vo.setMonth(Integer.toString(weekCal.get(Calendar.MONTH)+1));
		vo.setDay(Integer.toString(weekCal.get(Calendar.DAY_OF_MONTH)));
		vo.setWeek(weekCal.get(Calendar.DAY_OF_WEEK));
        model.addAttribute("resultList_6", scheduleManageService.selectAdministDayCal(vo));
        model.addAttribute("RestdeList_6", scheduleManageService.selectAdministDaySchedule(vo));

		// 토요일
		weekCal.add(Calendar.DATE, 1);
		vo.setYear(Integer.toString(weekCal.get(Calendar.YEAR)));
		vo.setMonth(Integer.toString(weekCal.get(Calendar.MONTH)+1));
		vo.setDay(Integer.toString(weekCal.get(Calendar.DAY_OF_MONTH)));
		vo.setWeek(weekCal.get(Calendar.DAY_OF_WEEK));

        model.addAttribute("resultList_7", scheduleManageService.selectAdministDayCal(vo));
        model.addAttribute("RestdeList_7", scheduleManageService.selectAdministDaySchedule(vo));

		return "/sym/cal/EgovAdministWeekCalendar";
	}
	
	/**
	 * 행정달력 월간
	 * @param schedule
	 * @param model
	 * @return "/ScheduleMonthCalendar"
	 * @throws Exception
	 */
	@RequestMapping(value="/ScheduleMonthCalendar.do")
 	public String selectAdministMonthCalendar (Schedule schedule
 			, ModelMap model
 			) throws Exception {

		Calendar cal = Calendar.getInstance();

		if(schedule.getYear()==null || schedule.getYear().equals("")){
			schedule.setYear(Integer.toString(cal.get(Calendar.YEAR)));
		}
		if(schedule.getMonth()==null || schedule.getMonth().equals("")){
			schedule.setMonth(Integer.toString(cal.get(Calendar.MONTH)+1));
		}
		int iYear  = Integer.parseInt(schedule.getYear());
		int iMonth = Integer.parseInt(schedule.getMonth());

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
		schedule.setYear(Integer.toString(iYear));
		schedule.setMonth(Integer.toString(iMonth));
		
		cal.set(iYear,iMonth-1,1);
		
		schedule.setStartWeekMonth(cal.get(Calendar.DAY_OF_WEEK));
		schedule.setLastDayMonth(cal.getActualMaximum(Calendar.DATE));

        model.addAttribute("resultList", scheduleManageService.selectAdministSchedulePopup(schedule));
        model.addAttribute("RestdeList", scheduleManageService.selectAdministMonthSchedule(schedule));

        return "/sym/cal/EgovAdministMonthCalendar";
	}	


	/**
	 * 행정달력 연간
	 * @param schedule
	 * @param model
	 * @return "/ScheduleAdministYearCalendar"
	 * @throws Exception
	 */
	@RequestMapping(value="/ScheduleYearCalendar.do")
 	public String selectAdministYearCalendar (Schedule schedule
 			, ModelMap model
 			) throws Exception {

		Calendar cal = Calendar.getInstance();

		if(schedule.getYear()==null || schedule.getYear().equals("")){
			schedule.setYear(Integer.toString(cal.get(Calendar.YEAR)));
		}
		if(schedule.getMonth()==null || schedule.getMonth().equals("")){
			schedule.setMonth(Integer.toString(cal.get(Calendar.MONTH)+1));
		}
		int iYear  = Integer.parseInt(schedule.getYear());
		int iMonth = Integer.parseInt(schedule.getMonth());

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
		schedule.setYear(Integer.toString(iYear));
		
		/* 월별확인 */

		/* 1월 */
		iMonth = 1;
		schedule.setMonth(Integer.toString(iMonth));
		cal.set(iYear,iMonth-1,1);
		schedule.setStartWeekMonth(cal.get(Calendar.DAY_OF_WEEK));
		schedule.setLastDayMonth(cal.getActualMaximum(Calendar.DATE));
        model.addAttribute("resultList_1" , scheduleManageService.selectAdministSchedulePopup(schedule) );
        model.addAttribute("RestdeList_1" , scheduleManageService.selectAdministMonthSchedule(schedule) );
        
		/* 2월 */
		iMonth = 2;
		schedule.setMonth(Integer.toString(iMonth));
		cal.set(iYear,iMonth-1,1);
		schedule.setStartWeekMonth(cal.get(Calendar.DAY_OF_WEEK));
		schedule.setLastDayMonth(cal.getActualMaximum(Calendar.DATE));
        model.addAttribute("resultList_2" , scheduleManageService.selectAdministSchedulePopup(schedule) );
        model.addAttribute("RestdeList_2" , scheduleManageService.selectAdministMonthSchedule(schedule) );
        
		/* 3월 */
		iMonth = 3;
		schedule.setMonth(Integer.toString(iMonth));
		cal.set(iYear,iMonth-1,1);
		schedule.setStartWeekMonth(cal.get(Calendar.DAY_OF_WEEK));
		schedule.setLastDayMonth(cal.getActualMaximum(Calendar.DATE));
        model.addAttribute("resultList_3" , scheduleManageService.selectAdministSchedulePopup(schedule) );
        model.addAttribute("RestdeList_3" , scheduleManageService.selectAdministMonthSchedule(schedule) );
        
		/* 4월 */
		iMonth = 4;
		schedule.setMonth(Integer.toString(iMonth));
		cal.set(iYear,iMonth-1,1);
		schedule.setStartWeekMonth(cal.get(Calendar.DAY_OF_WEEK));
		schedule.setLastDayMonth(cal.getActualMaximum(Calendar.DATE));
        model.addAttribute("resultList_4" , scheduleManageService.selectAdministSchedulePopup(schedule));
        model.addAttribute("RestdeList_4" , scheduleManageService.selectAdministMonthSchedule(schedule));
        
		/* 5월 */
		iMonth = 5;
		schedule.setMonth(Integer.toString(iMonth));
		cal.set(iYear,iMonth-1,1);
		schedule.setStartWeekMonth(cal.get(Calendar.DAY_OF_WEEK));
		schedule.setLastDayMonth(cal.getActualMaximum(Calendar.DATE));
        model.addAttribute("resultList_5" , scheduleManageService.selectAdministSchedulePopup(schedule));
        model.addAttribute("RestdeList_5" , scheduleManageService.selectAdministMonthSchedule(schedule));
        
		/* 6월 */
		iMonth = 6;
		schedule.setMonth(Integer.toString(iMonth));
		cal.set(iYear,iMonth-1,1);
		schedule.setStartWeekMonth(cal.get(Calendar.DAY_OF_WEEK));
		schedule.setLastDayMonth(cal.getActualMaximum(Calendar.DATE));
        model.addAttribute("resultList_6" , scheduleManageService.selectAdministSchedulePopup(schedule));
        model.addAttribute("RestdeList_6" , scheduleManageService.selectAdministMonthSchedule(schedule));
        
		/* 7월 */
		iMonth = 7;
		schedule.setMonth(Integer.toString(iMonth));
		cal.set(iYear,iMonth-1,1);
		schedule.setStartWeekMonth(cal.get(Calendar.DAY_OF_WEEK));
		schedule.setLastDayMonth(cal.getActualMaximum(Calendar.DATE));
        model.addAttribute("resultList_7" , scheduleManageService.selectAdministSchedulePopup(schedule));
        model.addAttribute("RestdeList_7" , scheduleManageService.selectAdministMonthSchedule(schedule));
        
		/* 8월 */
		iMonth = 8;
		schedule.setMonth(Integer.toString(iMonth));
		cal.set(iYear,iMonth-1,1);
		schedule.setStartWeekMonth(cal.get(Calendar.DAY_OF_WEEK));
		schedule.setLastDayMonth(cal.getActualMaximum(Calendar.DATE));
        model.addAttribute("resultList_8" , scheduleManageService.selectAdministSchedulePopup(schedule));
        model.addAttribute("RestdeList_8" , scheduleManageService.selectAdministMonthSchedule(schedule));
        
		/* 9월 */
		iMonth = 9;
		schedule.setMonth(Integer.toString(iMonth));
		cal.set(iYear,iMonth-1,1);
		schedule.setStartWeekMonth(cal.get(Calendar.DAY_OF_WEEK));
		schedule.setLastDayMonth(cal.getActualMaximum(Calendar.DATE));
        model.addAttribute("resultList_9" , scheduleManageService.selectAdministSchedulePopup(schedule));
        model.addAttribute("RestdeList_9" , scheduleManageService.selectAdministMonthSchedule(schedule));
        
		/* 10월 */
		iMonth = 10;
		schedule.setMonth(Integer.toString(iMonth));
		cal.set(iYear,iMonth-1,1);
		schedule.setStartWeekMonth(cal.get(Calendar.DAY_OF_WEEK));
		schedule.setLastDayMonth(cal.getActualMaximum(Calendar.DATE));
        model.addAttribute("resultList_10", scheduleManageService.selectAdministSchedulePopup(schedule));
        model.addAttribute("RestdeList_10", scheduleManageService.selectAdministMonthSchedule(schedule));
        
		/* 11월 */
		iMonth = 11;
		schedule.setMonth(Integer.toString(iMonth));
		cal.set(iYear,iMonth-1,1);
		schedule.setStartWeekMonth(cal.get(Calendar.DAY_OF_WEEK));
		schedule.setLastDayMonth(cal.getActualMaximum(Calendar.DATE));
        model.addAttribute("resultList_11", scheduleManageService.selectAdministSchedulePopup(schedule));
        model.addAttribute("RestdeList_11", scheduleManageService.selectAdministMonthSchedule(schedule));
        
		/* 12월 */
		iMonth = 12;
		schedule.setMonth(Integer.toString(iMonth));
		cal.set(iYear,iMonth-1,1);
		schedule.setStartWeekMonth(cal.get(Calendar.DAY_OF_WEEK));
		schedule.setLastDayMonth(cal.getActualMaximum(Calendar.DATE));
        
        model.addAttribute("resultList_12", scheduleManageService.selectAdministSchedulePopup(schedule));
        model.addAttribute("RestdeList_12", scheduleManageService.selectAdministMonthSchedule(schedule));

        return "/sym/cal/EgovAdministYearCalendar";
	}	
	
	 /**
     * 일정을 등록한다.
     * @param loginVO
     * @param schedule
     * @param bindingResult
     * @param model
     * @return "ScheduleRegist"
     * @throws Exception
     */
    @RequestMapping(value="/ScheduleRegist.do")
	public String insertRestde (@ModelAttribute("loginVO") LoginVO loginVO
			, @ModelAttribute("schedule") Schedule schedule
			, BindingResult bindingResult
			, ModelMap model
			) throws Exception {
    	if   (schedule.getScheduleDe() == null
    		||schedule.getScheduleDe().equals("")) {

    		ComDefaultCodeVO vo = new ComDefaultCodeVO();
    		vo.setCodeId("COM017");
            List<?> scheduleCodeList = cmmUseService.selectCmmCodeDetail(vo);
            model.addAttribute("scheduleCodeList", scheduleCodeList);

            return "sym/cal/EgovRestdeRegist";
    	}

        beanValidator.validate(schedule, bindingResult);
		if (bindingResult.hasErrors()){
            return "/sym/cal/EgovRestdeRegist";
		}

		schedule.setScheduleNo(idgenService.getNextIntegerId()%1000000);
		schedule.setFrstRegisterId(loginVO.getUniqId());

    	scheduleManageService.insertSchedule(schedule);;
        return "forward:/ScheduleList.do";
    }

	
	/**
	 * 일정을 삭제한다.
	 * @param loginVO
	 * @param schedule
	 * @param model
	 * @return "forward:/sym/cal/EgovRestdeList.do"
	 * @throws Exception
	 */
    @RequestMapping(value="/ScheduleRemove.do")
	public String deleteRestde (@ModelAttribute("loginVO") LoginVO loginVO
			, Schedule schedule
			, ModelMap model
			) throws Exception {
    	scheduleManageService.deleteSchedule(schedule);;
        return "forward:/ScheduleList.do";
	}



    /**
     * 일정 세부내역을 조회한다.
     * @param loginVO
     * @param schedule
     * @param model
     * @return "/ScheduleDetail"
     * @throws Exception
     */
	@RequestMapping(value="/ScheduleDetail.do")
 	public String selectRestdeDetail (@ModelAttribute("loginVO") LoginVO loginVO
 			, Schedule schedule
 			, ModelMap model
 			) throws Exception {
		Schedule vo = scheduleManageService.selectScheduleDetail(schedule);
		model.addAttribute("result", vo);
		
		return "/sym/cal/EgovRestdeDetail";
	}

    /**
	 * 일정 리스트를 조회한다.
     * @param loginVO
     * @param searchVO
     * @param model
     * @return "/ScheduleList"
     * @throws Exception
     */
    @RequestMapping(value="/ScheduleList.do")
	public String selectRestdeList (@ModelAttribute("loginVO") LoginVO loginVO
			, @ModelAttribute("searchVO") ScheduleVO searchVO
			, ModelMap model
			) throws Exception {
    	
    	/** EgovPropertyService.sample */
    	searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
    	searchVO.setPageSize(propertiesService.getInt("pageSize"));

    	/** pageing */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
        model.addAttribute("resultList", scheduleManageService.selectScheduleList(searchVO));
        
        int totCnt = scheduleManageService.selectScheduleListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        
        return "/sym/cal/EgovRestdeList";
	}
    

    /**
	 * 일정을 수정한다.
     * @param loginVO
     * @param schedule
     * @param bindingResult
     * @param commandMap
     * @param model
     * @return "/ScheduleModify"
     * @throws Exception
     */
    @RequestMapping(value="/ScheduleModify.do")
	public String updateRestde (@ModelAttribute("loginVO") LoginVO loginVO
			, @ModelAttribute("schedule") Schedule schedule
			, BindingResult bindingResult
			, @RequestParam Map <String, Object> commandMap
			, ModelMap model
			) throws Exception {
		String sCmd = commandMap.get("cmd") == null ? "" : (String)commandMap.get("cmd");
    	if (sCmd.equals("")) {
    		Schedule vo = scheduleManageService.selectScheduleDetail(schedule);
    		model.addAttribute("restde", vo);

    		ComDefaultCodeVO CodeVO = new ComDefaultCodeVO();
    		CodeVO.setCodeId("COM017");
            model.addAttribute("restdeCode", cmmUseService.selectCmmCodeDetail(CodeVO));

            return "/sym/cal/EgovRestdeModify";
    	} else if (sCmd.equals("Modify")) {
            beanValidator.validate(schedule, bindingResult);
    		if (bindingResult.hasErrors()){
        		ComDefaultCodeVO CodeVO = new ComDefaultCodeVO();
        		CodeVO.setCodeId("COM017");
                model.addAttribute("restdeCode", cmmUseService.selectCmmCodeDetail(CodeVO));

                return "/sym/cal/EgovRestdeModify";
    		}

    		schedule.setLastUpdusrId(loginVO.getUniqId());
    		scheduleManageService.updateSchedule(schedule);
	        return "forward:/sym/cal/EgovRestdeList.do";
    	} else {
    		return "forward:/sym/cal/EgovRestdeList.do";
    	}
    }

	
}
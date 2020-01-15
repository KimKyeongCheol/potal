package egovframework.let.sym.cal.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * 일정 모델 클래스
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
public class Restde implements Serializable {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 1L;

	/*
	 * 일정번호
	 */
    private int    restdeNo       = 0;
    
    /*
     * 일정일자
     */
    private String restdeDe       = "";
    
    /*
     * 일정명
     */
    private String restdeNm       = "";
    
    /*
     * 일정설명
     */
    private String restdeDc       = "";
    
    /*
     * 일정구분
     */
    private String restdeSe       = "";
    
    /*
     * 일정구분코드
     */
    private String restdeSeCode   = "";
    
    /*
     * 최초등록자ID
     */
    private String frstRegisterId = "";
    
    /*
     * 최종수정자ID
     */
    private String lastUpdusrId   = "";

    /*
     * 년
     */
    private String year           = "";
    
    /*
     * 월
     */
    private String month          = "";
    
    /*
     * 일
     */
    private String day            = "";
    
    /*
     * 일정여부
     */
    private String restdeAt       = "";

    /*
     * 달력셀
     */
	private int    cellNum        = 0;
	


	/*
	 * 월별 주순위
	 */
    private int    weeks          = 0;
    
    /*
     * 월 주수
     */
    private int maxWeeks = 0;
    
    /*
     * 요일
     */
    private int    week           = 0;
    
    /*
     * 시작요일 
     */
    private int    startWeekMonth = 0;
    
    /*
     * 마지막 일자
     */
    private int    lastDayMonth   = 0;

    
    /*
     * 일정 마지막 일자
     */
    
    private String restdeDe_e      = "";

    /*
     * 다음 달 정보
     */
   
    private String NextYM ="";

    /*
     * 이전 달 정보
     */
    
    private String PrevYM="";


    
	
	public String getNextYM() {
		return NextYM;
	}

	public void setNextYM(String nextYM) {
		NextYM = nextYM;
	}

	public String getPrevYM() {
		return PrevYM;
	}

	public void setPrevYM(String prevYM) {
		PrevYM = prevYM;
	}

	/**
	 * restdeDe_e attribute 를 리턴한다.
	 * @return String
	 */
	public String getRestdeDe_e() {
		return restdeDe_e;
	}

	/**
	 * restdeDe_e attribute 값을 설정한다.
	 * @param restdeDe_e String
	 */
	public void setRestdeDe_e(String restdeDe_e) {
		this.restdeDe_e = restdeDe_e;
	}
	
	
    /**
	 * restdeNo attribute 를 리턴한다.
	 * @return int
	 */
	public int getRestdeNo() {
		return restdeNo;
	}

	/**
	 * restdeNo attribute 값을 설정한다.
	 * @param restdeNo int
	 */
	public void setRestdeNo(int restdeNo) {
		this.restdeNo = restdeNo;
	}

	/**
	 * restdeDe attribute 를 리턴한다.
	 * @return String
	 */
	public String getRestdeDe() {
		return restdeDe;
	}

	/**
	 * restdeDe attribute 값을 설정한다.
	 * @param restdeDe String
	 */
	public void setRestdeDe(String restdeDe) {
		this.restdeDe = restdeDe;
	}

	/**
	 * restdeNm attribute 를 리턴한다.
	 * @return String
	 */
	public String getRestdeNm() {
		return restdeNm;
	}

	/**
	 * restdeNm attribute 값을 설정한다.
	 * @param restdeNm String
	 */
	public void setRestdeNm(String restdeNm) {
		this.restdeNm = restdeNm;
	}

	/**
	 * restdeDc attribute 를 리턴한다.
	 * @return String
	 */
	public String getRestdeDc() {
		return restdeDc;
	}

	/**
	 * restdeDc attribute 값을 설정한다.
	 * @param restdeDc String
	 */
	public void setRestdeDc(String restdeDc) {
		this.restdeDc = restdeDc;
	}

	/**
	 * restdeSe attribute 를 리턴한다.
	 * @return String
	 */
	public String getRestdeSe() {
		return restdeSe;
	}

	/**
	 * restdeSe attribute 값을 설정한다.
	 * @param restdeSe String
	 */
	public void setRestdeSe(String restdeSe) {
		this.restdeSe = restdeSe;
	}

	/**
	 * restdeSeCode attribute 를 리턴한다.
	 * @return String
	 */
	public String getRestdeSeCode() {
		return restdeSeCode;
	}

	/**
	 * restdeSeCode attribute 값을 설정한다.
	 * @param restdeSeCode String
	 */
	public void setRestdeSeCode(String restdeSeCode) {
		this.restdeSeCode = restdeSeCode;
	}

	/**
	 * frstRegisterId attribute 를 리턴한다.
	 * @return String
	 */
	public String getFrstRegisterId() {
		return frstRegisterId;
	}

	/**
	 * frstRegisterId attribute 값을 설정한다.
	 * @param frstRegisterId String
	 */
	public void setFrstRegisterId(String frstRegisterId) {
		this.frstRegisterId = frstRegisterId;
	}

	/**
	 * lastUpdusrId attribute 를 리턴한다.
	 * @return String
	 */
	public String getLastUpdusrId() {
		return lastUpdusrId;
	}

	/**
	 * lastUpdusrId attribute 값을 설정한다.
	 * @param lastUpdusrId String
	 */
	public void setLastUpdusrId(String lastUpdusrId) {
		this.lastUpdusrId = lastUpdusrId;
	}

	/**
	 * year attribute 를 리턴한다.
	 * @return String
	 */
	public String getYear() {
		return year;
	}

	/**
	 * year attribute 값을 설정한다.
	 * @param year String
	 */
	public void setYear(String year) {
		this.year = year;
	}

	/**
	 * month attribute 를 리턴한다.
	 * @return String
	 */
	public String getMonth() {
		return month;
	}

	/**
	 * month attribute 값을 설정한다.
	 * @param month String
	 */
	public void setMonth(String month) {
		this.month = month;
	}

	/**
	 * day attribute 를 리턴한다.
	 * @return String
	 */
	public String getDay() {
		return day;
	}

	/**
	 * day attribute 값을 설정한다.
	 * @param day String
	 */
	public void setDay(String day) {
		this.day = day;
	}

	/**
	 * restdeAt attribute 를 리턴한다.
	 * @return String
	 */
	public String getRestdeAt() {
		return restdeAt;
	}

	/**
	 * restdeAt attribute 값을 설정한다.
	 * @param restdeAt String
	 */
	public void setRestdeAt(String restdeAt) {
		this.restdeAt = restdeAt;
	}

	/**
	 * cellNum attribute 를 리턴한다.
	 * @return int
	 */
	public int getCellNum() {
		return cellNum;
	}

	/**
	 * cellNum attribute 값을 설정한다.
	 * @param cellNum int
	 */
	public void setCellNum(int cellNum) {
		this.cellNum = cellNum;
	}

	/**
	 * weeks attribute 를 리턴한다.
	 * @return int
	 */
	public int getWeeks() {
		return weeks;
	}

	/**
	 * weeks attribute 값을 설정한다.
	 * @param weeks int
	 */
	public void setWeeks(int weeks) {
		this.weeks = weeks;
	}

	/**
	 * maxWeeks attribute 를 리턴한다.
	 * @return int
	 */
	public int getMaxWeeks() {
		return maxWeeks;
	}

	/**
	 * maxWeeks attribute 값을 설정한다.
	 * @param maxWeeks int
	 */
	public void setMaxWeeks(int maxWeeks) {
		this.maxWeeks = maxWeeks;
	}

	/**
	 * week attribute 를 리턴한다.
	 * @return int
	 */
	public int getWeek() {
		return week;
	}

	/**
	 * week attribute 값을 설정한다.
	 * @param week int
	 */
	public void setWeek(int week) {
		this.week = week;
	}

	/**
	 * startWeekMonth attribute 를 리턴한다.
	 * @return int
	 */
	public int getStartWeekMonth() {
		return startWeekMonth;
	}

	/**
	 * startWeekMonth attribute 값을 설정한다.
	 * @param startWeekMonth int
	 */
	public void setStartWeekMonth(int startWeekMonth) {
		this.startWeekMonth = startWeekMonth;
	}

	/**
	 * lastDayMonth attribute 를 리턴한다.
	 * @return int
	 */
	public int getLastDayMonth() {
		return lastDayMonth;
	}

	/**
	 * lastDayMonth attribute 값을 설정한다.
	 * @param lastDayMonth int
	 */
	public void setLastDayMonth(int lastDayMonth) {
		this.lastDayMonth = lastDayMonth;
	}

	/**
     * toString 메소드를 대치한다.
     */
    public String toString() {
    	return ToStringBuilder.reflectionToString(this);
    }
    
}

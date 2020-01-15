<!DOCTYPE html>
<%
 /**
  * @Class Name  : EgovNormalMonthCalendar.jsp
  * @Description : EgovNormalMonthCalendar 화면
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.04.01   이중호              최초 생성
  *
  *  @author 공통서비스팀
  *  @since 2009.04.01
  *  @version 1.0
  *  @see
  *
  */
%>
<%  
response.setHeader("Cache-Control","no-store");  
response.setHeader("Pragma","no-cache");  
response.setDateHeader("Expires",0);  
if (request.getProtocol().equals("HTTP/1.1"))
        response.setHeader("Cache-Control", "no-cache");
%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html lang="ko">
<head>
<title>일반달력 월간</title>
</head>

<body>

<div class="cal-month-box">
							<div class="cal-tit-box">
							<div class="box-tit">이달의 일정</div>
							<div class="sec-r">
							
								<a href="javascript:;"  class="btn-cal-prev">이전달</a>
								<p class="month-txt">        <span id="cal_top_year"></span>
        .<span class="today"><span id="cal_top_month"></span>월 </span></p>
								<a href="javascript:;" class="btn-cal-next">다음달</a>

							</div>
						</div>



<div class="cal-day-box">
</div>

 
<script type="text/javascript">
    
    var today = null;
    var year = null;
    var month = null;
    var firstDay = null;
    var lastDay = null;
    var $tdDay = null;
    var $tdSche = null;
    var jsonData = null;
    var day = null;
    var tdMonth = null;
    var tdYear = null;
    $(document).ready(function() {
        drawCalendar();
        initDate();
        drawDays();
        drawSche();
        $(".btn-cal-prev").on("click", function(){movePrevMonth();});
        $(".btn-cal-next").on("click", function(){moveNextMonth();});
    });
    
    //Calendar 그리기
   
    function drawCalendar(){
        var setTableHTML = "";
        setTableHTML+='<ul>';
        setTableHTML+='<li class="day">SUN</li><li class="day">MON</li><li class="day">TUE</li><li class="day">WED</li><li class="day">THU</li><li class="day">FRI</li><li class="day">SAT</li>';
        for(var i=0;i<6;i++){
            for(var j=0;j<7;j++){
                setTableHTML+='<li>';
                setTableHTML+='    <a href="#" class="cal-day"></a>';
   /*              setTableHTML+='    <div class="cal-schedule"></div>'; */
                setTableHTML+='</li>';
            }
 
        }
        setTableHTML+='</ul>';
        $(".cal-day-box").html(setTableHTML);
    }
    
    //날짜 초기화
    function initDate(){
        $tdDay = $("li a.cal-day")
/*         $tdSche = $("li div.cal-schedule") */
        dayCount = 0;
        today = new Date();
        year = today.getFullYear();
        month = today.getMonth()+1;
        if(month < 10){month = "0"+month;}
        firstDay = new Date(year,month-1,1);
        lastDay = new Date(year,month,0);
        day = new String(today.getDate()); 
        tdMonth = new String(today.getMonth()+1);
        tdYear = today.getFullYear();
    }
    
    //calendar 날짜표시
    function drawDays(){
        $("#cal_top_year").text(year);
        $("#cal_top_month").text(month);
        for(var i=firstDay.getDay();i<firstDay.getDay()+lastDay.getDate();i++){
            $tdDay.eq(i).text(++dayCount);


            	if(tdYear == year && tdMonth == month && dayCount == day){

            		$tdDay.eq(i).parent().addClass("today");
            	}else{
            		
            		$tdDay.eq(i).parent().removeClass("today");
            	}
            	
            
        }
        for(var i=0;i<42;i+=7){
            $tdDay.eq(i).parent().addClass("sun");
        }
        for(var i=6;i<42;i+=7){
            $tdDay.eq(i).parent().addClass("sat");
        }
    
        focus(".cal-month-box");
    }
    
    //calendar 월 이동
    function movePrevMonth(){
        month--;
        if(month<=0){
            month=12;
            year--;
        }
        if(month<10){
            month=String("0"+month);
        }
        getNewInfo();
        }
    
    function moveNextMonth(){
        month++;
        if(month>12){
            month=1;
            year++;
        }
        if(month<10){
            month=String("0"+month);
        }
        getNewInfo();
    }
    
    //정보갱신
    function getNewInfo(){
        for(var i=0;i<42;i++){
            $tdDay.eq(i).text("");
  /*           $tdSche.eq(i).text(""); */
        }
        dayCount=0;
        firstDay = new Date(year,month-1,1);
        lastDay = new Date(year,month,0);
        drawDays();
        drawSche();
    }
    
    //2019-08-27 추가본
    
    //데이터 등록
    function setData(){
        jsonData = 
        {
            "2019":{
                "07":{
                    "17":"제헌절"
                }
                ,"08":{
                    "7":"칠석"
                    ,"15":"광복절"
                    ,"23":"처서"
                }
                ,"09":{
                    "13":"추석"
                    ,"23":"추분"
                }
            }
        }
    }
    
    //스케줄 그리기
    function drawSche(){
        setData();
        var dateMatch = null;
        for(var i=firstDay.getDay();i<firstDay.getDay()+lastDay.getDate();i++){
            var txt = "";
            txt =jsonData[year];
            if(txt){
                txt = jsonData[year][month];
                if(txt){
                    txt = jsonData[year][month][i];
                    dateMatch = firstDay.getDay() + i -1; 
                    $tdSche.eq(dateMatch).text(txt);
                }
            }
        }
    }
 
</script>
</div>
<!-- cal-today-text (S) -->
					<div class="cal-today-text">
						<dl>
							<dt>2019-09-18</dt>
							<dd>&gt;사업 개최식<br/>&gt;취업 설명회 _ 한경대</dd>
						</dl>
						<div class="btn-more"><a href="">더보기</a></div>
					</div>
					<!-- cal-today-text (E) -->

</body>
</html>

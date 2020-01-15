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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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
                setTableHTML+='    <a  class="cal-day"></a>';
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
       
        // 오늘 날짜 일정 정보 보여주기
        change_info(tdYear+tdMonth+day);
        
    }
    
    //calendar 날짜표시
    function drawDays(){
  


        $("#cal_top_year").text(year);
        $("#cal_top_month").text(month);
        for(var i=firstDay.getDay();i<firstDay.getDay()+lastDay.getDate();i++){
            $tdDay.eq(i).text(++dayCount);
            
            var lday = dayCount;			//d
            lday = lday >= 10 ? lday : '0' + lday;	
			
            var YMD=""+year+month+lday;
        	var restdeDe;
      		var restdeE;
            
        	
        	<c:forEach items ="${calList}" var="info"  varStatus="status">

        	 restdeDe =${info.restdeDe};
      		 restdeE = ${info.restdeE};
      	/* 	$tdDay.eq(i).removeClass("schedule"); */

        	if(YMD >= restdeDe && YMD <= restdeE){
        		$tdDay.eq(i).addClass("schedule");
        	}else if(YMD == restdeDe){
      		$tdDay.eq(i).addClass("schedule");
      		}

        	

      		
      		</c:forEach>
      	 	$tdDay.eq(i).attr("href","javascript:change_info("+YMD+");");
      		/* $tdDay.eq(i).setAttribute( 'href','YMD'); */
     

        	

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
        	$tdDay.eq(i).removeClass("schedule");
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



<script type="text/javascript">
/*  $(document).ready(function(){ */
	
 		function YMDFormatter(num){

 			var num1='';
	 num1= num;
     if(!num) return "";

     var formatNum = '';

 	alert(num1);

     // 공백제거

     //replace(/\s/gi, "")
  /*    num1=num1.trim(); */



     try{

          if(num1 != null) {
        	  num1=num1.trim();
               formatNum = num1.replace(/(\d{4})(\d{2})(\d{2})/, '$1-$2-$3');

          }

     } catch(e) {

          formatNum = num1;
      
          console.log(e);
  

     }
     
     return formatNum;

};

function change_info(sts){	
	var stt="";
	

	
	var cdate="";
 	if(sts == null || sts == ""){
		 var dt = new Date();
		    var Year = dt.getFullYear();        
		    var Month = "" + (dt.getMonth()+1);
		    var Day = "" + dt.getDate();            
		    
		    if(Month.length < 2) Month = "0" + Month;
		    if(Day.length < 2) Day = "0" + Day;
		    
		    stt = Year.toString() + Month + Day;
		    
			cdate= new String(stt);
	}else{
		cdate=new String(sts);		
	}
	


	
	var chk ="";
	
	chk = cdate.replace(/(\d{4})(\d{2})(\d{2})/, '$1-$2-$3');


	
	
    var setTableHTML = "";
    var startDay="";
    var endDay="";
    setTableHTML+='<dl>';
     setTableHTML+="<dt>"+chk+"</dt>";
	 	setTableHTML+="<dd>";
     <c:forEach items ="${calList}" var="info"  varStatus="status">
     startDay ="${info.restdeDe}";
     endDay="${info.restdeE}";
     if(startDay <= cdate && endDay>=cdate){
    	
    	 var startDay1 = "";
    	startDay1 = startDay.substring(0,4);
    	var startDay2 = "";
    	startDay2 =startDay.substring(4,6);
    	var startDay3 ="";
    	startDay3 = startDay.substring(6,8);
   	
    	var endDay1 = "";
    	endDay1 = endDay.substring(0,4);
 	var endDay2 = "";
 	endDay2 =endDay.substring(4,6);
 	var endDay3 ="";
 	endDay3 = endDay.substring(6,8);
    	
    	var s_date=startDay1+"-"+startDay2+"-"+startDay3;
    	var e_date=endDay1+"-"+endDay2+"-"+endDay3;


    	    setTableHTML+='<c:out value="${info.restdeNm}"/>';
    	    setTableHTML+='&nbsp;&#40;'+s_date+'&nbsp;&#45;&nbsp;'+e_date+'&#41;';
    	    setTableHTML+="</br>"; 
     }

  
    </c:forEach>
    setTableHTML+="</dt>"; 
     setTableHTML+='</dl>'; 
     setTableHTML+='<div class="btn-more"><a href="<c:url value='/CalList.do'/>';
 
     setTableHTML+='" >더보기</a></div>';
    $(".cal-today-text").html(setTableHTML);
	
}
/*  }); */
</script>
<!-- cal-today-text (S) -->
					<div class="cal-today-text">
						<%-- <dl>
							<dt>2019-09-18</dt>
							<dd>
							<c:forEach var="result" items="${calList}" varStatus="status">

&gt;<c:out value="${result.restdeNm}" /><br/>
</c:forEach>
</dd>
						<!-- 	<dd>&gt;사업 개최식<br/>&gt;취업 설명회 _ 한경대</dd> -->
						</dl> --%>
						

						<!-- <div class="btn-more"><a href="" >더보기</a></div> -->
					</div>
					<!-- cal-today-text (E) -->


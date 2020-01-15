$(document).ready(function () {
	$(".gnb-menu-list-box").each(function(){
		$(this).on("mouseenter focusin",function(){
			$('.gnb-menu-list-box > li > div').stop(true,true).animate({"height":"13.5rem"},300);
			$('.gnb-menu-bg').addClass("open").stop(true,true).animate({"height":"13.5rem"},200);
  		}).on("mouseleave",function(){
  		});
	});
 
	$(".gnb-wrap").each(function(){
		$(this).on("mouseenter focusin",function(){
  		}).on("mouseleave",function(){
			$('.gnb-menu-list-box > li > div').stop(true,true).animate({"height":"0px"},200);
			$('.gnb-menu-bg').removeClass("open").stop(true,true).animate({"height":"0px"},300);
  		});
	});

	$(".btnSitemap").click(function(){
		$('.gnb-menu-list-box > li > div').stop(true,true).animate({"height":"13.5rem"},300);
		$('.gnb-menu-bg').addClass("open").stop(true,true).animate({"height":"13.5rem"},200);
	});

	$(".gnb-wrap .gnb-menu-list-box > li").each(function(){
		$(this).on("mouseenter focusin",function(){
			$(".gnb-wrap .gnb-menu-list-box > li").removeClass("on");
			$(this).addClass("on");
  		}).on("mouseleave",function(){
			$(this).removeClass("on");
  		});
	});


	$(".m-hd-menu").on("click",function(){
 		$('.nav-list.mb').addClass("open").stop(true,true).animate({"left":"0", "width":"100%"},300);
 		$('.m-hd-menu').addClass("close");
		$('.m-hd-menu-close').addClass("close");
		$('body').css("overflow", "hidden");
	});
	$(".m-hd-menu-close").on("click",function(){
 		$('.nav-list.mb').removeClass("open").stop(true,true).animate({"left":"-100%", "width":"0"},300);
 		$('.m-hd-menu').removeClass("close");
		$('.m-hd-menu-close').removeClass("close");
		$('body').css("overflow", "auto");
	});

	$(".nav-list.mb > ul > li > a").on("click",function(){
		$(".nav-list.mb > ul > li").removeClass("open");
		$(".nav-list.mb > ul > li > div > ul").slideUp();
   		if($(this).parent().find(" > div > ul").css("display") == "block"){
			$(this).parent().removeClass("open");
			$(this).parent().find("> div > ul").slideUp();
		}else{
 			$(this).parent().addClass("open");
			$(this).parent().find("> div > ul").slideDown();
		}
 	});

 	var uploadFile = $('.fileBox .uploadBtn');
	uploadFile.on('change', function(){
		if(window.FileReader){
			var filename = $(this)[0].files[0].name;
		} else {
			var filename = $(this).val().split('/').pop().split('\\').pop();
		}
		$(this).siblings('.fileName').val(filename);
	});
	 

    var select = $(".comm_selectbox select");
    
    select.change(function(){
        var select_name = $(this).children("option:selected").text();
        $(this).siblings("label").text(select_name);
    });
	/* ie �섏쐞 釉뚮씪�곗� css 愿��� 異붽� */

	 $('.pop-type').click(function(){
		var $href = $(this).attr('id');
		layer_popup($href);
	});

});

 /*****************************
** �덉씠�� �앹뾽 �ㅽ겕由쏀듃 
*************************************/
 

function layer_popup(el){

	var $el = $(el);        //�덉씠�댁쓽 id瑜� $el 蹂��섏뿉 ����
	var isDim = $el.prev().hasClass('dimBg');   //dimmed �덉씠�대� 媛먯��섍린 �꾪븳 boolean 蹂���

	$el.addClass("on");
	//isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();
	$('.dim-layer').fadeIn()
	$el.fadeIn();
	$el.center();
 
	$el.find('a.btn-layerClose').click(function(){
		$('.dim-layer').fadeOut();
		$el.fadeOut();  
		$el.removeClass("on");
	   return false;
	});
	$el.find('a.pop-close').click(function(){
		$('.dim-layer').fadeOut();
		$el.fadeOut();  
		$el.removeClass("on");
	   return false;
	});

	$('.layer .dimBg').click(function(){
		$('.dim-layer').fadeOut();
		$el.removeClass("on");
	   return false;
	});
}


$.fn.center = function () {
    this.css("position","absolute");
    this.css("top", Math.max(0, (($(window).height() - $(this).outerHeight()) / 2) + $(window).scrollTop()) + "px");
    this.css("left", Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) + $(window).scrollLeft()) + "px");
    return this;
}


//JS -- ǰ̨��ҳ

function show_job(id,showhtml){
	if(showhtml=="1"){
		$.post("index.php?m=ajax&c=show_leftjob",{},function(data){	
			$("#menuLst").html(data);	
			$(".lst"+id).attr("class","lst"+id+" hov");			
		});
	}else{
		var num=$(".lstCon").length/3;
		if(id<num){
			var height=id*35;
			var heightdiv=$(".lst"+id+" .lstCon").height();
			if(heightdiv-height<35){
				height=heightdiv=$(".lst"+id+" .lstCon").height()/2;
			}
			$(".lst"+id+" .lstCon").attr("style","top:-"+height+"px");
		}else if(id<num*2){
			var height=id*35;
			var heightdiv=$(".lst"+id+" .lstCon").height()/2;
			$(".lst"+id+" .lstCon").attr("style","top:-"+heightdiv+"px");
		}else{
			var height=($(".lstCon").length-id)*35;
			var heightdiv=$(".lst"+id+" .lstCon").height();
			if(heightdiv>height){
				heightdiv=heightdiv-height;
			}else{
				heightdiv=0;
			}
			$(".lst"+id+" .lstCon").attr("style","top:-"+heightdiv+"px");
		}
		$(".lst"+id).attr("class","lst"+id+" hov");	
	}
}
function selects(id,type,name){
	$("#job_"+type).hide();
	$("#"+type).val(name);
	$("#"+type+"id").val(id);
} 
function hide_job(id){
	$("#menuLst li").removeClass("hov"); 
}
function showDiv2(obj){
	if($(obj).attr("class")=="current1"){
		$(obj).removeClass();
	}
	else{
		$(obj).addClass("current1");
		$(obj).find(".shade").height($(obj).find(".area").height()+60)
	}
}
function clean(){
	$("#edu").val("��ѡ��");
	$("#eduid").val("");
	$("#exp").val("��ѡ��");
	$("#expid").val("");
	$("#mun").val("��ѡ��")
	$("#munid").val("");;
	$("#salary").val("��ѡ��");
	$("#salaryid").val("");
	$("#index_job_class_val").val("��ѡ��ְλ���");
	$("#job_class").val("");
	$("#city").val("��ѡ�����ص�");
	$("#cityid").val("");
	$("#hy").val("��ѡ����ҵ���");
	$("#hyid").val("");
}
$(function(){
	$('body').click(function(evt) {
		if($(evt.target).parents("#job_hy").length==0 && evt.target.id != "hy") {
			$('#job_hy').hide();
		}
		if($(evt.target).parents("#job_exp").length==0 && evt.target.id != "exp") {
			$('#job_exp').hide();
		}
		if($(evt.target).parents("#job_edu").length==0 && evt.target.id != "edu") {
			$('#job_edu').hide();
		}
		if($(evt.target).parents("#job_salary").length==0 && evt.target.id != "salary") {
			$('#job_salary').hide();
		}
		if($(evt.target).parents("#job_mun").length==0 && evt.target.id != "mun") {
			$('#job_mun').hide();
		}  
		if($(evt.target).parents(".index_r_wap_l").length==0&&$(evt.target).attr('class')!='index_r_wap_l') {
			$(".index_r_wap_l>.index_r_wap_box").hide();
		} 
		if($(evt.target).parents(".index_r_weixin").length==0&&$(evt.target).attr('class')!='index_r_weixin') {
			$(".index_r_wap_box_weixin").hide();
		} 
		if($(evt.target).parents(".index_r_wap_box").length){
			$(".index_r_wap_box").hide();
		}
		if($(evt.target).parents(".index_nav_tit").length==0){
			$("#boxNav").hide();
		}
	});  
	/*$.post(weburl+"/index.php?m=ajax&c=DefaultLoginIndex",{},function(data){
		$("#index_logoin").html(data);
	});*/
	
	/*��ҳ�Ҳ����š������л�*/
	$(".yun_index_h1_list li").hover(function(){
		var num=$(this).index(); 
		$(".yun_index_h1_list li").removeClass("yun_index_h1_cur");
		$(this).addClass("yun_index_h1_cur");
		$(".yuin_index_r .yun_index_cont").hide();
		$(".yun_index_cont:eq("+num+")").show(); 
	}); 
	$(".index_r_wap_l").click(function(){
		$(".index_r_wap_box").hide();
		$(this).find(".index_r_wap_box").show();
	});
	$(".index_r_weixin").click(function(){
		$(".index_r_wap_box").hide();
		$(this).find(".index_r_wap_box").show();
	});

	/*��ҳ���ʼ*/
	$("#navMenu").click(function(){
		$("#boxNav").show();
	});
	
	$("#navLst li").hover(function(){
		$(this).attr('class','show');
	},function(){$(this).attr('class','');});
	/*
	$("#navLst .index_nav_l").hover(function(){
		$(this).parent().attr('class','show');
	},function(){$(this).parent().attr('class','');});*/
	/*��ҳ������*/
})

/*��ҳ���*/
$(document).ready(function(){
	$('#bottom_ad_is_show').val('1');
	var duilian = $("div.duilian");
	var duilian_close = $(".btn_close");
	var scroll_Top = $(window).scrollTop();
	var window_w = $(window).width();
	if(window_w>1000){duilian.show();}
	buttom_ad();
	$("div .duilian").css("top",scroll_Top+200);
	$(window).scroll(function(){
		buttom_ad();
		var scroll_Top = $(window).scrollTop();
		duilian.stop().animate({top:scroll_Top+200});
	});
	duilian_close.click(function(){
		$(this).parents('.duilian').hide();
		return false;
	});
});
function colse_bottom(){
	$("#bottom_ad_fl").parent().hide();
	$('#bottom_ad_is_show').val('0');
}
function buttom_ad(){
	if($("#bottom_ad").length>0&&$("#bottom_ad_is_show").length>0){
		var scrollTop = $(window).scrollTop();
		var w_height=$(document).height();
		var bottom_ad=$("#bottom_ad").offset().top;
		var bottom_ad_fl=$("#bottom_ad_fl").offset().top;
		var poor_height=parseInt(w_height)-parseInt(scrollTop);
		var bottom_ad_is_show=$('#bottom_ad_is_show').val();
		if(window.attachEvent){
			poor_height=parseInt(poor_height)-parseInt(22);
		}
		if(poor_height<=880){
			$("#bottom_ad_fl").parent().hide();
		}else if(bottom_ad_is_show=='1'){
			$("#bottom_ad_fl").parent().show();
		}
	}
}

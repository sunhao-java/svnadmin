var pageNumber = 1;//记录Main窗口的分页页码
/**
 * 操作消息提示
 * @param title
 * @param message
 */
function ShowMsg(message) {
	$("#msg_title").html('操作提示');
	$("#msg_content").html(message);
	$("#show_success_msg").slideDown(350);
	setTimeout(function() {
		$("#show_success_msg").slideUp(350);
	}, 3500);
}
// ifream自适应高度
function init() {
	$("#MainContentDiv").height($(window).height() - $("#navigation_p2p").height() - 50);
	$("#sidebar").height($(window).height() - $("#navigation_p2p").height()-20);
}
// 窗口大小改变时
window.onresize = function() {
	init();
};
$(function() {
	$(".nav_tab").bind("click", function() {
		$(".nav_tab").removeClass("active");
		$(this).addClass("active");
	});
	init();
});

/**
 * 主页导航改变
 */
function changeUrl(Url,Menu_code,MeneName,SubMenuName) {
	iframeLoadAnimation(Url);
	select_menu_code=Menu_code;
	pageNumber = 1;//重置
	var mentHtml = '<span><i class="icon-home home-icon"></i>&nbsp;首页</span><span>'+MeneName+'</span></li>';
	if(SubMenuName){mentHtml+='<span onclick="backUpUrl(\''+Url+'\')" title="需要跳转到'+SubMenuName+'？">'+SubMenuName+'</span>';}
	$('#mentNavgation').html(mentHtml);
}

function iframeLoadAnimation(Url){
	var load_index = layer.load(0, {shade: false});
	var iframe = $("#MainiFrame").attr("src", Url).get(0);
	if (iframe.attachEvent){
	    iframe.attachEvent("onload", function(){
	    	layer.close(load_index);
	    });
	} else {
	    iframe.onload = function(){
	    	layer.close(load_index);
	    };
	}
}
/**
 * 返回上一级
 * @param Url 返回路径
 */
function backUpUrl(Url){
	$("#MainiFrame").attr("src", Url);
}

function logout() {
	window.location.href = "logout.do";
}
var required = {
	"oldpassword" : "请输入原密码",
	"password" : "请输入新密码",
	"repassword" : "请输入确认密码"
};
function readyEditPWD() {
	var pass = true;
	for ( var key in required) {
		if (!$.trim($("#" + key).val())) {
			ShowMsg("操作提示", required[key]);
			$("#" + key).focus();
			pass = false;
			break;
		}
	}
	if (pass) {
		var password = $("#password");
		if (password.val().length < 6 || password.val().length > 20) {
			ShowMsg("操作提示", "新密码长度必须为6-20 位");
			return;
		}
		if ($.trim($("#password").val()) != $.trim($("#repassword").val())) {
			ShowMsg("操作提示:", "确认密码和新密码输入不一致，请重新输入");
			return;
		}
		$.ajax({
			type : "POST",
			url : "adminUserModifyPwdBySelf.do",
			data : {
				"oldpswd" : $.trim($("#oldpassword").val()),
				"newpswd" : $.trim($("#password").val())
			},
			dataType : "json",
			success : function(data) {
				ShowMsg("操作提示:", data.info);
				if (data.status) {
					$("#modal-table").modal("hide");
				}
			}
		});

	}

}
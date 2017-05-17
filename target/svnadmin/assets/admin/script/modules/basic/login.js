/**
 * 登录页面
 * @author Hpboys
 * @version 1.0.0
 */
define(function(require, exports, module){
	//引入模块
	require('$');
	var util = require('util');
	var layer = require('layer');
	
	//全登陆不允许iframe嵌入 
	if(window.top !== window.self){ window.top.location = window.location;}
	
	$(document).keydown(function(e) {
        if (e.keyCode == 13) {
        	$('#submit').click();
        }
    });
	
	function loginSubmit(){
		var layIndex = util.loading();
		$.post('loginHandler',util.serializeObject($('#loginForm')),function(data){
			layer.close(layIndex);
			if(data.status){
				$('#error').html('<i class="form-success"></i>登录成功').slideDown(100);
				setTimeout(function(){location.href = data.attr.url;},500);
			}else{
				$('#error').html('<i class="form-error"></i>'+data.info).slideDown(150);
				$('#verify').val('').focus();
			}
		});
		return false;
	};
	
	window.loginSubmit = loginSubmit;
	
});
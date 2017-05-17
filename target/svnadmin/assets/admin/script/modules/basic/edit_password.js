/**
 * 用户修改密码
 * @author Hpboys
 * @version 1.0.0
 */
define(function(require, exports, module){
	//引入模块
	require('$');
	var util = require('util');
	var layer = require('layer');

	function formSubmit(){
		var submitForm = $('#submitForm');
		var loadIndex = util.loading();
		$.post('updatePassword.do',util.serializeObject(submitForm),function(data){
			layer.close(loadIndex);
			if(data.status){
				util.showMsg(data.info);
				submitForm.get(0).reset();
			}else{
				util.showMsg(data.info,3);
			}
		});
		return false;
	};
	
	window.formSubmit = formSubmit;
	
});
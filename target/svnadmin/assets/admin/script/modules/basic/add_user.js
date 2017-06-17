/**
 * 添加用户
 * @author yuliang
 * @version 1.0.0
 */
define(function(require, exports, module){
	//引入模块
	require('$');
	var util = require('util');
	
	function formSubmit(){
		var addUserForm = $('#addUserForm');
		$.post('saveUser.do',util.serializeObject(addUserForm),function(data){
			if(data.status){
				util.showMsg(data.info);
				addUserForm.get(0).reset()
			}else{
				util.showMsg(data.info, 3);
			}
		});
		return false;
	};
	
	window.formSubmit = formSubmit;
	
});
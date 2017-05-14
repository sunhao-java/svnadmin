/**
 * 创建项目
 * @author Hpboys
 * @version 1.0.0
 */
define(function(require, exports, module){
	//引入模块
	require('$');
	var util = require('util');

	function submitForm(){
		var form = util.serializeObject($('#submitForm'));
		var load_index = util.loading();
		$.post('pjCreateHandler',form,function(data){
			util.showMsg(data.info);
			if(data.status){
				util.closeLayer(load_index);
				setTimeout(function(){
					location.href = data.attr.url;
				},1500);
			}
		});
		return false;
	}
	
	window.submitForm = submitForm;
	
});
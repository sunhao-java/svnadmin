/**
 * 用户修改密码页面
 * @author Hpboys
 * @version 1.0.0
 */
define(function(require, exports, module){
	//引入模块
	require('$');
	var util = require('util');
	var layer = require('layer');
	var constant = require('constant');

	//页面请求域
	var _scope = {
		view:{},
		methods:{
            submitForm: function(){
                var form = util.serializeObject($('#submitForm'));
                if(form.rePsw != form.newPsw){
                    util.showMsg("两次新密码输入不一致", 3);
                    return false;
				}
                if(form.oldPsw == form.newPsw){
                    util.showMsg("新密码不能和老密码保持一致", 3);
                    return false;
                }
                var loadIndex = util.loading();
                $.post('usrUpdatePswdHandler', form ,function(data){
                    if(data.status){
                        util.showMsg(data.info);
					}else{
                        util.showMsg(data.info, 3);
					}
                    layer.closeAll();
                });
                return false;
			}
		}
	};

    //暴露方法到Window
    window.submitForm = _scope.methods.submitForm;
});




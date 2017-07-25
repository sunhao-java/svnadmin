/**
 * 用户列表页面
 * @author Hpboys
 * @version 1.0.0
 */
define(function(require, exports, module){
	//引入模块
	require('$');
	var util = require('util');
	var layer = require('layer');
	var template = require('template');
	var constant = require('constant');
	var pageService = require('page_service');

	var pageBean = pageService.init({
		url: 'usrRightList?action=data',
		isPagination: false,
        intercept:function(data){
            data.resRightStatus = constant.resRightStatus;
            return data;
        },
		after:function(data){

		}
	});

	//页面请求域
	var _scope = {
		view:{

		},
		methods:{

		}
	};

	// _scope.view.init();
	
});




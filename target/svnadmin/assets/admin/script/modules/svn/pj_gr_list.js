/**
 * 项目用户页面
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

	var pj = $('.select_pj').val();
	var newPsw = $('#psw');

	var pageBean = pageService.init({
		url: 'pjGrList?action=data&pj='+pj,
		isPagination: false,
		after:function(data){
			_scope.view.reBindEvent();
		}
	});

	//页面请求域
	var _scope = {
		view:{
			init:function(){
				$('#addBtn').on('click', function(){
					$('#submitForm')[0].reset();
					_scope.view.editDialog();
				});
			},
			reBindEvent:function(){
				$('.btn-remove').on('click', function(){
					var pj = $(this).attr('data-pj');
					var gr = $(this).attr('data-gr');
					_scope.methods.removePjGr(pj,gr);
				});
			},
			editDialog:function(){
				//用户编辑层
				layer.open({
					type: 1
					,title: '添加项目用户组'
					,area: ['650px', '300px']
					,shade: [0.3, '#393D49']
					,content: $('#submitForm')
				});
			}
		},
		methods:{
			submitForm:function(){
				var form = util.serializeObject($('#submitForm'));
				var load_index = util.loading();
				$.post('pjGrAddHandler',form,function(data){
					util.showMsg(data.info);
					if(data.status){
						layer.closeAll();
						pageBean.reload();
					}
				});
				return false;
			},
			removePjGr:function(pj,gr){
				util.confirm({
					msg: '您确定在项目 “'+pj+'” 中删除用户组 “'+gr+'” 吗?',
					confirm:function(){
						// 请求
						$.post('pjGrRemoveHandler', {'pj': pj,'gr' : gr}, function(data){
							if(data.status){
								pageBean.reload();
								util.showMsg(data.info);
							}else{
								util.showMsg(data.info, 3);
							}
						});
						// 关闭弹窗
						layer.closeAll();
					}
				});
			}
		}
	};

	_scope.view.init();
	//暴露方法到Window
	window.submitForm = _scope.methods.submitForm;
});




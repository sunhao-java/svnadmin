/**
 * 项目用户组页面
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
	var gr = $('.select_gr').val();

	var pageBean = pageService.init({
		url: 'pjGrUsrList?action=data&pj='+pj+"&gr="+gr,
		isPagination: false,
		after:function(data){
			_scope.view.reBindEvent();
		}
	});

	//页面请求域
	var _scope = {
		view:{
			init:function(){
				$('.usr-list li').on('click', function(){
					$(this).toggleClass('selected');
				});
				$('#addBtn').on('click', function(){
					_scope.view.selectUsrEvent(true);
				});
				$('#removeBtn').on('click', function(){
					_scope.view.selectUsrEvent(false);
				});
				$('#submitBtn').on('click', function(){
					_scope.methods.submitForm();
				});
			},
			reBindEvent:function(){
				$('.btn-remove').on('click', function(){
					var _this = $(this);
					var usr = _this.attr('data-usr');
					_scope.methods.removePjGrUsrUser(usr);
				});
			},
			//true:添加，false:移出
			selectUsrEvent:function(flag){
				if(flag){
					$('.out-usr-list li.selected').appendTo($('.in-usr-list'));
				}else{
					$('.in-usr-list li.selected').appendTo($('.out-usr-list'));
				}
				_scope.view.resetUsrBox();
			},
			resetUsrBox: function(){
				$('.usr-list .selected').removeClass('selected');
			}
		},
		methods:{
			submitForm:function(){
				var form = util.serializeObject($('#in-usr-form'));
				form.pj = pj;
				form.gr = gr;
				var load_index = util.loading();
				$.post('pjGrUsrAddHandler',form,function(data){
					util.showMsg(data.info);
					if(data.status){
						layer.closeAll();
						pageBean.reload();
					}
				});
				return false;
			},
			removePjGrUsrUser:function(usr){
				util.confirm({
					msg: '您确定要删除项目 “'+pj+'” 中（'+gr+'）组的 “'+usr+'” 账户吗?',
					confirm:function(){
						var form = {};
						form.pj = pj;
						form.gr = gr;
						form.usr = usr;
						// 请求
						$.post('pjGrUsrRemoveHandler', form, function(data){
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




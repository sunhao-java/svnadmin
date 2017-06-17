/**
 * 公用分页模块Service
 * @author Hpboys
 * @version 1.0.1
 */
define(function(require, exports, module){
	//引入模块
	require('$');
	var util = require('util');
	var template = require('template');
	var layer = require('layer');
	module.exports = {
		/**
		 * 进行初始化分页对象
		 */
		init: function(options){
			var pageBean = new PageBean(options);
			pageBean.init();
			pageBean.paging(1);//进行加载
			return pageBean;
		}
	};
	//分页对象
	function PageBean(options){
		this.url = options.url;
		this.queryWhere = {};//查询条件
		this.pageNumber = 1;//页码
		this.isPagination = options.isPagination || true;//是否需要分页显示
		this.queryFormId = options.queryFormId || '#QueryForm';//查询form选择器
		this.qryBtnId = options.qryBtnId || '#qryBtn';
		this.cancelQryBtnId = options.cancelQryBtnId || '#cancelQryBtn';
		
		this.tplId = options.tplId || 'listView';
		this.tplContainer = options.tplContainer || '#tplContainer';
		//初始化
		this.init = function(){
			var pb = this;
			$(this.qryBtnId).on('click', function(){
				pb.query();
			});
			$(this.cancelQryBtnId).on('click', function(){
				pb.cancelQuery();
			});
		};
		//查询
		this.query = function(){
			this.queryWhere = util.serializeObject($(this.queryFormId));
			this.paging(1);
		};
		//取消查询
		this.cancelQuery = function(){
			this.queryWhere = {};
			$(this.queryFormId)[0].reset();
			this.paging(1);
		};
		//分页
		this.paging = function (pageNumber){
			this.pageNumber = pageNumber;
			var pb = this;
			if(options.before){
				options.before(this.pageNumber);
			}
			var loadIndex = util.loading();
			this.queryWhere.pageNumber = this.pageNumber;//页码
			$.get(this.url, this.queryWhere, function(data){
				util.closeLayer(loadIndex);
				if(options.intercept){
					data = options.intercept(data);
				}
				$(pb.tplContainer).html(template(pb.tplId, data));
				if(pb.isPagination){
					pb.loadPagination();
				}
				if(options.after){
					options.after(data);
				}
			});
		};
		//加载分页组件
		this.loadPagination = function(){
			var pb = this;
			$('.pagination a').on('click', function(){
				var _this = $(this);
				pb.paging(_this.attr('data-page'));
			});
			$('.to-pager').on('click', function(){
				var toPageNum = $('#toPageNum');
				var pageNum = toPageNum.val() || 1;
				pb.paging(pageNum);
			});
		};
		//重载当前页码
		this.reload = function(url){
			if(url){
				this.url = url;
			}
			this.paging(this.pageNumber);
		};
		//分页数据前调用方法,可以进行方法重写
		//this.before = function(pageNumber){};
		//分页数据拦截调用方法,可以进行方法重写
		//this.intercept = function(data){};
		//分页数据后调用方法,可以进行方法重写
		//this.after = function(data){};
	}
});
/**
 * @requires JQuery||zepto
 * @namespace util
 * @author hpboys
 * @version 1.0.1
 * @blog www.hpboys.com
 */
define(function(require, exports, module){
	var util = {};
	//引用模块
	require('$');
	
	/**
	 * @author 微笑风采
	 * @requires jQuery
	 * 将form表单元素的值序列化成对象
	 * @returns object
	 */
	util.serializeObject = function(form) {
		var o = {};
		$.each(form.serializeArray(), function(index) {
			if (o[this['name']]) {
				o[this['name']] = o[this['name']] + "," + this['value'];
			} else {
				o[this['name']] = this['value'];
			}
		});
		return o;
	};
	
	/**
	 * 将select元素的选项值序列化为JSON对象
	 */
	util.serializeSelectToObject = function(select){
		var o = {};
		select.find('option').each(function(i,item){
			var _item = $(item);
			o[_item.attr('value')] = _item.html();
		});
		return o;
	};
	/**
	 * 将JSON对象转换为字符串
	 */
	util.json2Str = function(jsonObj){
		var i = 0;
		var resultTxt = "";
		for(var key in jsonObj){
			if(i++==0){
				if (jsonObj[key] == undefined) {
					resultTxt +=  key + "=" + "";
				} else {
					resultTxt +=  key + "=" + jsonObj[key];
				}
			} else {
				if (jsonObj[key] == undefined) {
					resultTxt += "&"  + key + "=" + "";
				} else {
					resultTxt += "&" + key + "=" + jsonObj[key];
				}
			}
		}
		return resultTxt;
	};

	/**
	 * 操作消息提示
	 * @param title
	 * @param type 1：成功 2：信息 3：警告 4：错误
	 */
	util.showMsg = function(message,type) {
		//var layer = require('layer');
		//if(icon == undefined){
		//	icon = 1;
		//}
		//var layerIndex = layer.msg('<b>操作提示：</b>'+message, {
		//	icon: icon,
		//	offset: 0,
		//	shift: 1,
		//	time: 4000
		//}, function(){});
		////$(window.parent).append($('#layui-layer'+layerIndex).clone());
		//return layerIndex;
		//toastr.options = {
		//	"closeButton": true,
		//	"debug": false,
		//	"progressBar": false,
		//	"positionClass": "toast-top-right",
		//	"onclick": null,
		//	"showDuration": "400",
		//	"hideDuration": "5000",
		//	"timeOut": "4000",
		//	"extendedTimeOut": "1000",
		//	"showEasing": "swing",
		//	"hideEasing": "linear",
		//	"showMethod": "fadeIn",
		//	"hideMethod": "fadeOut"
		//}
		//toastr.success("info",message);
		type = type || 1;
		var tips = ['success','success','info','warning','error'];
		require('toastr');
		toastr.options = {"closeButton": true};
		toastr[tips[type]](message);
	};

	/**
	 * 将一个Json对象加载到表单中
	 */
	util.load = function($form,jsonObj){
		$.each($form.serializeArray(), function(index,item) {
			var $item = $form.find('[name='+this['name']+']');
			if($item.length>1){//可能为Radio或者checkBox
				$form.find('[name='+this['name']+'][value='+jsonObj[this['name']]+']').prop('checked',true);
			}else{
				$item.val(jsonObj[this['name']]);
			}
		});
	};

	/**
	 * 传入时间戳进行格式化
	 */
	util.dateFormat = function(date,format){
		if(!date){return '';}
		if(!isNaN(date)){
			date = (new Date(Number(date))).toString();
		}
		date = new Date(date);
	    var map = {
	        "M": date.getMonth() + 1, //月份 
	        "d": date.getDate(), //日 
	        "h": date.getHours(), //小时 
	        "m": date.getMinutes(), //分 
	        "s": date.getSeconds(), //秒 
	        "q": Math.floor((date.getMonth() + 3) / 3), //季度 
	        "S": date.getMilliseconds() //毫秒 
	    };
	    format = format.replace(/([yMdhmsqS])+/g, function(all, t){
	        var v = map[t];
	        if(v !== undefined){
	            if(all.length > 1){
	                v = '0' + v;
	                v = v.substr(v.length-2);
	            }
	            return v;
	        }
	        else if(t === 'y'){
	            return (date.getFullYear() + '').substr(4 - all.length);
	        }
	        return all;
	    });
	    return format;
	};

	/**
	 * 过滤HTML标签
	 */
	util.filterHTMLTag = function (str) {
	    str = str.replace(/<\/?[^>]*>/g,''); //去除HTML tag
	    str = str.replace(/[ | ]*\n/g,'\n'); //去除行尾空白
	    //str = str.replace(/\n[\s| | ]*\r/g,'\n'); //去除多余空行
	    str=str.replace(/&nbsp;/ig,'');//去掉&nbsp;
	    return str;
	};

	/**
	 * 上传图片
	 * @required jquery.upload.js
	 */
	util.upload = function(fileName){
		$.upload({
			// 上传地址
			url:"upload_image.do",
			fileName: fileName, 
			params: {'fileName':fileName},
			// 上传之后回调
			onComplate: function(data) {
				if(data.status){
					$('#'+fileName+'_show').attr('src','../'+data.info).slideDown(500);
					$('#'+fileName+'_val').val(data.info);
				}else{
					parent.ShowMsg("操作提示：",data.info);
				}
			}
		});
	};
	/**
	 * layer加载层
	 * @param loadText 加载显示文字，有默认
	 * @return 层id
	 */
	util.loading = function(loadText){
		var layer = require('layer');
		if(typeof loadText == 'number'){
			loadText = "提交数据中，请稍后...";
		}
		var loadMsg = loadText||'请求数据中，请稍候...';
//		return layer.msg(loadMsg, 0, {type: 16, shade: [0.1, '#ccc']});
		//加载层
		return layer.load(0, {shade: false}); //0代表加载的风格，支持0-2
	};
	/**
	 * 关闭 layer 加载层
	 * @param layerIndex 层id ,不传则关闭所有
	 */
	util.closeLayer = function(layerIndex){
		var layer = require('layer');
		if(layerIndex){
			layer.close(layerIndex);
		}else{
			layer.closeAll();
		}
	};
	/**
	 * Confirm是否操作
	 * option：传入对象参数
	 * {msg:'Confirm框提示的消息',
	 * confirm:function(){//点击确定的回调函数},
	 * cancel:function(){//点击取消的回调函数}} 未实现
	 */
	util.confirm = function(option){
		var layer = require('layer');
		return layer.confirm(option.msg, {icon: 3, title:'提示'},function(index){
			option.confirm(index);
		});
	};
	/**
	 * layer dialog
	 * @param opts 参数对象
	 * @returns
	 */
	util.dialog  = function(opts){
		this.defaults = {
				'id':'',//dialog内容id,class,使用Jq选择器
				'title': 'dialog title',
				'width':650,
				'height': 500,
				'index':0,
				offset:['25px' , '']
		},
		this.options = $.extend({}, this.defaults, opts);
		if($(window).height()<(this.options.height+80)){
			this.options.height = $(window).height()-80;
		}
		var layer = require('layer');
		this.options.index = layer({
		    type : 1,
		    shade : [0],
		    moveOut: true,
		    area : [this.options.width+'px', this.options.height+'px'],
		    title : '<b>'+this.options.title+'</b>',
		    shade: [0.5, '#e4e6e9'],
		    shadeClose:true,
		    border: [10, 0.5, '#666'],
		    offset: this.options.offset,
		    success: function(){
		    	layer.shift('top', 400);
		    },
		    page : {dom : this.options.id}
		});
		return this.options;
	};
	/**
	 * Html5图片预览
	 * @param imgFile 图片文件域
	 * @param showDom 在哪里Dom元素中显示
	 */
	util.imgPreView = function(imgFile,showDom){
		var reader = new FileReader();
	    reader.onload = function(e) {
	        var $img = $('<img>').attr("src", e.target.result);
	        $(showDom).empty().append($img);
	    };
	    reader.readAsDataURL(imgFile);
		
		/*var img = new Image(), url = img.src = URL.createObjectURL(imgFile);
	    var $img = $(img);
	    img.onload = function() {
	        URL.revokeObjectURL(url);
	        $(showDom).empty().append($img);
	    };*/
	};
	/**
	 * 根据URL导出文档
	 * @param url 请求导出URL
	 */
	util.exportdown = function(url){
		var export_iframe = $('#export_iframe');
		if(export_iframe.length==0){
			var iframe = '<iframe id="export_iframe" frameborder="no" src="#" scrolling="no" allowtransparency="true" style="border: medium none; width: 0%; display: block; height: 0%; overflow: hidden;"></iframe>';
			$(document.body).append(iframe);
			export_iframe = $('#export_iframe');
		}
		export_iframe.attr('src',url);
	};
	
	module.exports = util;
});



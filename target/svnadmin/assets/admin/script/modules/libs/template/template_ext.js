/**
 * template扩展函数库
 * 函数使用方式：如
 * {{item.loan_title(值) | textsub(方法名):16(参数)}}
 * @author daybreak
 * @since 2015-01-01
 * @blog hpboys.com
 */
define(function(require, exports, module){
	//引入模块
	var template = require('template');
	
	/**
	 * template辅助方法 number格式化方法
	 * @param value 值
	 * @param pattern 保留小数位
	 */
	template.helper('numberFormat', function (value, pattern) {
		return value.toFixed(pattern);
	});

	/**
	 * template辅助方法 时间格式化方法
	 * 示例：dateFormat:yyyy-MM-dd hh:mm:ss
	 * @param date long值 | 时间对象ToString 
	 * @param pattern 格式字符串,例如：yyyy-MM-dd hh:mm:ss 
	 * @return 符合要求的日期字符串 
	 */
	template.helper('dateFormat', function (date, format) {
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
	});

	/**
	 * template辅助方法 字符自适应
	 * @param value 值
	 * @param pattern 保留字数
	 */
	template.helper('textsub', function (value, len) {
		if(value.length>len){
			return value.substring(0,len);
		}
		return value;
	});

});
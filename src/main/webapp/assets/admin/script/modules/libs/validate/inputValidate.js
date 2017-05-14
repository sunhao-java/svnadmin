/**
 * 输入框验证插件
 * @author hpboys
 * @required jquery|zepto
 * @params  vali-data="{min:100,max:99999999,fixed:0}"
 */
$(function(){
	$('.vali-number').bind('input propertychange', function() {
		var _this = $(this);
		var _val=_this.val();
	    _val=/^[0-9]+\.?[0-9]*/.test(_val)?RegExp.lastMatch:'';
	    _this.val(_val);
	});
	$('.vali-number').bind('blur', function() {
		var _this = $(this);
		var _valiData = eval("("+_this.attr('vali-data')+")");
	    if(_this.val()<_valiData.min){
	   		_this.val(_valiData.min);
	    }else if((_this.val()>_valiData.max)){
	   		_this.val(_valiData.max);
	    }
	    _this.val(Number(_this.val()).toFixed(_valiData.fixed));
	});
	
	converTime();
});
/**
 * 时间转换输出
 */
function converTime(){
	var convertArr = $('.convert-time');
	for(var i in convertArr){
		convertArr[i].innerHTML = util.dateFormat(convertArr[i].innerHTML,'yyyy-MM-dd hh:mm:ss');
	}
}


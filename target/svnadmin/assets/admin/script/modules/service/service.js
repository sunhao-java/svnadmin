/**
 * 公用功能实现Service
 * @author Hpboys
 * @version 1.0.1
 */
define(function(require, exports, module){
	module.exports = {
		/**
		 * 倒计时效果
		 * @params opts = {
		 * 			process:function(currentTime,surplusTime){},
		 *			end:function(){},
		 *			time:60}
		 */
		countDown:function(opts){
			var index = 0;
			var timer = setInterval(function(){
				index++;
				opts.process(index,(opts.time-index));
				if(index==opts.time){
					opts.end();
					clearInterval(timer);
				}
			}, 1000);
		},
		/**
		 * 复制所有对象属性值
		 * @params source 源对象
		 * @params target 目标对象
		 */
		copyProperties:function(source,target){
			for(var key in source){
				target[key] = source[key];
			}
			return target;
		}
	};
});
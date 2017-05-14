var global = {};
//全局配置项
global.config = {
    // Sea.js 的基础路径
    base: location.origin+"/svnadmin/assets/admin/script/modules/",
    // 变量配置
    vars: {
        'framePath': location.origin+"/svnadmin/assets/hui/js"
    },
    // 别名配置
    alias: {
      '$': 'libs/jquery/jquery-2.1.1.min.js',
      'util': 'libs/util.js',
      'bootstrap': 'libs/bootstrap/bootstrap.min.js',
      'kindeditor': 'libs/kindeditor/bootstrap.min.js',
      'layer': 'libs/layer/layer.min.js', //layer层综合插件
      'input_vali_service': 'service/input_vali_service.js', //输入框验证插件
      'service': 'service/service.js', //输入框验证插件
      'page_service': 'service/page_service.js', //输入框验证插件
      'template': 'libs/template/template.js', //模板引擎
      'template_ext': 'libs/template/template_ext.js', //模板扩展Tag
      'my97date': 'libs/My97DatePicker/WdatePicker.js', //时间选择控件
      'toastr': '{framePath}/plugins/toastr/toastr.min.js', //时间选择控件
      'constant': 'constant/constant.js' //系统公用常量
    },
    // 文件编码
    charset: 'utf-8'
 };
// Set configuration
seajs.config(global.config);

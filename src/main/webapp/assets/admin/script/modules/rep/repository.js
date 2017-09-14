/**
 * 项目资源权限管理页面
 * @author Hpboys
 * @version 1.0.0
 */
define(function (require, exports, module) {
    //引入模块
    require('$');
    var util = require('util');
    var layer = require('layer');
    var template = require('template');
    var constant = require('constant');
    var pageService = require('page_service');

    var pj = $('#now-pj').val();
    var selectedRes = $('#selectedRes');

    //页面请求域
    var _scope = {
        view: {
            init: function () {
                $('#addBtn').on('click', function () {
                    _scope.view.editDialog();
                });
                _scope.view.initTree();
                //移到用户组右边
                $('#group_add').click(function () {
                    //获取选中的选项，删除并追加给对方
                    $('#select3 option:selected').appendTo('#select4');
                });
                //移到用户组左边
                $('#group_del').click(function () {
                    $('#select4 option:selected').appendTo('#select3');
                });
                //全部移到用户组右边
                $('#group_add_all').click(function () {
                    //获取全部的选项,删除并追加给对方
                    $('#select3 option').appendTo('#select4');
                });
                //全部移到用户组左边
                $('#group_del_all').click(function () {
                    $('#select4 option').appendTo('#select3');
                });
                //移到用户右边
                $('#user_add').click(function () {
                    //获取选中的选项，删除并追加给对方
                    $('#select1 option:selected').appendTo('#select2');
                });
                //移到用户左边
                $('#user_del').click(function () {
                    $('#select2 option:selected').appendTo('#select1');
                });
                //全部移到用户右边
                $('#user_add_all').click(function () {
                    //获取全部的选项,删除并追加给对方
                    $('#select1 option').appendTo('#select2');
                });
                //全部移到用户左边
                $('#user_del_all').click(function () {
                    $('#select2 option').appendTo('#select1');
                });
                //双击选项
                $('#select1').dblclick(function () {     //绑定双击事件
                    //获取全部的选项,删除并追加给对方
                    $("option:selected", this).appendTo('#select2');     //追加给对方
                });
                //双击选项
                $('#select2').dblclick(function () {
                    $("option:selected", this).appendTo('#select1');
                });
                //双击选项
                $('#select3').dblclick(function () {     //绑定双击事件
                    //获取全部的选项,删除并追加给对方
                    $("option:selected", this).appendTo('#select4');     //追加给对方
                });
                //双击选项
                $('#select4').dblclick(function () {
                    $("option:selected", this).appendTo('#select3');
                });
            },
            initTree: function () {
                AjaxTreeView.config = {
                    classLoading: "loading",//ajax loading css
                    ontoggle: null,//function(o,b) when toggle folder.o:li,b:is open
                    onclick: null,//function(o,a) when click text.o: li;a:a
                    url: 'repTreeLoad?action=data',//ajax load url
                    intercept: function (data) {
                        data = JSON.parse(data);
                        console.log(data);
                        var nodeHtml = '<ul>';
                        for (var i = 0; i < data.length; i++) {
                            var nodeInfo = data[i];
                            if (nodeInfo.leaf) {
                                //文件
                                nodeHtml += '<li class="last" param="path=' + nodeInfo.parameters.path + '&action=data&pj=' + nodeInfo.parameters.pj + '">';
                                nodeHtml += '<span class="file"><a href="javascript:void(0);" onclick="$atc(this)">' + nodeInfo.text + '</a></span>';
                                nodeHtml += '</li>';
                            } else {
                                //文件夹
                                nodeHtml += '<li class="closed" treeParentId="rep" param="path=' + nodeInfo.parameters.path + '&action=data&pj=' + nodeInfo.parameters.pj + '">';
                                nodeHtml += '<div class="hit closed-hit" onclick="$att(this);"></div>';
                                nodeHtml += '<span class="folder" onclick="$att(this);">';
                                nodeHtml += '<a href="javascript:void(0);" onclick="$atc(this)">' + nodeInfo.text + '</a>';
                                nodeHtml += '</span>';
                                nodeHtml += '</li>';
                            }
                        }
                        nodeHtml += '</ul>';
                        return nodeHtml;
                    },
                    attrs: ["treeId", "treeParentId"]
                };
                AjaxTreeView.config.onclick = function (o, a) {
                    var paramTxt = o.getAttribute("param");
                    var convPtxt = decodeURIComponent(paramTxt);
                    var paramArr = _scope.methods.getParams(convPtxt);
                    var res = _scope.methods.getRes(paramArr);
                    selectedRes.val(res);
                    _scope.vars.path = paramArr.path;
                    pageBean.reload(_scope.methods.getListUrl());
                };
                _scope.methods.freshTree();
            },
            reBindEvent: function () {
                $('.btn-remove').on('click', function () {
                    var paramTxt = $(this).attr('data-param');
                    var param = _scope.methods.getParams(paramTxt);
                    _scope.methods.removeRepAuth(param);
                });
            }
        },
        methods: {
            freshTree: function () {
                var $r = $("#svnroot");
                $r.children("ul").first().remove();
                AjaxTreeView.close($r[0]);
                $r.attr('param', 'pj=' + pj + '&path=/');
                $r[0].loading = false;
                $r[0].loaded = false;
                AjaxTreeView.open($r[0]);
            },
            submitForm: function () {
                var form = util.serializeObject($('#submitForm'));
                form.pj = pj;
                var load_index = util.loading();
                $.post('repPathAuthAddHandler', form, function (data) {
                    util.showMsg(data.info);
                    if (data.status) {
                        layer.closeAll();
                        pageBean.reload();
                    }
                });
                return false;
            },
            removeRepAuth: function (param) {
                util.confirm({
                    msg: '您确定在项目 “' + param.pj + '” 中删除用户组/账号 “' + (param.usr + param.gr) + '” 吗?',
                    confirm: function () {
                        // 请求
                        $.post('repPathAuthRemoveHandler', param, function (data) {
                            if (data.status) {
                                pageBean.reload();
                                util.showMsg(data.info);
                            } else {
                                util.showMsg(data.info, 3);
                            }
                        });
                        // 关闭弹窗
                        layer.closeAll();
                    }
                });
            },
            getParams: function (paramTxt) {
                var params = paramTxt.split('&');
                var paramObj = {};
                for (var i = 0; i < params.length; i++) {
                    var param = params[i].split('=');
                    paramObj[param[0]] = param[1];
                }
                return paramObj;
            },
            getRes: function (params) {
                return '[' + params.pj + ':' + params.path + ']';
            },
            getListUrl: function () {
                return _scope.vars.listUrl + '&path=' + _scope.vars.path;
            }
        },
        vars: {
            path: '/',
            listUrl: 'repPathAuth?action=data&pj=' + pj
        }
    };
    _scope.view.init();
    //
    var pageBean = pageService.init({
        url: _scope.methods.getListUrl(),
        isPagination: false,
        intercept: function (data) {
            data.resRightStatus = constant.resRightStatus;
            return data;
        },
        after: function (data) {
            _scope.view.reBindEvent();
        }
    });
    //暴露方法到Window
    window.submitForm = _scope.methods.submitForm;
});




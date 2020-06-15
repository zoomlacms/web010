<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sale.aspx.cs" Inherits="sale" %>
<%@ Register Src="~/User/ASCX/DefaultTop.ascx" TagName="UserMenu" TagPrefix="ZL" %><!DOCTYPE html>
<%@ Register Src="~/Manage/I/ASCX/UserInfoBar.ascx" TagPrefix="ZL" TagName="UserBar" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
<title>业绩系统</title>
<link type="text/css" rel="stylesheet" href="/dist/css/bootstrap.min.css" />
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" href="/dist/css/font-awesome.min.css"/>
<link rel="stylesheet" href="/dist/css/weui.min.css"/>
<link type="text/css" rel="stylesheet" href="/App_Themes/User.css" />
<link href="/Template/Wuzyz/style/global.css?v=<%Call.Label("{ZL.Label id=\"前端样式版本号\"/}");%>" rel="stylesheet" />
<script src="/JS/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
<script src="/JS/ZL_ValidateCode.js"></script>
<style>
.code i { position:absolute; z-index:10; left:60px; top:8px;}
</style>
</head>
<body>
<form runat="server" id="form1">
<div class="container padding0_xs sales_main">
<div class="sales_main_t"><img src="<%Call.Label("{$CssDir/}"); %>images/wz.jpg" alt="五子衍宗软胶囊" /></div>

<div class="sales_main_c">
<div class="weui_cells weui_cells_form" style="margin-top:0;">
<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">会员ID</label></div>
<div class="weui_cell_bd weui_cell_primary">
<input type="text" name="PubUserID" id="PubUserID" value="<%Call.Label("{ZL:GetuserID()/}"); %>" readonly class="form-control input-sm" />
</div>
</div>
<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">会员名</label></div>
<div class="weui_cell_bd weui_cell_primary">
<input type="text" name="PubInputer" id="PubInputer" value="<%Call.Label("{ZL:GetuserName()/}"); %>" readonly class="form-control input-sm" />
</div>
</div>
<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">业绩编码</label></div>
<div class="weui_cell_bd weui_cell_primary">
<asp:TextBox ID="bm" runat="server" CssClass="form-control input-sm" placeholder="8位纯数字"></asp:TextBox>
</div>
</div>
<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">验证码</label></div>
<div class="weui_cell_bd weui_cell_primary code">
<div class="input-group input-group-sm">
<asp:TextBox ID="VCode" runat="server" CssClass="codestyle form-control" placeholder="验证码" maxlength="6"></asp:TextBox>
<span class="input-group-addon" style="padding:1px 2px;"><img style="height:auto;" id="VCode_img" title="点击刷新验证码" class="codeimg" src="" /></span>
</div>
<asp:HiddenField ID="VCode_hid" runat="server" />

</div>
</div>
<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">备注</label></div>
<div class="weui_cell_bd weui_cell_primary">
<asp:TextBox ID="PubContent" runat="server" CssClass="form-control input-sm" TextMode="MultiLine" Rows="2"></asp:TextBox>
</div>
</div>
</div>
<div class="weui_btn_area">
<button type="button" class="weui_btn weui_btn_primary" onClick="CheckFun();">确定</button>
<asp:Button ID="Button1" CssClass="weui_btn weui_btn_primary" runat="server" Text="确定" OnClick="Button1_Click1" style="display:none;" />
</div>

</div>
</div>
</form>
</body>
</html>
<script>
//1,页面上指定codeok,codeno两个样式
//2,$("#TxtValidateCode").ValidateCode();
(function ($) {
    $.fn.extend({
        ValidateCode: function (options, callback) {//callback暂未用
            var opts = $.extend({}, $.fn.ValidateCode.defaults, options), CodeCheck = $.fn.ValidateCode.CodeCheck;
            var isok = false;
            var obj = this;
            if (!obj || obj == null || !obj.attr("id")) return;
            var objimg = $("#" + obj[0].id + "_img");
            var objhid = $("#" + obj[0].id + "_hid");
            objhid.val(Math.random());//Key
            objimg.attr("src", "/Common/ValidateCode.aspx?key="+ objhid.val()+"&t=" + Math.random());
            //----事件
            objimg.click(function () {
                var url = "/Common/ValidateCode.aspx?key=" + objhid.val() + "&t=" + Math.random();
                $(this).attr("src", url); obj.val(""); obj.keyup(); obj.focus();
            });
            $(obj).keyup(function () {
                var v = $(obj).val(),k=objhid.val();
                if (v.length < opts.num) { $(obj).removeClass(opts.okcss).removeClass(opts.nocss); return; }
                CodeCheck(v, k, function (data) {
                    if (data == 0) {
                        $(obj).next(".fa").remove();
                        $(obj).after("<i class=\"fa fa-close\" style=\"color:#ed6d6d;\"></i>");
                        $(obj).removeClass(opts.okcss).addClass(opts.nocss);
                        isok = false;
                    }
                    else if (data == 1) {
                        $(obj).next(".fa").remove();
                        $(obj).after("<i class=\"fa fa-check\" style=\"color:#b9f373;\"></i>");
                        $(obj).removeClass(opts.nocss).addClass(opts.okcss);
                        isok = true;
                    }
                });
            });//keyup end;
            if (opts.submitchk)//提交验证
            {
                $("form").submit(function (e) {
                    //var v = $(obj).val(), k = objhid.val(), flag = true;
                    //CodeCheck(v, k, function (data) {
                    //    if (data == 0) {
                    //        alert("验证码不正确"); flag = false;
                    //    }
                    //});
                    //return flag;
                    var v = $(obj).val();
                    if (v.length < opts.num) { isok = false; }
                    if (!isok) { }
                    return isok;
                });
            }
           
        }
    })//fn end;
    $.fn.ValidateCode.defaults = { okcss: "codeok", nocss: "codeno", num: 6,submitchk:true };//参数赋值
    $.fn.ValidateCode.CodeCheck = function (v, k, callback) {
        a = "checkcode";
        $.ajax({
            type: "Post",
            async: true,
            url: "/Common/ValidateCode.aspx",
            data: { action: a, value: v, key: k },
            success: function (data) {
                callback(data);
            }
        });
    };
})(jQuery)

//给一个配置项,如果开启,则先AJAX验证,校验不对则拒绝提交,弹窗验证码有误
function CheckFun() {
	if($("#bm").val()==""){
		$("#bm").popover({
			animation: true,
			placement: 'top',
			content: '<span style="color:red;">业绩编码不能为空！</span>',
			html: true,
			trigger: 'manual',
			delay: { show: 10000, hide: 100 }
		});
		$("#bm").popover('show');
		setTimeout(function () { $("#bm").popover('destroy'); }, 2000);
	}
	else if($("#VCode").val()==""){
		$("#VCode").popover({
			animation: true,
			placement: 'top',
			content: '<span style="color:red;">验证码不能为空！</span>',
			html: true,
			trigger: 'manual',
			delay: { show: 10000, hide: 100 }
		});
		$("#VCode").popover('show');
		setTimeout(function () { $("#VCode").popover('destroy'); }, 2000);
	}
	else {
		$.ajax({
			url: "/Common/ValidateCode.aspx",
            data: { action: 'checkcode', value:$("#VCode").val(), key: $("#VCode_hid").val() },
			type: 'POST',
			success: function (data) {
				if (data == '1') {
					//验证码正确
					var para = { key:'',alias:'bmIsOk',psize:'1000',cpage:1,bm:$("#bm").val()}
					$.post("/API/Center.ashx?action=GetCustom",para,function(data){
						data=JSON.parse(JSON.parse(data).addon);
						if(parseInt(data.count)<=0)
						{
							$("#bm").popover({
								animation: true,
								placement: 'top',
								content: '<span style="color:red;">业绩编码错误，请重新填写！</span>',
								html: true,
								trigger: 'manual',
								delay: { show: 10000, hide: 100 }
							});
							$("#bm").popover('show');
							setTimeout(function () { $("#bm").popover('destroy'); }, 2000);
						}
						else {
							var para1 = { key:'',alias:'bmIsExits',psize:'1000',cpage:1,bm:$("#bm").val()}
							$.post("/API/Center.ashx?action=GetCustom",para1,function(data){
								data=JSON.parse(JSON.parse(data).addon);
								if(parseInt(data.count)>0)
								{
									$("#bm").popover({
										animation: true,
										placement: 'top',
										content: '<span style="color:red;">该编码已使用，请重新填写！</span>',
										html: true,
										trigger: 'manual',
										delay: { show: 10000, hide: 100 }
									});
									$("#bm").popover('show');
									setTimeout(function () { $("#bm").popover('destroy'); }, 2000);
								}
								else {
									$("#Button1").click();
								}
							});
						}
					});
				}
				else {
					$("#VCode").popover({
						animation: true,
						placement: 'top',
						content: '<span style="color:red;">验证码错误！</span>',
						html: true,
						trigger: 'manual',
						delay: { show: 10000, hide: 100 }
					});
					$("#VCode").popover('show');
					setTimeout(function () { $("#VCode").popover('destroy'); }, 2000);
					$("#VCode").ValidateCode();
				}
			}
		});
	}
}
$().ready(function(e) {
	$("#VCode").ValidateCode();
	$("#VCode").attr("name","VCode").addClass("form-control");
	//var data={PubContentid:'10658',PubTitle:'asdasd',PubContent:'asdasdsa'};
	//console.log(data);
    //$.post("/API/Mod/pub.ashx?action=add&pubid=8&id=53", {data:JSON.stringify(data)},function(data){
	//	console.log(data)
	//});
});
</script>
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default1.aspx.cs" Inherits="User_Default1" ClientIDMode="Static" %><!DOCTYPE html>
<%@ Register Src="~/User/ASCX/DefaultTop.ascx" TagName="UserMenu" TagPrefix="ZL" %><!DOCTYPE html>
<%@ Register Src="~/Manage/I/ASCX/UserInfoBar.ascx" TagPrefix="ZL" TagName="UserBar" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
<title>会员中心</title>
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
<script>
var gid='<%Call.Label("{ZL.Label id=\"获取当前登录会员组ID\" /}");%>';
if(parseInt(gid)!=3)
{
	alert("您不是店员会员，分销中心仅对店员会员开放！请点击进入会员中心");
	window.location="/User/default1.aspx?key="+escape($("#key").val());
}
</script>

</head>
<body class="YaHei">
<form id="form1" runat="server">
<div class="muser_top">
<div class="media">
<div class="media-left"><a href="/User/Info/UserInfo.aspx"><asp:Image ID="imgUserPic" class="media-object" AlternateText="" onerror="this.src='/images/userface/noface.gif'" runat="server" /></a></div>
<div class="media-body media-middle">
<h4 class="media-heading">会员：<asp:Label ID="UserNameLb" runat="server" Text=""></asp:Label></h4>
<p>会员组：<%Call.Label("{ZL.Label id=\"获取当前登录会员组\" /}");%></p>
</div>
</div>
</div>

<div class="muser_hlist">
<div class="weui_cells weui_cells_access" id="muser_g1" style="display:none;">
<a class="weui_cell" href="/User/Info/ConsumeDetail1.aspx?SType=1">
<div class="weui_cell_bd weui_cell_primary">
<p><i class="fa fa-cny"></i> 我的佣金 </p></div>
<div class="weui_cell_ft" style="color:#ff7000;"><i class="fa fa-rmb"></i> <asp:Label ID="UserYeLb" runat="server" Text=""></asp:Label></div>
</a>
<a class="weui_cell" href="/User/Info/ConsumeDetail2.aspx?SType=3">
<div class="weui_cell_bd weui_cell_primary"><p><i class="fa fa-star"></i> 我的积分</p></div>
<div class="weui_cell_ft" style="color:#ff7000;"><i class="fa fa-database"></i> <asp:Label ID="UserJfLb" runat="server" Text=""></asp:Label></div>
</a>
<a class="weui_cell" href="/wxshare.aspx">
<div class="weui_cell_bd weui_cell_primary"><p><i class="fa fa-qrcode"></i> 推广二维码</p></div>
<div class="weui_cell_ft"></div>
</a>
<a class="weui_cell" href="/Class_2/NodePage_1.aspx">
<div class="weui_cell_bd weui_cell_primary"><p><i class="fa fa-file-sound-o"></i> 会员公告</p></div>
<div class="weui_cell_ft"></div>
</a>
<a class="weui_cell" href="javascript:;" style="display:none;">
<div class="weui_cell_bd weui_cell_primary"><p><i class="fa fa-money"></i> 我的红包</p></div>
<div class="weui_cell_ft"></div>
</a>
<a class="weui_cell" href="/Class_18/NodeNews.aspx" style="display:none;">
<div class="weui_cell_bd weui_cell_primary"><p><i class="fa fa-book"></i> 我的电子书</p></div>
<div class="weui_cell_ft"></div>
</a>
<a class="weui_cell" href="/Class_18/NodeHot.aspx" style="display:none;">
<div class="weui_cell_bd weui_cell_primary"><p><i class="fa fa-gamepad"></i> 我的小游戏</p></div>
<div class="weui_cell_ft"></div>
</a>
<a class="weui_cell" href="/Class_19/NodeNews.aspx" style="display:none;">
<div class="weui_cell_bd weui_cell_primary"><p><i class="fa fa-book"></i> 我的任务</p></div>
<div class="weui_cell_ft"></div>
</a>
<a class="weui_cell" href="javascript:;" style="display:none;">
<div class="weui_cell_bd weui_cell_primary"><p><i class="fa fa-database"></i> 我的兑奖</p></div>
<div class="weui_cell_ft"></div>
</a>
</div>

<div class="weui_cells weui_cells_access" id="muser_g2" style="display:none;">
<a class="weui_cell" href="Info/ConsumeDetail1.aspx?SType=1">
<div class="weui_cell_bd weui_cell_primary">
<p><i class="fa fa-cny"></i> 我的佣金 </p></div>
<div class="weui_cell_ft" style="color:#ff7000;"><i class="fa fa-rmb"></i> <%Call.Label("{ZL.Label id=\"获取当前登录用户余额\" /}");%></div>
</a>
<a class="weui_cell" href="/Class_19/NodeElite.aspx">
<div class="weui_cell_bd weui_cell_primary"><p><i class="fa fa-sitemap"></i> 推客中心</p></div>
<div class="weui_cell_ft"></div>
</a>
<a class="weui_cell" href="/Class_19/NodeElite.aspx">
<div class="weui_cell_bd weui_cell_primary"><p><i class="fa fa-navicon"></i> 所属级别</p></div>
<div class="weui_cell_ft"></div>
</a>
<a class="weui_cell" href="/Class_19/NodeElite.aspx">
<div class="weui_cell_bd weui_cell_primary"><p><i class="fa fa-bullseye"></i> 返利明细</p></div>
<div class="weui_cell_ft"></div>
</a>
<a class="weui_cell" href="/User/UserFunc/Money/WithDraw1.aspx">
<div class="weui_cell_bd weui_cell_primary"><p><i class="fa fa-money"></i> 申请提现</p></div>
<div class="weui_cell_ft"></div>
</a>
<a class="weui_cell" href="/wxshare.aspx">
<div class="weui_cell_bd weui_cell_primary"><p><i class="fa fa-qrcode"></i> 推广二维码</p></div>
<div class="weui_cell_ft"></div>
</a>
<a class="weui_cell" href="/Class_16/Default.aspx?uid=<%Call.Label("{ZL:GetuserID()/}");%>">
<div class="weui_cell_bd weui_cell_primary"><p><i class="fa fa-home"></i> 店铺主页</p></div>
<div class="weui_cell_ft"></div>
</a>
<a class="weui_cell" href="/Class_2/NodePage_1.aspx">
<div class="weui_cell_bd weui_cell_primary"><p><i class="fa fa-file-sound-o"></i> 会员公告</p></div>
<div class="weui_cell_ft"></div>
</a>
</div>

<div class="weui_cells weui_cells_access" id="muser_g3">
<a class="weui_cell" href="Info/ConsumeDetail1.aspx?SType=1">
<div class="weui_cell_bd weui_cell_primary">
<p><i class="fa fa-cny"></i> 我的佣金 </p></div>
<div class="weui_cell_ft" style="color:#ff7000;"><i class="fa fa-rmb"></i> <%Call.Label("{ZL.Label id=\"获取当前登录用户余额\" /}");%></div>
</a>
<a class="weui_cell" href="/User/Info/ConsumeDetail2.aspx?SType=3">
<div class="weui_cell_bd weui_cell_primary"><p><i class="fa fa-star"></i> 我的积分</p></div>
<div class="weui_cell_ft" style="color:#ff7000;"><i class="fa fa-database"></i> <%=UserJfLb.Text%></div>
</a>
<a class="weui_cell" href="/User/UserFunc/Money/WithDraw.aspx">
<div class="weui_cell_bd weui_cell_primary"><p><i class="fa fa-money"></i> 申请提现</p></div>
<div class="weui_cell_ft"></div>
</a>
<a class="weui_cell" href="/Class_20/NodePage.aspx">
<div class="weui_cell_bd weui_cell_primary"><p><i class="fa fa-sitemap"></i> 销售码提交</p></div>
<div class="weui_cell_ft"></div>
</a>
<a class="weui_cell" href="/Class_16/Default.aspx?uid=<%Call.Label("{ZL:GetuserID()/}");%>">
<div class="weui_cell_bd weui_cell_primary"><p><i class="fa fa-home"></i> 店铺主页</p></div>
<div class="weui_cell_ft"></div>
</a>
<a class="weui_cell" href="/Class_2/NodePage_1.aspx">
<div class="weui_cell_bd weui_cell_primary"><p><i class="fa fa-file-sound-o"></i> 会员公告</p></div>
<div class="weui_cell_ft"></div>
</a>
</div>

</div>


<div style="height:54px;"></div>
<div class="hidden">
<div class="u_info">
<div class="container">
<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 u_face">

<ZL:UserBar ID="UserBar_U" runat="server" Width="100" />
</div>
<div class="col-lg-10 col-md-10 col-sm-10 col-xs-12 u_syn">
<ul class="list-unstyled">
<li>
<ul class="list-unstyled">
<li><i class="glyphicon glyphicon-user"></i>会员名称：</li>
<li>等级：<asp:Literal id="LvIcon_Li" runat="server"></asp:Literal> <asp:Label ID="UserLvLb" runat="server" Text=""></asp:Label></li>
<li>加入时间：<asp:Label ID="UserRegTimeLb" runat="server" Text=""></asp:Label></li>
</ul>
</li>
<li><i class="glyphicon glyphicon-map-marker"></i>地址：<asp:Label ID="UserAddressLb" runat="server" Text=""></asp:Label></li>
<li><i class="glyphicon glyphicon-edit"></i>个性签名：<asp:Label ID="UserSignLb" runat="server" Text=""></asp:Label></li>
<li>
<ul class="list-unstyled">
<li><i class="glyphicon glyphicon-usd"></i>余额：
<a href="/PayOnline/SelectPayPlat.aspx" target="_blank">[在线充值]</a>
<a href="UserFunc/Money/WithDraw.aspx">[申请提现]</a>

</li>
<li>银币：<asp:Label ID="UserJbLb" runat="server" Text=""></asp:Label></li><li>积分：</li>
</ul>
</li>
</ul>
</div>
</div>
</div>
<div class="container">  
<div class="u_menu">
<asp:Literal ID="UserApp_Li" runat="server" EnableViewState="false"></asp:Literal>
<div class="clearfix"></div>
</div>
</div> 
<div class="u_menu_more text-center">
<a href="javascript:;" id="more_btn" title="点击显示更多">More <i class="fa fa-angle-double-down"></i></a>
</div>
<div class="user_menu_sub"> 
<ul class="list-unstyled text-center">
<asp:Literal runat="server" ID="onther_lit" EnableViewState="false"></asp:Literal>
</ul>
<div class="clearfix"></div>
</div>  

</div>
</form>

<div style="height:54px;"></div>
<div class="mobile_bottom" id="mobile_bottom1" style="display:none;">
<ul>
<li><a href="/user/Default1.aspx">首页</a></li>
<li><a href="/Class_3/Default.aspx">产品中心</a></li>
<li><a href="/Class_18/Default.aspx">会员俱乐部</a></li>
<div class="clearfix"></div>
</ul>
</div>
<div class="mobile_bottom" id="mobile_bottom2" style="display:none;">
<div class="mobile_footnav">
<ul>
<li><a href="{ZL:GetNodeLinkUrl(16)/}">首页</a></li>
<li><a href="{ZL:GetNodeLinkUrl(3)/}">产品中心</a></li>
<li><a href="{ZL:GetNodeLinkUrl(1)/}">购买产品</a></li>
<li><a href="/User/VIPUpgrade.aspx">推客申请</a></li>
<li><a href="/user/Default1.aspx">会员中心</a></li>
</ul>
</div>
</div>
</body>
</html>
<script>
var code='<%Call.Label("{$GetRequest(code)$}");%>';
$.get("/wxpage.aspx?code=<%Call.Label("{$GetRequest(code)$}");%>", function(data){
	try
	{
		var userinfo=JSON.parse(data);
		console.log(userinfo)
		$("#imgUserPic").attr("src",userinfo.headimgurl).attr("alt",userinfo.nickname);
	}
	catch(e)
	{
		console.log(e);
	}
});
$().ready(function (e) {//菜单颜色配置
	var colorArr=new Array('#c47f3e','#669933','#27a9e3','#f05033','#990066','#9999FF','#E48632','#990000','#22afc2','#6633FF','#9900FF','#1FA67A');
	var count=$(".user_menu_sub li").length;
	for(var i=0; i<count; i++){
		$(".user_menu").eq(i).css("background",colorArr[i%12]);	
	}
    if ($(".user_menu_sub li").length < 1)
        $(".u_menu_more").remove();
	
	var gid='<%Call.Label("{ZL.Label id=\"获取当前登录会员组ID\" /}");%>';
	if(parseInt(gid)==3)
	{
		
		$("#mobile_bottom2").show();
		$("#mobile_bottom1").remove();
	}
	else
	{
		$("#mobile_bottom2").show();
		$("#mobile_bottom1").remove();
	}
})
$("#mimenu_btn").click(function(e) { 
	if($(".user_mimenu_left").width()>0){ 
 		$(".user_mimenu_left ul").fadeOut(100);
		$(".user_mimenu_left").animate({width:0},200); 	
	}
	else{ 
		$(".user_mimenu_left").animate({width:150},300); 
		$(".user_mimenu_left ul").fadeIn();
	}
});
//会员菜单更多显示/隐藏
$("#more_btn").click(function(e) {
	if($(".user_menu_sub").css("display")=="none"){  
	    $(".user_menu_sub").slideDown();
		$(this).find("i").removeClass("fa-angle-double-down");
		$(this).find("i").addClass("fa-angle-double-up");
	}
	else {  
	    $(".user_menu_sub").slideUp(200); 
		$(this).find("i").removeClass("fa-angle-double-up");
		$(this).find("i").addClass("fa-angle-double-down");
	}
});
//会员搜索
$("#sub_btn").click(function(e) { 
    if($("#key").val()=="")
		alert("搜索关键字为空!");
	else
		window.location="/User/SearchResult.aspx?key="+escape($("#key").val());	
});
//搜索回车事件
function IsEnter(obj) {
	if (event.keyCode == 13) {
		$("#sub_btn").click(); return false;
	}
}
</script>
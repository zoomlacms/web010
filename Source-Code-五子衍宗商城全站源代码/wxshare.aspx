<%@ Page Language="C#" AutoEventWireup="true" CodeFile="wxshare.aspx.cs" Inherits="wxshare" Debug="true" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
<meta charset="utf-8">
<meta name="msapplication-TileColor" content="#1A0066"/>
<meta name="msapplication-TileImage" content="/images/win8_symbol_140x140.png"/>
<title>推广二维码</title>
<meta name="Keywords" content="META关键字">
<meta name="Description" content="META网页描述">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">
<link href="/dist/css/bootstrap.min.css" rel="stylesheet"/>
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<script type="text/javascript" src="/JS/jquery-1.11.1.min.js" ></script>
<script src="/dist/js/bootstrap.min.js"></script>
<link href="/dist/css/font-awesome.min.css" rel="stylesheet"/>
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script>
wx.config({
	appId: '<%=ZoomLa.BLL.WxPayAPI.WxPayConfig.APPID%>', // 必填，公众号的唯一标识
	debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
	jsApiList: ["onMenuShareAppMessage"], // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
	nonceStr: '<%=nonceStr%>', // 必填，生成签名的随机串
	signature: '<%=paySign%>',// 必填，签名，见附录1
	timestamp: '<%=timestr%>' // 必填，生成签名的时间戳
});
wx.ready(function () {
	// config信息验证后会执行ready方法，所有接口调用都必须在config接口获得结果之后，config是一个客户端的异步操作，所以如果需要在页面加载时就调用相关接口，则须把相关接口放在ready函数中调用来确保正确执行。对于用户触发时才调用的接口，则可以直接调用，不需要放在ready函数中。
	wx.onMenuShareAppMessage({
		title: '五子衍宗推广系统', // 分享标题
		desc: '五子衍宗推广系统', // 分享描述
		link: 'http://x014.2013.hx008.com/wxpromo.aspx?userid=<%Call.Label("{ZL:GetuserID()/}"); %>', // 分享链接
		imgUrl: 'http://x014.2013.hx008.com/UploadFiles/bLOGO.png', // 分享图标
		type: '', // 分享类型,music、video或link，不填默认为link
		dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
		success: function () {
			// 用户确认分享后执行的回调函数
		},
		cancel: function () {
			// 用户取消分享后执行的回调函数
		}
	});
});
</script>
<style>
.tui_body { font-family: "STHeiti","Microsoft YaHei","宋体","arial";}
.tui_body:before { background:none;}
.tui_body_t {background:url(/Template/Wuzyz/style/images/start_bg.jpg) center no-repeat; height:255px; background-size:cover;}
.tui_body_tc { padding:10px; background:rgba(0,0,0,0.48); }
.tui_body_tc h4 { margin-bottom:20px; color:#fff;}
.tui_body_tc p { margin-bottom:0; color:#fff; color:#ff7000;}
.tui_body_tc .muser img { height:60px; width:60px; border-radius:50%; border:1px solid #ccc;}
.tui_body_tc .muser .media-body span { color:#F7700;}
.tui_body_c { background:#fff; margin-bottom:10px;}
.tui_body_ct { padding:15px; font-size:1.6em; border-bottom:1px solid #f2f2f2;}
.tui_body_c p { margin-bottom:0; padding:10px 15px; font-size:1.2em; line-height:2em; color:#848484;}
#tui_body1:before { content: ' '; position: fixed; z-index: -1; top: 0; right: 0; bottom: 0; left: 0; background: url(/Template/Wuzyz/style/images/start_bg1.jpg) top no-repeat; background-size:cover; }
.tui_body1_b { position:absolute; top:0; left:0; right:0; bottom:0; background:rgba(0,0,0,0.42);}
.tui_body1_bc { position:absolute; left:15px; right:15px; top:50%; margin-top:-66px; padding:15px; background:#8c6f4b; color:#fff; border-radius:4px;}
.tui_body1_bc p { font-size:1.2em;}
</style>
</head>
<body style="background:#f8f8f8;">
<form id="form1" runat="server">
<div class="tui_body" id="tui_body1" style="display:none;">
<div class="tui_body1_b">
<div class="tui_body1_bc">
<p>推广中心只对推客会员开放，点击下方按钮立即成为推客会员</p>
<a href="/User/VIPUpgrade.aspx" class="btn btn-danger btn-block btn-lg"><i class="fa fa-user-plus"></i> 加入推客</a>
</div>
</div>
</div>
<div class="tui_body" id="tui_body2" style="display:none;">
<div class="tui_body_t">
<div class="tui_body_tc">
<div class="media">
<div class="media-left"><img src='/Common/Common.ashx?url=http://x014.2013.hx008.com/wxpromo.aspx?userid=<%Call.Label("{ZL:GetuserID()/}"); %>' width="160" alt='推广手机二维码' />
</div>
<div class="media-body media-middle">
<h4 class="media-heading">长按此图 识别图中二维码</h4>
<p>关注五子好宝宝,奖金送不停,别人消费你赚佣金（长按可保存图片用于转发）！</p>
</div>
</div>
<div class="media muser">
<div class="media-left"><img src="" alt='会员头像' onerror="javascript:this.src='/Images/userface/noface.png';" />
</div>
<div class="media-body media-middle">
<h4 class="media-heading">我是<span></span></h4>
<p>我为五子衍宗代言！</p>
</div>
</div>
</div>
</div>

<div class="tui_body_c">
<div class="tui_body_ct">方法2：微信内直接分享</div>
<p>点击微信右上角 <img src="/Template/Wuzyz/style/images/start_menu.png" width="50" alt="分享按钮" /><br>通过【发送给朋友】、【分享到朋友圈】推广</p>
</div>
<div class="tui_body_c">
<div class="tui_body_ct">方法3：复制链接推广</div>
<p>我建了个五子好宝宝站，快来看看吧<br/><span style="font-size:12px">http://x014.2013.hx008.com/wxpromo.aspx?userid=<%Call.Label("{ZL:GetuserID()/}"); %></span></p>
</div>
</div>
</form>
</body>
</html>
<script src="/JS/Controls/B_User.js"></script>
<script>
var code='<%Call.Label("{$GetRequest(code)$}");%>';
$.get("/wxpage.aspx?code=<%Call.Label("{$GetRequest(code)$}");%>", function(data){
	try
	{
		var userinfo=JSON.parse(data);
		console.log(userinfo)
		$(".tui_body_tc .muser .media-left img").attr("src", userinfo.headimgurl).attr("alt", userinfo.nickname);
	    $(".tui_body_tc .muser .media-body span").html(userinfo.nickname);
	}
	catch(e)
	{
		console.log(e);
	}
});
$().ready(function(e) {
	var gid='<%Call.Label("{ZL.Label id=\"获取当前登录会员组ID\" /}");%>';
	if(parseInt(gid)==1)
	{
		$("#tui_body1").show();
		$("#tui_body2").remove();
	}
	else if(parseInt(gid)==2)
	{
		$("#tui_body2").show();
		$("#tui_body1").remove();
	}
	else if(parseInt(gid)==3)
	{
		$("#tui_body2").show();
		$("#tui_body1").remove();	
	}
	else
	{
		
	}
});
</script>
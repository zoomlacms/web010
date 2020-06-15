<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VIPUpgrade.aspx.cs" Inherits="Test_VIPUpgrade" MasterPageFile="~/Common/Master/Empty1.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>推客申请</title>
<link href="/Template/Wuzyz/style/global.css?v=20150909" rel="stylesheet" />
<link href="/dist/css/weui.min.css" rel="stylesheet"/>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="mreg_body">
<div class="mreg_title">推客申请</div>
<div class="weui_cells weui_cells_form">
<div class="weui_cell weui_cell_warn">
<div class="weui_cell_hd"><label class="weui_label">会员名</label></div>
<div class="weui_cell_bd weui_cell_primary">
<asp:TextBox ID="UserName_T" runat="server" class="weui_input" onblur="CheckUser();" placeholder="请输入会员名" />
<span class="d_err" id="CheckUserNameMessage"></span>
<asp:RegularExpressionValidator ID="RevUserName_T" runat="server" ControlToValidate="UserName_T" ValidationGroup="userVaid" ErrorMessage="不能包含特殊字符" ValidationExpression="^[^@#$%^&*()'?{}\[\];:,.]*$" Display="Dynamic" ForeColor="Red" />
<asp:RequiredFieldValidator runat="server" ID="ReqUserName" ControlToValidate="UserName_T"  ErrorMessage="用户名不能为空" Display="Dynamic" ValidationGroup="userVaid" ForeColor="Red" />
</div>
<div class="weui_cell_ft"><i class="weui_icon_warn"></i></div>
</div>

<div class="weui_cell weui_cell_warn">
<div class="weui_cell_hd"><label class="weui_label">会员密码</label></div>
<div class="weui_cell_bd weui_cell_primary">
<asp:TextBox ID="Password_T" TextMode="Password"  runat="server" class="weui_input" placeholder="请输入会员密码"></asp:TextBox>
<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidatorPassword" ValidationGroup="userVaid" ControlToValidate="Password_T" ValidationExpression="[\S]{6,}" ErrorMessage="密码至少6位" Display="Dynamic" ForeColor="Red" />
<asp:RequiredFieldValidator runat="server" ID="ReqTxtPassword" ControlToValidate="Password_T" ErrorMessage="密码不能为空" Display="Dynamic" ValidationGroup="userVaid" ForeColor="Red" />
</div>
<div class="weui_cell_ft"><i class="weui_icon_warn"></i></div>
</div>

<div class="weui_cell weui_cell_warn">
<div class="weui_cell_hd"><label class="weui_label">确认密码</label></div>
<div class="weui_cell_bd weui_cell_primary">
<asp:TextBox ID="ConfirmPwd_T" TextMode="Password"  runat="server" class="weui_input" placeholder="请再次输入密码"></asp:TextBox>
<asp:RequiredFieldValidator ID="RefConfirmPwd" runat="server" ControlToValidate="ConfirmPwd_T" ForeColor="Red" ValidationGroup="userVaid" SetFocusOnError="false" Display="Dynamic" ErrorMessage="确认密码不能为空" />
<asp:CompareValidator ID="req2" runat="server" ControlToValidate="ConfirmPwd_T" ControlToCompare="Password_T" Operator="Equal" SetFocusOnError="false" ErrorMessage="两次密码输入不一致" ValidationGroup="userVaid" Display="Dynamic" ForeColor="Red" />
</div>
<div class="weui_cell_ft"><i class="weui_icon_warn"></i></div>
</div>

<div class="weui_cell weui_cell_warn">
<div class="weui_cell_hd"><label class="weui_label">电子邮箱</label></div>
<div class="weui_cell_bd weui_cell_primary">
<asp:TextBox ID="Email_T" runat="server" class="weui_input" placeholder="请输入电子邮箱"></asp:TextBox>
<asp:RequiredFieldValidator ID="ReqEmail_T" runat="server" ErrorMessage="联系邮箱不能为空" SetFocusOnError="false" ControlToValidate="Email_T" ValidationGroup="userVaid" Display="Dynamic" ForeColor="Red" />
<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Email_T" ValidationGroup="userVaid" ErrorMessage="请输入正确的邮箱" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$" Display="Dynamic" ForeColor="Red" />
</div>
<div class="weui_cell_ft"><i class="weui_icon_warn"></i></div>
</div>
</div>
</div>
<div class="weui_btn_area">
<asp:Button ID="Submit_B" runat="server" Text="注册" ValidationGroup="userVaid" class="weui_btn weui_btn_warn" OnClick="Submit_B_Click" />
</div>

</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
<style type="text/css">
.weui_cells { font-size:15px;}
label { font-weight:normal;}
.d_ok {color:green;}
.d_err {color:red;}
</style>
<script>
//----Register User
function CheckUser() {
    var userName = document.getElementById("UserName_T");
    var checkUserNameMessage = document.getElementById("CheckUserNameMessage");
    checkUserNameMessage.className = "";
    checkUserNameMessage.innerHTML = "";
    if (userName.value.toString().replace(" ", "") != "") {
        var checkUserNameMessage = document.getElementById("CheckUserNameMessage");
        checkUserNameMessage.className = "";
        checkUserNameMessage.innerHTML = '<i class="fa fa-spinner fa-spin"></i>';
        $.ajax({
            type: "Post",
            data: { action: "UserIsExist", value: userName.value },
            success: function (data) {
                ReceiveServerData(data);
            },
            error: function (data) {
                console.log("错误" + data);
            }
        });;;
    }
}
function ReceiveServerData(result) {
    var checkUserNameMessage = document.getElementById("CheckUserNameMessage");
    checkUserNameMessage.innerHTML = "";
    if (result == "false") {
        checkUserNameMessage.innerHTML = "用户名已经被注册了！";
        checkUserNameMessage.className = "d_err";
    }
    if (result == "disabled") {
        checkUserNameMessage.innerHTML = "该用户名禁止注册！";
        checkUserNameMessage.className = "d_err";
    }
    if (result == "true") {
        checkUserNameMessage.innerHTML = "恭喜您，用户名可以使用！";
        checkUserNameMessage.className = "d_ok";
    }
}
</script>
</asp:Content>

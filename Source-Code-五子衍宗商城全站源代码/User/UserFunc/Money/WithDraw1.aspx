<%@ page language="C#" autoeventwireup="true" inherits="User_UserFunc_WithDraw, App_Web_tayvt5oy" masterpagefile="~/User/Default1.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>提现申请</title>
<style>
.muser_tixian .weui_cells { font-size:1em;}
.muser_tixian .weui_cell_hd label { margin-bottom:0; font-weight:normal;}
.muser_tixian .weui_cell_bd p { margin-bottom:0;}
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ol class="breadcrumb">
<li><a title="会员中心" href="/User/Default1.aspx">会员中心</a></li>
<li class="active">提现申请</li>
</ol>

<div class="muser_tixian">
<div class="weui_cells">
<div class="weui_cell">
<div class="weui_cell_bd weui_cell_primary"><p>现有金额</p></div>
<div class="weui_cell_ft" style="color:#ff7000;"><i class="fa fa-rmb"></i> <asp:Label runat="server" ID="NowMoney_L" /></div>
</div>

<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">提现金额</label></div>
<div class="weui_cell_bd weui_cell_primary">
<asp:TextBox runat="server" ID="Money_T" CssClass="form-control input-sm" />
<asp:RequiredFieldValidator runat="server" ID="MR1" ControlToValidate="Money_T" ErrorMessage="提现金额不能为空" ForeColor="Red" Display="Dynamic" />
<asp:RegularExpressionValidator runat="server" ID="MR2" ControlToValidate="Money_T" ErrorMessage="金额必须是数字" ForeColor="Red" ValidationExpression="([0-9]+)" Display="Dynamic"/>
</div>
</div>

<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">开户人</label></div>
<div class="weui_cell_bd weui_cell_primary">
<asp:TextBox runat="server" CssClass="form-control input-sm" ID="PName_T" />
<asp:RequiredFieldValidator runat="server" ID="R1" ControlToValidate="PName_T" ErrorMessage="开户人姓名不能为空" ForeColor="Red" Display="Dynamic" />
</div>
</div>

<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">银行名称</label></div>
<div class="weui_cell_bd weui_cell_primary">
<asp:TextBox runat="server" CssClass="form-control input-sm" ID="Bank_T" />
<asp:RequiredFieldValidator runat="server" ID="R2" ControlToValidate="Bank_T" ErrorMessage="银行名称不能为空" ForeColor="Red" Display="Dynamic" />
</div>
</div>

<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">开户银行</label></div>
<div class="weui_cell_bd weui_cell_primary">
<asp:TextBox runat="server" ID="Remark_T" TextMode="MultiLine" CssClass="form-control input-sm" />
<asp:RequiredFieldValidator runat="server" ID="RV5" ControlToValidate="Remark_T" ErrorMessage="开户银行不能为空" ForeColor="Red" Display="Dynamic" />
</div>
</div>

<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">银行卡号</label></div>
<div class="weui_cell_bd weui_cell_primary">
<asp:TextBox runat="server" ID="Account_T" CssClass="form-control input-sm" />
<asp:RequiredFieldValidator runat="server" ID="R3" ControlToValidate="Account_T" ErrorMessage="银行卡号不能为空" ForeColor="Red" Display="Dynamic"/>
<asp:RegularExpressionValidator runat="server" ID="R4" ControlToValidate="Account_T" ErrorMessage="请输入16或19位银行卡号" ForeColor="Red" ValidationExpression="^(\d{16}|\d{19})$" Display="Dynamic"/>
</div>
</div>
</div>

<div class="weui_btn_area">
<asp:Button runat="server" CssClass="weui_btn weui_btn_primary" ID="Sure_Btn" Text="申请提现" OnClick="Sure_Btn_Click" OnClientClick="disBtn(this,2000);" />
</div>

</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/ICMS/ZL_Common.js"></script>
<script src="/JS/ZL_Regex.js"></script>
</asp:Content>

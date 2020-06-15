<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_CashCoupon_ArriveJihuo, App_Web_ij0dinww" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>优惠券激活</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
 <div id="pageflag" data-nav="group" data-ban="ArriveManage"></div>
<div class="container">
    	<ol class="breadcrumb">
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">优惠券激活</li>
    </ol>
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td colspan="2" class="text-center">优惠劵激活</td>
        </tr>
        <tr>
            <td class="td_l">
                优惠券编号：
            </td>
            <td>
                <ZL:TextBox class="border" CssClass="form-control text_300" ID="ANo" runat="server" ValidType="String" AllowEmpty="false"></ZL:TextBox>
            </td>
        </tr>
        <tr>
            <td>优惠券密码：</td>
            <td>
                <asp:TextBox class="form-control text_300" ID="APwd" runat="server" ValidType="String" AllowEmpty="false"></asp:TextBox>
            </td>
        </tr>
        <tr><td></td>
            <td><asp:Button ID="Btn" runat="server" Text="激活优惠券" CssClass="btn btn-primary" OnClick="Btn_Click" /></td>
        </tr>
    </table>
</div>
</asp:Content>
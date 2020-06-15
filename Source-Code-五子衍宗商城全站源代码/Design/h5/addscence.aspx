<%@ page language="C#" autoeventwireup="true" inherits="Design_scence_addscence, App_Web_ms5g2xn0" masterpagefile="~/Common/Master/Empty.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>新建场景</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<table class="table table-bordered table-striped">
    <tr><td class="td_m">场景名称</td><td><ZL:TextBox runat="server" ID="Title_T" CssClass="form-control text_300" AllowEmpty="false" ValidType="String"></ZL:TextBox></td></tr>
    <tr><td></td><td>
        <asp:Button runat="server" ID="Save_Btn" Text="保存" CssClass="btn btn-info" OnClick="Save_Btn_Click"/>
        <input type="button" value="取消" class="btn btn-default" onclick="top.CloseDiag();" />
    </td></tr>
</table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">

</asp:Content>
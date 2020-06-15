<%@ page language="C#" autoeventwireup="true" inherits="User_Info_ConsumeDetail, App_Web_gx0v3ywz" masterpagefile="~/User/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<script src="/JS/DatePicker/WdatePicker.js"></script>
<title>我的积分</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="muser_jifen">
<div class="muser_jifen_t">
<h3>当前积分</h3>
<p>
<strong><%Call.Label("{ZL.Label id=\"获取当前登录用户积分\" /}");%></strong>分
<span class="pull-right"><a href="#" class="btn btn-default">兑换积分</a></span>
<div class="clearfix"></div>
</p>
</div>
</div>
<ol class="breadcrumb">
<li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
<li class="active"><a href="<%=Request.RawUrl %>">我的积分记录</a></li>
</ol>
<ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" EnableTheming="False" CssClass="table table-striped table-bordered table-hover" EmptyDataText="没有变更记录!!" OnPageIndexChanging="EGV_PageIndexChanging">
<Columns>
<asp:TemplateField HeaderText="我的积分记录">
<ItemTemplate>
积分：<span style="color:#ff7000;"><%#Eval("score","{0:f2}") %></span><br/>
日期：<%#Eval("HisTime","{0:yyyy年MM月dd日 HH:mm:ss}") %><br/>
详情：<%#Eval("Detail")%><br/>
</ItemTemplate>
</asp:TemplateField>
</Columns>
</ZL:ExGridView>


<div class="input-group" style="display:none;">
<asp:TextBox runat="server" ID="STime_T" placeholder="起始时间" CssClass="form-control text_md" onclick="WdatePicker({})" />
<asp:TextBox runat="server" ID="ETime_T" placeholder="结束时间" CssClass="form-control text_md" onclick="WdatePicker({})" />
<asp:TextBox runat="server" ID="Skey_T" CssClass="form-control text_md" placeholder="关键词" />
<span class="input-group-btn">
<asp:LinkButton runat="server" ID="Skey_Btn" CssClass="btn btn-default" OnClick="Skey_Btn_Click"><span class="glyphicon glyphicon-search"></span></asp:LinkButton>
</span>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>
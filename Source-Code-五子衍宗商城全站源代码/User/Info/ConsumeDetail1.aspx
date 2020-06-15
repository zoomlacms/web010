<%@ page language="C#" autoeventwireup="true" inherits="User_Info_ConsumeDetail, App_Web_gx0v3ywz" masterpagefile="~/User/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<script src="/JS/DatePicker/WdatePicker.js"></script>
<title>返利明细</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ol class="breadcrumb">
<li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
<li class="active"><a href="<%=Request.RawUrl %>">返利明细</a></li>
</ol>
<div class="container"> 
</div>
<div class="panel-body" style="display:none;">
<div class="input-group">
<asp:TextBox runat="server" ID="STime_T" placeholder="起始时间" CssClass="form-control text_md" onclick="WdatePicker({})" />
<asp:TextBox runat="server" ID="ETime_T" placeholder="结束时间" CssClass="form-control text_md" onclick="WdatePicker({})" />
<asp:TextBox runat="server" ID="Skey_T" CssClass="form-control text_md" placeholder="关键词" />
<span class="input-group-btn">
<asp:LinkButton runat="server" ID="Skey_Btn" CssClass="btn btn-default" OnClick="Skey_Btn_Click"><span class="glyphicon glyphicon-search"></span></asp:LinkButton>
</span>
</div>
</div>

<div class="container">
<ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" EnableTheming="False" CssClass="table table-striped table-bordered table-hover" EmptyDataText="没有变更记录!!" OnPageIndexChanging="EGV_PageIndexChanging">
<Columns>
<asp:TemplateField HeaderText="返利明细">
<ItemTemplate>
金额：<span style="color:#ff7000"><i class="fa fa-rmb"></i> <%#Eval("score","{0:f2}") %></span><br/>
时间：<%#Eval("HisTime","{0:yyyy年MM月dd日 HH:mm:ss}") %><br/>
明细：<%#Eval("Detail")%>
</ItemTemplate>
</asp:TemplateField>
</Columns>
</ZL:ExGridView>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>
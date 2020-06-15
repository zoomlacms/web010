﻿<%@ page language="C#" autoeventwireup="true" inherits="Manage_Plat_MemberList, App_Web_df13e2ba" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>成员列表</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ol id="BreadNav" class="breadcrumb navbar-fixed-top">
    <li><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'><%=Resources.L.工作台 %></a></li>
    <li><a href='CompList.aspx'>能力中心</a></li>
    <li><a href="MemberList.aspx">成员列表</a></li>
    <div id="help" class="pull-right text-center"><a href="javascript::" id="sel_btn" class="help_btn"><i class="fa fa-search"></i></a></div>
    <div id="sel_box" runat="server" class="padding5">
        <div style="display: inline-block; width: 230px;">
            <div class="input-group" style="position: relative; margin-bottom: -12px;">
                <asp:TextBox ID="Skey_T" placeholder="请输入用户名" runat="server" CssClass="form-control text_md" />
                <span class="input-group-btn">
                    <asp:Button ID="Search_B" runat="server" Text="<%$Resources:L,搜索 %>" class="btn btn-primary" OnClick="Search_B_Click" />
                </span>
            </div>
        </div>
    </div>
</ol>
<ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="10" IsHoldState="false" 
        OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound"
        CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="数据为空">
        <Columns>
            <asp:TemplateField ItemStyle-CssClass="td_s">
                <ItemTemplate><input type="checkbox" name="idchk" value="<%#Eval("UserID") %>" /></ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="ID" DataField="UserID" ItemStyle-CssClass="td_s"/>
            <asp:TemplateField HeaderText="头像">
                <ItemTemplate>
                    <img src="<%#Eval("UserFace") %>" class="img_50" onerror="shownoface(this);" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="部门" DataField="GroupName" />
            <asp:BoundField HeaderText="用户名" DataField="UserName" />
            <asp:BoundField HeaderText="昵称" DataField="TrueName" />
            <asp:BoundField HeaderText="职位"   DataField="Post"/>
            <asp:BoundField HeaderText="手机"   DataField="Mobile" />
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <a class="option_style" href="VideoInfo.aspx?id=<%#Eval("UserID") %>"><i class="fa fa-pencil" title="修改"></i></a>                                                         <%--  <%# System.Convert.ToInt32(Eval("type")) == 1 ? "":"DownFiles" %>--%>
                    <asp:LinkButton runat="server" CssClass="option_style" CommandName='<%# IsAdmin(Convert.ToInt32(Eval("UserID"))) ? "recallAdmin" : "setAdmin" %>' CommandArgument='<%#Eval("UserID") %>'><i class='<%# IsAdmin(Convert.ToInt32(Eval("UserID"))) ? "fa fa-user-times" : "fa fa-user-plus" %>'></i></asp:LinkButton>
                    <asp:LinkButton runat="server" CssClass="option_style" CommandName="del" CommandArgument='<%#Eval("UserID") %>' OnClientClick="return confirm('确定从该企业移除吗？');"><i class="fa fa-trash-o" title="移除"></i>移除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<style>
    #souchkey {border-radius: 0;border-color: #ccc;}
    #souchok { border-color: #999;border-radius: 0;background: #999;color: #fff;}
    .allchk_l{display:none;}
</style>
<script>
    $("#sel_btn").click(function (e) {
        if ($("#sel_box").css("display") == "none") {
            $(this).addClass("active");
            $("#sel_box").slideDown(300);
            $("#EGV").css("margin-top","44px");
        }
        else {
            $(this).removeClass("active");
            $("#sel_box").slideUp(200);
            $("#EGV").css("margin-top", "0px");
        }
    });
</script>
</asp:Content>
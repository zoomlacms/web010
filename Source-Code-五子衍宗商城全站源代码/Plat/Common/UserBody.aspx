<%@ page language="C#" autoeventwireup="true" inherits="Common_Dialog_UserBody, App_Web_fruufokp" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Repeater ID="UserPlat_RPT" runat="server">
    <ItemTemplate>
        <div class="userlist_item" data-uid="<%#Eval("UserID") %>">
            <div class="item_face pull-left"><img src="<%#Eval("UserFace") %>" onerror="shownoface(this);"/></div>
            <div class="pull-left item_name"><%#Eval("TrueName") %></div>
            <div class="pull-right item_add">添加</div>
        </div>
    </ItemTemplate>
</asp:Repeater>

﻿<%@ page language="C#" autoeventwireup="true" inherits="MIS_OA_Office_FreeProNext, App_Web_3kgo4u0z" masterpagefile="~/User/Empty.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>指定投递人</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div>
        <div id="Div1" runat="server" class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title" style="text-align:center;">已有流程(已执行的流程不允许更改)</h3></div>
            <div class="panel-body">
                   <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="20"  EnableTheming="False"  GridLines="None" CellPadding="2" CellSpacing="1" 
                       Width="100%" CssClass="table border" OnPageIndexChanging="EGV_PageIndexChanging" RowStyle-CssClass="tdbg" BackColor="White" DataKeyNames="ID"  AllowUserToOrder="true"
                        EmptyDataText="尚未指定流程步骤!!" >
                <Columns>
               <%--     <asp:BoundField HeaderText="ID" DataField="ID" HeaderStyle-Height="22" />--%>
                    <asp:BoundField HeaderText="序号" DataField="StepNum"/>
                    <asp:BoundField HeaderText="步骤名" DataField="StepName"/>
                    <asp:TemplateField HeaderText="经办人" >
                        <ItemTemplate >
                            <%#GetUserInfo(Eval("ReferUser","{0}"),Eval("ReferGroup","{0}")) %>
                        </ItemTemplate>
                    </asp:TemplateField>
                  <%--  <asp:TemplateField HeaderText="抄送人">
                        <ItemTemplate>
                            <%# GetUserInfo(Eval("CCUser","{0}"),Eval("CCGroup","{0}")) %>
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                    <asp:TemplateField HeaderText="会签">
                        <ItemTemplate>
                            <%# GetHQoption(Eval("HQoption","{0}")) %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="强制转交">
                        <ItemTemplate>
                            <%# GetQzzjoption(Eval("Qzzjoption","{0}")) %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="回退">
                        <ItemTemplate>
                            <%# GetHToption(Eval("HToption","{0}")) %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="备注" DataField="Remind"/>
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <%#GetEditLink(Eval("ID"),Eval("StepNum")) %>
                        </ItemTemplate>
                    </asp:TemplateField>
                   </Columns>
                    <PagerStyle HorizontalAlign="Center"/>
                   <RowStyle Height="24px" HorizontalAlign="Center" />
            </ZL:ExGridView>
            </div>
        </div>
       <span runat="server" visible="false" id="remind2" style="color:green;font-size:16px;margin-top:10px;">已为自由流程创建步骤,你可以修改最新创建的流程,或关闭本页面!!!</span>
    <div id="Free_Div" runat="server" class="panel panel-primary" style="margin-top:10px;">
            <div class="panel-heading">
                <h3 class="panel-title" style="text-align:center;">自由流程,请选择需要投递的用户</h3></div>
            <div>
                <table class="table border" style="width:960px;">
                    <tr>
                        <td style="width: 150px; text-align: right; padding: 5px; height: 30px;">
                            <button type="button" name="selruser" id="selruser" class="btn-primary" onclick="selRuser();">选择主办人</button>
                        </td>
                        <td style="width:600px; word-wrap:break-word;">
                            <asp:Label runat="server" ID="RUserName_Lab" Style="height: 60px;word-wrap:break-word;"></asp:Label><asp:HiddenField runat="server" ID="RUserID_Hid" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 150px; text-align: right; padding: 5px; height: 30px;">
                            <button type="button" name="selcuser" id="selcuser" class="btn-primary" onclick="selCuser();">选择协办人</button>
                        </td>
                        <td style="width:600px; word-wrap: break-word; ">
                            <asp:Label runat="server" ID="CUserName_Lab" Style="height: 60px;Word-wrap:break-word;"></asp:Label><asp:HiddenField runat="server" ID="CUserID_Hid" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 150px; text-align: right; padding: 5px; height: 30px;">操作：</td>
                        <td>
                            <asp:Button runat="server" ID="return_Btn" class="btn-primary" Style="margin-left: 5px;" OnClick="return_Btn_Click" OnClientClick="return confirm('确定返回吗?');" Text="返回新建页面" Visible="false" />
                            <asp:Button runat="server" ID="Free_Sure_Btn" class="btn-important" Style="margin-left: 5px;" OnClick="Free_Sure_Btn_Click" OnClientClick="return FreeCheck();" Text="确定投递人" />
                            <span runat="server" id="remind" style="color: green; font-size: 14px; font-family: 'Microsoft YaHei';"></span>
                        </td>
                    </tr>
                </table>         
            </div>
            <div class="panel-body" style="display:none;" id="select">
                <iframe id="User_IFrame" style="visibility: inherit; overflow: auto; overflow-x: hidden;width: 1000px;height:400px;"  name="main_right" src="/Mis/OA/Mail/SelGroup.aspx?Type=AllInfo" frameborder="0"></iframe>
            </div>
        </div>
    </div>
        <script type="text/javascript">
            $().ready(function () {
                $("#EGV tr:gt(0):not(:last)").addClass("tr-hover");
            });
            function UserFunc(json, select)
            {
                var uname = "";
                var uid = "";
                for (var i = 0; i < json.length; i++) {
                    uname += json[i].UserName + ",";
                    uid += json[i].UserID + ",";
                }
                if (uid) uid = uid.substring(0, uid.length - 1);
                if (select == "ReferUser") {
                    $("#RUserName_Lab").text(uname);
                    $("#RUserID_Hid").val(uid);
                }
                if (select == "CCUser") {
                    $("#CUserName_Lab").text(uname);
                    $("#CUserID_Hid").val(uid);
                }
                $("#select").hide();
            }
            function FreeCheck() {
                if ($("#RUserName_Lab").text() == "" || $("RUserID_Hid").val() == "") {
                    alert("尚未选定投递人!!!");
                    return false;
                }
                return true;
            }
            //----等待图标
            //var spin;
            //function ShowFoo() {
            //    target = document.getElementById("foo");
            //    spin = new Spinner().spin(target);
            //}
            //function HideFoo() {
            //    if (spin) spin.stop();
            //}
            function selRuser() {
                $("#User_IFrame").attr("src", "/Mis/OA/Mail/SelGroup.aspx?Type=AllInfo#ReferUser");
                $("#User_IFrame")[0].contentWindow.ClearChk();
                $("#select").show();
            }
            function selCuser() {
                $("#User_IFrame").attr("src", "/Mis/OA/Mail/SelGroup.aspx?Type=AllInfo#CCUser");
                $("#User_IFrame")[0].contentWindow.ClearChk();
                $("#select").show();
            }
        </script>
</asp:Content>


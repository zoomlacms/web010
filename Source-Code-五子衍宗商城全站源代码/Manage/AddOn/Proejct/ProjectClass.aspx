<%@ page language="C#" autoeventwireup="true" inherits="manage_AddOn_ProjectClass, App_Web_yctkphmk" enableviewstatemac="false" masterpagefile="~/Common/Common.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title></title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="node_div" style="min-height:300px;">
            <asp:Literal runat="server" ID="NodeHtml_Lit" EnableViewState="false"></asp:Literal>
        </div>
    <script>
        function ShowChild(obj) {
            if ($(obj).find('.folders').hasClass('fa-folder')) {
                $(obj).find('.folders').removeClass('fa-folder').addClass('fa-folder-open');
                $(obj).next().show();
            } else {
                $(obj).find('.folders').removeClass('fa-folder-open').addClass('fa-folder');
                $(obj).next().hide();
            }
            
        }
    </script>
</asp:Content>

<%@ page language="C#" autoeventwireup="true" inherits="Manage_Common_ShowIfr, App_Web_atdplsfh" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <iframe runat="server" id="myifr" width="100%" height="1000px" src="<% %>"></iframe>
</asp:Content>
<asp:Content runat ="server" ContentPlaceHolderID="ScriptContent">
    <script>
    </script>
</asp:Content>
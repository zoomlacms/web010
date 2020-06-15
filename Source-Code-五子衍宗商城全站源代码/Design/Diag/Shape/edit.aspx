<%@ page language="C#" autoeventwireup="true" inherits="Design_Diag_Shape_edit, App_Web_n5nck3jv" masterpagefile="~/Design/Master/Edit.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>图形设置</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="control-section-divider labeled">样式设置</div>
<hr class="divider-long" />
<div class="setting-row" data-group="indent">
    <div>
        <label class="row-title">颜色</label></div>
        <input type="text" id="color_t" class="form-control text_150">
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
<script>
$(function () {
    console.log(editor.dom);
    $("#color_t").ColorPickerSliders({
        size: 'sm', placement: 'right', swatches: false, sliders: false, hsvpanel: true, previewformat: "hex",
        onchange: function (container, color) {
            editor.config.color = color.tiny.toHexString();
            //editor.dom.css("color", color.tiny.toHexString());
        }
    });
})
</script>
</asp:Content>


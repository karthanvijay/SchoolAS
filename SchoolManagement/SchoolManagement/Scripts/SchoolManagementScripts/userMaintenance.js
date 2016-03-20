$(function () {

    var dlgbx = $('#addOrUpdateUser').dialog({
        autoOpen: false,
        height: 600,
        width: 700,
        modal: true,
        position: [(($(window).width()) / 2) - 350, (($(window).height()) / 2) - 300],

        title: 'User Maintenance',
        close: function () {
            window.location.replace('/Admin/UserMaintenance.aspx');
        }
    });
   
    dlgbx.parent().appendTo($("form:first"));

    if ($.trim($(".addOrUpdateUser").text()).toLowerCase() == 'true') {
        $('#addOrUpdateUser').dialog('open');
         return false;
    }

});
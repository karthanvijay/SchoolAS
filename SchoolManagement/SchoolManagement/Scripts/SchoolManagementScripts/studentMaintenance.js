$(function () {

    var dlgbx = $('#addStudentDiv').dialog({
        autoOpen: false,
        height: 600,
        width: 700,
        modal: true,
        position: [(($(window).width()) / 2) - 350, (($(window).height()) / 2) - 350],

        title: 'Student Maintenance',
        close: function () {
            window.location.replace('/Staff/StudentMaintenance.aspx');
        }
    });
    dlgbx.parent().appendTo($("form:first"));
    $('.addStudent').bind('click', function () {
        $('#addStudentDiv').dialog('open');
        return false;
    });
    if ($.trim($(".showPopup").text()).toLowerCase() == 'true') {
        $('#addStudentDiv').dialog('open');
        return false;
    }
});


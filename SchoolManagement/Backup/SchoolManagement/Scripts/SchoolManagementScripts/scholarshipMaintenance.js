$(function () {

    var dlgbx = $('#updateScholarShip').dialog({
        autoOpen: false,
        height: 600,
        width: 700,
        modal: true,
        position: [(($(window).width()) / 2) - 350, (($(window).height()) / 2) - 300],

        title: 'ScholarShip Details',
        close: function () {
            window.location.replace('/Staff/ScholarShipMaintenance.aspx');
        }
    });
    var dlgbxScholarShipAdd = $('#addScholarShips').dialog({
        autoOpen: false,
        height: 600,
        width: 700,
        modal: true,
        position: [(($(window).width()) / 2) - 350, (($(window).height()) / 2) - 300],

        title: 'ScholarShip Details',
        close: function () {
            window.location.replace('/Staff/ScholarShipMaintenance.aspx');
        }
    });

    dlgbx.parent().appendTo($("form:first"));
    dlgbxScholarShipAdd.parent().appendTo($("form:first"));

    if ($.trim($(".updateStudentScholarShipDetails").text()).toLowerCase() == 'true') {
        $('#updateScholarShip').dialog('open');
        return false;
    }

    if ($.trim($(".addScholarShipForStudents").text()).toLowerCase() == 'true') {
        $('#addScholarShips').dialog('open');
        return false;
    }


});


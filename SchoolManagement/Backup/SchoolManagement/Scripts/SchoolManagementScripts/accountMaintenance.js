$(function () {

    var dlgbx = $('#addFee').dialog({
        autoOpen: false,
        height: 600,
        width: 700,
        modal: true,
        position: [(($(window).width()) / 2) - 350, (($(window).height()) / 2) - 300],

        title: 'Fee Payment',
        close: function () {
            window.location.replace('/Staff/AccountMaintenance.aspx');
        }
    });
    var dlgbxhistory = $('#history').dialog({
        autoOpen: false,
        height: 600,
        width: 1200,
        modal: true,
        position: [(($(window).width()) / 2) - 600, (($(window).height()) / 2) - 300],

        title: 'Fee Payment',
        close: function () {
            window.location.replace('/Staff/AccountMaintenance.aspx');
        }
    });
    dlgbx.parent().appendTo($("form:first"));
    dlgbxhistory.parent().appendTo($("form:first"));
    if ($.trim($(".feeInformation").text()).toLowerCase() == 'true') {
        $('#addFee').dialog('open');
        return false;
    }
    if ($.trim($(".transactionInformation").text()).toLowerCase() == 'true') {
        $('#history').dialog('open');
        return false;
    }
    
});


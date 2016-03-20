$(function () {

    var dlgbxTransactionHistory = $('#transactionHistory').dialog({
        autoOpen: false,
        height: 600,
        width: 1000,
        modal: true,
        position: [(($(window).width()) / 2) - 500, (($(window).height()) / 2) - 300],

        title: 'Transaction Details',
        close: function () {
            window.location.replace('/Admin/FeeApprovals.aspx');
        }
    });
    dlgbxTransactionHistory.parent().appendTo($("form:first"));
   
    if ($.trim($(".feeTransactionDetail").text()).toLowerCase() == 'true') {
        $('#transactionHistory').dialog('open');
      
        return false;
    }

});


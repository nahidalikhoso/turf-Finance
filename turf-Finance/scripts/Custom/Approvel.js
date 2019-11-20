$(document).ready(function () {

    $('.selectVendorOrCustomer').select2({}).on('select2:open', function () {
        var a = $(this).data('select2');
        if (!$('.select2-link').length) {
            a.$results.parents('.select2-results')
                    .prepend('<div class="select2-link"><a style="font-weight:bold;"> + Add New</a></div>')
                    .on('click', function (b) {
                        $(".selectVendorOrCustomer").select2('close');
                        $('#AddTaxModel').modal();
                    });
        }
    });

    let simplepicker = new SimplePicker(".datePickStart");
    let simplepicker2 = new SimplePicker(".datePickEnd");
    $("#datePickStart").focus(function () {
        simplepicker.open('');
        simplepicker.disableTimeSection();
        $("#datePickStart").attr('readonly', 'true');
    });
    simplepicker.on('submit', (date) => {
        $("#datePickStart").prop('readonly', false);
        $("#datePickStart")[0].value = formatDate(date);
    });
    simplepicker.on('close', function () {

        $("#datePickStart").removeAttr('readonly');
    });
    $("#datePickEnd").focus(function () {
        simplepicker2.open();
        simplepicker2.disableTimeSection();
        $("#datePickEnd").attr('readonly', 'true');
    });
    simplepicker2.on('submit', (date) => {
        $("#datePickEnd")[0].value = formatDate(date);
        $("#datePickEnd").prop('readonly', false);
    });
    simplepicker2.on('close', function () {

        $("#datePickEnd").removeAttr('readonly');
    });


    $("#tblExpenseList").DataTable({

        columnDefs: [{
            targets: [1,2,3,4,5,6,7,8],
            render: $.fn.dataTable.render.ellipsis(7)
        }],
        pageLength: '4',
        "filter": true, // this is for disable filter (search box)
        "order": [[3, "desc"]],
        "pagingType": "full_numbers",
    });
    $("#tblAllVoucherList").DataTable({

        columnDefs: [{
            targets: 7,
            render: $.fn.dataTable.render.ellipsis(10)
        }],
        pageLength: '4',
        "filter": true, // this is for disable filter (search box)
        "order": [[3, "desc"]],
        "pagingType": "full_numbers",
    });
    $("#div_ExpenseList").hide();
    ClickCheckBox();
});
function ClickCheckBox() {
    var $Pay = $("#btnApprove").hide(),
   $cbs = $('input[type="checkbox"]').click(function () {
       $Pay.toggle($cbs.is(":checked"));

   });
}
function OpenExpenseList() {
    $("#div_AllVoucherList").hide();
    $("#div_ExpenseList").show();
}
    function formatDate(date) {
        var d = new Date(date),
            month = '' + (d.getMonth() + 1),
            day = '' + d.getDate(),
            year = d.getFullYear();

        if (month.length < 2)
            month = '0' + month;
        if (day.length < 2)
            day = '0' + day;

        return [year, month, day].join('-');
    }
    function show_confirm(message) {
        show_confirm_message({
            message: message,
            executeYes: function () {
             
            },
            executeNo: function () {

            }
        });
    }
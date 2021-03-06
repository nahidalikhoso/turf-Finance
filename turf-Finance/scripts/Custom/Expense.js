﻿
$(document).ready(function () {
    CalculateNetAmount();
    CalculatePayment();
    $('.tax').select2({}).on('select2:open', function () {
        var a = $(this).data('select2');
        if (!$('.select2-link').length) {
            a.$results.parents('.select2-results')
                    .prepend('<div class="select2-link"><a style="font-weight:bold;"> + Add New</a></div>')
                    .on('click', function (b) {
                        $(".tax").select2('close');
                      $('#AddTaxModel').modal();
                    });
        }
    });
    $('.vendor').select2({}).on('select2:open', function () {
        var a = $(this).data('select2');
        if (!$('.select2-link').length) {
            a.$results.parents('.select2-results')
                    .prepend('<div class="select2-link"><a style="font-weight:bold;"> + Add New</a></div>')
                    .on('click', function (b) {
                        $(".vendor").select2('close');
                        $('#AddVenderModel').modal();
                    });
        }
    });
    $('#ddlLegal').select2({}).on('select2:open', function () {
        var a = $(this).data('select2');
        if (!$('.select2-link').length) {
            a.$results.parents('.select2-results')
                    .prepend('<div class="select2-link"><a style="font-weight:bold;"> + Add New</a></div>')
                    .on('click', function (b) {
                        $("#ddlLegal").select2('close');
                        $('#AddLegalEntity').modal();
                    });
        }
    });
    $('#ddlTaxProfile').select2({}).on('select2:open', function () {
        var a = $(this).data('select2');
        if (!$('.select2-link').length) {
            a.$results.parents('.select2-results')
                    .prepend('<div class="select2-link"><a style="font-weight:bold;"> + Add New</a></div>')
                    .on('click', function (b) {
                        $("#ddlTaxProfile").select2('close');
                        $('#AddTaxModel').modal();
                    });
        }
    });
    $('#ddlCity').select2({}).on('select2:open', function () {
        var a = $(this).data('select2');
        if (!$('.select2-link').length) {
            a.$results.parents('.select2-results')
                    .prepend('<div class="select2-link"><a style="font-weight:bold;"> + Add New</a></div>')
                    .on('click', function (b) {
                        $("#ddlCity").select2('close');
                        $('#AddCity').modal();
                    });
        }
    });
    $('#ddlCountry').select2({}).on('select2:open', function () {
        var a = $(this).data('select2');
        if (!$('.select2-link').length) {
            a.$results.parents('.select2-results')
                    .prepend('<div class="select2-link"><a style="font-weight:bold;"> + Add New</a></div>')
                    .on('click', function (b) {
                        $("#ddlCountry").select2('close');
                        $('#AddCountry').modal();
                    });
        }
    });
    $('#ddlVendorAccount').select2({}).on('select2:open', function () {
        var a = $(this).data('select2');
        if (!$('.select2-link').length) {
            a.$results.parents('.select2-results')
                    .prepend('<div class="select2-link"><a style="font-weight:bold;"> + Add New</a></div>')
                    .on('click', function (b) {
                        $("#ddlVendorAccount").select2('close');
                        $('#AddTaxModel').modal();
                    });
        }
    });
    let simplepicker = new SimplePicker(".datePickStart");
    let simplepicker2 = new SimplePicker(".datePickEnd");
    let simplepicker3 = new SimplePicker(".InvoiceDate");
    let simplepicker4 = new SimplePicker(".DueDate");
    let simplepicker5 = new SimplePicker(".VoucherDate");
    let simplepicker6 = new SimplePicker(".datePickStartVendorList");
    let simplepicker7 = new SimplePicker(".datePickEndVendorList");
    let simplepicker8 = new SimplePicker(".VoucherDatePayment");
    let simplepicker9 = new SimplePicker(".VendorAsOFdate");
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
    $("#InvoiceDate").focus(function () {
        simplepicker3.open();
        simplepicker3.disableTimeSection();
        $("#InvoiceDate").attr('readonly', 'true');
    });
    simplepicker3.on('submit', (date) => {
        $("#InvoiceDate")[0].value = formatDate(date);
        $("#InvoiceDate").prop('readonly', false);
    });
    simplepicker3.on('close', function () {

        $("#InvoiceDate").removeAttr('readonly');
    });
    $("#DueDate").focus(function () {
        simplepicker4.open();
        simplepicker4.disableTimeSection();
        $("#DueDate").attr('readonly', 'true');
    });
    simplepicker4.on('submit', (date) => {
        $("#DueDate")[0].value = formatDate(date);
        $("#DueDate").prop('readonly', false);
    });
    simplepicker4.on('close', function () {

        $("#DueDate").removeAttr('readonly');
    });
    $("#VoucherDate").focus(function () {

        simplepicker5.open();
        simplepicker5.disableTimeSection();
        $("#VoucherDate").attr('readonly', 'true');
    });
    simplepicker5.on('submit', (date) => {
        $("#VoucherDate")[0].value = formatDate(date);
        $("#VoucherDate").prop('readonly', false);
    });
    simplepicker5.on('close', function () {

        $("#VoucherDate").removeAttr('readonly');
    });
    $("#datePickStartVendorList").focus(function () {

        simplepicker6.open();
        simplepicker6.disableTimeSection();
        $("#datePickStartVendorList").attr('readonly', 'true');
    });
    simplepicker6.on('submit', (date) => {
        $("#datePickStartVendorList")[0].value = formatDate(date);
        $("#datePickStartVendorList").prop('readonly', false);
    });
    simplepicker6.on('close', function () {

        $("#datePickStartVendorList").removeAttr('readonly');
    });
    $("#datePickEndVendorList").focus(function () {
        simplepicker7.open();
        simplepicker7.disableTimeSection();
        $("#datePickEndVendorList").attr('readonly', 'true');
    });
    simplepicker7.on('submit', (date) => {
        $("#datePickEndVendorList")[0].value = formatDate(date);
        $("#datePickEndVendorList").prop('readonly', false);
    });
    simplepicker7.on('close', function () {

        $("#datePickEndVendorList").removeAttr('readonly');
    });
    $("#VoucherDatePayment").focus(function () {
        simplepicker8.open();
        simplepicker8.disableTimeSection();
        $("#VoucherDatePayment").attr('readonly', 'true');
    });
    simplepicker8.on('submit', (date) => {
        $("#VoucherDatePayment")[0].value = formatDate(date);
        $("#VoucherDatePayment").prop('readonly', false);
    });
    simplepicker8.on('close', function () {

        $("#VoucherDatePayment").removeAttr('readonly');
    });
    $("#VendorAsOFdate").focus(function () {
        simplepicker9.open();
        simplepicker9.disableTimeSection();
        $("#VendorAsOFdate").attr('readonly', 'true');
    });
    simplepicker9.on('submit', (date) => {
        $("#VendorAsOFdate")[0].value = formatDate(date);
        $("#VendorAsOFdate").prop('readonly', false);
    });
    simplepicker9.on('close', function () {

        $("#VendorAsOFdate").removeAttr('readonly');
    });
    $("#lblItemDetail").click(function () {
        ShowItemDetailTable();
    });
    $('#tblExpenseVoucherList tbody').on('click', 'tr td:eq(1)', function () {
        jQuery('#div_ExpList').hide();
        jQuery('#Product_DetailEdit').hide();
        jQuery('#ExpenseVoucher').show();
    });
    $('#tblExpenseVoucherList tbody').on('click', 'tr:eq(3) td:eq(3)', function () {
        jQuery('#div_ExpList').hide();
        jQuery('#Product_DetailEdit').hide();
        $("#btnInActive").show();
        $("#btnEditPayment").show();
        $("#btnDeletePayment").show();
        $("#lblStatus").show();
        jQuery('#Payment').show();
    });
    $('#demoGridForVendorList tbody').on('click', 'tr td:eq(1)', function () {
        //jQuery('#ReceiveList').hide();
        //jQuery('#Product_DetailEdit').hide();
        jQuery('#div_ExpList').hide();
        jQuery('#AddNewVendor').show();
    });
    $("#ExpenseVoucher").hide();
    $("#Payment").hide();
    $("#AddNewVendor").hide();
    ClickCheckBox();
    ClickCheckBoxVendorCredit();
    ClickCheckBoxVendorList();
    // AddRow();
     AddRow_Account();
    AddRowAccountDeatil()
   // AddRow_Bank()
    AddRowBankDetail();
   // AddRow_Item();
    AddRowItemDeatil();
    $("#tab_ItemDetail").DataTable({
        "ordering": false,
        "paging": false,
        "bInfo": false,
        "searching": false
    })
    $("#tblExpenseVoucherList").DataTable({

        columnDefs: [{
            targets: 7,
            render: $.fn.dataTable.render.ellipsis(10)
        }],
        pageLength: '4',
        "filter": true, // this is for disable filter (search box)
        "order": [[3, "desc"]],
        "pagingType": "full_numbers",
    });
    $("#demoGridForUnpaid").DataTable({

        columnDefs: [{
            targets: [1, 2, 3, 4, 5, 7, 8],
            render: $.fn.dataTable.render.ellipsis(6)
        }],
        pageLength: '4',
        "filter": true, // this is for disable filter (search box)
        "order": [[3, "desc"]],
        "pagingType": "full_numbers",
    });
    $("#demoGridForVenderBalance").DataTable({

        "ordering": false,
        "paging": false,
        "bInfo": false,
        "searching": false

    });
    $("#tblPayment").DataTable({
        columnDefs: [{
            targets: 0,
            render: $.fn.dataTable.render.ellipsis(8)
        }],
        "ordering": false,
        "paging": false,
        "bInfo": false,
        "searching": false

    });
    $("#tab_BankDetail").DataTable({

        "ordering": false,
        "paging": false,
        "bInfo": false,
        "searching": false

    });
    $("#VendorBalance").DataTable({

        fixedHeader: {
            header: true,
            headerOffset: 45,
        },
        scrollX: true,
        pageLength: '4',
        // this is for disable filter (search box)

        "searching": false,
        "bInfo": false,
        "paging": true,
        "scrollY": 200

    });
    $("#demoGridForVendorList").DataTable({
        fixedHeader: {
            header: true,
            headerOffset: 45,
        },
        scrollX: true,
        columnDefs: [{
            targets: [1, 2, 3, 4, 5, 6, 7, 8],
            render: $.fn.dataTable.render.ellipsis(8)
        }],
        pageLength: '4',
        //  "filter": true, // this is for disable filter (search box)
        "order": [[3, "desc"]],
        "bInfo": false,
        "paging": true,
        "scrollY": 200
    });
    $("#div_ExpenseVoucherList").show();
    $("#div_UnpaidVoucher").hide();
    $("#di_UseCredit").hide();
});

$("#tblExpenseVoucherDetail td input").on('change', function () {

    var $td = $(this).closest('td');
    var v = $td.find('input').val();
    alert(v);
   // table.cell($td).invalidate();
});


function initializeDataTable_ExpenseVoucherDetail()
{
    if (!$.fn.DataTable.isDataTable('#tblExpenseVoucherDetail'))
    {
        table = $("#tblExpenseVoucherDetail").DataTable();
        table.destroy();
    }

    $("#tblExpenseVoucherDetail").dataTable({
        drawCallback: function (settings) {
            var api = this.api();
            // Initialize custom control
            initDataTableCtrl(api.table().container());
        },
        responsive: {
            details: {

                renderer: function (api, rowIdx, columns) {

                    var $row_details = $.fn.DataTable.Responsive.defaults.details.renderer(api, rowIdx, columns);

                    // Initialize custom control
                    initDataTableCtrl($row_details);

                    return $row_details;
                }
            }
        },
        "ordering": false,
        "paging": false,
        "bInfo": false,
        "searching": false
    });
}
function initDataTableCtrl(container) {
    //console.log("Container :"+container.innerHTML);
    $('.select', container).select2({}).on('select2:open', function () {
        var a = $(this).data('select2');
        if (!$('.select2-link').length) {
            a.$results.parents('.select2-results')
                    .prepend('<div class="select2-link"><a style="font-weight:bold;"> + add new</a></div>')
                    .on('click', function (b) {
                        $("#ddlclass").select2('close');
                        $('#addvendermodel').modal();
                    });
        }
    });
    //$('.select', container).select2('destroy');

   

    //$('select', container).select2();
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
function openmodel() {
    jQuery('#myModal').modal();
}
function openExpenseVoucher() {
    $("#btnEdit").hide();
    $("#btnDelete").hide();
    jQuery('#div_ExpList').hide();
    jQuery('#Payment').hide();
    jQuery('#Product_Detail').hide();
    jQuery('#ExpenseVoucher').show();
}
function ShowItemDetailTable() {
    jQuery('#Product_Detail').show();
}

function AddRow_Account() {
    
    
        row =  '<tr id="row1" data-id="1" class="hidden">';
        row += '<td data-name="sel"><div id="div_Class"><select id="ddlClass" name="Class1" style="width:100%" class="form-control select "><option value="0">Select</option><option value="1">Class1</option><option value="2">Class2</option><option value="3">Class3</option></select></div></td>';
        row += '<td data-name="sel"><div id="Acount"><select id="ddlAccount" name="Account1" class="form-control select"><option value="0">Select</option><option style="color: blue; font-weight: bold" value="-1">Add New Account </option><option value="1">Sale</option><option value="2">Expense</option><option value="3">Utilities</option></select></div></td>';
        row += '<td data-name="td_Memo"><input type="text" name="Memo1" class="form-control memo" /></td>';
        row += '<td data-name="td_Amount"><input type="number" name="txtAmount1" class="form-control Amount" /></td>';
        row += '<td data-name="sel"><div id="td_project"><select id="ddlProject" name="Project1" class="form-control select"><option value="0">Select</option><option style="color: blue; font-weight: bold" value="-1">Add New Project</option><option value="1">Project1</option><option value="2">Project2</option><option value="3">Project3</option></select></div></td>';
        row += '<td data-name="del"><button class="btn btn-danger glyphicon   row-remove" style="background-color: white; color: black; border: none;"><span aria-hidden="true">×</span></button></td>';
        row += '</tr>';
    
        $(row).appendTo($('#tblExpenseVoucherDetail'));
        initializeDataTable_ExpenseVoucherDetail();
}
function AddRow(){
    
    var newid = 1;
    $.each($("#tblExpenseVoucherDetail tr"), function () {
        if (parseInt($(this).data("id")) > newid) {
            newid = parseInt($(this).data("id"));
        }
    });
    newid++;
    var tr = $(" <tr></tr>", {
        id: "addr" + newid,
        "data-id": newid
    });
    // loop through each td and create new elements with name of newid
    $.each($("#tblExpenseVoucherDetail tbody tr:nth(0) td"), function () {
        var td;
        var cur_td = $(this);
        var children = cur_td.children();
        // add new td and element if it has a nane
        if ($(this).data("name") !== undefined) {
            td = $("    <td></td>", {
                "data-name": $(cur_td).data("name")
            });
            var c = $(cur_td).find($(children[0]).prop('tagName')).clone().val("");
            c.attr("name", $(cur_td).data("name") + newid);
            c.appendTo($(td));
            td.appendTo($(tr));
        } else {
            td = $("  <td></td>", {
                'text': $('#tblExpenseVoucherDetail tr').length
            }).appendTo($(tr));
        }
    });
    // add the new row
    $(tr).appendTo($('#tblExpenseVoucherDetail'));
    //sumAmount();

    $(tr).find("td button.row-remove").on("click", function () {
        $(this).closest("tr").remove();
    });

}
function AddRowAccountDeatil() {
        
    $("#add_rowAccountDetail").on("click", function () {
  
        var newid = 1;
        $.each($("#tblExpenseVoucherDetail tr"), function () {
            if (parseInt($(this).data("id")) > newid) {
                newid = parseInt($(this).data("id"));
            }
        });
        newid++;
        var tr = $(" <tr></tr>", {
            id: "addr" + newid,
            "data-id": newid
        });
        // loop through each td and create new elements with name of newid
        $.each($("#tblExpenseVoucherDetail tbody tr:nth(0) td"), function () {
            var td;
            var cur_td = $(this);
            var children = cur_td.children();
            // add new td and element if it has a nane
            if ($(this).data("name") !== undefined) {
                td = $("    <td></td>", {
                    "data-name": $(cur_td).data("name")
                });
                var c = $(cur_td).find($(children[0]).prop('tagName')).clone().val("");
                c.attr("name", $(cur_td).data("name") + newid);
                c.appendTo($(td));
                td.appendTo($(tr));
            } else {
                td = $("  <td></td>", {
                    'text': $('#tblExpenseVoucherDetail tr').length
                }).appendTo($(tr));
            }
        });
        // add the new row
        $(tr).appendTo($('#tblExpenseVoucherDetail'));
        //sumAmount();

        $(tr).find("td button.row-remove").on("click", function () {
            $(this).closest("tr").remove();
        });
    });
   
}
function AddRow_Bank() {

    var newid = 1;
    $.each($("#tab_BankDetail tr"), function () {
        if (parseInt($(this).data("id")) > newid) {
            newid = parseInt($(this).data("id"));
        }
    });
    newid++;
    var tr = $(" <tr></tr>", {
        id: "addr" + newid,
        "data-id": newid
    });

    // loop through each td and create new elements with name of newid
    $.each($("#tab_BankDetail tbody tr:nth(0) td"), function () {
        var td;
        var cur_td = $(this);
        var children = cur_td.children();
        // add new td and element if it has a nane
        if ($(this).data("name") !== undefined) {
            td = $("    <td></td>", {
                "data-name": $(cur_td).data("name")
            });
            var c = $(cur_td).find($(children[0]).prop('tagName')).clone().val("");
            c.attr("name", $(cur_td).data("name") + newid);
            c.appendTo($(td));
            td.appendTo($(tr));
        }
        else {
            td = $("  <td></td>", {
                'text': $('#tblExpenseVoucherDetail tr').length
            }).appendTo($(tr));
        }
    });
    // add the new row
    $(tr).appendTo($('#tab_BankDetail'));
    $(tr).find("td button.row-remove").on("click", function () {
        $(this).closest("tr").remove();
    });

}
function AddRowBankDetail() {
    $("#add_rowBankDetail").on("click", function () {

        // Dynamic Rows Code

        // Get max row id and set new id

        var newid = 1;

        $.each($("#tab_BankDetail tr"), function () {
            if (parseInt($(this).data("id")) > newid) {
                newid = parseInt($(this).data("id"));
            }
        });
        newid++;
        var tr = $(" <tr></tr>", {
            id: "addr" + newid,
            "data-id": newid
        });

        // loop through each td and create new elements with name of newid
        $.each($("#tab_BankDetail tbody tr:nth(0) td"), function () {
            var td;
            var cur_td = $(this);

            var children = cur_td.children();

            // add new td and element if it has a nane
            if ($(this).data("name") !== undefined) {

                td = $("    <td></td>", {
                    "data-name": $(cur_td).data("name")
                });

                var c = $(cur_td).find($(children[0]).prop('tagName')).clone().val("");
                c.attr("name", $(cur_td).data("name") + newid);

                c.appendTo($(td));
                td.appendTo($(tr));
            } else {

                td = $("  <td></td>", {
                    'text': $('#tab_BankDetail tr').length
                }).appendTo($(tr));
            }
        });


        // add the new row
        $(tr).appendTo($('#tab_BankDetail'));

        $(tr).find("td button.row-remove").on("click", function () {
            $(this).closest("tr").remove();
        });
    })
}
function AddRow_Item() {

    var newid = 1;
    $.each($("#tab_ItemDetail tr"), function () {
        if (parseInt($(this).data("id")) > newid) {
            newid = parseInt($(this).data("id"));
        }
    });
    newid++;
    var tr = $(" <tr></tr>", {
        id: "addr" + newid,
        "data-id": newid
    });

    // loop through each td and create new elements with name of newid
    $.each($("#tab_ItemDetail tbody tr:nth(0) td"), function () {
        var td;
        var cur_td = $(this);

        var children = cur_td.children();

        // add new td and element if it has a nane
        if ($(this).data("name") !== undefined) {

            td = $("    <td></td>", {
                "data-name": $(cur_td).data("name")
            });

            var c = $(cur_td).find($(children[0]).prop('tagName')).clone().val("");
            c.attr("name", $(cur_td).data("name") + newid);

            c.appendTo($(td));
            td.appendTo($(tr));
        } else {

            td = $("  <td></td>", {
                'text': $('#tab_ItemDetail tr').length
            }).appendTo($(tr));
        }
    });


    // add the new row
    $(tr).appendTo($('#tab_ItemDetail'));

    $(tr).find("td button.row-remove").on("click", function () {
        $(this).closest("tr").remove();
    });

}
function AddRowItemDeatil() {
    $("#add_rowProduct").on("click", function () {

        // Dynamic Rows Code

        // Get max row id and set new id

        var newid = 1;

        $.each($("#tab_ItemDetail tr"), function () {
            if (parseInt($(this).data("id")) > newid) {
                newid = parseInt($(this).data("id"));
            }
        });
        newid++;
        var tr = $(" <tr></tr>", {
            id: "addr" + newid,
            "data-id": newid
        });

        // loop through each td and create new elements with name of newid
        $.each($("#tab_ItemDetail tbody tr:nth(0) td"), function () {
            var td;
            var cur_td = $(this);

            var children = cur_td.children();

            // add new td and element if it has a nane
            if ($(this).data("name") !== undefined) {

                td = $("    <td></td>", {
                    "data-name": $(cur_td).data("name")
                });

                var c = $(cur_td).find($(children[0]).prop('tagName')).clone().val("");
                c.attr("name", $(cur_td).data("name") + newid);

                c.appendTo($(td));
                td.appendTo($(tr));
            } else {

                td = $("  <td></td>", {
                    'text': $('#tab_ItemDetail tr').length
                }).appendTo($(tr));
            }
        });


        // add the new row
        $(tr).appendTo($('#tab_ItemDetail'));

        $(tr).find("td button.row-remove").on("click", function () {
            $(this).closest("tr").remove();
        });
    })
}
function AllRowRemove() {
    var table = $('#tblExpenseVoucherDetail').DataTable();
    var tableRow = table.row($(this).parents('tr'));
    table.row(tableRow).remove().draw();
    $('#lblTotal').html('');
    
    
}
function AllRowRemoveItem() {
    var table = $('#tab_ItemDetail').DataTable();
    var tableRow = table.row($(this).parents('tr'));
    table.row(tableRow).remove().draw();
    $('#lbltotalItem').html('');


}

function show_confirm(message) {
   
    show_confirm_message({
        message: message,
        executeYes: function () {
            $("#ExpenseVoucher").hide();
            $("#ExpenseVoucherEdit").hide();
            jQuery('#div_ExpList').show();
        },
        executeNo: function () {

        }
    });
}
function show_confirmVendorInformation(message) {

    show_confirm_message({
        message: message,
        executeYes: function () {

            $("#AddNewVendor").hide();
            $("#div_ExpList").show();
        },
        executeNo: function () {

        }
    });
}
function AllVoucher() {
    $("#div_ExpenseVoucherList").show();
    $("#div_UnpaidVoucher").hide();

}
function AllUnPaidVoucher() {
    $("#div_ExpenseVoucherList").hide();
    $("#div_UnpaidVoucher").show();

}
function PaymentPage() {
    jQuery('#div_ExpList').hide();
    jQuery('#ExpenseVoucher').hide();
    $("#btnInActive").hide();
    $("#btnEditPayment").hide();
    $("#btnDeletePayment").hide();
    $("#lblStatus").hide();

    jQuery('#Payment').show();

}
function ClickCheckBox() {
    var $Pay = $("#btnPay").hide(),
   $cbs = $('input[type="checkbox"]').click(function () {
       $Pay.toggle($cbs.is(":checked"));

   });
}
function ClickCheckBoxVendorCredit() {
    
    var $Pay = $("#di_UseCredit").hide(),
   $cbs = $('input[id="chkUseCredit"]').click(function () {
       $Pay.toggle($cbs.is(":checked"));

   });
}
function AddNewVendor() {

    jQuery('#div_ExpList').hide();
    jQuery('#AddNewVendor').show();

}
function VendorPaymentPage() {

    jQuery('#div_ExpList').hide();
    jQuery('#ExpenseVoucher').hide();
    //jQuery('#customerList').hide();
    jQuery('#Payment').show();
    document.getElementById('Payment').setAttribute('source', 'Vendor');

}
function ClickCheckBoxVendorList() {
    var $PaymentVendor = $("#btnVendorPayment").hide(),
   $cbs = $('input[type="checkbox"]').click(function () {
       $PaymentVendor.toggle($cbs.is(":checked"));

   });
}
function sumAmountAccount() {
    var sum = 0.00;
    $('.txtAmount').each(function () {
        if ($(this).val() != '')
            sum = parseInt(sum) + parseInt($(this).val());
       
    });

    $('#lblTotal').html(sum +".00");
}
function sumAmountItem() {
    var sum = 0.00;
    $('.txtAmountItem').each(function () {
        if ($(this).val() != '')
            sum = parseInt(sum) + parseInt($(this).val());

    });

    $('#lbltotalItem').html(sum + ".00");
}
function CalculateNetAmount() {
    var diff = 0.00;
    var invoiceAmount = $("#lblInvoiceAmount").text().split(",").join("");
    if ($(".txtDiscount").val()!= '')
    {
        
        var discount = $(".txtDiscount").val();
       
        diff = parseFloat(invoiceAmount).toFixed(2) - parseFloat(discount).toFixed(2)
        $('#lblNetAmount').html(diff.toLocaleString());
        CalculatePayment();
    }
    else
    {
       
        diff = parseFloat(invoiceAmount).toFixed(2)
        $('#lblNetAmount').html(diff.toLocaleString());
        CalculatePayment();
    }
   
}
function CalculatePayment() {
    var Payment = 0.00;
    var NetAmount = $("#lblNetAmount").text();
    if ($(".txtPayment").val()!='') {
        var AmountToPay = $(".txtPayment").val();
        Payment = parseFloat(NetAmount).toFixed(2) - parseFloat(AmountToPay).toFixed(2)
        $('#lblPayment').html(Payment.toLocaleString());
    }
    else {
        debugger
        Payment = NetAmount;
        $('#lblPayment').html(Payment.toLocaleString());
    }
   
}



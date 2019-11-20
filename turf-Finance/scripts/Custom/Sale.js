$(document).ready(function () {

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
    $('.Customer').select2({}).on('select2:open', function () {
        var a = $(this).data('select2');
        if (!$('.select2-link').length) {
            a.$results.parents('.select2-results')
                    .prepend('<div class="select2-link"><a style="font-weight:bold;"> + Add New</a></div>')
                    .on('click', function (b) {
                        $(".Customer").select2('close');
                        $('#AddCustomerModel').modal();
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
    $('#ddlCustomerAccount').select2({}).on('select2:open', function () {
        var a = $(this).data('select2');
        if (!$('.select2-link').length) {
            a.$results.parents('.select2-results')
                    .prepend('<div class="select2-link"><a style="font-weight:bold;"> + Add New</a></div>')
                    .on('click', function (b) {
                        $("#ddlCustomerAccount").select2('close');
                        $('#AddTaxModel').modal();
                    });
        }
    });

    let simplepicker = new SimplePicker(".datePickStart");
    let simplepicker2 = new SimplePicker(".datePickEnd");
    let simplepicker3 = new SimplePicker(".InvoiceDate");
    let simplepicker4 = new SimplePicker(".DueDate");
    let simplepicker5 = new SimplePicker(".VoucherDate");
    let simplepicker6 = new SimplePicker(".VoucherDateReceived");
    let simplepicker7 = new SimplePicker(".datePickStartCustomerList");
    let simplepicker8 = new SimplePicker(".datePickEndCustomerList");
    let simplepicker9 = new SimplePicker(".CustomerAsOFdate");
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
    $("#VoucherDateReceived").focus(function () {
        simplepicker6.open();
        simplepicker6.disableTimeSection();
        $("#VoucherDateReceived").attr('readonly', 'true');
    });
    simplepicker6.on('submit', (date) => {
        $("#VoucherDateReceived")[0].value = formatDate(date);
        $("#VoucherDateReceived").prop('readonly', false);
    });
    simplepicker6.on('close', function () {

        $("#VoucherDateReceived").removeAttr('readonly');
    });


    $("#datePickStartCustomerList").focus(function () {

        simplepicker7.open();
        simplepicker7.disableTimeSection();
        $("#datePickStartCustomerList").attr('readonly', 'true');
    });
    simplepicker7.on('submit', (date) => {
        $("#datePickStartCustomerList")[0].value = formatDate(date);
        $("#datePickStartCustomerList").prop('readonly', false);
    });
    simplepicker7.on('close', function () {

        $("#datePickStartCustomerList").removeAttr('readonly');
    });
    $("#datePickEndCustomerList").focus(function () {
        simplepicker8.open();
        simplepicker8.disableTimeSection();
        $("#datePickEndCustomerList").attr('readonly', 'true');
    });
    simplepicker8.on('submit', (date) => {
        $("#datePickEndCustomerList")[0].value = formatDate(date);
        $("#datePickEndCustomerList").prop('readonly', false);
    });
    simplepicker8.on('close', function () {

        $("#datePickEndCustomerList").removeAttr('readonly');
    });
    $("#CustomerAsOFdate").focus(function () {
        simplepicker9.open();
        simplepicker9.disableTimeSection();
        $("#CustomerAsOFdate").attr('readonly', 'true');
    });
    simplepicker9.on('submit', (date) => {
        $("#CustomerAsOFdate")[0].value = formatDate(date);
        $("#CustomerAsOFdate").prop('readonly', false);
    });
    simplepicker9.on('close', function () {

        $("#CustomerAsOFdate").removeAttr('readonly');
    });
  


    $('#my_tab').tabs();

    $("#lblItemDetail").click(function () {

        ShowItemDetailTable();
    });
    $("#lblItemDetailEdit").click(function () {
        ShowItemDetailTableEdit();
    });
    ClickCheckBox();
    ClickCheckBoxCustomerList();
    $('#demoGrid tbody').on('click', 'tr td:eq(1)', function () {
        jQuery('#ReceiveList').hide();
        jQuery('#Product_Detail').hide();
        jQuery('#btnEdit').show();
        jQuery('#btnDelete').show();
        jQuery('#ReceiveVoucher').show();
    });
    $('#demoGrid tbody').on('click', 'tr:eq(3) td:eq(3)', function () {
        jQuery('#ReceiveList').hide();
        $("#btnEditReceived").show();
        $("#btnInActive").show();
        $("#btnDeleteReceived").show();
        $("#lblStatus").show();
        jQuery('#Received').show();
    });

    $('#demoGridForCustmoerList tbody').on('click', 'tr td:eq(1)', function () {
        //jQuery('#ReceiveList').hide();
        //jQuery('#Product_DetailEdit').hide();
        jQuery('#ReceiveList').hide();
        jQuery('#AddNewCustomerOnEdit').show();
    });

    

    $("#ReceiveVoucher").hide();
    $("#ReceiveVoucherEdit").hide();
    $("#Received").hide();
    $("#ReceivedEditMode").hide();
    $("#AddNewCustomer").hide();
    $("#AddNewCustomerOnEdit").hide();

    
    //$("#ddSelect").select2();

  //  EditableDataTable();
    AddRow();
    AddRow();
 
    AddRow_Bank()
    AddRowBankDetail();
  
    AddRow_Item();
    AddRowItemDeatil();
  
 

    $("#tab_logic").DataTable({
        "ordering": false,
        "paging": false,
        "bInfo": false,
        "searching": false
    })
    $("#tab_ItemDetail").DataTable({
        "ordering": false,
        "paging": false,
        "bInfo": false,
        "searching": false
    })
   
    $("#demoGrid").DataTable({

        columnDefs: [{
            targets:[ 1,2,3,4,5,6,7,,8],
            render: $.fn.dataTable.render.ellipsis(7)
        }],
        pageLength: '4',
        "filter": true, // this is for disable filter (search box)
        "order": [[3, "desc"]],
        "pagingType": "full_numbers",
    });
    $("#CustomerBalance").DataTable({

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
    $("#demoGridForCustmoerList").DataTable({
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
    $("#demoGridForNotReceived").DataTable({

        columnDefs: [{
            targets: [1, 2, 3, 4, 5, 7, 8],
            render: $.fn.dataTable.render.ellipsis(6)
        }],
        pageLength: '4',
        "filter": true, // this is for disable filter (search box)
        "order": [[3, "desc"]],
        "pagingType": "full_numbers",
    });
    $("#demoGridForCustomerBalance").DataTable({

        "ordering": false,
        "paging": false,
        "bInfo": false,
        "searching": false

    });
    
    $("#demoGrid_Received").DataTable({
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

    $("#div_DemoGrid").show();
    $("#div_NotReceivedVoucher").hide();

});

function openmodel() {

    jQuery('#myModal').modal();
}
function openSaleVoucher() {
    debugger
    jQuery('#ReceiveList').hide();
    jQuery('#Received').hide();
    jQuery('#Product_Detail').hide();
    jQuery('#btnDelete').hide();
    jQuery('#btnEdit').hide();
    
    jQuery('#ReceiveVoucher').show();

}
function AddNewCustomer() {
    debugger
    jQuery('#ReceiveList').hide();
    jQuery('#AddNewCustomer').show();
 
}





function ShowItemDetailTable() {
    jQuery('#Product_Detail').show();

}
function AddRow() {

    var newid = 1;
    $.each($("#tab_logic tr"), function () {
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
    $.each($("#tab_logic tbody tr:nth(0) td"), function () {
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
                'text': $('#tab_logic tr').length
            }).appendTo($(tr));
        }
    });


    // add the new row
    $(tr).appendTo($('#tab_logic'));

    $(tr).find("td button.row-remove").on("click", function () {
        $(this).closest("tr").remove();
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
        } else {

            td = $("  <td></td>", {
                'text': $('#tab_logic tr').length
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



//function EditableDataTable() {
//    $("#add_row").on("click", function () {

//        // Dynamic Rows Code

//        // Get max row id and set new id

//        var newid = 1;

//        $.each($("#tab_logic tr"), function () {
//            if (parseInt($(this).data("id")) > newid) {
//                newid = parseInt($(this).data("id"));
//            }
//        });
//        newid++;
//        var tr = $(" <tr></tr>", {
//            id: "addr" + newid,
//            "data-id": newid
//        });

//        // loop through each td and create new elements with name of newid
//        $.each($("#tab_logic tbody tr:nth(0) td"), function () {
//            var td;
//            var cur_td = $(this);

//            var children = cur_td.children();

//            // add new td and element if it has a nane
//            if ($(this).data("name") !== undefined) {

//                td = $("    <td></td>", {
//                    "data-name": $(cur_td).data("name")
//                });

//                var c = $(cur_td).find($(children[0]).prop('tagName')).clone().val("");
//                c.attr("name", $(cur_td).data("name") + newid);

//                c.appendTo($(td));
//                td.appendTo($(tr));
//            } else {

//                td = $("  <td></td>", {
//                    'text': $('#tab_logic tr').length
//                }).appendTo($(tr));
//            }
//        });


//        // add the new row
//        $(tr).appendTo($('#tab_logic'));

//        $(tr).find("td button.row-remove").on("click", function () {
//            $(this).closest("tr").remove();
//        });
//    });

//    // Sortable Code
//    var fixHelperModified = function (e, tr) {
//        var $originals = tr.children();
//        var $helper = tr.clone();

//        $helper.children().each(function (index) {
//            $(this).width($originals.eq(index).width())
//        });

//        return $helper;
//    };

//    $(".table-sortable tbody").sortable({
//        helper: fixHelperModified
//    }).disableSelection();

//    $(".table-sortable thead").disableSelection();


//}
function AllRowRemove() {
}

function show_confirm(message) {
    show_confirm_message({
        message: message,
        executeYes: function () {
            $("#ReceiveVoucher").hide();
            $("#ReceiveVoucherEdit").hide();
            jQuery('#ReceiveList').show();
        },
        executeNo: function () {

        }
    });
}
function show_confirmReceived(message) {
    show_confirm_message({
        message: message,
        executeYes: function () {
            $("#ReceiveVoucher").hide();
            $("#ReceiveVoucherEdit").hide();

            //  $('#' + document.getElementById('Received').getAttribute('source')).show();


            jQuery('#ReceiveList').show();
            $("#Received").hide();
            debugger
            activaTab(document.getElementById('Received').getAttribute('source'));
            jQuery('#btnReceive').hide();

             AllVoucher();
        },
        executeNo: function () {

        }
    });
}

function activaTab(tab) {
    $('.nav-tabs a[href="#' + tab + '"]').tab('show');
};



function show_confirmCustomerInformation(message) {
   
    show_confirm_message({
        message: message,
        executeYes: function () {
            debugger
            $("#AddNewCustomer").hide();
            $("#ReceiveList").show();
        },
        executeNo: function () {

        }
    });
}



function AllVoucher() {
    $("#div_DemoGrid").show();
    $("#div_NotReceivedVoucher").hide();

}
function AllNotReceivedVoucher() {
    $("#div_DemoGrid").hide();
    $("#div_NotReceivedVoucher").show();

}
function ReceivePage() {
    debugger
    jQuery('#ReceiveList').hide();
    jQuery('#ReceiveVoucher').hide();
    $("#btnEditReceived").hide();
    $("#btnInActive").hide();
    $("#lblStatus").hide();
    $("#btnDeleteReceived").hide();
    jQuery('#Received').show();
    document.getElementById('Received').setAttribute('source', 'RecList');

}
function CustomerReceivePage() {
    debugger
    jQuery('#ReceiveList').hide();
    jQuery('#ReceiveVoucher').hide();
    //jQuery('#customerList').hide();
    jQuery('#Received').show();
    document.getElementById('Received').setAttribute('source', 'customer');

}
function ClickCheckBox() {
    var $Receive = $("#btnReceive").hide(),
   $cbs = $('input[type="checkbox"]').click(function () {
       $Receive.toggle($cbs.is(":checked"));

   });
}
function ClickCheckBoxCustomerList() {
    var $ReceiveCst = $("#btnCstReceive").hide(),
   $cbs = $('input[type="checkbox"]').click(function () {
       $ReceiveCst.toggle($cbs.is(":checked"));

   });
}


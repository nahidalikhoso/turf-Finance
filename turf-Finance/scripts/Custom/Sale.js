$(document).ready(function () {
    debugger
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
        jQuery('#Product_DetailEdit').hide();
        jQuery('#ReceiveVoucherEdit').show();
    });
    $('#demoGrid tbody').on('click', 'tr:eq(3) td:eq(3)', function () {
        jQuery('#ReceiveList').hide();
        jQuery('#Product_DetailEdit').hide();
        jQuery('#ReceiveVoucherEdit').hide();
        jQuery('#ReceivedEditMode').show();
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

    EditableDataTable();
    AddRow();
    AddRow();
    AddRowOnEditMode();
    AddRow_Bank()
    AddRowBankDetail();
    AddRowBankDetailEditMode();
    AddRow_Item();
    AddRowItemDeatil();
    AddRow_ItemEdit();
    AddRowItemDeatilEdit();
    $("#tab_logicOnEdit").DataTable({
        "ordering": false,
        "paging": false,
        "bInfo": false,
        "searching": false
    })
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
    $("#tab_ItemDetailEdit").DataTable({
        "ordering": false,
        "paging": false,
        "bInfo": false,
        "searching": false
    })
    $("#demoGrid").DataTable({

        columnDefs: [{
            targets: 7,
            render: $.fn.dataTable.render.ellipsis(10)
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
    $("#demoGridForCustomerBalanceEditMode").DataTable({

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
    $("#demoGrid_ReceivedEditMode").DataTable({
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
    $("#tab_BankDetailEditMode").DataTable({

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

function ShowItemDetailTableEdit() {
    jQuery('#Product_DetailEdit').show();

}
function ddChange() {
    dd = document.getElementById('ddSelect');
    if (dd.selectedOptions[0].value == '-1')

        $('#AddCustomerModel').modal();
}
function ddChangeOnEdit() {
    dd = document.getElementById('ddSelectOnEdit');
    if (dd.selectedOptions[0].value == '-1')

        $('#AddCustomerModel').modal();
}
function ddChangeTax() {

    dd = document.getElementById('AddTax');
    if (dd.selectedOptions[0].value == '-1')

        $('#AddTaxModel').modal();
}
function ddChangeTaxOnEdit() {
    dd = document.getElementById('AddTaxOnEdit');
    if (dd.selectedOptions[0].value == '-1')

        $('#AddTaxModel').modal();
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
function AddRowBankDetailEditMode() {
    $("#add_rowBankDetailEditMode").on("click", function () {

        // Dynamic Rows Code

        // Get max row id and set new id

        var newid = 1;

        $.each($("#tab_BankDetailEditMode tr"), function () {
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
        $.each($("#tab_BankDetailEditMode tbody tr:nth(0) td"), function () {
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
                    'text': $('#tab_BankDetailEditMode tr').length
                }).appendTo($(tr));
            }
        });


        // add the new row
        $(tr).appendTo($('#tab_BankDetailEditMode'));

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
function AddRow_ItemEdit() {

    var newid = 1;
    $.each($("#tab_ItemDetailEdit tr"), function () {
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
    $.each($("#tab_ItemDetailEdit tbody tr:nth(0) td"), function () {
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
                'text': $('#tab_ItemDetailEdit tr').length
            }).appendTo($(tr));
        }
    });


    // add the new row
    $(tr).appendTo($('#tab_ItemDetailEdit'));

    $(tr).find("td button.row-remove").on("click", function () {
        $(this).closest("tr").remove();
    });

}
function AddRowItemDeatilEdit() {
    $("#add_rowProductEdit").on("click", function () {

        // Dynamic Rows Code

        // Get max row id and set new id

        var newid = 1;

        $.each($("#tab_ItemDetailEdit tr"), function () {
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
        $.each($("#tab_ItemDetailEdit tbody tr:nth(0) td"), function () {
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
                    'text': $('#tab_ItemDetailEdit tr').length
                }).appendTo($(tr));
            }
        });


        // add the new row
        $(tr).appendTo($('#tab_ItemDetailEdit'));

        $(tr).find("td button.row-remove").on("click", function () {
            $(this).closest("tr").remove();
        });
    })
}

function AddRowOnEditMode() {
    $("#add_rowOnEdit").on("click", function () {

        // Dynamic Rows Code

        // Get max row id and set new id

        var newid = 1;

        $.each($("#tab_logicOnEdit tr"), function () {
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
        $.each($("#tab_logicOnEdit tbody tr:nth(0) td"), function () {
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
                    'text': $('#tab_logicOnEdit tr').length
                }).appendTo($(tr));
            }
        });


        // add the new row
        $(tr).appendTo($('#tab_logicOnEdit'));

        $(tr).find("td button.row-remove").on("click", function () {
            $(this).closest("tr").remove();
        });
    })
}
function EditableDataTable() {
    $("#add_row").on("click", function () {

        // Dynamic Rows Code

        // Get max row id and set new id

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
    });

    // Sortable Code
    var fixHelperModified = function (e, tr) {
        var $originals = tr.children();
        var $helper = tr.clone();

        $helper.children().each(function (index) {
            $(this).width($originals.eq(index).width())
        });

        return $helper;
    };

    $(".table-sortable tbody").sortable({
        helper: fixHelperModified
    }).disableSelection();

    $(".table-sortable thead").disableSelection();


}
function AllRowRemove() {
}
function show_confirmOnEdit(message) {
    show_confirm_message({
        message: message,
        executeYes: function () {
            $("#ReceiveVoucher").hide();    //   Stop Here
            $("#ReceiveVoucherEdit").hide();
            jQuery('#ReceiveList').show();
        },
        executeNo: function () {

        }
    });
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


function show_confirmReceivedEditMode(message) {
    show_confirm_message({
        message: message,
        executeYes: function () {
            $("#ReceiveVoucher").hide();
            $("#ReceiveVoucherEdit").hide();
            $("#Received").hide();
            $("#ReceivedEditMode").hide();
            $("#ReceiveList").show();


            //jQuery('#ExpenseList').show();
            AllVoucher();

        },
        executeNo: function () {

        }
    });
}
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
function show_confirmCustomerInformationOnEdit(message) {
    debugger
    show_confirm_message({
        message: message,
        executeYes: function () {

            $("#AddNewCustomerOnEdit").hide();
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
function ddAddClass() {

    dd = document.getElementById('ddlClass');
    if (dd.selectedOptions[0].value == '-1')
        $('#AddTaxModel').modal();
}

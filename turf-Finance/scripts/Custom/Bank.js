
$(document).ready(function () {
    
    $(".select2").select2();
    $('.bank').select2({}).on('select2:open', function () {
        var a = $(this).data('select2');
        if (!$('.select2-link').length) {
            a.$results.parents('.select2-results')
                    .prepend('<div class="select2-link"><a style="font-weight:bold;"> + Add New</a></div>')
                    .on('click', function (b) {
                        $(".bank").select2('close');
                        $('#BankModal').modal();
                    });
        }
    });
    $('.Contacts').select2({}).on('select2:open', function () {
        var a = $(this).data('select2');
        if (!$('.select2-link').length) {
            a.$results.parents('.select2-results')
                    .prepend('<div class="select2-link"><a style="font-weight:bold;"> + Add New</a></div>')
                    .on('click', function (b) {
                        $(".Contacts").select2('close');
                        $('#AddCustomerModel').modal();
                    });
        }
    });




        let simplepicker = new SimplePicker(".datePickStart");
        let simplepicker2 = new SimplePicker(".datePickEnd");
        let simplepicker3 = new SimplePicker(".CashInVoucherDate");
        let simplepicker4 = new SimplePicker(".CashOutVoucherDate");
        let simplepicker5 = new SimplePicker(".BankTransferVoucherDate");

        
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
        $("#CashInVoucherDate").focus(function () {

            simplepicker3.open();
            simplepicker3.disableTimeSection();
            $("#CashInVoucherDate").attr('readonly', 'true');
        });
        simplepicker3.on('submit', (date) => {
            $("#CashInVoucherDate")[0].value = formatDate(date);
            $("#CashInVoucherDate").prop('readonly', false);
        });
        simplepicker3.on('close', function () {

            $("#CashInVoucherDate").removeAttr('readonly');
        });
        $("#CashOutVoucherDate").focus(function () {

            simplepicker4.open();
            simplepicker4.disableTimeSection();
            $("#CashOutVoucherDate").attr('readonly', 'true');
        });
        simplepicker4.on('submit', (date) => {
            $("#CashOutVoucherDate")[0].value = formatDate(date);
            $("#CashOutVoucherDate").prop('readonly', false);
        });
        simplepicker4.on('close', function () {

            $("#CashOutVoucherDate").removeAttr('readonly');
        });
        $("#BankTransferVoucherDate").focus(function () {

            simplepicker5.open();
            simplepicker5.disableTimeSection();
            $("#BankTransferVoucherDate").attr('readonly', 'true');
        });
        simplepicker5.on('submit', (date) => {
            $("#BankTransferVoucherDate")[0].value = formatDate(date);
            $("#BankTransferVoucherDate").prop('readonly', false);
        });
        simplepicker5.on('close', function () {

            $("#BankTransferVoucherDate").removeAttr('readonly');
        });



        $('#tblBankList tbody').on('click', 'tr td:eq(1)', function () {
            debugger
      
          // jQuery('#Tab_BankList').hide();
            $("#btnEditCashIn").show();
            $("#btnDeleteCashIn").show();
            $("#btnInActiveCashIn").show();
            $('.nav-tabs a[href="#tabs_CashIn"]').tab('show');
            
          
        });
        $('#tblBankList tbody').on('click', 'tr:eq(1) td:eq(1)', function () {
            $("#btnEditCashOut").show();
            $("#btnDeleteCashOut").show();
            $("#btnInActiveCashOut").show();
            $('.nav-tabs a[href="#tabs_CashOut"]').tab('show');
            
        });
        $('#tblBankList tbody').on('click', 'tr:eq(2) td:eq(1)', function () {
            $("#btnEditBankTransfer").show();
            $("#btnDeleteBankTransfer").show();
            $("#btnInActiveBankTransfer").show();
            $('.nav-tabs a[href="#tabs_BankTransfer"]').tab('show');
        });
        //ADnan
        $("#tblBankList").DataTable({

            columnDefs: [{
                targets: [1, 2, 3, 4, 5, 6, 7, 8],
                render: $.fn.dataTable.render.ellipsis(10)
            }],
            pageLength: '4',
            "filter": true, // this is for disable filter (search box)
            "order": [[3, "desc"]],
            "pagingType": "full_numbers",
        });
        $("#tab_CashIn").DataTable({
            "ordering": false,
            "paging": false,
            "bInfo": false,
            "searching": false
        })
        $("#tab_BankDetail").DataTable({
            "ordering": false,
            "paging": false,
            "bInfo": false,
            "searching": false
        })
     

        ////CashOut
        $("#tblCashOut").DataTable({
            "ordering": false,
            "paging": false,
            "bInfo": false,
            "searching": false
        })
        $("#tab_BankDetailCashOut").DataTable({
            "ordering": false,
            "paging": false,
            "bInfo": false,
            "searching": false
        })

 
        //BankTransfer
        $("#tblBankTransfer").DataTable({
            "ordering": false,
            "paging": false,
            "bInfo": false,
            "searching": false
        })
      
        AddRow_CashIn();
        AddRow_CashInOnClick();
        AddRow_BankDetail();
        AddRow_BankDetailOnClick();

        AddRow_CashOut();
        AddRow_CashOutOnClick();
        AddRow_BankDetailCashOut();
        AddRow_BankDetailCashOutOnClick();

        AddRow_BankTransfer();
        AddRow_BankTransferOnClick();

        AddRow_CashInOnEdit();
        AddRow_CashInEditOnClick();
        AddRow_BankDetailOnEdit();
        AddRow_BankDetailEditOnClick();

        
    })

function AddRow_CashIn() {
    debugger
    var newid = 1;
    $.each($("#tab_CashIn tr"), function () {
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
    $.each($("#tab_CashIn tbody tr:nth(0) td"), function () {
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
                'text': $('#tab_CashIn tr').length
            }).appendTo($(tr));
        }
    });


    // add the new row
    $(tr).appendTo($('#tab_CashIn'));

    $(tr).find("td button.row-remove").on("click", function () {
        $(this).closest("tr").remove();
    });

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
function AddRow_CashInOnClick() {
    $("#add_rowCashIn").on("click", function () {
        debugger
        // Dynamic Rows Code

        // Get max row id and set new id

        var newid = 1;

        $.each($("#tab_CashIn tr"), function () {
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
        $.each($("#tab_CashIn tbody tr:nth(0) td"), function () {
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
                    'text': $('#tab_CashIn tr').length
                }).appendTo($(tr));
            }
        });


        // add the new row
        $(tr).appendTo($('#tab_CashIn'));

        $(tr).find("td button.row-remove").on("click", function () {
            $(this).closest("tr").remove();
        });
    })
}
function AddRow_BankDetail() {
    debugger
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

}
function AddRow_BankDetailOnClick() {
    $("#add_rowBankDetail").on("click", function () {
        debugger
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

function AddRow_CashOut() {
    debugger
    var newid = 1;
    $.each($("#tblCashOut tr"), function () {
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
    $.each($("#tblCashOut tbody tr:nth(0) td"), function () {
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
                'text': $('#tblCashOut tr').length
            }).appendTo($(tr));
        }
    });


    // add the new row
    $(tr).appendTo($('#tblCashOut'));

    $(tr).find("td button.row-remove").on("click", function () {
        $(this).closest("tr").remove();
    });

}
function AddRow_CashOutOnClick() {
    $("#add_rowCashOut").on("click", function () {
        debugger
        // Dynamic Rows Code

        // Get max row id and set new id

        var newid = 1;

        $.each($("#tblCashOut tr"), function () {
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
        $.each($("#tblCashOut tbody tr:nth(0) td"), function () {
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
                    'text': $('#tblCashOut tr').length
                }).appendTo($(tr));
            }
        });


        // add the new row
        $(tr).appendTo($('#tblCashOut'));

        $(tr).find("td button.row-remove").on("click", function () {
            $(this).closest("tr").remove();
        });
    })
}
function AddRow_BankDetailCashOut() {
    debugger
    var newid = 1;
    $.each($("#tab_BankDetailCashOut tr"), function () {
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
    $.each($("#tab_BankDetailCashOut tbody tr:nth(0) td"), function () {
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
                'text': $('#tab_BankDetailCashOut tr').length
            }).appendTo($(tr));
        }
    });


    // add the new row
    $(tr).appendTo($('#tab_BankDetailCashOut'));

    $(tr).find("td button.row-remove").on("click", function () {
        $(this).closest("tr").remove();
    });

}
function AddRow_BankDetailCashOutOnClick() {
    $("#add_rowBankDetailCashOut").on("click", function () {
        debugger
        var newid = 1;

        $.each($("#tab_BankDetailCashOut tr"), function () {
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
        $.each($("#tab_BankDetailCashOut tbody tr:nth(0) td"), function () {
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
                    'text': $('#tab_BankDetailCashOut tr').length
                }).appendTo($(tr));
            }
        });


        // add the new row
        $(tr).appendTo($('#tab_BankDetailCashOut'));

        $(tr).find("td button.row-remove").on("click", function () {
            $(this).closest("tr").remove();
        });
    })
}

function AddRow_CashOutOnEdit() {
    debugger
    var newid = 1;
    $.each($("#tblCashoutOnEdit tr"), function () {
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
    $.each($("#tblCashoutOnEdit tbody tr:nth(0) td"), function () {
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
                'text': $('#tblCashoutOnEdit tr').length
            }).appendTo($(tr));
        }
    });


    // add the new row
    $(tr).appendTo($('#tblCashoutOnEdit'));

    $(tr).find("td button.row-remove").on("click", function () {
        $(this).closest("tr").remove();
    });

}
function AddRow_CashOutEditOnClick() {
    $("#add_rowCashOutOnEdit").on("click", function () {
        debugger
        // Dynamic Rows Code

        // Get max row id and set new id

        var newid = 1;

        $.each($("#tblCashoutOnEdit tr"), function () {
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
        $.each($("#tblCashoutOnEdit tbody tr:nth(0) td"), function () {
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
                    'text': $('#tblCashoutOnEdit tr').length
                }).appendTo($(tr));
            }
        });


        // add the new row
        $(tr).appendTo($('#tblCashoutOnEdit'));

        $(tr).find("td button.row-remove").on("click", function () {
            $(this).closest("tr").remove();
        });
    })
}
function AddRow_BankDetailCashOutOnEdit() {
        
    var newid = 1;
    $.each($("#tab_BankDetailCashOutOnEdit tr"), function () {
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
    $.each($("#tab_BankDetailCashOutOnEdit tbody tr:nth(0) td"), function () {
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
                'text': $('#tab_BankDetailCashOutOnEdit tr').length
            }).appendTo($(tr));
        }
    });


    // add the new row
    $(tr).appendTo($('#tab_BankDetailCashOutOnEdit'));

    $(tr).find("td button.row-remove").on("click", function () {
        $(this).closest("tr").remove();
    });

}
function AddRow_BankDetailCashOutEditOnClick() {
    $("#add_rowBankDetailCashOutOnEdit").on("click", function () {
          
        var newid = 1;

        $.each($("#tab_BankDetailCashOutOnEdit tr"), function () {
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
        $.each($("#tab_BankDetailCashOutOnEdit tbody tr:nth(0) td"), function () {
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
                    'text': $('#tab_BankDetailCashOutOnEdit tr').length
                }).appendTo($(tr));
            }
        });


        // add the new row
        $(tr).appendTo($('#tab_BankDetailCashOutOnEdit'));

        $(tr).find("td button.row-remove").on("click", function () {
            $(this).closest("tr").remove();
        });
    })
}

function AddRow_BankTransfer() {
         
    var newid = 1;
    $.each($("#tblBankTransfer tr"), function () {
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
    $.each($("#tblBankTransfer tbody tr:nth(0) td"), function () {
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
                'text': $('#tblBankTransfer tr').length
            }).appendTo($(tr));
        }
    });


    // add the new row
    $(tr).appendTo($('#tblBankTransfer'));

    $(tr).find("td button.row-remove").on("click", function () {
        $(this).closest("tr").remove();
    });

}
function AddRow_BankTransferOnClick() {
    $("#add_rowBankTransfer").on("click", function () {
        var newid = 1;
        $.each($("#tblBankTransfer tr"), function () {
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
        $.each($("#tblBankTransfer tbody tr:nth(0) td"), function () {
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
                    'text': $('#tblBankTransfer tr').length
                }).appendTo($(tr));
            }
        });


        // add the new row
        $(tr).appendTo($('#tblBankTransfer'));

        $(tr).find("td button.row-remove").on("click", function () {
            $(this).closest("tr").remove();
        });
    });
}
//BankTransfer OnEdit
//function show_confirmCashIn(message) {
//    show_confirm_message({
//        message: message,
//        executeYes: function () {
                   
//            $("#BankList").show();
//            $("#CashInOnEdit").hide();
//        },
//        executeNo: function () {

//        }
//    });
//}
//function show_confirmCashOut(message) {
//    show_confirm_message({
//        message: message,
//        executeYes: function () {

//            $("#BankList").show();
//            $("#CashOutOnEdit").hide();
//        },
//        executeNo: function () {

//        }
//    });
//}
//function show_confirmBankTransfer(message) {
//    show_confirm_message({
//        message: message,
//        executeYes: function () {

//            $("#BankList").show();
//            $("#BankTransferOnEdit").hide();
//        },
//        executeNo: function () {

//        }
//    });
//}

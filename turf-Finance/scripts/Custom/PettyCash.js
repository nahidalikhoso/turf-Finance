$(document).ready(function () {
    //$('#tab_PettyCash').dataTable({
    //    "preDrawCallback": function (settings) {
    //        $('#AddTax').select2({  width: "6em" });
    //        alert('DataTables has redrawn the table');
    //    }
    //});
   
    //$('#AddTax').select2().on('select2:open', function () {
   
    //    var a = $(this).data('select2');
    //    if (!$('.select2-link').length) {
    //        a.$results.parents('.select2-results')
    //                .prepend('<div class="select2-link"><a style="font-weight:bold;"> + Add New</a></div>')
    //                .on('click', function (b) {
    //                    ;
    //                    $("#AddTax").select2().hide();

    //                    $('#AddTaxModel').modal();

    //                });
    //    }
    //});
    $('.select').select2().on('select2:open', function () {
        

        var a = $(this).data('select2');
        if (!$('.select2-link').length) {
            a.$results.parents('.select2-results')
                    .prepend('<div class="select2-link"><a style="font-weight:bold;"> + Add New</a></div>')
                    .on('click', function (b) {
                        ;
                        $("#AddTax").select2().hide();

                        $('#AddTaxModel').modal();

                    });
        }
    });


    let simplepicker = new SimplePicker(".datePickStart");
    let simplepicker2 = new SimplePicker(".datePickEnd");
    let simplepicker3 = new SimplePicker(".voucherDate");
    
           $("#datePickStart").focus(function () {
            
               simplepicker.open('');
               simplepicker.disableTimeSection();
               $("#datePickStart").attr('readonly', 'true');
           });
           simplepicker.on('submit', (date) => {
               ;
               $("#datePickStart").prop('readonly', false);
               $("#datePickStart")[0].value = formatDate(date);
              
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
           $("#VoucherDate").focus(function () {
               

               simplepicker3.open();
               simplepicker3.disableTimeSection();
               $("#VoucherDate").attr('readonly','true')
           });
           simplepicker3.on('submit', (date) => {
               $("#VoucherDate")[0].value = formatDate(date);
               $("#VoucherDate").prop('readonly', false);

           });


           $('#demoGrid tbody').on('click', 'tr td:eq(0)', function () {
               jQuery('#PettyCashList').hide();
               jQuery('#PettyCashVoucher').hide();
               jQuery('#PettyCashVoucherOnEdit').show();
           });

           $("#PettyCashVoucher").hide();
           $("#PettyCashVoucherOnEdit").hide();
           $("#PettyCashList").show();
           $("#demoGrid").DataTable({
               columnDefs: [{
                   targets: 4,
                   render: $.fn.dataTable.render.ellipsis(5)
               }],
               pageLength: '4',
               "filter": true, // this is for disable filter (search box)
               "order": [[3, "desc"]],
               "pagingType": "full_numbers",
           });
           $("#tab_PettyCash").DataTable({
               "ordering": false,
               "paging": false,
               "bInfo": false,
               "searching": false
           });
           $("#tab_PettyCashOnEdit").DataTable({
               "ordering": false,
               "paging": false,
               "bInfo": false,
               "searching": false
           });
           AddRow_PettyCashVoucher();
           AddRow_PettyCash();
           AddRow_PettyCashVoucherOnEDit();
           AddRow_PettyCashOnEdit();
       });
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

function AddRow_PettyCashVoucher() {
    var newid = 1;
    $.each($("#tab_PettyCash tr"), function () {
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
    $.each($("#tab_PettyCash tbody tr:nth(0) td"), function () {
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
                //


                'text': $('#tab_PettyCash tr').length
            }).appendTo($(tr));
        }
    });


    // add the new row
    $(tr).appendTo($('#tab_PettyCash'));

    $(tr).find("td button.row-remove").on("click", function () {
        $(this).closest("tr").remove();
    });

}
function AddRow_PettyCash() {
    $("#add_row").on("click", function () {
       
        // Dynamic Rows Code

        // Get max row id and set new id

        var newid = 1;

        $.each($("#tab_PettyCash tr"), function () {
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
        $.each($("#tab_PettyCash tbody tr:nth(0) td"), function () {
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
                    'text': $('#tab_PettyCash tr').length
                }).appendTo($(tr));
            }
        });


        // add the new row
        $(tr).appendTo($('#tab_PettyCash'));

        $(tr).find("td button.row-remove").on("click", function () {
            $(this).closest("tr").remove();
        });
    })
}

function AddRow_PettyCashVoucherOnEDit() {

    var newid = 1;
    $.each($("#tab_PettyCashOnEdit tr"), function () {
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
    $.each($("#tab_PettyCashOnEdit tbody tr:nth(0) td"), function () {
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
                'text': $('#tab_PettyCashOnEdit tr').length
            }).appendTo($(tr));
        }
    });


    // add the new row
    $(tr).appendTo($('#tab_PettyCashOnEdit'));

    $(tr).find("td button.row-remove").on("click", function () {
        $(this).closest("tr").remove();
    });

}
function AddRow_PettyCashOnEdit() {
    $("#add_rowOnEdit").on("click", function () {
     
        // Dynamic Rows Code

        // Get max row id and set new id

        var newid = 1;

        $.each($("#tab_PettyCashOnEdit tr"), function () {
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
        $.each($("#tab_PettyCashOnEdit tbody tr:nth(0) td"), function () {
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
                    'text': $('#tab_PettyCashOnEdit tr').length
                }).appendTo($(tr));
            }
        });


        // add the new row
        $(tr).appendTo($('#tab_PettyCashOnEdit'));

        $(tr).find("td button.row-remove").on("click", function () {
            $(this).closest("tr").remove();
        });
    })
}
function openPettyCashVoucher() {
    $("#btnEdit").hide();
    $("#btnDelete").hide();
    jQuery('#PettyCashList').hide();
    jQuery('#PettyCashVoucher').show();

}

function show_confirm(message) {
    show_confirm_message({
        message: message,
        executeYes: function () {
            $("#PettyCashVoucher").hide();
            $("#ReceiveVoucherEdit").hide();
            jQuery('#PettyCashList').show();
        },
        executeNo: function () {

        }
    });
}
function show_confirmOnEdit(message) {
    show_confirm_message({
        message: message,
        executeYes: function () {
            $("#PettyCashVoucher").hide();    //   Stop Here
            $("#PettyCashVoucherOnEdit").hide();
            jQuery('#PettyCashList').show();
        },
        executeNo: function () {

        }
    });
}
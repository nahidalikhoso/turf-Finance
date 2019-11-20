
$(document).ready(function () {
    $(".select2").select2();

    let simplepicker = new SimplePicker(".datePickStart");
    let simplepicker2 = new SimplePicker(".datePickEnd");
    let simplepicker3 = new SimplePicker(".VoucherDate");
    let simplepicker4 = new SimplePicker(".AutoRevdate");
    let simplepicker5 = new SimplePicker(".VoucherDateOnEdit");

    
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
    $("#VoucherDate").focus(function () {

        simplepicker3.open();
        simplepicker3.disableTimeSection();
        $("#VoucherDate").attr('readonly', 'true');
    });
    simplepicker3.on('submit', (date) => {
        $("#VoucherDate")[0].value = formatDate(date);
        $("#VoucherDate").prop('readonly', false);
    });
    simplepicker3.on('close', function () {

        $("#VoucherDate").removeAttr('readonly');
    });
    $("#AutoRevdate").focus(function () {

        simplepicker4.open();
        simplepicker4.disableTimeSection();
        $("#AutoRevdate").attr('readonly', 'true');
    });
    simplepicker4.on('submit', (date) => {
        $("#AutoRevdate")[0].value = formatDate(date);
        $("#AutoRevdate").prop('readonly', false);
    });
    simplepicker4.on('close', function () {

        $("#AutoRevdate").removeAttr('readonly');
    });

    $("#VoucherDateOnEdit").focus(function () {

        simplepicker5.open();
        simplepicker5.disableTimeSection();
        $("#VoucherDateOnEdit").attr('readonly', 'true');
    });
    simplepicker5.on('submit', (date) => {
        $("#VoucherDateOnEdit")[0].value = formatDate(date);
        $("#VoucherDateOnEdit").prop('readonly', false);
    });
    simplepicker5.on('close', function () {

        $("#VoucherDateOnEdit").removeAttr('readonly');
    });

          $('#tblJournalEntryList tbody').on('click', 'tr td:eq(0)', function () {
              debugger
              jQuery('#JournalEntryList').hide();
              jQuery('#JournalEntryVoucher').hide();
              jQuery('#JournalEntryVoucherOnEdit').show();
          });
          $("#JournalEntryVoucher").hide();
          $("#JournalEntryVoucherOnEdit").hide();
          $("#tblJournalEntryList").DataTable({

              columnDefs: [{
                  targets: 2,
                  render: $.fn.dataTable.render.ellipsis(10)
              }],
              pageLength: '4',
              "filter": true, // this is for disable filter (search box)
              "order": [[3, "desc"]],
              "pagingType": "full_numbers",
          });
          $("#tblJournalEntry").DataTable({
              "ordering": false,
              "paging": false,
              "bInfo": false,
              "searching": false
          });
          $("#tblJournalEntryOnEdit").DataTable({
              "ordering": false,
              "paging": false,
              "bInfo": false,
              "searching": false
          });
            
          AddRow_JournalEntry();
          AddRow_JournalEntry_OnClick();

          AddRow_JournalEntryOnEdit();
          AddRow_JournalEntryEdit_OnClick();
      });
function AddRow_JournalEntry() {
          
    var newid = 1;
    $.each($("#tblJournalEntry tr"), function () {
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
    $.each($("#tblJournalEntry tbody tr:nth(0) td"), function () {
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
                'text': $('#tblJournalEntry tr').length
            }).appendTo($(tr));
        }
    });


    // add the new row
    $(tr).appendTo($('#tblJournalEntry'));

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
function AddRow_JournalEntry_OnClick() {
    $("#add_row").on("click", function () {
        debugger
        // Dynamic Rows Code

        // Get max row id and set new id

        var newid = 1;

        $.each($("#tblJournalEntry tr"), function () {
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
        $.each($("#tblJournalEntry tbody tr:nth(0) td"), function () {
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
                    'text': $('#tblJournalEntry tr').length
                }).appendTo($(tr));
            }
        });


        // add the new row
        $(tr).appendTo($('#tblJournalEntry'));

        $(tr).find("td button.row-remove").on("click", function () {
            $(this).closest("tr").remove();
        });
    })
}

function AddRow_JournalEntryOnEdit() {

    var newid = 1;
    $.each($("#tblJournalEntryOnEdit tr"), function () {
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
    $.each($("#tblJournalEntryOnEdit tbody tr:nth(0) td"), function () {
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
                'text': $('#tblJournalEntryOnEdit tr').length
            }).appendTo($(tr));
        }
    });


    // add the new row
    $(tr).appendTo($('#tblJournalEntryOnEdit'));

    $(tr).find("td button.row-remove").on("click", function () {
        $(this).closest("tr").remove();
    });

}
function AddRow_JournalEntryEdit_OnClick() {
    $("#add_rowOnEdit").on("click", function () {
        debugger
        // Dynamic Rows Code

        // Get max row id and set new id

        var newid = 1;

        $.each($("#tblJournalEntryOnEdit tr"), function () {
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
        $.each($("#tblJournalEntryOnEdit tbody tr:nth(0) td"), function () {
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
                    'text': $('#tblJournalEntryOnEdit tr').length
                }).appendTo($(tr));
            }
        });


        // add the new row
        $(tr).appendTo($('#tblJournalEntryOnEdit'));

        $(tr).find("td button.row-remove").on("click", function () {
            $(this).closest("tr").remove();
        });
    })
}
function OpenJournalEntryVoucher() {

    jQuery('#JournalEntryList').hide();
    jQuery('#JournalEntryVoucher').show();

}
function show_confirm(message) {
    show_confirm_message({
        message: message,
        executeYes: function () {
            $("#JournalEntryVoucher").hide();
            jQuery('#JournalEntryList').show();
        },
        executeNo: function () {

        }
    });
}
function show_confirmOnEdit(message) {
    show_confirm_message({
        message: message,
        executeYes: function () {
            $("#JournalEntryVoucherOnEdit").hide();
            //  jQuery('#JournalEntryList').hide();
            jQuery('#JournalEntryList').show();
        },
        executeNo: function () {

        }
    });
}


$(document).ready(function () {
    
  
    $('#overlay').fadeIn();
    $(".select2").select2();
    $('#ddSelectTax').select2({}).on('select2:open', function () {
        var a = $(this).data('select2');
        if (!$('.select2-link').length) {
            a.$results.parents('.select2-results')
                    .prepend('<div class="select2-link"><a style="font-weight:bold;"> + Add New</a></div>')
                    .on('click', function (b) {
                        $("#ddSelectTax").select2('close');
                        $('#AddTaxModel').modal();
                    });
        }
    });
           $('#tblTaxList tbody').on('click', 'tr td:eq(1)', function () {
               jQuery('#TaxList').hide();
               $("#btnEditTaxPayment").show();
               $("#btnDeleteTaxPayment").show();
               $("#btnInActiveTaxPayment").show();
               $("#TaxPaymentVoucher").show();
               // jQuery('#ExpenseVoucherEdit').show();
           });
           $('#tblTaxList tbody').on('click', 'tr:eq(3) td:eq(1)', function () {
               jQuery('#TaxList').hide();
               $("#btnEditTaxReceived").show();
               $("#btnDeleteTaxReceived").show();
               $("#btnInActiveTaxReceived").show();
               $("#TaxReceiveVoucher").show();
               // jQuery('#ExpenseVoucherEdit').show();
           });
           $('#demoGridForTaxList tbody').on('click', 'tr td:eq(1)', function () {
               $("#NewTaxRate").show();
               jQuery('#TaxList').hide();
               
           });

           $("#div_UnpaidTaxList").hide();
           $("#div_NotReceivedTaxList").hide();
           $("#TaxPaymentVoucher").hide();
           $("#TaxReceiveVoucher").hide();
           $("#NewTaxRate").hide();
           $("#btnTaxPayment").hide()
           $("#btnPay").hide();
           $("#btnReceive").hide();
           $("#tblTaxList").DataTable({
               columnDefs: [{
                   targets: [0, 1, 2, 3, 4, 5, 6, 7, 8],
                   render: $.fn.dataTable.render.ellipsis(7)
               }],
               pageLength: '4',
               "filter": true, // this is for disable filter (search box)
               "order": [[3, "desc"]],
               "pagingType": "full_numbers",
           });
           $("#tblUnpaidTaxList").DataTable({
               columnDefs: [{
                   targets: [1, 2, 3, 4, 5, 6, 7, 8, 9],
                   render: $.fn.dataTable.render.ellipsis(7)
               }],
               pageLength: '4',
               "filter": true, // this is for disable filter (search box)
               "order": [[3, "desc"]],
               "pagingType": "full_numbers",
           });
           $("#tblNotReceivedTaxList").DataTable({
               columnDefs: [{
                   targets: [1, 2, 3, 4, 5, 6, 7, 8, 9],
                   render: $.fn.dataTable.render.ellipsis(7)
               }],
               pageLength: '4',
               "filter": true, // this is for disable filter (search box)
               "order": [[3, "desc"]],
               "pagingType": "full_numbers",
           });

           $("#tblPayTaxList").DataTable({

               "ordering": false,
               "paging": false,
               "bInfo": false,
               "searching": false

           });
           $("#tblReceiveTaxList").DataTable({

               "ordering": false,
               "paging": false,
               "bInfo": false,
               "searching": false

           });
           $("#tblReceiveTaxListOnEdit").DataTable({

               "ordering": false,
               "paging": false,
               "bInfo": false,
               "searching": false

           });

           $("#tblPayTaxListOnEdit").DataTable({

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
           $("#tab_BankDetailOnEdit").DataTable({

               "ordering": false,
               "paging": false,
               "bInfo": false,
               "searching": false

           });
           $("#tblTaxRate").DataTable({

               "ordering": false,
               "paging": false,
               "bInfo": false,
               "searching": false

           });
           $("#tblTaxRateOnEdit").DataTable({

               "ordering": false,
               "paging": false,
               "bInfo": false,
               "searching": false

           });
            

           $("#TaxBalance").DataTable({

               fixedHeader: {
                   header: true,
                   headerOffset: 45,
               },
               // scrollX: true,
               pageLength: '4',
               // this is for disable filter (search box)

               "searching": false,
               "bInfo": false,
               "paging": true,
               //"scrollY": 100

           });
           $("#demoGridForTaxList").DataTable({
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

            
           AddRow_TaxComponent();
           AddRow_TaxComponentOnClick();

           AddRow_TaxComponentOnEdit();
           AddRow_TaxComponentEditOnClick();
           AddRow_Bank();
           AddRowBankDetail();

           AddRow_BankOnEdit();
           AddRowBankDetailOnEdit();
           ClickCheckBoxTaxList();

          

           var params = getUrlParameter('Param');
           if (params) {
               AddNewTax();
           }
           $('#overlay').fadeOut();
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
function AllTaxVoucher() {
    $("#div_TaxList").show();
    $("#div_UnpaidTaxList").hide();
    $("#btnReceive").hide();
    $("#btnPay").hide();
    $("#div_NotReceivedTaxList").hide();

}
function AllUnPaidTaxVoucher() {
    $("#div_TaxList").hide();
    $("#div_NotReceivedTaxList").hide();
    $("#TaxPaymentVoucher").hide();
    $("#TaxPaymentVoucherOnEdit").hide();
    $("#btnReceive").hide();
    $("#btnPay").show();
    $("#div_UnpaidTaxList").show();

}

function AllNotReceivedTaxVoucher() {
    $("#div_TaxList").hide();
    $("#div_UnpaidTaxList").hide();
    $("#TaxPaymentVoucher").hide();
    $("#TaxPaymentVoucherOnEdit").hide();
    $("#btnPay").hide();
    $("#btnReceive").show();
    $("#div_NotReceivedTaxList").show();
            

}

function AddRow_TaxComponent() {
    
    var newid = 1;
    $.each($("#tblTaxRate tr"), function () {
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
    $.each($("#tblTaxRate tbody tr:nth(0) td"), function () {
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
                'text': $('#tblTaxRate tr').length
            }).appendTo($(tr));
        }
    });


    // add the new row
    $(tr).appendTo($('#tblTaxRate'));

    $(tr).find("td button.row-remove").on("click", function () {
        $(this).closest("tr").remove();
    });

}
function AddRow_TaxComponentOnClick() {
    $("#add_rowTaxComponent").on("click", function () {
        
        // Dynamic Rows Code

        // Get max row id and set new id

        var newid = 1;

        $.each($("#tblTaxRate tr"), function () {
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
        $.each($("#tblTaxRate tbody tr:nth(0) td"), function () {
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
                    'text': $('#tblTaxRate tr').length
                }).appendTo($(tr));
            }
        });


        // add the new row
        $(tr).appendTo($('#tblTaxRate'));

        $(tr).find("td button.row-remove").on("click", function () {
            $(this).closest("tr").remove();
        });
    })
}

function AddRow_TaxComponentOnEdit() {
    
    var newid = 1;
    $.each($("#tblTaxRateOnEdit tr"), function () {
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
    $.each($("#tblTaxRateOnEdit tbody tr:nth(0) td"), function () {
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
                'text': $('#tblTaxRateOnEdit tr').length
            }).appendTo($(tr));
        }
    });


    // add the new row
    $(tr).appendTo($('#tblTaxRateOnEdit'));

    $(tr).find("td button.row-remove").on("click", function () {
        $(this).closest("tr").remove();
    });

}
function AddRow_TaxComponentEditOnClick() {
    $("#add_rowTaxComponentOnEdit").on("click", function () {
        
        // Dynamic Rows Code

        // Get max row id and set new id

        var newid = 1;

        $.each($("#tblTaxRateOnEdit tr"), function () {
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
        $.each($("#tblTaxRateOnEdit tbody tr:nth(0) td"), function () {
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
                    'text': $('#tblTaxRateOnEdit tr').length
                }).appendTo($(tr));
            }
        });


        // add the new row
        $(tr).appendTo($('#tblTaxRateOnEdit'));

        $(tr).find("td button.row-remove").on("click", function () {
            $(this).closest("tr").remove();
        });
    })
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

function AddRow_BankOnEdit() {
    
    var newid = 1;
    $.each($("#tab_BankDetailOnEdit tr"), function () {
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
    $.each($("#tab_BankDetailOnEdit tbody tr:nth(0) td"), function () {
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
                'text': $('#tab_BankDetailOnEdit tr').length
            }).appendTo($(tr));
        }
    });


    // add the new row
    $(tr).appendTo($('#tab_BankDetailOnEdit'));

    $(tr).find("td button.row-remove").on("click", function () {
        $(this).closest("tr").remove();
    });

}
function AddRowBankDetailOnEdit() {
    $("#add_rowBankDetailOnEdit").on("click", function () {
        
        // Dynamic Rows Code

        // Get max row id and set new id

        var newid = 1;

        $.each($("#tab_BankDetailOnEdit tr"), function () {
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
        $.each($("#tab_BankDetailOnEdit tbody tr:nth(0) td"), function () {
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
                    'text': $('#tab_BankDetailOnEdit tr').length
                }).appendTo($(tr));
            }
        });


        // add the new row
        $(tr).appendTo($('#tab_BankDetailOnEdit'));

        $(tr).find("td button.row-remove").on("click", function () {
            $(this).closest("tr").remove();
        });
    })
}
function PaymentPage() {
    $("#TaxList").hide();
    $("#btnEditTaxPayment").hide();
    $("#btnDeleteTaxPayment").hide();
    $("#btnInActiveTaxPayment").hide();
    $("#TaxPaymentVoucher").show();
            

}
function TaxPaymentPage() {
    $("#TaxList").hide();
    //$("#div_UnpaidTaxList").hide();
    //$("#TaxPaymentVoucher").hide();
    //$("#TaxPaymentVoucher").hide();

    //$("#div_NotReceivedTaxList"), hide();
    $("#TaxPaymentVoucher").show();


}
function ClickCheckBoxTaxList() {
    var $PaymentTax = $("#btnTaxPayment").hide(),
   $cbs = $('input[type="checkbox"]').click(function () {
       $PaymentTax.toggle($cbs.is(":checked"));

   });
}

function ReceivePage() {
    $("#TaxList").hide();
    $("#btnEditTaxReceived").hide();
    $("#btnDeleteTaxReceived").hide();
    $("#btnInActiveTaxReceived").hide();
    $("#TaxReceiveVoucher").show();


}
function AddNewTax() {
    $("#TaxList").hide();
    $("#NewTaxRate").show();
}
function show_confirmTaxPayment(message) {
    show_confirm_message({
        message: message,
        executeYes: function () {
            $("#TaxPaymentVoucher").hide();
            $("#TaxReceiveVoucher").hide();
            $("#TaxReceiveVoucherOnEdit").hide();
            $("#btnPay").hide();
            $("#btnReceive").hide();
            $("#TaxList").show();

            $("#div_TaxList").show();
            $("#div_UnpaidTaxList").hide();
                    
                    
                   
        },
        executeNo: function () {

        }
    });
}

function show_confirmTaxPaymentOnEdit(message) {
    show_confirm_message({
        message: message,
        executeYes: function () {
            $("#TaxPaymentVoucher").hide();
            $("#TaxPaymentVoucherOnEdit").hide();
            $("#TaxReceiveVoucherOnEdit").hide();
            $("#TaxReceiveVoucher").hide();
            $("#btnPay").hide();
            $("#btnReceive").hide();
            $("#TaxList").show();

            $("#div_TaxList").show();
            $("#div_UnpaidTaxList").hide();



        },
        executeNo: function () {

        }
    });
}

      
function show_confirmTaxReceive(message) {
    show_confirm_message({
        message: message,
        executeYes: function () {
            $("#TaxReceiveVoucher").hide();
            $("#TaxReceiveVoucherOnEdit").hide();
            $("#btnPay").hide();
            $("#btnReceive").hide();
            $("#TaxList").show();

            $("#div_TaxList").show();
            $("#div_NotReceivedTaxList").hide();
        },
        executeNo: function () {

        }
    });
}

function show_confirmTaxReceiveOnEdit(message) {
    show_confirm_message({
        message: message,
        executeYes: function () {
            $("#TaxReceiveVoucher").hide();
            $("#TaxReceiveVoucherOnEdit").hide();
            $("#btnPay").hide();
            $("#btnReceive").hide();
            $("#TaxList").show();

            $("#div_TaxList").show();
            $("#div_NotReceivedTaxList").hide();
        },
        executeNo: function () {

        }
    });
}

function show_confirmTaxRate(message) {
    show_confirm_message({
        message: message,
        executeYes: function () {
            $("#TaxList").show();
            $("#NewTaxRate").hide();
            // $("#div_NotReceivedTaxList").hide();
        },
        executeNo: function () {

        }
    });
}
function show_confirmTaxRateOnEdit(message) {
    show_confirm_message({
        message: message,
        executeYes: function () {
            $("#TaxList").show();
            $("#NewTaxRateOnEdit").hide();
            // $("#div_NotReceivedTaxList").hide();
        },
        executeNo: function () {

        }
    });
}

   
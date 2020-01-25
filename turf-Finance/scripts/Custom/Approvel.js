$(document).ready(function () {
    $('#overlay').fadeIn();
 
    $("#tblExpenseList tbody tr").find("td:eq(2),td:eq(4)").attr('title', 'click me to view detail');
    $("#tblExpenseList tbody tr").find("td:eq(2),td:eq(4)").css({ cursor: 'pointer', color: 'blue', 'text-decoration': 'underline' });
    $("#tblJournalEntryList tbody tr").find("td:eq(0)").attr('title', 'click me to view detail');
    $("#tblJournalEntryList tbody tr").find("td:eq(0)").css({ cursor: 'pointer', color: 'blue', 'text-decoration': 'underline' });
    $("#tblPaymentList tbody tr").find("td:eq(0)").attr('title', 'click me to view detail');
    $("#tblPaymentList tbody tr").find("td:eq(0)").css({ cursor: 'pointer', color: 'blue', 'text-decoration': 'underline' });
    $('.selectVendorOrCustomer').select2({}).on('select2:open', function () {
        var a = $(this).data('select2');
        if (!$('.select2-link').length) {
            a.$results.parents('.select2-results')
                    .prepend('<div class="select2-link"><a style="font-weight:bold;"> + Add New</a></div>')
                    .on('click', function (b) {
                        $(".selectVendorOrCustomer").select2('close');
                        $('#AddVenderModel').modal();
                    });
        }
    });
    $("#tblExpenseList").DataTable({
        dom: 'Bfrtip',
        buttons: [
            {
                extend: 'excel', text: 'Export',
                exportOptions: {
                    columns: ':visible',
                    orthogonal: {
                        display: ':null'
                    }
                }
            },
             {
                 extend: 'pdf', text: 'Print',
                 exportOptions: { orthogonal: "pdf" }
             },
        ],
        columnDefs: [{
            targets: [1, 2, 3, 4, 5, 6, 7, 8],
            render: $.fn.dataTable.render.ellipsis(7)
        }],
        pageLength: '4',
        "filter": true, // this is for disable filter (search box)
        "order": [[3, "desc"]],
        "pagingType": "full_numbers",
    });
    $("#tblJournalEntryList").DataTable({
        dom: 'Bfrtip',
        buttons: [
            {
                extend: 'excel', text: 'Export',
                exportOptions: {
                    columns: ':visible',
                    orthogonal: {
                        display: ':null'
                    }
                }
            },
             {
                 extend: 'pdf', text: 'Print',
                 exportOptions: { orthogonal: "pdf" }
             },
        ],
        columnDefs: [{
            targets:  6,
            render: $.fn.dataTable.render.ellipsis(7)
        }],
        pageLength: '4',
        "filter": true, // this is for disable filter (search box)
        "order": [[3, "desc"]],
        "pagingType": "full_numbers",
    });
    
    $("#tblPaymentList").DataTable({
        dom: 'Bfrtip',
        buttons: [
            {
                extend: 'excel', text: 'Export',
                exportOptions: {
                    columns: ':visible',
                    orthogonal: {
                        display: ':null'
                    }
                }
            },
             {
                 extend: 'pdf', text: 'Print',
                 exportOptions: { orthogonal: "pdf" }
             },
        ],
      
        pageLength: '4',
        "filter": true, // this is for disable filter (search box)
        "order": [[3, "desc"]],
        "pagingType": "full_numbers",
    });
    $("#tblAppRejList").DataTable({
        dom: 'Bfrtip',
        buttons: [
            {
                extend: 'excel', text: 'Export',
                exportOptions: {
                    columns: ':visible',
                    orthogonal: {
                        display: ':null'
                    }
                }
            },
             {
                 extend: 'pdf', text: 'Print',
                 exportOptions: { orthogonal: "pdf" }
             },
        ],
        pageLength: '4',
        "filter": true, // this is for disable filter (search box)
        "order": [[3, "desc"]],
        "pagingType": "full_numbers",
    });
    $('#tblExpenseList tbody tr').find("td:eq(2),td:eq(4)").on('click', function () {
        window.open("Expense.aspx?param=checkForApprove", '_blank');
    });
    $('#tblJournalEntryList tbody tr').find("td:eq(0)").on('click', function () {
        window.open("JournalEntry.aspx?param=checkForApprove", '_blank');
    });
    $('#tblPaymentList tbody tr').find("td:eq(0)").on('click', function () {
        
        var Type = $(this).closest('tr').find('td').last().text();
        if (Type=='Bank Transfer') {
            window.open("Bank.aspx?param=checkForApprove&From=" + Type + "", '_blank');
        }
        else if (Type == 'Cashout') {
            window.open("Bank.aspx?param=checkForApprove&From=" + Type + "", '_blank');
        }
        else if (Type == 'Expense') {
            window.open("Expense.aspx?param=checkForApprove&From=" + Type + "", '_blank');
        }
        else
            window.open("Tax.aspx?param=checkForApprove&From=" + Type + "", '_blank');
        
    });
    BindAllCheckBox();
    ClickCheckBox();
    OpenExpenseList();
    $('#overlay').fadeOut();
});
function ClickCheckBox() {
   
    var Approve = $("#btnApprove").hide()
    var Rejected = $("#btnRejected").hide()  ,
   cbs = $('input[type="checkbox"]').click(function () {
       
       Approve.toggle(cbs.is(":checked"));
       Rejected.toggle(cbs.is(":checked"));

   });
}
function BindAllCheckBox() {
    $('#chkAllPayment').on('click', function () {
        if ($('#chkAllPayment').prop('checked') == true) {
            $('#tblPaymentList tbody tr ').find('input[type="checkbox"]').prop('checked', true);
        }
        else
            $('#tblPaymentList tbody tr ').find('input[type="checkbox"]').prop('checked', false);
    });
    $('#chkAllJournalEntry').on('click', function () {
        if ($('#chkAllJournalEntry').prop('checked') == true) {
            $('#tblJournalEntryList tbody tr ').find('input[type="checkbox"]').prop('checked', true);
        }
        else
            $('#tblJournalEntryList tbody tr ').find('input[type="checkbox"]').prop('checked', false);
    });
    $('#chkAllExpense').on('click', function () {
        if ($('#chkAllExpense').prop('checked') == true) {
            $('#tblExpenseList tbody tr ').find('input[type="checkbox"]').prop('checked', true);
        }
        else
            $('#tblExpenseList tbody tr ').find('input[type="checkbox"]').prop('checked', false);
    });
}
function OpenExpenseList() {
    ResetCheckBox();
    $("#div_JournalEntry").hide();
    $("#div_Payment").hide();
    $("#div_ApprovedOrRejected").hide();
    $("#div_BankList").hide();
    $("#div_ddlvendor").show();
    $("#div_ExpenseList").show();
}
function OpenJournalEntryList() {
    ResetCheckBox();
    $("#div_Payment").hide();
    $("#div_JournalEntry").show();
    $("#div_BankList").hide();
    $("#div_ddlvendor").hide();
    $("#div_ApprovedOrRejected").hide();
    $("#div_ExpenseList").hide();
}

function OpenPaymentList() {
    ResetCheckBox();
    $("#div_Payment").show();
    $("#div_JournalEntry").hide();
    $("#div_BankList").hide();
    $("#div_ddlvendor").hide();
    $("#div_ApprovedOrRejected").hide();
    $("#div_ExpenseList").hide();
}
function OpenAppRejList() {
    ResetCheckBox();
    $("#div_Payment").hide();
    $("#div_JournalEntry").hide();
    $("#div_BankList").hide();
    $("#div_ddlvendor").hide();
    $("#div_ApprovedOrRejected").show();
    $("#div_ExpenseList").hide();
}
function ResetCheckBox() {
    $('input[type="checkbox"]').prop("checked", false);
    $('#btnApprove').hide();
    $('#btnRejected').hide();
}
function show_confirm_Approved(message) {
    swal({
        title: 'Are you sure want to Approve ?',
        content: {
            element: "input",
            attributes: {
                placeholder: "Type your Remarks",
                type: "text",
            },
        },
        
        icon: "warning",
        buttons: ["No", "Yes"],
    }).then((ifyes) => {
        if (ifyes != null) {
            swal("Successfully Approved", {
                icon: "success",
                timer: 2000,
                showConfirmButton: false
            });
        }
    });

}
function show_confirm_Reject(message) {
    swal({
        title: 'Are you sure want to Reject ?',
        content: {
            element: "input",
            attributes: {
                placeholder: "Type your Remarks",
                type: "text",
            },
        },
        icon: "warning",
        buttons: ["No", "Yes"],
    }).then((ifyes) => {
        if (ifyes != null) {
            swal("Successfully Rejected", {
                icon: "success",
                timer: 2000,
                showConfirmButton: false
                
            });
        }
           
       
        
    });

}
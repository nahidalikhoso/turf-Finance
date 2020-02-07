var ClassColumn = true;
var ProjectColumn = true;



$(document).ready(function () {

    $("#btnSave").on('click', function () {
        ValidateAccount();
    })
    $('#tbl_PettyCashList tbody tr').on('click', ' td:eq(0)', function () {
        jQuery('#PettyCashList').hide();
        $("#btnEdit").show();
        $("#btnDelete").show();
        jQuery('#PettyCashVoucher').show();
        DisablePettyCashVoucher();
    });
    $("#PettyCashVoucher").hide();
    $("#PettyCashVoucherOnEdit").hide();
    $("#PettyCashList").show();
    if (ClassColumn == false)
        $('#tbl_PettyCashList thead tr ').find('th[class="headingClass sorting"]').remove()
    if (ProjectColumn == false)
        $('#tbl_PettyCashList thead tr ').find('th[class="headingProject sorting"]').remove()
    AddRow_PettyCashOnClick();
    setTimeout(function () {
        getPreviusThirtyDays().then(function (reult) {
            return GetPettyCashData();
        });
    },500)
   
});
function SavePettyCash() {
    return new Promise(function (resolve, reject) {
        
        if (hdnPettyCashID.value == '') {
            return SubmitPettyCash('http://localhost:20037/api/PettyCash/AddPettyCash').then(function (result) {
                resolve('done');
            });

        }
        else {
            return SubmitPettyCash('http://localhost:20037/api/PettyCash/UpdatePettyCash').then(function (result) {
                resolve('done');
            });
        }
    })
   
        
}
function SubmitPettyCash(api_url) {
    return new Promise(function (resolve, reject) {
        var Data = JSON.parse(localStorage.getItem('UserData'))
        obj = {};
        obj.ID = hdnPettyCashID.value == "" ? 0 : hdnPettyCashID.value;
        obj.VoucherNo = txtVoucherNo.value;
        obj.VoucherDate = VoucherDate.value;
        obj.AccountTotalAmount = lblTotalAmount.innerText;
        if (hdnPettyCashID.value == '')
            obj.CreatedBy = Data[0].UserID;
        else
            obj.UpdatedBy = Data[0].UserID;
        obj.StatusID = 1
        obj1 = new Array();
        $('#tab_PettyCash tbody tr').each(function () {
            obj1.push({
                AccountID: $(this).find('.selectAccount').val(),
                Amount: $(this).find('.txtAmount').val(),
                Memo: $(this).find('.memo').val(),
                ClassID: $(this).find('.selectClass').val(),
                ProjectID: $(this).find('.selectProject').val()
            });
        });
        //var Parameter = '?petty=' + JSON.stringify(obj) + '&pettyDeatil' + JSON.stringify(obj1);
        $.ajax({
            url: api_url,
            type: "GET",
            data: 'petty=' + JSON.stringify(obj) + '&pettyDetail=' + JSON.stringify(obj1),
            contentType: "application/json; charset=utf-8",
            success: function (msg) {
                if (msg == 'success') {
                    resolve('done');
                    showMessage('Data Saved Successfully', 'success', '');
                }
                else
                    showMessage(msg, 'success', 'ti-na');
                reject('done')
            }
        });
    });

}
function GetPettyCashData() {
    return new Promise(function (resolve, reject) {
        var parameter = "?StartDate=" + datePickStart.value + "&EndDate=" + datePickEnd.value;
        $.ajax({
            url: "http://localhost:20037/api/PettyCash/GetPettyCashData" + parameter,
            type: "GET",
            success: function (ApiResponse) {
                $('#tbl_PettyCashList').DataTable().clear().destroy();
                if (ApiResponse.includes('[{')) {
                    $('#overlay').fadeIn();
                    $('#tbl_PettyCashList tbody').html('');
                    var response = JSON.parse(ApiResponse);
                    for (var i = 0; i < response.length; i++) {
                        var tr = $('<tr></tr>');
                        $(tr).attr('pettycash-id', response[i].ID);
                        $(tr).append('<td onclick="check(this)">' + response[i].VoucherNo + '</td><td >' + DateFormat(response[i].VoucherDate) + '</td><td>' + response[i].Accounts + '</td><td>' + response[i].AccountTotalAmount + '</td><td>' + response[i].Memos + '</td><td>' + response[i].Classes + '</td><td>' + response[i].Project + '</td>');
                        $('#tbl_PettyCashList tbody').append(tr)
                    }
                    InitializePettyCashDataTable();
                    resolve('done');
                    $('#overlay').fadeOut();
                }
                else {
                    InitializePettyCashDataTable();
                    resolve('done');
                    $('#overlay').fadeOut();

                }

            }
        });
    });

}
function check(name) {

    $("#btnEdit").show();
    $("#PettyCashVoucher").show();

    $("#PettyCashList").hide();
    $('#tab_PettyCash tbody tr').remove();
    PettyCashID = name.closest('tr').getAttribute('pettycash-id');
    hdnPettyCashID.value = PettyCashID;

    GetPettyCashByID(PettyCashID)
}
function GetPettyCashByID(PettyCashID) {
    
    $.ajax({
        url: "http://localhost:20037/api/PettyCash/GetPettyCashByID",
        type: "GET",
        data: "PettyCashID=" + PettyCashID,
        contentType: "application/json; charset=utf-8",
        success: function (ApiResponse) {
            if (ApiResponse) {
                var Data = $.parseJSON(ApiResponse);
                //ddlAccountType.va = ApiResponse[0].AccountTypeID;
                txtVoucherNo.value = Data[0].VoucherNo;
                VoucherDate.value = DateFormat(Data[0].VoucherDate);
                $('#lblTotalAmount').text(Data[0].AccountTotalAmount);

                //for (z = 0; z < Data.length; z++) {
                //    AddFirstRow_PettyCashVoucher().then(function (result) {
                //        console.log(result);
                //        return FillDetailOnEdit(z, Data);
                //    }).then(function (result) {
                //        console.log(result);
                //    });

                //}

                (function loop(i) {
                    if (i < Data.length) new Promise((resolve, reject) => {
                        return AddFirstRow_PettyCashVoucher();
                    }).then(function (result) {
                        return FillDetailOnEdit(i, Data);
                    }).then(loop.bind(null, i + 1));
                })(0);

                DisablePettyCashVoucher();
            }
        }
    });
}
function FillDetailOnEdit(i, Data) {
    
    return new Promise(function (resolve, reject) {
        
        var index = $('.selectAccount').length - 1;
        var selectAccount = $('.selectAccount')[index];
        var selectClass = $('.selectClass')[index];
        var selectProject = $('.selectProject')[index];
        $(selectAccount).val(Data[index].AccountID).attr('selected', 'selected');
        $('.txtAmount').val(Data[index].Amount);
        $('.memo').val(Data[index].Memo);
        $(selectClass).val(Data[index].ClassID).attr('selected', 'selected');
        $(selectProject).val(Data[index].ProjectID).attr('selected', 'selected');
        resolve('done');

    })
}

function GetUniqueKey() {

    var table = 'PettyCash';
    var Column = 'ID';
    var prefix = 'Voucher No';
    var Parameter = '?tableName=' + table + '&columnName=' + Column + '&prefix=' + prefix;
    $.ajax({
        url: 'http://localhost:20037/api/Common/GetNewKey' + Parameter,
        type: "GET",
        success: function (ApiResponse) {


            txtVoucherNo.value = ApiResponse;

        }
    })
}
function GetAccount() {
    return new Promise(function (resolve, reject) {

        $.ajax({
            url: 'http://localhost:20037/api/Expense/GetAccount',
            type: "GET",
            success: function (ApiResponse) {
                if (ApiResponse) {
                    
                    var response = JSON.parse(ApiResponse);
                    var selectAccount = $('.selectAccount')[$('.selectAccount').length - 1];

                    $(selectAccount).find('option').remove();
                    $(selectAccount).append($('<option></option>').val("0").text("Select"));
                    var Account = "";
                    for (var i = 0; i < response.length ; i++) {
                        Account += '<option value="' + response[i].ID + '">' + response[i].Code + ' | ' + response[i].Name + '</option>';
                    }
                    $(selectAccount).append(Account);
                    resolve('done');
                }
            }
        });
    });
   
}
function GetClass() {
    return new Promise(function (resolve, reject) {
        $.ajax({
            url: 'http://localhost:20037/api/Expense/GetClass',
            type: "GET",
            success: function (ApiResponse) {
                if (ApiResponse) {
                    var response = JSON.parse(ApiResponse);
                    var selectClass = $('.selectClass')[$('.selectClass').length - 1];
                    $(selectClass).find('option').remove();
                    //$('#ddlSubClass').find('option').remove();
                    $(selectClass).append($('<option></option>').val("0").text("Select"));
                    //$('#ddlSubClass').append($('<option></option>').val("0").text("Select Sub Account"));
                    var Class = "";
                    for (var i = 0; i < response.length ; i++) {
                        Class += '<option value="' + response[i].ID + '">' + response[i].Name + '</option>';
                    }
                    $(selectClass).append(Class);
                    resolve('done');
                    //$('#ddlSubClass').append(Class);
                }
            }

        });
    });
   

}
function fillAllClassDropdown() {

    $.ajax({
        url: 'http://localhost:20037/api/Expense/GetClass',
        type: "GET",
        success: function (ApiResponse) {
            if (ApiResponse) {
                //Get Classes from db
                var response = JSON.parse(ApiResponse);

                //Select All Class Drop DOwns
                var dropDowns = $('.selectClass');

                //Start loop for each drop down
                for (i = 0; i < dropDowns.length; i++) {

                    //select drop down by index i
                    var selectClass = $(dropDowns)[i];

                    //select currently selected value
                    var selectedValue = $(selectClass).val();

                    //remove drop down options
                    $(selectClass).find('option').remove();
                    $(selectClass).append('<option value="0">Select</option>');
                    var Class = "";

                    //refill dropdown
                    for (var j = 0; j < response.length; j++) {
                        Class += '<option value="' + response[j].ID + '">' + response[j].Name + '</option>'
                    }
                    $(selectClass).append(Class);

                    //set Selected value again
                    $(selectClass).val(selectedValue);
                }
            }
        }

    });
}
function fillAllAccountDropdown() {

    $.ajax({
        url: 'http://localhost:20037/api/Expense/GetAccount',
        type: "GET",
        success: function (ApiResponse) {
            if (ApiResponse) {
                //Get Classes from db
                var response = JSON.parse(ApiResponse);

                //Select All Class Drop DOwns
                var dropDowns = $('.selectAccount');

                //Start loop for each drop down
                for (i = 0; i < dropDowns.length; i++) {

                    //select drop down by index i
                    var selectAccount = $(dropDowns)[i];

                    //select currently selected value
                    var selectedValue = $(selectAccount).val();

                    //remove drop down options
                    $(selectAccount).find('option').remove();
                    $(selectAccount).append('<option value="0">Select</option>');
                    var Account = "";

                    //refill dropdown
                    for (var j = 0; j < response.length; j++) {
                        Account += '<option value="' + response[j].ID + '">' + response[j].Code + ' | ' + response[j].Name + '</option>'
                    }
                    $(selectAccount).append(Account);

                    //set Selected value again
                    $(selectAccount).val(selectedValue);
                }
            }
        }

    });
}
function AddClass() {
    var Data = JSON.parse(localStorage.getItem('UserData'));
    obj = {};
    obj.Name = txtClassName.value;
    if ($('#chkSubClass').is(':checked')) {
        obj.IsSubClass = true;
        obj.ParentClassID = ddlSubClass.selectedOptions[0].value;
    }
    else {
        obj.IsSubClass = false;
        obj.ParentClassID = 0;
    }
    obj.CreatedBy = Data[0].UserID;
    $.ajax({
        url: 'http://localhost:20037/api/PettyCash/AddClass',
        type: "POST",
        data: JSON.stringify(obj),
        contentType: "application/json; charset=utf-8",
        success: function (msg) {
            if (msg == "success") {
                //GetClass();
                fillAllClassDropdown();
                ResetClassModal();
            }
            else
                showMessage(msg, 'warning', '');
        }
    });
}
function AddAccount() {

    var Data = JSON.parse(localStorage.getItem('UserData'))
    obj = {};
    obj.Code = txtAccountCode.value;
    obj.Name = txtAccountName.value;
    obj.CreatedBy = Data[0].UserID;
    obj.StatusID = 1
    $.ajax({
        url: 'http://localhost:20037/api/Accounting/AddAccount',
        type: "POST",
        data: JSON.stringify(obj),
        contentType: "application/json; charset=utf-8",
        success: function (msg) {
            if (msg == "success") {
                //GetAccount();
                fillAllAccountDropdown();
                ResetAccountModal();
            }
            else
                showMessage(msg, 'warning', '');
        }
    })



}
function ResetClassModal() {
    txtClassName.value = "";
    $('#chkSubClass').prop('checked', false);
    ddlSubClass.selectedIndex = 0;
    $('#select2-ddlSubClass-container').text('Select Sub Account');
}
function ResetAccountModal() {
    txtAccountCode.value = '';
    txtAccountName.value = '';
}
function getPreviusThirtyDays() {
    return new Promise(function (resolve, reject) {
        $('#datePickStart').val(GetLastDate());
        resolve('done');
    });
}
function InitializePettyCashDataTable() {
    $("#tbl_PettyCashList").DataTable().destroy();
    $("#tbl_PettyCashList tbody tr").find("td:eq(0)").attr('title', 'click me to view detail');
    $("#tbl_PettyCashList tbody tr").find("td:eq(0)").css({ cursor: 'pointer', color: 'blue', 'text-decoration': 'underline' });
    $("#tbl_PettyCashList").DataTable({
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
                  extend: 'print',

                  title: 'Print The Report From Bank List ',
                  message: 'print It and Use it ',
                  customize: function (win) {
                      $(win.document.body).append('<h1> This Report was Generated by Nahid Ali</h1>'); //after the table
                      $(win.document.body).prepend('<h3>Company Name : Turf.</h3>'); //before the table
                      $(win.document.body)
                          .css('font-size', '10pt')
                      $(win.document.body).find('table')
                          .addClass('compact')
                          .css('font-size', 'inherit');
                  }
              }

        ],
        columnDefs: [{
            targets: [2,4,5,6 ],
            render: $.fn.dataTable.render.ellipsis(12)
        }],
        pageLength: '4',
        "filter": true, // this is for disable filter (search box)
        "order": [[3, "desc"]],
        "pagingType": "full_numbers",
    });

}
function OnchangeSubClass() {
    if ($('#chkSubClass').is(':checked')) {
        $("#ddlSubClass").select2({ width: '100%' });
        $('#ddlSubClass').show();
    }
    else {
        if ($("#ddlSubClass").data('select2'))
            $("#ddlSubClass").select2('destroy');
        $('#ddlSubClass').hide();
    }
}
function AddFirstRow_PettyCashVoucher() {
    return new Promise(function (resolve, reject) {
        AddRow_PettyCash().then(function (result) {
            return GetAccount();
        }).then(function (result) {
            return GetClass();
        }).then(function (result) {
            
            resolve();
        });
    });
}
function AddRow_PettyCashOnClick() {
    $("#add_row").on("click", function () {
        if ($("#btnEdit")[0].style.display == "") {
            return
        }
        else {
            AddRow_PettyCash().then(function (result) {
                return GetAccount();
            }).then(function (result) {
                return GetClass();
            });
        }
    });

}
function AddRow_PettyCash() {
    
    return new Promise(function (resolve, reject) {
        if (ProjectColumn == false)
            $('#tab_PettyCash thead tr ').find('th[class="headingProject"]').remove();
        if (ClassColumn == false) {
            $('#tab_PettyCash thead tr ').find('th[class="headingClass"]').remove();
            $('#tab_PettyCash thead tr ').find('th:eq(0),th:eq(3)').css({ 'cssText': 'width:180px' });
        }
        var id = $("#tab_PettyCash tbody tr").length;
        row = '<tr id="row' + id + '" data-id="' + id + '">';
        row += '<td data-name="sel"><div id="Acount"><select   class="form-control selectAccount"></select></div></td>';
        row += '<td data-name="td_Amount"><input type="number" name="txtAmount1" id="txtAmount' + id + '"  class="form-control txtAmount" onkeyup="sumAmountAccount()" /></td>';
        row += '<td data-name="td_Memo"><input type="text"  id="txtMemo' + id + '" class="form-control memo" /></td>';
        if (ClassColumn)
            row += '<td data-name="sel"><div id="div_Class"><select  class="form-control selectClass "></select></div></td>';
        if (ProjectColumn)
            row += '<td data-name="sel"><div id="td_project"><select  class="form-control selectProject"><option value="0">Select</option><option value="1">Project1</option><option value="2">Project2</option><option value="3">Project3</option></select></div></td>';
        row += '<td data-name="del"><button type="button" class="btn btn-danger  row-remove" id="btnRemoveRow' + id + '" onclick="removePettyCashRow(this);"  ><span aria-hidden="true">×</span></button></td>';
        row += '</tr>';
        $('#tab_PettyCash tbody').append(row);
        //GetAccount();
        //GetClass();
        $('.selectClass').select2({}).on('select2:open', function () {
            var a = $(this).data('select2');
            if (!$('.select2-link').length) {
                a.$results.parents('.select2-results')
                        .prepend('<div class="select2-link"><a style="font-weight:bold;"> + Add New</a></div>')
                        .on('click', function (b) {
                            //$('#tab_PettyCash tbody').find('selectClass').select2('close');
                            $(".selectClass").select2('close');
                            OnchangeSubClass();
                            $('#AddClass').modal();
                        });
            }
        });
        $('.selectAccount').select2({}).on('select2:open', function () {
            var a = $(this).data('select2');
            if (!$('.select2-link').length) {
                a.$results.parents('.select2-results')
                        .prepend('<div class="select2-link"><a style="font-weight:bold;"> + Add New</a></div>')
                        .on('click', function (b) {

                            $(".selectAccount").select2('close');
                            $('#AddAccount').modal();
                        });
            }
        });
        $('.selectProject').select2({}).on('select2:open', function () {
            var a = $(this).data('select2');
            if (!$('.select2-link').length) {
                a.$results.parents('.select2-results')
                        .prepend('<div class="select2-link"><a style="font-weight:bold;"> + Add New</a></div>')
                        .on('click', function (b) {
                            $(".selectProject").select2('close');
                            $('#AddProject').modal();
                        });
            }
        });
        $('select').select2({ width: '100%' });

        $("#tab_PettyCash tbody tr").find("td button.row-remove").on("click", function () {
            if ($("#tab_PettyCash tbody tr").length == 1) {
                $('#div_totalAmount').hide();
            }
            $(this).closest("tr").remove();
            //sumAmountAccount();
        });
        resolve('done');
    });
}
function openPettyCashVoucher() {
    AddFirstRow_PettyCashVoucher();
    GetUniqueKey();
    $("#btnEdit").hide();
    $("#btnDelete").hide();
    jQuery('#PettyCashList').hide();
    jQuery('#PettyCashVoucher').show();
    $('#txtVoucherNo').attr('disabled', true);
    $('#txtVoucherNo').css({ 'cssText': 'background: #dddddd !important' });


}
function removePettyCashRow(btn) {

    tr = $(btn).closest('tr');
    if ($("#tab_PettyCash tbody tr").length == 1) {
        $("#div_totalAmount").hide();
    }
    tr.remove();
    sumAmountAccount();

}
function show_confirm_LeaveWithoutSavingPettyCash(message) {
    swal({
        title: 'Are you sure want to leave WithOut Saving?',
        //text: message,
        icon: "warning",
        buttons: ["No", "Yes"],
    }).then((ifyes) => {
        if (ifyes) {
            $('#tab_PettyCash tbody tr').remove();
            $('#lblTotalAmount').text('0.00');
            $('#PettyCashList').show();
            $('#PettyCashVoucher').hide();

        }
    });

}
function sumAmountAccount() {
    var sum = 0;
    $('.txtAmount').each(function () {
        if ($(this).val() != '')
            sum = parseFloat(sum) + parseFloat($(this).val());
    });

    $('#lblTotalAmount').html(sum.toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 }));
}
function ValidateAccount() {
    RowID = tr = $("#tab_PettyCash tbody tr")[0].getAttribute('id');
    rowNo = RowID.replace('row', '');
    isValid = false;
    $(".selectAccount").each(function () {
        if ($(this).val() != 0) {
            isValid = true;
        }
        else {
            showMessage('please select account', 'danger', '');
            isValid = false;
            $("#ddlAccount" + rowNo)[0].focus();
            return false;
        }
        rowNo++;
    });
    if (isValid)
        ValidateAmount()
    //ValidateMemo();
}
function ValidateAmount() {
    RowID = tr = $("#tab_PettyCash tbody tr")[0].getAttribute('id');
    rowNo = RowID.replace('row', '');
    isValid = false;
    $(".txtAmount").each(function () {
        if ($(this).val().match(RegexForInteger)) {
            isValid = true;
        }
        else {
            showMessage('please Enter Amount', 'danger', '');
            isValid = false;
            $("#txtAmount" + rowNo)[0].focus();
            return false;
        }
        rowNo++;
    });
    if (isValid)
        ValidateMemo();


}
function ValidateMemo() {

    RowID = tr = $("#tab_PettyCash tbody tr")[0].getAttribute('id');
    rowNo = RowID.replace('row', '');
    isValid = false;
    $(".memo").each(function () {
        if ($(this).val() != "") {
            isValid = true;
        }
        else {
            showMessage('please Enter Memo', 'danger', '');
            isValid = false;
            $("#txtMemo" + rowNo)[0].focus();
            return false;
        }
        rowNo++;
    });
    if (isValid) {
        show_confirmSavePettyCash();
    }
}
function show_confirmSavePettyCash(message) {
    swal({
        title: "Do You Wish To",
        icon: "warning",
        buttons: {
            cancel: "Cancel",
            SaveAndPrint: "Save And Print",
            SaveOnly: "Save Only",
        },
    }).then((ifyes) => {
        if (ifyes) {
            
           SavePettyCash().then(function (result) {
                return GetPettyCashData().then(function (result) {
                    $('#tab_PettyCash tbody tr').remove();
                    $('#lblTotalAmount').text('0.00');
                    jQuery('#PettyCashList').show();
                    jQuery('#PettyCashVoucher').hide();
                })
            });
           
            
        }
    });
}
function DisablePettyCashVoucher() {

    $('#PettyCashVoucher').find('input, textarea, button, select').attr('disabled', true);
    $("#PettyCashVoucher").find('select').select2('destroy');
    $('#PettyCashVoucher').find('input, textarea, button,select').css({ 'cssText': 'background: #dddddd !important' });
    $('#PettyCashVoucher').find(('.datepicker:input[type="text"]')).prop('disabled', true);
    $('.gj-icon').hide();
    $('a').attr('disabled', true);
    $("#btnEdit").attr('disabled', false);
    $("#btnEdit").css({ 'cssText': 'background:' })
}
function EnablePettyCashVoucher() {

    $('#PettyCashVoucher').find('input, textarea, button, select').attr('disabled', false);
    $("#PettyCashVoucher").find('select').select2();
    $('#PettyCashVoucher').find('input, textarea, button,select').css({ 'cssText': 'background:' });
    $('#PettyCashVoucher').find(('.datepicker:input[type="text"]')).prop('disabled', false);
    $('.gj-icon').hide();
    $('a').attr('disabled', false);
    $("#btnEdit").hide();
    $("#txtVoucherNo").attr('disabled', true);
    $("#txtVoucherNo").css({ 'cssText': 'background: #dddddd !important' });
    $('#PettyCashVoucher').find(('#VoucherDate:input[type="text"]')).prop('disabled', true);
    $('#PettyCashVoucher').find(('#VoucherDate:input[type="text"]')).css({ 'cssText': 'background: #dddddd !important' });
    var iconclass = $("#PettyCashVoucher").find('input[type="text"][id="VoucherDate"]').next().addClass('abc')[0].getAttribute('class');
    $("." + iconclass.replace('gj-icon ', '')).hide();
}
function show_confirm_RemoveAllRowsFromPettyCash(message) {
    if ($('#tab_PettyCash tbody tr').length != 0) {
        swal({
            title: 'Are you sure want to remove all lines?',
            //text: message,
            icon: "warning",
            buttons: ["No", "Yes"],
        }).then((ifyes) => {
            if (ifyes) {
                $('#tab_PettyCash tbody tr').remove();
                $('#div_totalAmount').hide();
                //$("#lblTotal").text('0.00');
            }
        });
    }
}
function show_confirm_AddAccountDetail(message) {

    swal({

        title: 'You Go to The Detail Then Lose The Data Of Voucher?',
        //text: message,
        icon: "warning",
        buttons: ["No", "Yes"],
    }).then((ifyes) => {
        if (ifyes) {
            window.location.href = "http://localhost:42985/Accounting.aspx?Param=AddNewAccount";
        }
    });

}

function EndDate_OnChange() {
    
    var EndDate = $("#datePickEnd").val();
    var StartDate = $("#datePickStart").val();
    if (Date.parse(EndDate) >= Date.parse(StartDate)) {

    }
    else {
        showMessage('sory you can not select End Date preveius to the start Date   ', 'danger');
        $("#datePickEnd").val(StartDate);
    }
}
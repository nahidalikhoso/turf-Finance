$(document).ready(function () {
    //$('#overlay').fadeIn();
    setTimeout(function () {
        getPreviusThirtyDays(GatAccountData);
    },0)
    $("#tblAccountList tbody tr").find("td:eq(1)").attr('title', 'click me to view detail');
    $("#tblAccountList tbody tr").find("td:eq(1)").css({ cursor: 'pointer', color: 'blue', 'text-decoration': 'underline' });
    GetAccountType();
    $('#ddlAccountType').on('change', function () {
        changeAccountType($(this).val());
    });
   
    //$(".dropdown-toggle").dropdown();
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
    
    $("#ddlParentAccount").prop("disabled", true);
    $("#chkSubAccount").click(function () {
        if ($(this).is(":checked")) {
            $("#ddlParentAccount").select2();
            $("#ddlParentAccount").attr("disabled", false);
            $("#ddlParentAccount").css({ 'cssText': 'background:' });
        } else {
            $("#ddlParentAccount").select2('destroy');
            $("#ddlParentAccount").attr("disabled", true);
            $("#ddlParentAccount").css({ 'cssText': 'background: #dddddd !important' });
        }
    });
   
    $("#tblReconcile").DataTable({
        columnDefs: [{
            targets: [0, 1, 2, 3, 4, 5, 6],
            render: $.fn.dataTable.render.ellipsis(7)
        }],
        pageLength: '4',
        "filter": true, // this is for disable filter (search box)
        "order": [[3, "desc"]],
        "searching": true,
        "pagingType": "full_numbers",
    });
    $("#tblReconcileList").DataTable({
        pageLength: '4',
        "filter": true, // this is for disable filter (search box)
        "order": [[3, "desc"]],
        "searching": true,
        "pagingType": "full_numbers",
    });
    $("#AddNewAccount").hide();
    $("#ReconcileAccount").hide();
    $("#Reconcile").hide();
    var params = getUrlParameter('Param');
    if (params) {
        OpenAccountPage();
    }
});

function changeAccountType(ParentID)
    {
        $('#chkSubAccount').prop('checked', false);
        $("#ddlParentAccount").select2();
        $("#ddlParentAccount").select2('destroy')
        $("#ddlParentAccount").attr("disabled", true);
        $("#ddlParentAccount").css({ 'cssText': 'background: #dddddd !important' });
        $("#ddlParentAccount ").find('option').remove()
        GetSubAccount(ParentID);
    }
function GatAccountData() {
    var parameter = "?StartDate=" + datePickStart.value + "&EndDate=" + datePickEnd.value;
    $.ajax({
        url: "http://localhost:20037/api/Accounting/GetAccountData" + parameter,
        type: "GET",
        contentType: "application/json; charset=utf-8",
        success: function (ApiResponse) {
            if (ApiResponse) {
                $('#overlay').fadeIn();
                    $('#tblAccountList').DataTable().clear().destroy();
                if (ApiResponse.includes("[{")) {
                    $('#tblAccountList tbody').html('');
                    var response = JSON.parse(ApiResponse);
                    for (var i = 0; i < response.length; i++) {
                        var tr = $('<tr></tr>');
                        $(tr).attr('account-id', response[i].ID);
                        $(tr).append('<td>' + response[i].AccountType + '</td><td onclick="check(this)">' + response[i].Name + '</td><td>' + response[i].Code + '</td><td>' + response[i].Description + '</td><td>' + response[i].Balance + '</td>');
                        $('#tblAccountList tbody').append(tr)
                    }
                    InitializeAccountDataTable();
                    $('#overlay').fadeOut();
                }
                else {
                    InitializeAccountDataTable();
                    $('#overlay').fadeOut();
                }
               
               
            }
            
        },
    })
  
}
function getPreviusThirtyDays(callback) {
  
        //do stuff
        
        $('#datePickStart').val(GetLastDate());
        callback()
     
}
function check(name)
{
    $("#btnInActive").show();
    $("#btnEdit").show();
    $("#AddNewAccount").show();

    $("#ChartsOfAccount").hide();
    AccountID = name.closest('tr').getAttribute('account-id');
    hdnUserID.value = AccountID;

    GetAccountByID(AccountID)
}
function SaveAccount() {
    
    if (hdnUserID.value=='') 
        SubmitAccount("http://localhost:20037/api/Accounting/AddAccount");
    else
        SubmitAccount("http://localhost:20037/api/Accounting/UpdateAccount");
    
}
function SubmitAccount(api_url) {
   var Data = JSON.parse( localStorage.getItem('UserData'));
    var  obj  ={};
    obj.ID = hdnUserID.value;
    obj.AccountTypeID = ddlAccountType.selectedOptions[0].value;
    obj.Code = txtAccountCode.value;
    obj.Name = txtAccountName.value;
    obj.Description = txtAccountDesc.value;
    if ($('#chkSubAccount').is(':checked')) {
        obj.IsSubAccount = true;
        if ($('#ddlParentAccount').find('option').length !=0){
            if ($('#ddlParentAccount').val() != 0){
                obj.ParentAccountID = ddlParentAccount.selectedOptions[0].value;
            }
        }
    }
       
    else
        obj.IsSubAccount = false;
   
    if (txtBalance.value != '')
        obj.Balance = txtBalance.value;
    else
        obj.Balance = 0;
    
   
    obj.AsOf = AsOFDate.value;
    if (hdnUserID.value!='') 
        obj.UpdatedBy = Data[0].UserID;
    else
        obj.CreatedBy = Data[0].UserID;
   
    obj.StatusID = 1;
    $.ajax({
        url: api_url,
        type:"POST",
        data: JSON.stringify(obj),
        contentType: "application/json; charset=utf-8",
        success: function (msg) {
            
            if (msg=="success") {
                window.location.href = "Accounting.aspx";
            }
            else {
                showMessage(msg, 'warning', 'ti-na');
                return false;
            }
               
          
        },
        error: function (msg) {
            
            showMessage(msg, 'warning', '');
            return false;
        }
    })

}
function GetAccountType() {
    
    $.ajax({
        url: "http://localhost:20037/api/Accounting/GetAccountType",
        success: function (ApiResponse) {
            
            if (ApiResponse) {
                var AccountType = JSON.parse(ApiResponse);
                $('#ddlAccountType').append('<option value="0">Select</option>');
                var Groups = AccountType.filter(x => x.HasParent == false);
                for (var i = 0; i < Groups.length; i++) {
                    
                    $('#ddlAccountType').append('<optgroup label="' + Groups[i].Type + '" value="' + Groups[i].Value + '" class="form-control"></optgroup>');
                    var Types = AccountType.filter(x => x.HasParent == true && x.ParentID == Groups[i].Value);
                    for (var j = 0; j < Types.length; j++) {
                        $('optgroup[label="' + Groups[i].Type + '"]').append('<option value="' + Types[j].Value + '">' + Types[j].Type + '</option>')
                    }
                }
            }
        }
    });
}

function GetSubAccount(ParentID) {
    
    $.ajax({
        url: "http://localhost:20037/api/Accounting/GetSubAccount",
        type:"GET",
        data: 'ParentID=' + ParentID,
        success: function (ApiResponse) {
            
            if (ApiResponse.includes('[{')) {
                $("#ddlParentAccount").select2();
                $("#ddlParentAccount").select2('destroy')
                $('#chkSubAccount').attr('disabled', false);

                $("#ddlParentAccount").attr("disabled", true);
                $("#ddlParentAccount").css({ 'cssText': 'background: #dddddd !important' });
                var SubAccount = $.parseJSON(ApiResponse);
                $("#ddlParentAccount").append($("<option></option>").val("0").text("Select"));
                $.each(SubAccount, function (index, value) {
                    $('#ddlParentAccount').append($('<option/>', {
                        value: value.ID,
                        text: value.Name
                    }));
                });
            }
            else {
                $('#chkSubAccount').attr('disabled', true);
            }
        }
    })
}
function EnableAccountVoucher() {
    $('#AddNewAccount').find('input, textarea, button, select').attr('disabled', false);
    $("#AddNewAccount").find('select').select2();
    $('#AddNewAccount').find('input, textarea, button,select').css({ 'cssText': 'background:' });
    $('#AddNewAccount').find(('.datepicker:input[type="text"]')).prop('disabled', false);
    $('.gj-icon').show();
    $("#btnEdit").hide();
    if ($('#chkSubAccount').is(":checked")) {
        $("#ddlParentAccount").select2();
        $("#ddlParentAccount").attr("disabled", false);
        $("#ddlParentAccount").css({ 'cssText': 'background:' });
    } else {
        $("#ddlParentAccount").select2('destroy');
        $("#ddlParentAccount").attr("disabled", true);
        $("#ddlParentAccount").css({ 'cssText': 'background: #dddddd !important' });
    }
    if ($('#txtBalance').val() != '') {
        $("#AsOFDate").attr("disabled", false);
        $("#AsOFDate").css({ 'cssText': 'background: ' });
        $('.gj-icon').show();
        $('#AsOFDate' ).datepicker({
            uiLibrary: 'bootstrap3'
        }).val(GetTodayDate());
    }
    else {
        $("#AsOFDate").attr("disabled", true);
        $("#AsOFDate").css({ 'cssText': 'background:#dddddd !important ' });

        $('.gj-icon').hide();
    }

}
function DisableAccountVoucher() {
    
    if ($("#AddNewAccount").find('select').data('select2'))
        $("#AddNewAccount").find('select').select2('destroy');
    $('#AddNewAccount').find('input, textarea, button, select').attr('disabled', true);
    $('#AddNewAccount').find('input, textarea, button,select').css({ 'cssText': 'background:#dddddd !important' });
    $('#AddNewAccount').find(('.datepicker:input[type="text"]')).prop('disabled', true);
    $('.gj-icon').hide();
    $("#btnEdit").show();
    $('#btnEdit').attr('disabled', false);
    $('#btnEdit').css({ 'cssText': 'background:' });

    if ($('#txtBalance').val() != ''  && $('#txtBalance')[0].getAttribute('disabled')!='disabled') {
        $("#AsOFDate").attr("disabled", false);
        $("#AsOFDate").css({ 'cssText': 'background: ' });
        $('.gj-icon').show();
    }
    else {
        $("#AsOFDate").attr("disabled", true);
        $("#AsOFDate").css({ 'cssText': 'background:#dddddd !important ' });
        if ( $('#txtBalance')[0].getAttribute('disabled')!='disabled') {
            $("#AsOFDate").attr("disabled", false);
            $("#AsOFDate").css({ 'cssText': 'background: ' });
            $('.gj-icon').show();
        }
        else {
            $("#AsOFDate").attr("disabled", true);
            $("#AsOFDate").css({ 'cssText': 'background:#dddddd !important ' });
            
            $('.gj-icon').hide();
        }
    }


}
function AccountBalance() {
    if ($('#txtBalance').val() != '') {
        $("#AsOFDate").attr("disabled", false);
        $("#AsOFDate").css({ 'cssText': 'background: ' });
        $('.gj-icon').show();
        $('#AsOFDate').datepicker({
            uiLibrary: 'bootstrap3'
        }).val(GetTodayDate());
    }
    else {
        $("#AsOFDate").attr("disabled", true);
        $("#AsOFDate").css({ 'cssText': 'background:#dddddd !important ' });
        $('.gj-icon').hide();
        $('#AsOFDate').val('');
    }
}
function OpenAccountPage() {
    $("#btnInActive").hide();
    $("#btnEdit").hide();
    $("#ddlParentAccount").select2('destroy');
    $("#ddlParentAccount").attr("disabled", true);
    $("#ddlParentAccount").css({ 'cssText': 'background: #dddddd !important' });
    $("#AsOFDate").attr("disabled", true);
    $("#AsOFDate").css({ 'cssText': 'background: #dddddd !important' });
    $('.gj-icon').hide();
    AccountBalance();
    $("#AddNewAccount").show();
    $("#ChartsOfAccount").hide();
}
function show_confirmAccount(message) {
    show_confirm_message({
        message: message,
        executeYes: function () {
            $("#AddNewAccount").hide();
            //   Stop Here
            $("#ChartsOfAccount").show();

        },
        executeNo: function () {

        }
    });
}
function OpenReconcile() {
    $("#ReconcileAccount").show();
    $("#ChartsOfAccount").hide();

}
function StartReconcile() {
    $("#Reconcile").show();
    $("#ReconcileAccount").hide();
    $("#ChartsOfAccount").hide();

}
function ShowReconcileList() {
    $("#Reconcile").hide();
    $("#ChartsOfAccount").show();
}
function show_confirmReconcileAccount(message) {
    show_confirm_message({
        message: message,
        executeYes: function () {
            //$("#AddNewAccount").hide();
            //$("#AccountOnEdit").hide();    //   Stop Here
            //$("#ChartsOfAccount").show();

            $("#ReconcileAccount").hide();
            $("#ChartsOfAccount").show();

        },
        executeNo: function () {

        }
    });
}
function show_confirm_LeaveWithoutSavingAccount(message) {
    swal({
        title: 'Are you sure want to leave WithOut Saving?',
        //text: message,
        icon: "warning",
        buttons: ["No", "Yes"],
    }).then((ifyes) => {
        if (ifyes) {
            $("#ReconcileAccount").hide();
            $('#AddNewAccount').hide();
            $("#ChartsOfAccount").show();// Allow next click to succeed
            ResetAccountForm();

        }
    });

}
function show_confirmSave(message) {
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
            SaveAccount();
        }
    });
}
function ValidateAccount() {
    if ($('#ddlAccountType').val() != 0) {

    }
    else {
        showMessage('select Account', 'warning', '');
        $('#ddlAccountType')[0].focus();
        return false;
    }
    if ($('#txtAccountCode').val().match(AlphaNumericRegex)) {

    }
    else {
        showMessage('Enter Unique Account Code', 'warning', '');
        $('#txtAccountCode')[0].focus();
        return false;
    }
    if ($('#txtAccountName').val().match(AlphaNumericRegex)) {

    }
    else {
        showMessage('Enter Unique Account Name', 'warning', '');
        $('#txtAccountName')[0].focus();
        return false;
    }
    if ($('#chkSubAccount').is(":checked")) {
        if ($('#ddlParentAccount').val() != 0) {
            show_confirmSave();
        }
        else {
            showMessage('select Parent Account', 'warning', '');
            $('#ddlParentAccount')[0].focus();
            return false;
        }
    }
    else {
        show_confirmSave();
    }

}
function ResetAccountForm() {

    ddlAccountType.selectedIndex = 0;
    $('#select2-ddlAccountType-container').text('Select');
    txtAccountCode.value = "";
    txtAccountName.value = "";
    txtAccountDesc.value = "";
    ddlParentAccount.selectedIndex = 0
    $('#select2-ddlParentAccount-container').text('Select');
    txtBalance.value = "";
    $('#chkSubAccount').prop('checked', false);
    $("#AddNewAccount").find('select').select2({ width: '100%' });
}

function InitializeAccountDataTable() {
    $("#tblAccountList").DataTable().destroy();
    $("#tblAccountList tbody tr").find("td:eq(1)").attr('title', 'click me to view detail');
    $("#tblAccountList tbody tr").find("td:eq(1)").css({ cursor: 'pointer', color: 'blue', 'text-decoration': 'underline' });
    $("#tblAccountList").DataTable({
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
        //columnDefs: [{
        //    targets: [6, ],
        //    render: $.fn.dataTable.render.ellipsis(10)
        //}],
        pageLength: '4',
        "filter": true, // this is for disable filter (search box)
        "order": [[3, "desc"]],
        "pagingType": "full_numbers",
    });
}
function GetAccountByID(AccountID) {
    $.ajax({
        url: "http://localhost:20037/api/Accounting/GetAccountByID",
        type: "GET",
        data: "AccountID=" + AccountID,
        contentType: "application/json; charset=utf-8",
        success: function (ApiResponse) {
            if (ApiResponse) {
                
                var Data = $.parseJSON(ApiResponse);
                if (Data[0].AccountTypeID != null) {
                    $("#ddlAccountType").val(Data[0].AccountTypeID).attr('selected', 'selected');
                    changeAccountType(Data[0].AccountTypeID, function () {
                        if (Data[0].IsSubAccount) {
                            $('#chkSubAccount').prop('checked', true);
                            $("#ddlParentAccount").val(Data[0].ParentAccountID).attr('selected', 'selected');
                        }
                    });
                }
                    
                //ddlAccountType.va = ApiResponse[0].AccountTypeID;
                txtAccountCode.value = Data[0].Code;
                txtAccountName.value = Data[0].Name;
                txtAccountDesc.value = Data[0].Description;
               
                
                //chkSubAccount.value = ApiResponse[0].IsSubAccount;
                //ddlParentAccount.selectedIndex = ApiResponse[0].ParentAccountID;
                txtBalance.value = Data[0].Balance;
                AsOFDate.value = DateFormat(Data[0].AsOf);
                DisableAccountVoucher();
                
               
                //$.when($.ajax(changeAccountType(Data[0].AccountTypeID))).then(function () {
                //    if (Data[0].IsSubAccount) {
                //                $('#chkSubAccount').prop('checked', true);
                //                $("#ddlParentAccount").val(Data[0].ParentAccountID).attr('selected', 'selected');
                //            }

                //});

                //changeAccountType(Data[0].AccountTypeID);
                //setTimeout(function () {
                //    if (Data[0].IsSubAccount) {
                //        $('#chkSubAccount').prop('checked', true);
                //        $("#ddlParentAccount").val(Data[0].ParentAccountID).attr('selected', 'selected');
                //    }
                //}, 200);
                
                $('#btnSaveUser').text('Update');

            }
        }

    })
}



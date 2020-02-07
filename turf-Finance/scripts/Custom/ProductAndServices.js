var path = 'D:\FinanceImages';

var GetDropdownID = "";
$(document).ready(function () {
    $(function () {
        $('#myTab a:last').tab('show');
    });
    $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
        var target = $(e.target).attr("href");
        if ((target == '#Inventory')) {
        } else {
            if ($('#ddlType')[0].getAttribute('disabled') != 'disabled')
                return;
            else {
                Reset_InventoryForm();
                Reset_Non_InventoryForm();
                ResetServiceForm();
                EnableInventory();
                EnableNon_Inventory();
                EnableServices();
                $('#ddlType').attr('disabled', false);
                $("#ddlType").css({ 'cssText': 'background : ' });
                $('#ddlType').select2()[0].selectedIndex = 0;
                $('#ddlType').select2().val("0");
                $('#ddlType').select2({ width: '100%' });
                $('#Add_NonInventory').hide();
                $('#Add_Services').hide();
                $('#Add_Inventory').hide();
                $("#btnDeleteInventory").hide();
                $("#btnDeleteNonInventory").hide();
                $("#btnDeleteService").hide();
            }
        }
    });
    GetProductAndServiceType();
    GetProductAndServices();
    var params = getUrlParameter('param');
    if (params) {
        $('.nav-tabs a[href="#Inventory"]').tab('show');
        setTimeout(function () { $('#ddlType').val(1).change(); }, 0);
    }
    $(".select2").select2();
    $('.Category ').select2({}).on('select2:open', function () {
        var a = $(this).data('select2');
        if (!$('.select2-link').length) {
            a.$results.parents('.select2-results')
                    .prepend('<div class="select2-link"><a style="font-weight:bold;"> + Add New</a></div>')
                    .on('click', function (b) {
                        $(".Category ").select2('close');
                        $('#AddCategory ').modal();
                    });
        }
    });
    $('.Account').select2({}).on('select2:open', function () {
        var a = $(this).data('select2');
        if (!$('.select2-link').length) {
            a.$results.parents('.select2-results')
                    .prepend('<div class="select2-link"><a style="font-weight:bold;"> + Add New</a></div>')
                    .on('click', function (b) {
                        $(".Account").select2('close');
                      var ID=  document.activeElement.firstElementChild.id.replace('select2-', '');
                        
                        
                        GetDropdownID = ID.replace('-container', '');
                        $('#AddAccount').modal();
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
    $('#tblProductAndServices tbody tr').on('click', ' td:eq(2)', function () {
        // 
        //var tabID= $("#my_tab").find('li[class="active"]').children()[0].getAttribute('href');
        type = $(this)[0].textContent;
        if (type == "Inventory")
            DisableInventory();
        else if (type == "Non Inventory")
            DisableNon_Inventory();
        else
            DisableServices();
        $('.nav-tabs a[href="#Inventory"]').tab('show');
        $("#btnEditInventory").show();
        $("#btnDeleteInventory").show();
        var ID = 0;
        $("#ddlType option").each(function () {
            var Type = $(this).text();
            if (type == Type) {
                var Val = $(this).val();
                ID = Val;
            }
        })
        //$("#ddlType option").ea
        $('#ddlType').val(ID).change();
    });
    $('#Add_NonInventory').hide();
    $('#Add_Services').hide();
    $('#Add_Inventory').hide();
    $('#chkStatus_Inventory').prop('checked', true);
    $('#chkStatus_NonInventory').prop('checked', true);
    $('#chkStatus_Services').prop('checked', true);
  
    
});
function AddAccount() {
    
    var Data = JSON.parse(localStorage.getItem('UserData'))
    obj = {};
   // var id = document.activeElement.id;
    var Type = ddlType.selectedOptions[0].text
    if (GetDropdownID == 'ddlIncomeAccount_' + Type + '')
        obj.AccountTypeID = 18;
    else if (GetDropdownID == 'ddlAssetAccount_' + Type + '')
        obj.AccountTypeID = 2;
    else if (GetDropdownID == 'ddlExpenseAccount_' + Type + '')
        obj.AccountTypeID = 9;
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
                
                ResetAccountModal();
                ddlAssetAccount = "ddlAssetAccount_Inventory";
                ddlIncomeAccount = "ddlIncomeAccount_Inventory";
                ddlExpenseAccount = "ddlExpenseAccount_NonInventory";
                GetAccount(ddlAssetAccount, TypeID = 1);
                GetAccount(ddlIncomeAccount, TypeID = 18);
                GetAccount(ddlExpenseAccount, TypeID = 9);
                showMessage('Account Saved successfully!', 'success', 'ti-check');
            }
            else
                showMessage(msg, 'warning', '');
        }
    })



}
function ResetAccountModal() {
    txtAccountCode.value = '';
    txtAccountName.value = '';
}
function GetProductAndServices() {
    return new Promise(function (resolve, reject) {
        $.ajax({
            url: "http://localhost:20037/api/ProductAndServices/GetProductAndServices",
            type: 'GET',
            success: function (ApiResponse) {

                if (ApiResponse) {
                    $('#overlay').fadeIn();
                    $('#tblProductAndServices').DataTable().clear().destroy();
                    if (ApiResponse.includes('[{')) {
                        var response = JSON.parse(ApiResponse)
                        $('#tblProductAndServices tbody').html('');
                        for (i = 0; i < response.length; i++) {
                            var tr = $('<tr></tr>');
                            $(tr).attr('P_SID', response[i].ID);
                            $(tr).attr('Type', response[i].Type);
                            $(tr).append('<td onclick="check(this)">' + response[i].SKU + '</td><td>' + response[i].Name + '</td><td>' + response[i].Type + '</td><td>' + response[i].Status + '</td><td>' + response[i].Description + '</td><td>' + response[i].Category + '</td><td>' + response[i].InitialQtyOnHand + '</td><td>' + response[i].InventoryAccount + '</td><td>' + response[i].IncomeAccount + '</td><td>' + response[i].ExpenseAccount + '</td><td>' + response[i].Unit + '</td><td>' + response[i].SalesPrice + '</td><td>' + response[i].Cost + '</td><td>' + response[i].PreferredSupplier + '</td>')
                            $('#tblProductAndServices tbody').append(tr)
                        }
                        Initialize_P_S_DataTable();
                        $('#overlay').fadeOut();
                        resolve('done');
                    }
                    else
                        Initialize_P_S_DataTable();
                    $('#overlay').fadeOut();
                    resolve('done');
                }
            }
        })
    });
   
}
function check(name) {
    
    PSID = name.closest('tr').getAttribute('p_sid');
    type = name.closest('tr').getAttribute('Type');
    if (type == "Inventory"){
        $('.nav-tabs a[href="#Inventory"]').tab('show');
        DisableInventory();
    }
        
    else if (type == "NonInventory") {
        $('.nav-tabs a[href="#Inventory"]').tab('show');
        DisableNon_Inventory();
    }

    else {
        $('.nav-tabs a[href="#Inventory"]').tab('show');
        DisableServices();
    }
    $("#btnEditInventory").show();
    $("#btnDeleteInventory").show();
    var ID = 0;
    $("#ddlType option").each(function () {
        var Type = $(this).text();
        if (type == Type) {
            var Val = $(this).val();
            ID = Val;
        }
    });
    $('#ddlType').val(ID).change();
    hdnProductAndSrvicesID.value = PSID;
    GetProductAndServiceByID(PSID,type);
}
function Initialize_P_S_DataTable() {
    $("#tblProductAndServices").DataTable().destroy();
    $("#tblProductAndServices tbody tr").find("td:eq(0)").attr('title', 'click me to view detail');
    $("#tblProductAndServices tbody tr").find("td:eq(0)").css({ cursor: 'pointer', color: 'blue', 'text-decoration': 'underline' });
    $("#tblProductAndServices").DataTable({
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
                  exportOptions: { orthogonal: 'print' },
                  title: 'Print The Report From  product and Services ',
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
             //'excel', 'pdf'
        ],
        columnDefs: [{
            targets: [4, 7, 8],
            render: $.fn.dataTable.render.ellipsis(7)
        }],
        pageLength: '4',
        "filter": true, // this is for disable filter (search box)
        "order": [[3, "desc"]],
        "pagingType": "full_numbers",
        "scrollX": true
    });
}
function SaveProductAndServices() {
    return new Promise(function (resolve, reject) {
        if (hdnProductAndSrvicesID.value == '') {
            SubmitProductAndService("http://localhost:20037/api/ProductAndServices/SaveProductAndServices").then(function (result) {
                resolve('done');
            })
            
        }
        else {
            SubmitProductAndService("http://localhost:20037/api/ProductAndServices/UpdateProductAndServices").then(function (result) {
                resolve('done');
            })
        }
    });
}
function GetProductAndServiceByID(PSID,Type) {
    var Parameter = "?PSID=" + PSID;
    $.ajax({
        url: "http://localhost:20037/api/ProductAndServices/GetProductAndServicesByID" + Parameter,
        type: "GET",
        success: function (ApiResponse) {
            if (ApiResponse) {
                var Data = JSON.parse(ApiResponse);
                $('#txtSKU_' + Type).val(Data[0].SKU);
                $('#txtName_' + Type).val(Data[0].Name);
                $('#txtDesc_' + Type).val(Data[0].Description);
                $('#ddlCategory_' + Type).val(Data[0].CategoryID);
                $('#txtInitialQTY_' + Type).val(Data[0].InitialQtyOnHand);
                $('#txtAsOfDate_' + Type).val(Data[0].AsOf);
                $('#ddlAssetAccount_' + Type).val(Data[0].InventoryAssetAccountID);
                $('#ddlIncomeAccount_' + Type).val(Data[0].IncomeAccountID);
                $('#ddlExpenseAccount_' + Type).val(Data[0].ExpenseAccountID);
                $('#txtUnit_' + Type).val(Data[0].Unit);
                $('#txtRate_' + Type).val(Data[0].SalesPrice);
                $('#txtCost_' + Type).val(Data[0].Cost);
                $('#ddlSupplier_' + Type).val(Data[0].PrefferedSupplierID);
                //$('#txtImage_' + Type).val(Data[0].Image);
                if (Data[0].StatusID=1) 
                    $('#chkStatus_' + Type).prop('checked', true);
                else
                    $('#chkStatus_' + Type).prop('checked', false);
            }
        }

    })
    


}
function SubmitProductAndService(api_url) {
    return new Promise(function (resolve, reject) { 
        var Data = JSON.parse(localStorage.getItem('UserData'));
        var Obj = {};
    Obj.ID = hdnProductAndSrvicesID.value;
    var Type = ddlType.selectedOptions[0].text
    $('#chkStatus_' + Type).prop('checked', true);
    Obj.SKU = $('#txtSKU_'+Type).val();
    Obj.Name = $('#txtName_'+Type).val();
    Obj.TypeID=ddlType.selectedOptions[0].value;
    Obj.Description=$('#txtDesc_'+Type).val();
    Obj.CategoryID = $('#ddlCategory_' + Type).val();
    if (ddlType.selectedOptions[0].text=="Inventory") {
        Obj.InitialQtyOnHand = $('#txtInitialQTY_' + Type).val();
        Obj.AsOf = $('#txtAsOFDate_' + Type).val();
        Obj.InventoryAssetAccountID = $('#ddlAssetAccount_' + Type).val();
    }
    else
        Obj.ExpenseAccountID = $('#ddlExpenseAccount_' + Type).val();
    Obj.IncomeAccountID = $('#ddlIncomeAccount_' + Type).val();
    Obj.Unit = $('#txtUnit_' + Type).val();
    Obj.SalesPrice = $('#txtRate_' + Type).val();
    Obj.Cost = $('#txtCost_' + Type).val(); 
    Obj.PrefferedSupplierID = $('#ddlSupplier_' + Type).val();
    formdata = new FormData();		
    //$('#txtImage_' + Type).on("change", function () {
    //    var file = this.files[0];
    //    if (formdata) {
    //        formdata.append("image", file);
    //        jQuery.ajax({
    //            url: "destination_ajax_file.php",
    //            type: "POST",
    //            data: formdata,
    //            processData: false,
    //            contentType: false,
    //            success: function () { }
    //        });
    //    }
    //});
 

  
    Obj.Image = $('#txtImage_' + Type).val();
  

    if (hdnProductAndSrvicesID.value == '')
        Obj.CreatedBy = Data[0].UserID;
    else
        Obj.UpdatedBy = Data[0].UserID;
    if ($('#chkStatus_' + Type).is(':checked'))
        Obj.StatusID = 1;
    else
        Obj.StatusID = 2;
    $.ajax({
        url: api_url,
        type: "POST",
        data: JSON.stringify(Obj),
        contentType: 'application/json; charset=utf-8',
        success: function (msg) {
            if (msg == 'success') {
               
                resolve('done');
            }
            else{
                showMessage(msg, 'warning', 'ti-na');
                reject('reject');
            }
        }
    });
    });
}
function GetProductAndServiceType() {
    
    $.ajax({
        url: "http://localhost:20037/api/ProductAndServices/GetProductAndServiceType",
        type: "GET",
        success: function (ApiResponse) {
            if (ApiResponse) {
                
                var response = JSON.parse(ApiResponse);
                $('#ddlType').find('option').remove();
                $('#ddlType').append('<option value="0">Select</option>');
                var Type = "";
                for (var i = 0; i < response.length; i++) {
                    Type += '<option value="' + response[i].Value + '">' + response[i].Name + '</option>'
                }
                $('#ddlType').append(Type);

            }
        }

    });
}
function GetAccount(ddlID, TypeID) {
    
 
    var Parameter = '?TypeID=' + TypeID;
    $.ajax({
        url: "http://localhost:20037/api/ProductAndServices/GetAccount" + Parameter,
        type: "GET",
        success: function (ApiResponse) {
            if (ApiResponse) {
                
                var response = JSON.parse(ApiResponse);
                $('#' + ddlID + '').find('option').remove();
                $('#' + ddlID + '').append('<option value="0">Select</option>');
                var Account = "";
                for (var i = 0; i < response.length; i++) {
                    Account += '<option value="' + response[i].ID + '">' + response[i].Name + '</option>'
                }
                $('#' + ddlID + '').append(Account);
                $('#overlay').fadeOut();

            }
        }

    });
}
function GetCategory(ddlCategory) {
    $.ajax({
        url: "http://localhost:20037/api/ProductAndServices/GetCategory",
        type: "GET",
        success: function (ApiResponse) {
            if (ApiResponse) {
                
                var response = JSON.parse(ApiResponse);
                $('#'+ddlCategory+'').find('option').remove();
                $('#' + ddlCategory + '').append('<option value="0">Select</option>');
                var Category = "";
                for (var i = 0; i <response.length; i++) {
                    Category +='<option value="' + response[i].Value + '">' +response[i].Name + '</option>'
                }
                $('#' + ddlCategory + '').append(Category);

            }
        }

    });
}
function GetPreferredSupplier(ddlSupplier) {
    $.ajax({
        url: "http://localhost:20037/api/ProductAndServices/GetPreferredSupplier",
        type: "GET",
        success: function (ApiResponse) {
            if (ApiResponse) {
                
                var response = JSON.parse(ApiResponse);
                $('#' + ddlSupplier + '').find('option').remove();
                $('#' + ddlSupplier + '').append('<option value="0">Select</option>');
                var PreferredSupplier = "";
                for (var i = 0; i < response.length; i++) {
                    PreferredSupplier += '<option value="' + response[i].ID + '">'+response[i].Type +' | ' + response[i].Name + '</option>'
                }
                $('#' + ddlSupplier + '').append(PreferredSupplier);

            }
        }

    });
}
function OnChangeType() {
    dd = document.getElementById('ddlType');
    if (dd.selectedOptions[0].value == '0') {
        $('#Add_NonInventory').hide();
        $('#Add_Services').hide();
        $('#Add_Inventory').hide();
        //  $('#Add_Services').hide();
    }
    if (dd.selectedOptions[0].value == '15') {
        $('#overlay').fadeIn();
        ddlCataegory = "ddlCategory_Inventory";
        ddlAssetAccount = "ddlAssetAccount_Inventory";
        ddlIncomeAccount = "ddlIncomeAccount_Inventory";
        ddlSupplier = "ddlSupplier_Inventory";
        GetAccount(ddlAssetAccount,TypeID=1);
        GetAccount(ddlIncomeAccount ,TypeID=18);
        GetCategory(ddlCataegory);
        //GetAssetAccount(ddlAssetAccount);
        //GetIncomeAccount(ddlIncomeAccount);
        GetPreferredSupplier(ddlSupplier);
        $('#Add_NonInventory').hide();
        $('#Add_Services').hide();
        $('#Add_Inventory').show();
        $("#txtAsOFDate_Inventory").attr('disabled', 'disabled');
        $("#txtAsOFDate_Inventory").css({ 'cssText': 'background: #dddddd !important' });
        $('#txtAsOFDate_Inventory').next().hide();
        $('#txtAsOFDate_Inventory').val('');
        //  $('#Add_Services').hide();
    }
    else if (dd.selectedOptions[0].value == '16') {
        $('#overlay').fadeIn();
        ddlCataegory = "ddlCategory_NonInventory";
        ddlExpenseAccount = "ddlExpenseAccount_NonInventory";
        ddlIncomeAccount = "ddlIncomeAccount_NonInventory";
        ddlSupplier = "ddlSupplier_NonInventory";
        
        GetAccount(ddlExpenseAccount,TypeID=9);
        GetAccount(ddlIncomeAccount, TypeID = 18);
        GetCategory(ddlCataegory);
        //GetExpenseAccount(ddlExpenseAccount);
        //GetIncomeAccount(ddlIncomeAccount);
        GetPreferredSupplier(ddlSupplier);
        $('#Add_NonInventory').show();
        $('#Add_Services').hide();
        $('#Add_Inventory').hide();
    }
    else if (dd.selectedOptions[0].value == '17') {
        $('#overlay').fadeIn();
        ddlCategory = "ddlCategory_Services";
        ddlExpenseAccount = "ddlExpenseAccount_Services";
        ddlIncomeAccount = "ddlIncomeAccount_Services";
        ddlSupplier = "ddlSupplier_Services";
        GetAccount(ddlExpenseAccount, TypeID = 9);
        GetAccount(ddlIncomeAccount, TypeID = 18);
        GetCategory(ddlCategory);
        //GetExpenseAccount(ddlExpenseAccount);
        //GetIncomeAccount(ddlIncomeAccount);
        GetPreferredSupplier(ddlSupplier);
        $('#Add_NonInventory').hide();
        $('#Add_Services').show();
        $('#Add_Inventory').hide();
    }
}
function DisableInventory() {
    $('#Add_Inventory').find('select').select2();
    $("#ddlType").select2();
    $('#Add_Inventory').find('input, textarea, button, select,span').attr('disabled', 'disabled');
    $("#Add_Inventory").find('select').select2('destroy');
    $('#Add_Inventory').find('input, textarea, button,select,span').css({ 'cssText': 'background: #dddddd !important' });
    $('#Add_Inventory').find(('.datepicker:input[type="text"]')).prop('disabled', true);
    $('.gj-icon').hide();
    $('a').attr('disabled', true);
    $("#ddlType").select2('destroy');
    $("#ddlType").attr('disabled', 'disabled');
    $("#ddlType").css({ 'cssText': 'background :#dddddd !important ' });
    $("#btnEditInventory").attr('disabled', false);
    $("#btnEditInventory").css({ 'cssText': 'background:' });
    $("#btnResetInventory").attr('disabled', false);
    $("#btnResetInventory").css({ 'cssText': 'background:' });
}
function EnableInventory() {
    $('#Add_Inventory').find('input, textarea, button, select,span').attr('disabled', false);

    //$("#ddlJournalOptions").select2()
    $('#Add_Inventory').find('input, textarea, button,select,span').css({ 'cssText': 'background ' });
    $("#ddlType").attr('disabled', 'disabled');
    $("#ddlType").css({ 'cssText': 'background :#dddddd !important ' });
    $('a').attr('disabled', false);
    $("#btnEditInventory").hide();
    $("#Add_Inventory").find('select').select2({ width: '100%' });

    if ($('#txtInitialQTY_Inventory').val() == "") {
        $("#txtAsOFDate_Inventory").attr('disabled', 'disabled');
        $("#txtAsOFDate_Inventory").css({ 'cssText': 'background: #dddddd !important' });
        $('#txtAsOFDate_Inventory').next().hide();
        $('#txtAsOFDate_Inventory').val('');
    }
    else
        $('.gj-icon').show();
}
function DisableNon_Inventory() {
 
    $('#Add_NonInventory').find('select').select2();
    $("#ddlType").select2();
    $('#Add_NonInventory').find('input, textarea, button, select,span').attr('disabled', 'disabled');
    $("#Add_NonInventory").find('select').select2('destroy');
    $('#Add_NonInventory').find('input, textarea, button,select,span').css({ 'cssText': 'background: #dddddd !important' });
    $('#Add_NonInventory').find(('.datepicker:input[type="text"]')).prop('disabled', true);
    $('.gj-icon').hide();
    $('a').attr('disabled', true);
    $("#ddlType").select2('destroy');
    $("#ddlType").attr('disabled', 'disabled');
    $("#ddlType").css({ 'cssText': 'background :#dddddd !important ' });
    $("#btnEditNonInventory").attr('disabled', false);
    $("#btnEditNonInventory").css({ 'cssText': 'background:' });
    $("#btnResetNonInventory").attr('disabled', false);
    $("#btnResetNonInventory").css({ 'cssText': 'background:' });
}
function EnableNon_Inventory() {

    $('#Add_NonInventory').find('input, textarea, button, select,span').attr('disabled', false);

    //$("#ddlJournalOptions").select2()
    $('#Add_NonInventory').find('input, textarea, button,select,span').css({ 'cssText': 'background ' });

    $("#ddlType").attr('disabled', 'disabled');
    $("#ddlType").css({ 'cssText': 'background :#dddddd !important ' });
    $("#ddlType").attr('disabled', 'disabled');
    $("#ddlType").css({ 'cssText': 'background :#dddddd !important ' });
    $('a').attr('disabled', false);
    $("#btnEditNonInventory").hide();
    $("#Add_NonInventory").find('select').select2({ width: '100%' });



}
function DisableServices() {
    $('#Add_Services').find('select').select2();
    $("#ddlType").select2();
    $('#Add_Services').find('input, textarea, button, select,span').attr('disabled', 'disabled');
    $("#Add_Services").find('select').select2('destroy');
    $('#Add_Services').find('input, textarea, button,select,span').css({ 'cssText': 'background: #dddddd !important' });
    $('#Add_Services').find(('.datepicker:input[type="text"]')).prop('disabled', true);
    $('.gj-icon').hide();
    $('a').attr('disabled', true);
    $("#ddlType").select2('destroy');
    $("#ddlType").attr('disabled', 'disabled');
    $("#ddlType").css({ 'cssText': 'background :#dddddd !important ' });
    $("#btnEditService").attr('disabled', false);
    $("#btnEditService").css({ 'cssText': 'background:' });
    $("#btnResetService").attr('disabled', false);
    $("#btnResetService").css({ 'cssText': 'background:' });
}
function EnableServices() {
    $('#Add_Services').find('input, textarea, button, select,span').attr('disabled', false);
    
    //$("#ddlJournalOptions").select2()
    $('#Add_Services').find('input, textarea, button,select,span').css({ 'cssText': 'background ' });
    //$("#ddlType").select2('destroy');
    $("#ddlType").attr('disabled', 'disabled');
    $("#ddlType").css({ 'cssText': 'background :#dddddd !important ' });
    $('a').attr('disabled', false);
    $("#btnEditService").hide();
    $("#Add_Services").find('select').select2({ width: '100%' });

}
function Reset_InventoryForm() {
    txtSKU_Inventory.value = "";
    txtName_Inventory.value = "";
    txtDesc_Inventory.value = "";
  
    ddlCategory_Inventory.selectedIndex = 0
    $('#select2-ddlCategory_Inventory-container').text('Select');
    txtInitialQTY_Inventory.value = "";
    ddlAssetAccount_Inventory.selectedIndex = 0;
    $('#select2-ddlAssetAccount_Inventory-container').text('Select');
    ddlIncomeAccount_Inventory.selectedIndex = 0;
    $('#select2-ddlIncomeAccount_Inventory-container').text('Select');
    txtUnit_Inventory.value = "";
    txtRate_Inventory.value = "";
    txtCost_Inventory.value = "";
    ddlSupplier_Inventory.selectedIndex = 0;
    $('#select2-ddlSupplier_Inventory-container').text('Select');
    txtImage_Inventory.value = "";
}
function Reset_Non_InventoryForm() {
    txtSKU_NonInventory.value = "";
    txtName_NonInventory.value = "";
    txtDesc_NonInventory.value = "";
    ddlCategory_NonInventory.selectedIndex = 0;
    $('#select2-ddlCategory_NonInventory-container').text('Select');
    txtUnit_NonInventory.value = "";
    txtRate_NonInventory.value = "";
    txtCost_NonInventory.value = "";
    ddlIncomeAccount_NonInventory.selectedIndex = 0;
    $('#select2-ddlIncomeAccount_NonInventory-container').text('Select');
    ddlExpenseAccount_NonInventory.selectedIndex = 0;
    $('#select2-ddlExpenseAccount_NonInventory-container').text('Select');
    ddlSupplier_NonInventory.selectedIndex = 0;
    $('#select2-ddlSupplier_NonInventory-container').text('Select');
    txtImage_NonInventory.value = "";

}
function ResetServiceForm() {
    txtSKU_Services.value = "";
    txtName_Services.value = "";
    txtDesc_Services.value = "";
    ddlCategory_Services.selectedIndex = 0
    $('#select2-ddlCategory_Services-container').text('Select');
    txtUnit_Services.value = "";
    txtRate_Services.value = "";
    txtCost_Services.value = "";
    ddlIncomeAccount_Services.selectedIndex = 0;
    $('#select2-ddlIncomeAccount_Services-container').text('Select');
    ddlExpenseAccount_Services.selectedIndex = 0;
    $('#select2-ddlExpenseAccount_Services-container').text('Select');
    ddlSupplier_Services.selectedIndex = 0;
    $('#select2-ddlSupplier_Services-container').text('Select');
    txtImage_Services.value = "";
}
function ValidateInventory() {
    if ($("#txtSKU_Inventory").val().match(AlphaNumericRegex)) {
    }
    else {
        showMessage('please enter SKU', 'danger', '');
        $("#txtSKU_Inventory").focus();
        return false;
    }
    if ($("#txtName_Inventory").val().match(AlphaNumericRegex)) {

    }
    else {
        showMessage('please enter Name', 'danger', '');
        $("#txtName_Inventory").focus();
        return false;
    }
    if ($("#ddlAssetAccount_Inventory").val() != 0) {
        show_confirmSave('are you print this');
    }
    else {
        showMessage('please select Asset Account', 'danger', '');
        $("#ddlAssetAccount_Inventory").focus();
        return false;
    }
}
function ValidateNonInventory() {
    if ($("#txtSKU_NonInventory").val().match(AlphaNumericRegex)) {
    }
    else {
        showMessage('please enter SKU', 'danger', '');
        $("#txtSKU_NonInventory").focus();
        return false;
    }
    if ($("#txtName_NonInventory").val().match(AlphaNumericRegex)) {
        show_confirmSave('are you print this');
    }
    else {
        showMessage('please enter Name', 'danger', '');
        $("#txtName_NonInventory").focus();
        return false;
    }

}
function ValidateServices() {
    if ($("#txtSKU_Services").val().match(AlphaNumericRegex)) {
    }
    else {
        showMessage('please enter SKU', 'danger', '');
        $("#txtSKU_Services").focus();
        return false;
    }
    if ($("#txtName_Services").val().match(AlphaNumericRegex)) {
        show_confirmSave('are you print this');
    }
    else {
        showMessage('please enter Name', 'danger', '');
        $("#txtName_Services").focus();
        return false;
    }

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
            SaveProductAndServices().then(function (result) {
                return GetProductAndServices()
            }).then(function (result) {
                Reset_InventoryForm();
                Reset_Non_InventoryForm();
                ResetServiceForm();
                $('.nav-tabs a[href="#P_S"]').tab('show');
                $('#Add_NonInventory').hide();
                $('#Add_Services').hide();
                $('#Add_Inventory').hide();
                ddlType.selectedIndex = 0
                $('#select2-ddlType-container').text('Select');
                showMessage('Data Saved Successfully', 'success', 'ti-check');
                hdnProductAndSrvicesID.value = '';
            });
        }
    });
}
function ValidateInitialQtyOnHand() {
    if ($('#txtInitialQTY_Inventory').val() != '') {
        if ($('#txtInitialQTY_Inventory').val().match(RegexForPositiveIncludeZero)) {
            $("#txtAsOFDate_Inventory").attr('disabled', false);
            $("#txtAsOFDate_Inventory").css({ 'cssText': 'background: ' });
            $('#txtAsOFDate_Inventory').next().show();
            $('#txtAsOFDate_Inventory').val(GetTodayDate());
        }
        else {
            $('#txtInitialQTY_Inventory').val('');
        }

    }
    else {
        $("#txtAsOFDate_Inventory").attr('disabled', 'disabled');
        $("#txtAsOFDate_Inventory").css({ 'cssText': 'background: #dddddd !important' });
        $('#txtAsOFDate_Inventory').val('');
        $('#txtAsOFDate_Inventory').next().hide();
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
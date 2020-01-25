
$(document).ready(function () {
    $('#overlay').fadeIn();
    list = localStorage.getItem('data');

    var params = getUrlParameter('Param');
    if (params) {
        AddNewCustomer();
        $('#SaleVoucher').hide();
        $('#Received').hide();
        return false;
    }
    
    $("#tblCustomerList tbody tr").find("td:eq(2),td:eq(4)").attr('title', 'click me to view detail');
    $("#tblCustomerList tbody tr").find("td:eq(2),td:eq(4)").css({ cursor: 'pointer', color: 'blue', 'text-decoration': 'underline' });
    $("#tblSaleVoucherList tbody tr").find("td:eq(1),td:eq(3)").attr('title', 'click me to view detail');
    $("#tblNotReceived tbody tr").find("td:eq(2),td:eq(4)").attr('title', 'click me to view detail');
    $("#tblSaleVoucherList tbody tr").find("td:eq(1),td:eq(3)").css({ cursor: 'pointer', color: 'blue', 'text-decoration': 'underline' });
    $("#tblNotReceived tbody tr").find("td:eq(2),td:eq(4)").css({ cursor: 'pointer', color: 'blue', 'text-decoration': 'underline' });
    CalculateNetAmount();
    sumInvoiceAmount();
    GetLegalEntity();
    GetTaxProfile();
    GetAccount();
    GetCountry();
    GetCustomer();

    $('#btnSave').on('click', function () {
        ValidateSaleVoucher();
    });
    $('#btnSaveReceived').on('click', function () {
        ValidateSaleVoucherReceived();
    });
    $("#ddlAddTax").change(function () {
        AddTaxToSaleVoucher();
    });
    $('.tax').select2({}).on('select2:open', function () {
        var a = $(this).data('select2');
        if (!$('.select2-link').length) {
            a.$results.parents('.select2-results')
                    .prepend('<div class="select2-link"><a style="font-weight:bold;"> + Add New</a></div>')
                    .on('click', function (b) {

                        $("#AddTaxReceived").modal('hide');
                        $(".tax").select2('close');

                        $('#AddTaxModel').modal();
                    });
        }
    });
    $('.customer').select2({}).on('select2:open', function () {
        var a = $(this).data('select2');
        if (!$('.select2-link').length) {
            a.$results.parents('.select2-results')
                    .prepend('<div class="select2-link"><a style="font-weight:bold;"> + Add New</a></div>')
                    .on('click', function (b) {
                        $(".customer").select2('close');
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
                        $('#AddAccount').modal();
                    });
        }
    });
    $("#lblItemDetail").click(function () {
        ShowItemDetailTable();
    });
    $('#tblNotReceived tbody tr').find("td:eq(2),td:eq(4)").on('click', function () {
        if ($("#btnEdit")[0].style.display != "") {
            return;
        }
        else {
            DisableSaleVoucher();
            $("#btnDuplicate").show();
            $("#btnEdit").show();
            $("#btnDelete").show();
            $("#btnReturn").show();
            jQuery('#div_SaleList').hide();
            jQuery('#SaleVoucher').show();
            $("#lblStatusOfSaleVoucher").show();


        }
    });
    $('#tblSaleVoucherList tbody tr').find("td:eq(1)").on('click', function () {
        if ($("#btnEdit")[0].style.display != "none") {
            DisableSaleVoucher();

            var row = this.closest('tr');
            var rowID = row.getAttribute('id');
            var RowNo = rowID.replace('listRow', '');
            var icon = ' <i class="ti-na">';
            var status = $("#lblStatusInvoice" + RowNo).text();
            $("#btnDuplicate").show();
            $("#btnEdit").show();
            $("#btnDelete").show();
            $("#btnReturn").show();
            jQuery('#div_SaleList').hide();
            jQuery('#SaleVoucher').show();
            $("#lblStatusOfSaleVoucher").text(status);
            $("#lblStatusOfSaleVoucher").append(icon);

        }
        else {
            var row = this.closest('tr');
            var rowID = row.getAttribute('id');
            var RowNo = rowID.replace('listRow', '');
            var icon = ' <i class="ti-na">';
            var status = $("#lblStatusInvoice" + RowNo).text();
            $("#btnDuplicate").show();
            $("#btnEdit").show();
            $("#btnDelete").show();
            $("#btnReturn").show();
            jQuery('#div_SaleList').hide();
            jQuery('#SaleVoucher').show();
            $("#lblStatusOfSaleVoucher").text(status);
            $("#lblStatusOfSaleVoucher").append(icon);

        }
    });
    $('#tblSaleVoucherList tbody tr').find("td:eq(3)").on('click', function () {

        var row = this.closest('tr');
        var rowID = row.getAttribute('id');
        var RowNo = rowID.replace('listRow', '');
        var status = $("#lblStatusInvoice" + RowNo).text();
        var icon = ' <i class="ti-na">';
        if (status == "Not Received") {

            DisableSaleVoucher();
            $("#btnDuplicate").show();
            $("#btnEdit").show();
            $("#btnDelete").show();
            $("#btnReturn").show();
            jQuery('#div_SaleList').hide();
            jQuery('#SaleVoucher').show();

            $("#lblStatusOfSaleVoucher").text(status);
            $("#lblStatusOfSaleVoucher").append(icon);



        }
        else {
            jQuery('#div_SaleList').hide();
            jQuery('#Product_DetailEdit').hide();
            $("#btnInActive").show();
            $("#btnEditReceived").show();
            $("#btnDeleteReceived").show();
            $("#lblStatus").show();
            jQuery('#Received').show();
            $("#lblStatus").text(status);
            $("#lblStatus").append(icon);
            DisableReceiveVoucher();
        }
    });
    $('#CustomerBalance tbody tr').on('click', ' td:eq(0)', function () {
        //jQuery('#ReceiveList').hide();
        //jQuery('#Product_DetailEdit').hide();
        jQuery('#div_SaleList').hide();
        jQuery('#AddNewCustomer').show();
        DisableCustomer();

    });
    $('#tblCustomerList tbody tr').on('click', ' td:eq(2)', function () {
        if ($("#btnEdit")[0].style.display != "") {
            return;
        }
        else {
            DisableSaleVoucher();
            var row = this.closest('tr');
            var rowID = row.getAttribute('id');
            var RowNo = rowID.replace('cuslistRow', '');
            var icon = ' <i class="ti-na">';
            var status = $("#lblCustStatusInvoice" + RowNo).text();
            $("#btnDuplicate").show();
            $("#btnEdit").show();
            $("#btnDelete").show();
            $("#btnReturn").show();
            jQuery('#div_SaleList').hide();
            jQuery('#SaleVoucher').show();
            $("#lblStatusOfSaleVoucher").show();
            $("#lblStatusOfSaleVoucher").text(status);
            $("#lblStatusOfSaleVoucher").append(icon);
        }
    });
    $('#tblCustomerList tbody tr').on('click', ' td:eq(4)', function () {

        var row = this.closest('tr');
        var rowID = row.getAttribute('id');
        var RowNo = rowID.replace('cuslistRow', '');
        var status = $("#lblCustStatusInvoice" + RowNo).text();
        var icon = ' <i class="ti-na">';
        if (status == "Not Received") {

            DisableSaleVoucher();
            $("#btnDuplicate").show();
            $("#btnEdit").show();
            $("#btnDelete").show();
            $("#btnReturn").show();
            jQuery('#div_SaleList').hide();
            jQuery('#SaleVoucher').show();

            $("#lblStatusOfSaleVoucher").text(status);
            $("#lblStatusOfSaleVoucher").append(icon);



        }
        else {

            jQuery('#div_SaleList').hide();
            jQuery('#Product_DetailEdit').hide();
            $("#btnInActive").show();
            $("#btnEditReceived").show();
            $("#btnDeleteReceived").show();
            $("#lblStatus").show();
            jQuery('#Received').show();
            $("#lblStatus").text(status);
            $("#lblStatus").append(icon);
            DisableReceiveVoucher();
        }
    });

    $("#SaleVoucher").hide();
    $("#Received").hide();
    $("#AddNewCustomer").hide();
    $("#btnReceive").hide();
    ClickCheckBox();
    ClickCheckBoxValidate();
    ClickCheckBoxCustomerCredit();
    ClickCheckBoxCustomerList();
    AddFirstRowBankDetail();
    AddFirstRowSaleVoucherDeatail();
    AddFirstRowItemDetail();
    AddRowSaleVoucherDetail()
    AddRowBankDetail();
    AddRowItemDetail();
    $("#tblSaleVoucherList").DataTable({
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
                  title: 'Print The Report From Sale ',
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
            targets: 7,
            render: $.fn.dataTable.render.ellipsis(7)
        }],
        pageLength: '4',
        "filter": true, // this is for disable filter (search box)
        "order": [[3, "desc"]],
        "pagingType": "full_numbers",
    });
    $("#tblNotReceived").DataTable({
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
                  title: 'Print The Report From Sale  ',
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
            targets: 8,
            render: $.fn.dataTable.render.ellipsis(6)
        }],
        pageLength: '4',
        "filter": true, // this is for disable filter (search box)
        "order": [[3, "desc"]],
        "pagingType": "full_numbers",
    });
    $("#tblCustomerBalance").DataTable({
        "lengthChange": false,
        "paging": false,
        "ordering": false,
        "paging": false,
        "bInfo": false,
        "searching": false
    });
    $("#tblReceived").DataTable({
        columnDefs: [{
            targets: 0,
            render: $.fn.dataTable.render.ellipsis(8)
        }],
        "ordering": false,
        "paging": false,
        "bInfo": false,
        "searching": false,


    });
    $("#CustomerBalance").DataTable({
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
                  title: 'Print The Report From Expense  ',
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

        pageLength: '4',

        "bInfo": false,
        "paging": true,



    });
    $("#tblCustomerList").DataTable({
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
                  title: 'Print The Report From Expense  ',
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
            targets: 8,
            render: $.fn.dataTable.render.ellipsis(8)
        }],
        pageLength: '4',
        "order": [[3, "desc"]],
        "bInfo": false,
        "paging": true,
    });
    $("#div_SaleVoucherList").show();
    $("#div_NotReceivedVoucher").hide();
    $("#di_UseCredit").hide();
    BindChequeAmount_KeyUp();
    $('#tblCustomerList tbody tr').each(function () {
        var row = this.closest('tr');
        var rowID = row.getAttribute('id');
        var RowNo = rowID.replace('cuslistRow', '');
        var status = $("#lblCustStatusInvoice" + RowNo).text();
        if (status == "Received") {

            $(this).find('input[type="checkbox"]').attr('disabled', true);
        }

    })
    $('#ddSelectCustomer').on('change', function () {
        
        var CustomerID = $('#ddSelectCustomer').val()
        GetCustomerDataBySelectCustomer(CustomerID);
    })
    $('#overlay').fadeOut();
});
function GetLegalEntity() {

    $.ajax({
        url: 'http://localhost:20037/api/Expense/GetLegalEntity',
        typ: "GET",
        success: function (ApiResponse) {
            if (ApiResponse) {

                var response = JSON.parse(ApiResponse);
                $('#ddlLegal').append($('<option></option>').val("0").text("Select"));
                var LegalEntity = "";
                for (var i = 0; i < response.length; i++) {
                    LegalEntity += '<option value="' + response[i].Value + '">' + response[i].Name + '</option>'
                }
                $('#ddlLegal').append(LegalEntity);
            }
        }
    })
}
function GetTaxProfile() {

    $.ajax({
        url: 'http://localhost:20037/api/Expense/GetTaxProfile',
        type: "GET",
        success: function (ApiResponse) {
            if (ApiResponse) {
                var response = JSON.parse(ApiResponse);
                $('#ddlTaxProfile').append($('<option></option>').val("0").text("Select"));
                var TaxProfile = "";
                for (var i = 0; i < response.length ; i++) {
                    TaxProfile += '<option value="' + response[i].Value + '">' + response[i].Name + '</option>'
                }
                $('#ddlTaxProfile').append(TaxProfile)
            }
        }

    })
}
function GetAccount() {

    $.ajax({
        url: 'http://localhost:20037/api/Expense/GetAccount',
        type: "GET",
        success: function (ApiResponse) {
            if (ApiResponse) {
                var response = JSON.parse(ApiResponse);
                $('#ddlCustomerAccount').append($('<option></option>').val("0").text("Select"));
                var Account = "";
                for (var i = 0; i < response.length ; i++) {
                    Account += '<option value="' + response[i].ID + '">' + response[i].Code + ' | ' + response[i].Name + '</option>';
                }
                $('#ddlCustomerAccount').append(Account)
            }
        }

    })
}
function GetCountry() {
    $.ajax({
        url: 'http://localhost:20037/api/Expense/GetCountry',
        type: 'GET',
        success: function (ApiResponse) {

            if (ApiResponse) {
                var response = JSON.parse(ApiResponse);
                $("#ddlCountry").append($("<option></option>").val("0").text("Select"));
                var Options = "";
                for (var i = 0; i < response.length ; i++) {
                    Options += '<option value="' + response[i].Value + '">' + response[i].Code + ' | ' + response[i].Name + '</option>'
                }
                $("#ddlCountry").append(Options);
            }
        }
    });
}
function GetCity(CountryID) {
    $('#ddlCity option').remove();
    $.ajax({
        url: "http://localhost:20037/api/Expense/GetCity",
        type: "GET",
        data: "CountryID=" + CountryID,
        success: function (ApiRespnse) {
            if (ApiRespnse) {
                var response = JSON.parse(ApiRespnse);
                $('#ddlCity').append($('<option></option>').val("0").text("Select"));
                var city = "";
                for (var i = 0; i < response.length ; i++) {
                    city += '<option value="' + response[i].Value + '">' + response[i].Name + '</option>'
                }
                $('#ddlCity').append(city);

            }
        }
    })
}
function OnchangeCountry() {

    var CountryID = $('#ddlCountry').val()
    if (CountryID > 0) {
        GetCity(CountryID);
    }

}
function SaveCustomer() {
    
    if (hdnCustomerID.value == '')
        SubmitCustomer("http://localhost:20037/api/Sale/AddNewCustomer");
    else
        SubmitCustomer("http://localhost:20037/api/Sale/UpdateCustomer");

}
function SubmitCustomer(api_url) {

    var Data = JSON.parse(localStorage.getItem('UserData'))
    var obj = {};
    obj.ID = hdnCustomerID.value;
    obj.Name = txtCustomerName.value;
    obj.LegalEntityID = ddlLegal.selectedOptions[0].value;
    obj.NTN = txtNtnNo.value;
    obj.STRN = txtStrnNo.value;
    obj.ATL = txtAtl.value;
    obj.ContactNo = txtCantactNo.value;
    obj.TaxProfileID = ddlTaxProfile.selectedOptions[0].value;
    obj.BusinessActivity = txtBusinessActivity.value;
    obj.BankAccountNO = txtAccountNo.value;
    obj.Address = txtAddress.value;
    obj.CountryID = ddlCountry.selectedOptions[0].value;
    if ($('#ddlCity').find('option').length > 0)
        obj.CityID = ddlCity.selectedOptions[0].value;
    else
        obj.CityID = 0;

    obj.OpeningBalance = txtOpeningBalance.value;
    obj.AsOf = CustomerAsOFdate.value;
    obj.AccountID = ddlCustomerAccount.selectedOptions[0].value;
    obj.Note = txtNotes.value;
    if (hdnCustomerID.value != '') {
        obj.UpdatedBy = Data[0].UserID;
    }
    else
        obj.CreatedBy = Data[0].UserID;

    if ($('#chkStatus').is(':checked'))
        obj.StatusID = 1;
    else
        obj.StatusID = 2;
    $.ajax({
        url: api_url,
        type: 'POST',
        data: JSON.stringify(obj),
        contentType: "application/json; charset=utf-8",
        success: function (msg) {
            if (msg == "success") {
                ResetCustomerForm();
                $("#AddNewCustomer").hide();
                $("#div_SaleList").show();
                $('#btnCustomerReceived').attr('disabled', true);
            }

        },
        error: function (msg) {
            showMessage(msg, 'warning', 'ti-na');
        }
    })


}
function GetCustomer() {
    $.ajax({
        url: "http://localhost:20037/api/Sale/GetCustomer",
        type: "GET",
        success: function (ApiResponse) {
            $('#CustomerBalance').DataTable().clear().destroy();
            if (ApiResponse) {

                //   $('#VendorBalance tbody').html('');
                var response = JSON.parse(ApiResponse)
                bindCustomer(response);
                for (var i = 0; i < response.length; i++) {

                    var tr = $('<tr></tr>')
                    $(tr).attr('customer-id', response[i].ID);
                    $(tr).append('<td onclick="check(this)">' + response[i].Name + '</td><td >' + response[i].InvoiceAmount + '</td><td>' + response[i].ReceivedAmount + '</td><td>' + response[i].Balance + '</td>');
                    $('#CustomerBalance tbody').append(tr)
                }
                InitializeCustomerBalanceDataTable();

            }
        }

    })
}
function GetCustomers() {
    
    $('#overlay').fadeIn();
    if ($('#chkShowInactive').is(':checked'))
        setTimeout(function () {
            GetAllCustomer();
        }, 300);

    else {
        setTimeout(function () {
            GetCustomer();
        }, 300);
    }
    $('#overlay').fadeOut();

}
function GetAllCustomer() {
    $.ajax({
        url: "http://localhost:20037/api/Sale/GetAllCustomer",
        type: "GET",
        success: function (ApiResponse) {
            $('#CustomerBalance').DataTable().clear().destroy();
            if (ApiResponse) {

                //  $('#VendorBalance tbody').html('');
                var response = JSON.parse(ApiResponse)
                bindCustomer(response);
                for (var i = 0; i < response.length; i++) {
                    var tr = $('<tr></tr>')
                    $(tr).attr('customer-id', response[i].ID);

                    if (response[i].StatusID == 2) {
                        $(tr).append('<td onclick="check(this)">' + response[i].Name + ' * </td><td >' + response[i].InvoiceAmount + '</td><td>' + response[i].ReceivedAmount + '</td><td>' + response[i].Balance + '</td>');
                    }
                    else
                        $(tr).append('<td onclick="check(this)">' + response[i].Name + '</td><td >' + response[i].InvoiceAmount + '</td><td>' + response[i].ReceivedAmount + '</td><td>' + response[i].Balance + '</td>');


                    $('#CustomerBalance tbody').append(tr)
                }
                InitializeCustomerBalanceDataTable();

            }
        }

    })
}
function GetCustomerDataBySelectCustomer(CustomerID) {
    var Parameter = "?CustomerID=" + CustomerID;
    $.ajax({
        url: "http://localhost:20037/api/Sale/GetCustomerDataBySelectCustomer" + Parameter,
        type: "GET",
        success: function (ApiResponse) {
            $('#CustomerBalance').DataTable().clear().destroy();
            if (ApiResponse) {

                //    $('#VendorBalance tbody').html('');
                var response = JSON.parse(ApiResponse)
                //bindVendor(response);
                for (var i = 0; i < response.length; i++) {

                    var tr = $('<tr></tr>')
                    $(tr).attr('customer-id', response[i].ID);
                    if (response[i].StatusID == 2) {
                        $(tr).append('<td onclick="check(this)">' + response[i].Name + ' * </td><td >' + response[i].InvoiceAmount + '</td><td>' + response[i].ReceivedAmount + '</td><td>' + response[i].Balance + '</td>');
                    }
                    else
                        $(tr).append('<td onclick="check(this)">' + response[i].Name + '</td><td >' + response[i].InvoiceAmount + '</td><td>' + response[i].ReceivedAmount + '</td><td>' + response[i].Balance + '</td>');

                    $('#CustomerBalance tbody').append(tr)
                }
                InitializeCustomerBalanceDataTable();

            }
        }

    })
}
function bindCustomer(response) {

    $('#ddSelectCustomer option').remove();

    if (response) {
        $('#ddSelectCustomer').append($("<option></option>").val("0").text("Select"));
        var Customer = "";
        for (var i = 0; i < response.length; i++) {
            if (response[i].StatusID == 2) 
                Customer += '<option value="' + response[i].ID + '">' + response[i].Name + ' * </option>';
            else
                Customer += '<option value="' + response[i].ID + '">' + response[i].Name + '</option>';
            
        }
        $('#ddSelectCustomer').append(Customer);

    }
}
function check(name) {

    jQuery('#div_SaleList').hide();

    jQuery('#AddNewCustomer').show();

    CustomerID = name.closest('tr').getAttribute('customer-id');
    hdnCustomerID.value = CustomerID;

    GetCustomerByID(CustomerID);
}
function InitializeCustomerBalanceDataTable() {
    //$("#VendorBalance").DataTable().destroy();
    $("#CustomerBalance tbody tr").find("td:eq(0)").attr('title', 'click me to view detail');
    $("#CustomerBalance tbody tr").find("td:eq(0)").css({ cursor: 'pointer', color: 'blue', 'text-decoration': 'underline' });
    $("#CustomerBalance").DataTable({
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
function GetCustomerByID(CustomerID) {

    $.ajax({
        url: "http://localhost:20037/api/Sale/GetCustomerByID",
        typ: "GET",
        data: "CustomerID=" + CustomerID,
        success: function (ApiResponse) {

            DisableCustomer();
            if (ApiResponse) {
                response = JSON.parse(ApiResponse);
                hdnCustomerID.value = response.ID;
                txtCustomerName.value = response.Name;
                $("#ddlLegal").val(response.LegalEntityID).attr('selected', 'selected');
                txtNtnNo.value = response.NTN;
                txtStrnNo.value = response.STRN;
                txtAtl.value = response.ATL;
                txtCantactNo.value = response.ContactNo;
                $("#ddlTaxProfile").val(response.TaxProfileID).attr('selected', 'selected');
                txtBusinessActivity.value = response.BusinessActivity;
                txtAccountNo.value = response.BankAccountNO;
                txtAddress.value = response.Address;
                $("#ddlCountry").val(response.CountryID).attr('selected', 'selected');
                $.when($.ajax(OnchangeCountry())).then(function () {
                    if ($("#ddlCity").find('option').length > 0) {
                        $("#ddlCity").val(response.CityID).attr('selected', 'selected');
                    }


                });


                txtOpeningBalance.value = response.OpeningBalance;
                CustomerAsOFdate.value = DateFormat(response.AsOf);
                $("#ddlCustomerAccount").val(response.AccountID).attr('selected', 'selected');
                txtNotes.value = response.Note;
                if (response.StatusID == 1) {
                    $('#chkStatus').prop('checked', true);
                    //$('#ShowVendorStatus').text('Active')
                }
                else {
                    $('#chkStatus').attr('checked', false);
                    //$('#ShowVendorStatus').text('InActive')
                }


                // 
                //DisableVendor();
            }
        }

    })
}

function DisableSaleVoucher() {

    if ($("#SaleVoucher").find('select').data('select2'))
        $("#SaleVoucher").find('select').select2('destroy');
    $('#SaleVoucher').find('input, textarea, button, select').attr('disabled', 'disabled');

    $('#SaleVoucher').find('input, textarea, button,select').css({ 'cssText': 'background: #dddddd !important' });
    $('#SaleVoucher').find(('.datepicker:input[type="text"]')).prop('disabled', true);
    $('.gj-icon').hide();
    $('a').attr('disabled', true);
    $("#btnEdit").attr('disabled', false);
    $("#btnEdit").css({ 'cssText': 'background:' });
    $("#btnDuplicate").attr('disabled', false);
    $("#btnDuplicate").css({ 'cssText': 'background:' });
    $("#btnReturn").attr('disabled', false);
    $("#btnReturn").css({ 'cssText': 'background:' });


}
function EnableSaleVoucher() {
    $('#SaleVoucher').find('input, textarea, button, select').attr('disabled', false);
    $("#SaleVoucher").find('select').select2();
    $('#SaleVoucher').find('input, textarea, button,select').css({ 'cssText': 'background: ' });
    $('#SaleVoucher').find(('.datepicker:input[type="text"]')).prop('disabled', false);
    $('.gj-icon').show();
    $("#btnDuplicate").hide();
    $("#btnEdit").hide();
    $('#btnReturn').hide();
    $("#voucherno").attr('disabled', true);
    $("#voucherno").css({ 'cssText': 'background: #dddddd !important' });
    $('#SaleVoucher').find(('#VoucherDate:input[type="text"]')).prop('disabled', true);
    $('#SaleVoucher').find(('#VoucherDate:input[type="text"]')).css({ 'cssText': 'background: #dddddd !important' });
    var iconclass = $("#SaleVoucher").find('input[type="text"][id="VoucherDate"]').next().addClass('abc')[0].getAttribute('class');
    $("." + iconclass.replace('gj-icon ', '')).hide();
    $('a').attr('disabled', false);
}
function DuplicateSaleVoucher() {
    EnableSaleVoucher();
    $('#SaleVoucher').find(('#VoucherDate:input[type="text"]')).prop('disabled', false);
    $('#SaleVoucher').find(('#VoucherDate:input[type="text"]')).css({ 'cssText': 'background: ' });
    var iconclass = $("#SaleVoucher").find('input[type="text"][id="VoucherDate"]').next().addClass('abc')[0].getAttribute('class');
    $("." + iconclass.replace('gj-icon ', '')).show();
    $("#voucherno").val('Sale Voucher No 1')
}
function DisableReceiveVoucher() {

    $('#Received').find('input, textarea, button, select').attr('disabled', 'disabled');
    $('#Received').find(' select').select2('destroy');
    $('#Received').find('input, textarea, button, select').css({ 'cssText': 'background: #dddddd !important' });
    $('#Received').find(('.datepicker:input[type="text"]')).prop('disabled', true);
    $('.gj-icon').hide();
    $('a').attr('disabled', 'true');
    $('#btnEditReceived').attr('disabled', false);
    $("#btnEditReceived").css({ 'cssText': 'background: ' });
}
function EnableReceiveVoucher() {
    $('#Received').find('input, textarea, button, select').attr('disabled', false);
    $('#Received').find(' select').select2();
    $('#Received').find('input, textarea, button, select').css({ 'cssText': 'background: ' });
    $('#Received').find(('.datepicker:input[type="text"]')).prop('disabled', false);
    $('.gj-icon').show();
    $("#btnEditReceived").hide();
    $("#txtReceiveVoucher").attr('disabled', true);
    $("#txtReceiveVoucher").css({ 'cssText': 'background: #dddddd !important' });
    $('#Received').find(('#VoucherDateReceived:input[type="text"]')).prop('disabled', true);
    $('#Received').find(('#VoucherDateReceived:input[type="text"]')).css({ 'cssText': 'background: #dddddd !important' });
    var iconclass = $("#Received").find('input[type="text"][id="VoucherDateReceived"]').next().addClass('abc')[0].getAttribute('class');
    $("." + iconclass.replace('gj-icon ', '')).hide();
    $('a').attr('disabled', false);
}
function BindChequeAmount_KeyUp() {
    $('.txtCheckAmount').unbind('keyup');
    $('.txtCheckAmount').on('keyup', function () {

        if ($(this).val() != '')
            var rowID = this.id.replace('txtAmountBnk', '');
        var txtCheckAmount = parseFloat($("#txtAmountBnk" + rowID).val());
        // sum = parseInt(sum) + parseInt($(this).val());
        balance = parseFloat($("#lblBankBalance" + rowID).text().replace(/,/g, ''));
        if (txtCheckAmount > balance) {
            showMessage('Your ChequeAmount is Greater Than Bank Balance', 'warning', '')
        }
        sumChequeAmountBank();
    });
}
function removeSaleVoucherRow(btn) {

    if ($("#tblSaleVoucherDetail tbody tr").length == 1) {
        $("#lblTotalShow").hide();
    }
    tr = $(btn).closest("tr");
    id = tr.attr('data-id');
    selectedValue = $('#ddlAccountOnTax' + id)[0].value;
    $("#ddlAddTax option").each(function () {
        if (this.value == selectedValue) {
            this.disabled = false;
        }
    });
    tr.remove();
    sumAmountAccount();
    CalculateReceived();
    CalculateTax();
}

function openmodel() {
    jQuery('#myModal').modal();
}
function openSaleVoucher() {
    $("#btnDuplicate").hide();
    $("#btnEdit").hide();
    $("#btnDelete").hide();
    $("#btnReturn").hide();
    $("#lblStatusOfSaleVoucher").hide();
    jQuery('#div_SaleList').hide();
    jQuery('#Received').hide();
    jQuery('#Product_Detail').hide();
    jQuery('#SaleVoucher').show();

}
function ShowItemDetailTable() {
    jQuery('#Product_Detail').toggle();
    $('#lbltotalItem').html('0.00');
}
function ShowCustomerTransaction() {
    if ($('#showCustomerTransaction')[0].style.display == 'none') {

        $('#btnShowCustomerTransaction').text('Hide Transaction');
    }
    else {

        $('#btnShowCustomerTransaction').text('Show Transaction');
    }
    $('#showCustomerTransaction').toggle(300);


}
function AddFirstRowSaleVoucherDeatail() {
    AddRowToSaleVoucher_WithoutTax();
}
function AddRowSaleVoucherDetail() {
    $("#add_rowAccountDetail").on("click", function () {
        if ($("#btnEdit")[0].style.display == "") {
            return;
        }
        else {
            AddRowToSaleVoucher_WithoutTax();
            $("#lblTotalShow").show();
        }
    });
}
function AddFirstRowBankDetail() {
    var id = $("#tab_BankDetail tbody tr").length;
    row = '<tr id="row' + id + '" data-id="' + id + '">';
    row += '<td data-name="sel"><div id="div_Bank"><select id="ddlBank' + id + '"style="width:160px;" name="Bank"  class="form-control selectBank "><option value="0">Select</option><option value="1">Meezan Bank</option><option value="2">HBL Bank</option><option value="3">Alfalah Bank</option></select></div></td>';
    row += '<td data-name="BankBalance"><div id="BankBalance" class="text-center" style="margin-top:10px;"><label id="lblBankBalance' + id + '" >50,000</label></div></td>';
    row += '<td data-name="td_chequeNo"><input type="text" name="chequeNo" id="txtChequeNo' + id + '" class="form-control chequeNo" /></td>';
    row += '<td data-name="td_chequeDate"><div id="div_chequeDate"><input type="text" name="ChequeDate" id="txtChequeDate' + id + '"  class="form-control border-input datepicker chkDate"/></div></td>';
    row += '<td data-name="td_Amount"><input type="number" name="txtAmount1" id="txtAmountBnk' + id + '"  class="form-control txtCheckAmount" /></td>'; //onkeyup="sumChequeAmountBank();ChequeBankBalanceAndChequeBalance();"
    row += '<td data-name="del"><button type="button" class="btn btn-danger glyphicon row-remove" id="btnRemoveRowBankDetail' + id + '" style="background-color: white; color: black; border: none;"><span aria-hidden="true">×</span></button></td>';
    row += '</tr>';
    $('#tab_BankDetail tbody').append(row);
    $('.selectBank').select2({}).on('select2:open', function () {
        var a = $(this).data('select2');
        if (!$('.select2-link').length) {
            a.$results.parents('.select2-results')
                    .prepend('<div class="select2-link"><a style="font-weight:bold;"> + Add New</a></div>')
                    .on('click', function (b) {
                        $(".selectBank").select2('close');
                        $('#AddBank').modal();
                    });
        }
    });

    $("#tab_BankDetail tbody tr").find("td button.row-remove").on("click", function () {

        if ($("#tab_BankDetail tbody tr").length == 1) {

            $("#div_CalculateChequeAmount").hide();
        }
        $(this).closest("tr").remove();
        sumChequeAmountBank();
    });


}
function AddRowBankDetail() {
    $("#add_rowBankDetail").on("click", function () {
        if ($("#btnEditReceived")[0].style.display == "") {
            return;
        }
        else {
            var id = $("#tab_BankDetail tbody tr").length;
            row = '<tr id="row' + id + '" data-id="' + id + '">';
            row += '<td data-name="sel"><div id="div_Bank"><select id="ddlBank' + id + '"style="width:160px;" name="Bank"  class="form-control selectBank "><option value="0">Select</option><option value="1">Meezan Bank</option><option value="2">HBL Bank</option><option value="3">Alfalah Bank</option></select></div></td>';
            row += '<td data-name="BankBalance"><div id="BankBalance" class="text-center" style="margin-top:10px;"><label id="lblBankBalance' + id + '" >50,000</label></div></td>';
            row += '<td data-name="td_chequeNo"><input type="text" name="chequeNo" id="txtChequeNo' + id + '" class="form-control chequeNo" /></td>';
            row += '<td data-name="td_chequeDate"><div id="div_chequeDate"><input type="text" name="ChequeDate" id="txtChequeDate' + id + '"  class="form-control border-input  datepicker chkDate" /></div></td>';
            row += '<td data-name="td_Amount"><input type="number" name="txtAmount1" id="txtAmountBnk' + id + '"  class="form-control txtCheckAmount"/></td>';
            row += '<td data-name="del"><button type="button" class="btn btn-danger glyphicon row-remove" id="btnRemoveRowBankDetail' + id + '" style="background-color: white; color: black; border: none;"><span aria-hidden="true">×</span></button></td>';
            row += '</tr>';
            $('#tab_BankDetail tbody').append(row);
            BindChequeAmount_KeyUp();

            $('.selectBank').select2({}).on('select2:open', function () {
                var a = $(this).data('select2');
                if (!$('.select2-link').length) {
                    a.$results.parents('.select2-results')
                            .prepend('<div class="select2-link"><a style="font-weight:bold;"> + Add New</a></div>')
                            .on('click', function (b) {
                                $(".selectBank").select2('close');
                                $('#AddBank').modal();
                            });
                }
            });

            $("#tab_BankDetail tbody tr").find("td button.row-remove").on("click", function () {
                $(this).closest("tr").remove();
                sumChequeAmountBank();
            });
            $('#txtChequeDate' + id).datepicker({
                uiLibrary: 'bootstrap3'
            }).val(GetTodayDate());
            $('#txtChequeDate' + id).focus(function () {


                $('#txtChequeDate' + id).attr('readonly', 'true');
            });
            $("#div_CalculateChequeAmount").show();
        }
    });

}
function AddFirstRowItemDetail() {
    var id = $("#tab_ItemDetail tbody tr").length;
    row = '<tr id="' + id + '" data-id="' + id + '">';
    row += '<td data-name="sel"><div id="div_Class"><select id="ddlProduct' + id + '"style="width:160px;" name="product1"  class="form-control selectProduct "><option value="0">Select</option><option value="1">100 | Printer</option><option value="2">102 | Laptop</option><option value="3">103 | Era</option></select></div></td>';
    row += '<td data-name="td_Des"><input type="text" name="Desc1" id="txtDescription' + id + '" class="form-control Desc" /></td>';
    row += '<td data-name="td_Qty"><input type="number" name="Qty1" id="txtQty' + id + '" onblur="sumAmountItemByQty();" class="form-control Qty" /></td>';
    row += '<td data-name="td_Rate"><input type="number" name="Rate1" id="txtRate' + id + '" onblur="AmountItemByRate();" class="form-control rate" /></td>';
    row += '<td data-name="td_Amount"><input type="number" name="txtAmount1" id="txtAmountItem' + id + '"  class="form-control txtAmountItem" onblur=" TotalAmountItem();CalculateItemRateByAmount();"/></td>';
    row += '<td data-name="sel"><div id="td_project"><select id="ddlProjectItem' + id + '" style="width:160px;" name="Project1" class="form-control selectProjectOfItem"><option value="0">Select</option><option value="1">Project1</option><option value="2">Project2</option><option value="3">Project3</option></select></div></td>';
    row += '<td data-name="del"><button type="button" class="btn btn-danger glyphicon row-remove" id="btnRemoveRowItemDetail' + id + '"  style="background-color: white; color: black; border: none;"><span aria-hidden="true">×</span></button></td>';
    row += '</tr>';
    $('#tab_ItemDetail tbody').append(row);
    $('.selectProduct').select2({}).on('select2:open', function () {
        var a = $(this).data('select2');
        if (!$('.select2-link').length) {
            a.$results.parents('.select2-results')
                    .prepend('<div class="select2-link"><a style="font-weight:bold;"> + Add New</a></div>')
                    .on('click', function (b) {
                        $(".selectProduct").select2('close');
                        $("#AddInventoryModal").modal();
                        //show_confirm_AddProductAndServices();
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
    $("#tab_ItemDetail tbody tr").find("td button.row-remove").on("click", function () {
        if ($("#tab_ItemDetail tbody tr").length == 1) {
            $("#div_TotalItemAmount").hide();
        }
        $(this).closest("tr").remove();
        TotalAmountItem();
    });
}
function GetTodayDate() {
    var tdate = new Date();
    var dd = tdate.getDate(); //yields day
    var MM = tdate.toLocaleString('default', { month: 'short' }); //yields month
    var yyyy = tdate.getFullYear(); //yields year
    var currentDate = dd + "-" + (MM) + "-" + yyyy;

    return currentDate;
}
function DatePickerExample() {
    $(".datepicker").each(function () {
        if (!$(this).data('datepicker')) {
            $(this).datepicker({
                uiLibrary: 'bootstrap3',
                //value: todayDate,

                format: "dd-mmm-yyyy"

            }).val(GetTodayDate());
        }
        $(".datepicker").focus(function () {
            $(".datepicker").attr('readonly', 'true');
        });
    });
}

function AddRowItemDetail() {
    $("#add_rowProduct").on("click", function () {
        if ($("#btnEdit")[0].style.display == "") {
            return;
        }
        else {
            var id = $("#tab_ItemDetail tbody tr").length;
            row = '<tr id="' + id + '" data-id="' + id + '">';
            row += '<td data-name="sel"><div id="div_Class"><select id="ddlProduct' + id + '"style="width:160px;" name="product1"  class="form-control selectProduct "><option value="0">Select</option><option value="1">100 | Printer</option><option value="2">102 | Laptop</option><option value="3">103 | Era</option></select></div></td>';
            row += '<td data-name="td_Des"><input type="text" name="Desc1" id="txtDescription' + id + '" class="form-control Desc" /></td>';
            row += '<td data-name="td_Qty"><input type="number" name="Qty1" id="txtQty' + id + '" onblur="sumAmountItemByQty();" class="form-control Qty" /></td>';
            row += '<td data-name="td_Rate"><input type="number" name="Rate1" id="txtRate' + id + '" onblur="AmountItemByRate();" class="form-control rate" /></td>';
            row += '<td data-name="td_Amount"><input type="number" name="txtAmount1" id="txtAmountItem' + id + '"  class="form-control txtAmountItem" onblur=" TotalAmountItem();CalculateItemRateByAmount();"/></td>';
            row += '<td data-name="sel"><div id="td_project"><select id="ddlProjectItem' + id + '" style="width:160px;" name="Project1" class="form-control selectProjectOfItem"><option value="0">Select</option><option value="1">Project1</option><option value="2">Project2</option><option value="3">Project3</option></select></div></td>';
            row += '<td data-name="del"><button type="button" class="btn btn-danger glyphicon row-remove" id="btnRemoveRowItemDetail' + id + '"  style="background-color: white; color: black; border: none;"><span aria-hidden="true">×</span></button></td>';
            row += '</tr>';
            $('#tab_ItemDetail tbody').append(row);
            $('.selectProduct').select2({}).on('select2:open', function () {
                var a = $(this).data('select2');
                if (!$('.select2-link').length) {
                    a.$results.parents('.select2-results')
                            .prepend('<div class="select2-link"><a style="font-weight:bold;"> + Add New</a></div>')
                            .on('click', function (b) {
                                $(".selectProduct").select2('close');
                                $("#AddInventoryModal").modal();
                                //show_confirm_AddProductAndServices('');
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
            $("#tab_ItemDetail tbody tr").find("td button.row-remove").on("click", function () {
                $(this).closest("tr").remove();
                TotalAmountItem();
            });
            $("#div_TotalItemAmount").show();
        }

    });
}
function show_confirm_RemoveAllRowsFromBankDetail(message) {
    if ($("#btnEditReceived")[0].style.display == "") {
        return;
    }
    else {

        if ($('#tab_BankDetail tbody tr').length == 0) {
            showMessage('Please Add The Bank Detail', 'warning', '')
        }
        else {
            swal({
                title: 'Are you sure want to remove All Rows?',
                text: '',
                icon: "warning",
                buttons: ["No", "Yes"],
            }).then((ifyes) => {
                if (ifyes) {
                    $('#tab_BankDetail tbody tr').remove();
                    $('#lblCheckAmount').html('0.00');
                    $("#div_CalculateChequeAmount").hide();
                    //ResetScreen();
                }
            });
        }
    }
}
function show_confirm_RemoveAllRowsFromItemDetail(message) {
    swal({
        title: 'Are you sure want to renove All rows ?',
        text: '',
        icon: "warning",
        buttons: ["No", "Yes"],
    }).then((ifyes) => {
        if (ifyes) {
            $('#tab_ItemDetail tbody tr').remove();
            $("#div_TotalItemAmount").hide();
            sumAmountItem();
        }
    });

}
function show_confirm_RemoveAllRowsFromSaleVoucher(message) {
    if ($('#tblSaleVoucherDetail tbody tr').length != 0) {
        swal({
            title: 'Are you sure Want to Remove All Lines?',
            text: '',
            icon: "warning",
            buttons: ["No", "Yes"],
        }).then((ifyes) => {
            if (ifyes) {
                $('#tblSaleVoucherDetail tbody tr').remove();
                $("#lblTotalShow").hide();
                $('#lblTotal').html('0.00');
            }
        });
    }
}
function show_confirm_LeaveWithoutSavingSaleVoucher(message) {

    swal({
        title: 'Are you sure want to leave WithOut Saving?',
        text: '',
        icon: "warning",
        buttons: ["No", "Yes"],
    }).then((ifyes) => {

        if (ifyes) {
            $("#SaleVoucher").hide();
            $("#SaleVoucherEdit").hide();
            jQuery('#div_SaleList').show();// Allow next click to succeed
            setTimeout(function () { window.location.href = "http://localhost:42985/Sale.aspx"; }, 0);
        }
    });


}
function show_confirmSaveCustomer(message) {
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
            
            $('#overlay').fadeIn();

            $.when($.ajax(SaveCustomer())).then(function () {
                //Adnan
                $.when($.ajax(GetCustomers())).then(function () {
                    ResetCustomerForm();
                    $("#AddNewCustomer").hide();
                    $("#div_SaleList").show();
                    $('#btnCustomerReceived').attr('disabled', true);
                    //$("#ExpenseVoucher").hide();
                    //$("#ExpenseVoucherEdit").hide();
                    //jQuery('#div_ExpList').show();// Allow next click to succeed
                    //showMessage('Data Saved Successfully', 'success', '');
                    //setTimeout(function () { window.location.href = "http://localhost:42985/Sale.aspx"; }, 3000);
                });
            });
            $('#overlay').fadeOut();
        }
    });
}
function show_confirmReceived(message) {
    swal({
        title: 'Are you sure Want To Leave Without Saving?',
        text: '',
        icon: "warning",
        buttons: ["No", "Yes"],
    }).then((ifyes) => {
        if (ifyes) {
            $("#SaleVoucher").hide();
            $("#Received").hide();
            $("#btnReceive").hide();
            jQuery('#div_SaleList').show();
            AllVoucher();
            setTimeout(function () { window.location.href = "http://localhost:42985/Sale.aspx"; }, 0);
        }
    });
}
function show_confirmCustomerInformation(message) {
    var from = getUrlParameter('From');

    swal({
        title: 'Are you sure want to leave without saving?',
        text: '',
        icon: "warning",
        buttons: ["No", "Yes"],
    }).then((ifyes) => {
        if (ifyes) {
            if (from) {
                window.location.href = "http://localhost:42985/JournalEntry.aspx";
                return false;
            }

            $("#AddNewCustomer").hide();
            DisableCustomer();
            EnableCustomer();
            ResetCustomerForm();
            $("#div_SaleList").show();
            $('#btnCustomerReceived').attr('disabled', true);
        }
    });
}
function show_confirm_CustomerDetail(message) {
    swal({
        title: 'You Go to The Detail Then Lose The Data Of Voucher?',
        //text: message,
        icon: "warning",
        buttons: ["No", "Yes"],
    }).then((ifyes) => {
        if (ifyes) {

            AddNewCustomerDetail();
        }
    });

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
function show_confirm_AddTaxDetail(message) {
    swal({
        title: 'You Go to The Detail Then Lose The Data Of Voucher?',
        //text: message,
        icon: "warning",
        buttons: ["No", "Yes"],
    }).then((ifyes) => {
        if (ifyes) {
            window.location.href = "http://localhost:42985/Tax.aspx?Param=AddNewTaxRate";
        }
    });

}
function show_confirm_AddProductAndServices(message) {
    swal({
        title: 'You Go to The Detail Then Lose The Data Of Voucher?',
        //text: message,
        icon: "warning",
        buttons: ["No", "Yes"],
    }).then((ifyes) => {
        if (ifyes) {

            window.location.href = "http://localhost:42985/ProductAndServices.aspx?param=AddType";
        }
    });

}
function AddNewCustomerDetail() {

    jQuery('#div_SaleList').hide();
    jQuery('#SaleVoucher').hide();
    jQuery('#AddNewCustomer').show();
    //$("#txtVendorName").val($("#txtVendorNameModel").val());
    $("#AddCustomerModel").modal('hide');
}
function AllVoucher() {
    $("#div_SaleVoucherList").show();
    $("#div_NotReceivedVoucher").hide();
    $("#btnReceive").hide();
}
function AllNotReceivedVoucher() {
    $("#div_SaleVoucherList").hide();
    $("#div_NotReceivedVoucher").show();
    $("#btnReceive").show();
    $("#chkAll").attr('disabled', true);
}
function ReceivedPage() {
    var checkBox = $("#tblNotReceived tbody tr").find('input[type="checkbox"]');
    $(checkBox).each(function () {
        if (this.checked) {
            $(checkBox).prop("checked", false);
            $("#btnReceive").attr('disabled', true);
        }
    })
    jQuery('#div_SaleList').hide();
    jQuery('#SaleVoucher').hide();
    $("#btnInActive").hide();
    $("#btnEditReceived").hide();
    $("#btnDeleteReceived").hide();
    $("#lblStatus").hide();
    jQuery('#Received').show();
    CheckCustomerBalance();
}
function ClickCheckBox() {
    var $Recive = $("#btnReceive").attr('disabled', true),
   $cbs = $('input[type="checkbox"]').click(function () {
       if (($cbs.is(":checked"))) {
           var $Recive = $("#btnReceive").attr('disabled', false);
       }
       else {
           var $Recive = $("#btnReceive").attr('disabled', true);
       }

   });
}
function ClickCheckBoxValidate() {

    $cbs = $('input[id="chkshowValidation"]').click(function () {
        if (($cbs.is(":checked")))
            $('#lblNTN').text('NTN / CNIC *');
        else
            $('#lblNTN').text('NTN / CNIC ');
    });
}

function ClickCheckBoxCustomerCredit() {
    var $Pay = $("#di_UseCredit").hide(),
   $cbs = $('input[id="chkUseCredit"]').click(function () {
       $Pay.toggle($cbs.is(":checked"));
       checkCustomerCredit();
   });
}
function ValidateCustomer() {
    if ($('#chkshowValidation').prop("checked") == true) {
        if ($('#txtCustomerName').val().match(AlphaNumericRegex)) {

        }
        else {
            showMessage('Enter Customer Name', 'danger', '')
            $('#txtCustomerName').focus();
            return false;
        }
        if ($('#txtNtnNo').val().match(CNICRegex)) {
            show_confirmSaveCustomer();
        }
        else {
            showMessage('Enter Valid NTN or CNIC', 'danger', '');
            $('#txtNtnNo').focus();
            return false;
        }
    }
    else {
        if ($('#txtCustomerName').val().match(AlphaNumericRegex)) {
            show_confirmSaveCustomer();
        }
        else {
            showMessage('Enter Customer Name', 'danger', '')
            $('#txtCustomerName').focus();
            return false;
        }
    }
}
function VerifyCustomer() {
    if ($('#btnEditCustomer')[0].style.display != "none")
        return
    else {
        if ($('#txtNtnNo').val().match(CNICRegex)) {
            var copyText = document.getElementById("txtNtnNo");
            copyText.select();
            document.execCommand("copy");
            window.open("https://e.fbr.gov.pk/esbn/Service.aspx?PID=lmPn%2fLtGhNykqPqtHCLZzg%3d%3d", '_blank');
        }
        else {
            showMessage('Enter Valid NTN or CNIC', 'danger', '');
            $('#txtNtnNo').focus();
            return false;
        }

    }
}
function ResetCustomerForm() {
    txtCustomerName.value = "";
    ddlLegal.selectedIndex = 0;
    $('#select2-ddlLegal-container').text('Select');
    txtNtnNo.value = "";
    txtStrnNo.value = "";
    txtAtl.value = "";
    txtCantactNo.value = "";
    $('#CustomerAsOFdate').val(GetTodayDate());

    ddlTaxProfile.selectedIndex = 0
    $('#select2-ddlTaxProfile-container').text('Select');
    txtBusinessActivity.value = "";
    txtAccountNo.value = "";
    txtAddress.value = "";
    ddlCity.selectedIndex = 0;
    $('#select2-ddlCity-container').text('city');
    ddlCountry.selectedIndex = 0;
    $('#select2-ddlCountry-container').text('Country');
    txtOpeningBalance.value = "";
    ddlCustomerAccount.selectedIndex = 0;
    $('#select2-ddlCustomerAccount-container').text('Select');
    txtNotes.value = "";
    $("#chkshowValidation").prop("checked", false);

}

function AddNewCustomer() {
    jQuery('#div_SaleList').hide();
    $('#btnEditCustomer').hide();

    jQuery('#AddNewCustomer').show();
    $('#chkStatus').prop('checked', true);
    $("#CustomerAsOFdate").attr('disabled', 'disabled');
    $("#CustomerAsOFdate").css({ 'cssText': 'background: #dddddd !important' });
    $('#CustomerAsOFdate').next().hide();
    $('#CustomerAsOFdate').val('');
}
function DisableCustomer() {
    if ($("#AddNewCustomer").find('select').data('select2'))
        $("#AddNewCustomer").find('select').select2('destroy');
    $('#AddNewCustomer').find('input, textarea, button, select,span').attr('disabled', 'disabled');
    $('#AddNewCustomer').find('input, textarea, button,select,span').css({ 'cssText': 'background: #dddddd !important' });
    $('#AddNewCustomer').find(('.datepicker:input[type="text"]')).prop('disabled', true);
    $('.gj-icon').hide();
    $('a').attr('disabled', true);
    $("#btnEditCustomer").attr('disabled', false);
    $("#btnEditCustomer").css({ 'cssText': 'background:' });
}
function EnableCustomer() {
    
    $('#AddNewCustomer').find('input, textarea, button, select,span').attr('disabled', false);
    $('#AddNewCustomer').find('input, textarea, button,select,span').css({ 'cssText': 'background:' });
    $('#AddNewCustomer').find(('.datepicker:input[type="text"]')).prop('disabled', false);
    if ($('#txtOpeningBalance').val() == "") {
        $("#CustomerAsOFdate").attr('disabled', 'disabled');
        $("#CustomerAsOFdate").css({ 'cssText': 'background: #dddddd !important' });
        $('#CustomerAsOFdate').next().hide();
        $('#CustomerAsOFdate').val('');
    }
    else
        $('.gj-icon').show();
    $('a').attr('disabled', false);
    $("#AddNewCustomer").find('select').select2({ width: '100%' });
    $('#btnEditCustomer').hide();
}
function CustomerReceivePage() {
    jQuery('#div_SaleList').hide();
    jQuery('#SaleVoucher').hide();
    jQuery('#Received').show();
    document.getElementById('Received').setAttribute('source', 'Customer');
}
function ClickCheckBoxCustomerList() {
    var $ReceivedCustomer = $("#btnCustomerReceived").attr('disabled', true),
   $cbs = $('input[type="checkbox"]').click(function () {
       if (($cbs.is(":checked"))) {
           var $ReceivedCustomer = $("#btnCustomerReceived").attr('disabled', false);
       }
       else {
           var $ReceivedCustomer = $("#btnCustomerReceived").attr('disabled', true);
       }

   });
}

function sumAmountAccount() {
    var sum = 0.00;
    $('.txtAmount').each(function () {
        if ($(this).val() != '')
            sum = parseFloat(sum) + parseFloat($(this).val());
    });
    $('#lblTotal').html(sum.toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 }));
}
function sumInvoiceAmount() {
    var sum = 0.00;
    $(".InvoiceAmount").each(function () {
        sum = sum + parseFloat($("#lblInvoiceAmount").text().replace(/,/g, ''));
        $("#lbltotalInvoiceAmount").html(sum.toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 }));
    })
}
function sumAmountItem() {
    var sum = 0.00;
    $('.rate').each(function () {
        if ($(this).val() != '')
            sum = parseInt(sum) + parseInt($(this).val());
    });
    $('#lbltotalItem').html(sum.toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 }));

}
function sumAmountItemByQty() {
    var product = 0.00;
    $('.Qty').each(function () {
        if ($(this).val() != '') {
            var tr = $("#tab_ItemDetail tbody tr");
            var rowID = this.id.replace('txtQty', '');
            rate = $('#txtRate' + rowID).val();
            if (rate == "") {
                var rate = '0.00';
                product = parseFloat($(this).val()) * parseFloat(rate);
                $('#txtAmountItem' + rowID).val(product.toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 }));
                TotalAmountItem();
            }
            else {
                product = parseFloat($(this).val()) * parseFloat(rate);
                $('#txtAmountItem' + rowID).val(product.toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 }));
                TotalAmountItem();
            }
        }
        else {
            var tr = $("#tab_ItemDetail tbody tr");
            var rowID = this.id.replace('txtQty', '');
            $('#txtAmountItem' + rowID).val('0.00');
            TotalAmountItem();
        }
    });
}
function AmountItemByRate() {

    var product = 0.00;
    $('.rate').each(function () {
        if ($(this).val() != '') {
            var tr = $("#tab_ItemDetail tbody tr");
            var rowID = this.id.replace('txtRate', '');
            Qty = $('#txtQty' + rowID).val();
            if (Qty == "") {
                var Qty = '0.00';
                product = parseFloat($(this).val()) * parseFloat(Qty);
                $('#txtAmountItem' + rowID).val(product);
                TotalAmountItem();
            }
            else {
                product = parseFloat($(this).val()) * parseFloat(Qty);
                $('#txtAmountItem' + rowID).val(product);
                TotalAmountItem();
            }
        }
        else {
            var tr = $("#tab_ItemDetail tbody tr");
            var rowID = this.id.replace('txtRate', '');
            $('#txtAmountItem' + rowID).val('0.00');
            TotalAmountItem();
        }
    });
}
function CalculateItemRateByAmount() {

    var result = 0.00;
    $('.txtAmountItem').each(function () {
        if ($(this).val() != '') {

            var rowID = this.id.replace('txtAmountItem', '');
            var Qty = $('#txtQty' + rowID).val();
            if (Qty == "") {
                var Amount = '0.00';
                result = parseFloat($(this).val());
                $('#txtRate' + rowID).val(result);
                TotalAmountItem();
            }
            else {
                product = parseFloat($(this).val()) / parseFloat(Qty);
                $('#txtRate' + rowID).val(product);
                TotalAmountItem();
            }
        }
        else {
            var tr = $("#tab_ItemDetail tbody tr");
            var rowID = this.id.replace('txtRate', '');
            $('#txtAmountItem' + rowID).val('0.00');
            TotalAmountItem();
        }
    });
}
function TotalAmountItem() {
    var Length = $("#tab_ItemDetail tbody tr").length;
    if (Length != 0) {
        var total = 0.00;
        $('.txtAmountItem').each(function () {
            if ($(this).val() != '') {
                var rowID = this.id.replace('txtAmountItem', '');
                var TotalAmount = parseFloat($('#txtAmountItem' + rowID).val());
                total = total + TotalAmount;
                $('#lbltotalItem').html(total.toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 }));
            }
            else {
                $('#lbltotalItem').html(total.toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 }));
            }
        });
    }
    else {
        $('#lbltotalItem').html('0.00');
    }
}
function sumChequeAmountBank() {
    var sum = 0.00;
    $('.txtCheckAmount').each(function () {
        if ($(this).val() != '')
            sum = parseInt(sum) + parseInt($(this).val());
    });
    $('#lblCheckAmount').html(sum.toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 }));
}
function CalculateNetAmount() {
    var diff = 0.00;
    var invoiceAmount = parseFloat($("#lblInvoiceAmount").text().replace(/,/g, ''));

    if ($(".txtDiscount").val() != '') {
        if ($(".txtDiscount").val().match(RegexForPositiveIncludeZero)) {
            if (parseFloat($(".txtDiscount").val()) > parseFloat($("#lblInvoiceAmount").text().replace(/,/g, ''))) {
                $(".txtDiscount").val('');
                $('#lblNetAmount').html(invoiceAmount.toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 }));
            }
            else {
                $("#txtReceived0").val('');
                var button = ' <a href="#" title="Add Tax" id="btnAddTax" onclick="AddTax(this);"><i class="fa fa-plus "></i></a>';
                $("#td_TaxName0")[0].innerHTML = button;
                $("#td_TaxAmount0")[0].innerHTML = "";
                $("#lblReceived0").text('0.00');
                $("#lblCalculateReceived").text('0.00');
                TaxCalculate();

                //Code End
                //$("#txtPayment0").val('0');
                //CalculatePayment_OnKeyUp(event);
                var discount = $(".txtDiscount").val();
                diff = parseFloat(invoiceAmount).toFixed(2) - parseFloat(discount).toFixed(2)
                $('#lblNetAmount').html(diff.toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 }));
            }
        }
        else {
            $(".txtDiscount").val('');
        }
    }
    else {
        var discount = 0;
        diff = parseFloat(invoiceAmount).toFixed(2) - parseFloat(discount).toFixed(2)
        $('#lblNetAmount').html(diff.toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 }));
    }
}
function CalculateReceived_OnKeyUp(event) {
    var Received = 0.00;
    if ($(".txtReceive").val().match(RegexForPositiveIncludeZero)) {
        var Received = 0.00;

        var NetAmount = parseFloat($("#lblNetAmount").text().replace(/,/g, ''));

        if ($(".txtReceive").val() != '') {
            var AmountToReceive = parseFloat($(".txtReceive").val());
            if (AmountToReceive > NetAmount) {
                showMessage('your Receive is exceed from netAmount', 'danger', '');
                $(".txtReceive").val(NetAmount);
                $('#lblReceived0').html(parseFloat(NetAmount).toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 }));
                $('#lblCalculateReceived').html(parseFloat(NetAmount).toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 }));
                var ActiveElement = document.activeElement.id;
                var id = ActiveElement.replace('txtReceived', '');
                $("#td_TaxName" + id).empty();
                $("#td_TaxAmount" + id).empty();
                var button = ' <a href="#" title="Add Tax" id="btnAddTax" onclick="AddTax(this);"><i class="fa fa-plus "></i></a>';
                $("#td_TaxName" + id)[0].innerHTML = button;

                event.preventDefault();
                return false;
            }
            else {
                Received = parseFloat(AmountToReceive).toFixed(2);
                $('#lblReceived0').html(parseFloat(Received).toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 }));
                $('#lblCalculateReceived').html(parseFloat(Received).toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 }));
                CalculateTotalReceived();
                ChangeCustomerCredit();
            }
        }
        else {

            $('#lblReceived0').html('0.00');
            $('#lblCalculateReceived').html('0.00');
            CalculateTotalReceived();
            ChangeCustomerCredit();
        }
        TaxCalculate();
        return true;
    }
    else {
        $(".txtReceive").val('');
        $('#lblReceived0').html(parseFloat(Received).toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 }));
        $('#lblCalculateReceived').html(parseFloat(Received).toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 }));
        return false;
    }
}

function CheckCustomerBalance() {
    var a = $("#lblBalance").text();
    if (a.charAt(0) != '-') {
        $("#chkUseCredit").hide();
    }
    else
        $("#chkUseCredit").show();
}
function checkCustomerCredit() {
    var a = Math.abs(parseFloat($("#lblBalance").text().replace(/,/g, '')));
    var b = Math.abs(parseFloat($("#lblCalculateReceived").text().replace(',', '', '-', '')));
    if (a > b) {
        $("#txtUseCustomerCredit").val(b);
        var c = b - parseFloat($("#txtUseCustomerCredit").val())
        $("#lblCustomerCredit").html(c);
    }
    else
        $("#txtUseCustomerCredit").val(a);
    var c = b - parseFloat($("#txtUseCustomerCredit").val());
    $("#lblCustomerCredit").text(c);
}
function ChangeCustomerCredit() {

    if ($("#lblCalculateReceived").text() == "NaN") {
        $("#lblCalculateReceived").text('0');
    }
    var b = Math.abs(parseFloat($("#lblCalculateReceived").text().replace(',', '', '-', '')));
    var c = b - parseFloat($("#txtUseCustomerCredit").val());
    if ($("#txtUseCustomerCredit").val() != '') {
        $("#lblCustomerCredit").text(c.toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 }));
    }
    else
        $("#lblCustomerCredit").text(b.toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 }));
}

function CalculateTotalReceived() {

    var ActiveRow = document.activeElement.id;
    id = ActiveRow.replace('txtReceived', '');

    $("#td_TaxName" + id).empty();
    $("#td_TaxAmount" + id).empty();
    var button = ' <a href="#" title="Add Tax" id="btnAddTax" onclick="AddTax(this);"><i class="fa fa-plus "></i></a>';
    $("#td_TaxName" + id)[0].innerHTML = button;
    var Sum = 0.00;
    $(".lblTax").each(function () {
        Sum += parseFloat($(this).text());
        var Received = parseFloat($("#lblReceived0").text().replace(/,/g, ''));
        $('#lblCalculateReceived').html(Received + Sum);
        ChangeCustomerCredit();
    });
    ChangeCustomerCredit();
}
function AddTaxToSaleVoucher() {

    if ($("#tblSaleVoucherDetail tbody tr").length == 0) {
        showMessage('please first enter Invoice', 'warning', '');
        $('#select2-ddlAddTax-container')[0].innerText = '-Select-';
        $('#ddlAddTax')[0].selectedIndex = 0;
    }
    else {
        lastRowNo = $("#tblSaleVoucherDetail tbody tr").length - 1;
        is_tax = $("#tblSaleVoucherDetail tbody tr")[lastRowNo].getAttribute('is_tax');
        if (is_tax == "false") {
            ValidateSaleVoucher();
        }
        else {
            AddRowSaleVoucher_OnTax();
        }
    }
}
function removeReceiveRow(btn) {
    if ($("#tblReceived tbody tr").length == 1) {

    }
    else {
        tr = $(btn).closest("tr");
        id = tr.attr('data-id');

        if ($('#lblTax' + id).length != 0) {
            value = $('#lblTax' + id)[0].getAttribute('value');
        }
        tr.remove();
        CalculateReceived();
        CalculateTax();
    }

}
function AddTax(btn) {
    if ($("#btnEditReceived")[0].style.display == "") {
        return;
    }
    else {
        if ($('.txtReceive').val() == "") {
            showMessage('please enter Amount to Receive ', 'danger', '')
        }
        else {
            $("#AddTax1 option").each(function () {
                this.disabled = false;
            });
            $("#tblTaxReceived tbody tr").remove();
            tr = $(btn).closest("tr");
            Pid = tr.attr('data-id');
            $("#txtHidden").val(Pid);
            var Label = $("#td_TaxName" + Pid).find('Label');
            var Array = [];
            if (Label.length != 0) {
                $(".TaxName").each(function () {

                    var Taxes = $(".TaxName")[Pid].innerHTML;
                    var taxValue = $(".TaxName")[Pid].getAttribute('value')
                    var TaxAmount = $(".TaxAmount")[Pid].innerHTML;
                    Array.push([{ Taxes, taxValue, TaxAmount}]);
                    var id = $("#tblTaxReceived tbody tr").length;
                    row = '<tr id="row' + id + '" data-id="' + id + '">';
                    row += '<td><label id="lblTax' + id + '" class="lblTaxName" value="' + taxValue + '">' + Taxes + '</label></td>'
                    row += '<td><label id="lblTaxAmount' + id + '">' + TaxAmount + '</label></td>'
                    row += '<td> <button type="button" id="btnRemoveReceived' + id + '" onclick="removeReceivedRowFromPopup(this);" class="btn btn-danger glyphicon   row-remove" style="background-color: white; color: black; border: none;"><span aria-hidden="true">×</span></button></td>';
                    row += '</tr>';
                    $('#tblTaxReceived tbody').append(row);
                    $("#AddTax1 option").each(function () {
                        if (this.value == taxValue) {
                            this.disabled = true;
                        }
                    });
                    Pid++;
                })
            }
            $("#AddTaxReceived").modal();
        }
    }
}
function removeReceivedRowFromPopup(btn) {
    tr = $(btn).closest("tr");
    id = tr.attr('data-id');
    if ($('#lblTax' + id).length != 0) {
        value = $('#lblTax' + id)[0].getAttribute('value');
        $("#AddTax1 option").each(function () {
            if (this.value == value) {
                this.disabled = false;
            }
        });
    }
    tr.remove();
}
function AddTaxToTable() {

    var TaxName = $("#AddTax1 option:selected").text();
    if ($("#txttaxAmount").val().match(RgexforPositiveNumberWithoutZero)) {
        var Amount = $("#txttaxAmount").val();
        if (TaxName == "-Select-" || Amount == "") {
            showMessage("please Select Tax and Enter Amount of Tax", 'warning', '')
        }
        else {
            var id = $("#tblTaxReceived tbody tr").length;
            row = '<tr id="row' + id + '" data-id="' + id + '">';
            row += '<td><label id="lblTax' + id + '" class="lblTaxName" value="' + $("#AddTax1 option:selected").val() + '">' + $("#AddTax1 option:selected").text() + '</label></td>'
            row += '<td><label id="lblTaxAmount' + id + '">' + $("#txttaxAmount").val() + '</label></td>'
            row += '<td> <button type="button" id="btnRemoveReceived' + id + '" onclick="removeReceivedRowFromPopup(this);" class="btn btn-danger glyphicon   row-remove" style="background-color: white; color: black; border: none;"><span aria-hidden="true">×</span></button></td>';
            row += '</tr>';
            $('#tblTaxReceived tbody').append(row);
            $("#AddTax1 option:selected").attr('disabled', 'disabled')
            $('#select2-AddTax1-container')[0].innerText = '-Select-';
            $('#AddTax1')[0].selectedIndex = 0;
            $("#txttaxAmount").val('');
        }
    }
    else
        showMessage('please Enter Valid Tax Amount', 'danger', '');
}
function SaveTaxOnInvoice() {

    var length = $("#tblTaxReceived tbody tr").length;
    if (length != 0) {
        var tr = $("#tblTaxReceived tbody tr");
        id = tr.attr('id');
        var rowID = id.replace('row', '');
        taxArray = [];
        $(".lblTaxName").each(function () {
            var Taxes = $("#lblTax" + rowID).text().replace(/^, /, '');
            var taxValue = $("#lblTax" + rowID)[0].getAttribute('value')
            var TaxAmount = $("#lblTaxAmount" + rowID).text();
            taxArray.push([{ Taxes, taxValue, TaxAmount}]);
            rowID++;
        })
        var tr = $("#tblTaxReceived tbody tr");
        id = tr.attr('id');
        var rowID = id.replace('row', '');
        id = $("#txtHidden").val();
        $("#td_TaxName" + id).empty();
        $("#td_TaxAmount" + id).empty();
        $("#lblReceived" + id).text('');
        var TotalSum = 0.0;
        var button = ' <a href="#" title="Add Tax" id="btnAddTax" onclick="AddTax(this);"><i class="fa fa-plus "></i></a>';
        $("#td_TaxName" + id)[0].innerHTML = button;
        $(".lblTaxName").each(function () {
            index = $("#" + $("#lblTax" + rowID).parent().parent()[0].getAttribute('id')).index();
            var length = taxArray.length;
            var labelTaxNameAndValue = '<label class="TaxName" value="' + taxArray[rowID][0].taxValue + '" style="margin-left: 10px;">' + taxArray[rowID][0].Taxes + '</label><br />';
            var labelTaxAmount = '<label class="TaxAmount" value="">' + taxArray[rowID][0].TaxAmount + '</label> <br />';
            Sum = parseFloat(taxArray[rowID][0].TaxAmount);
            TotalSum += Sum;
            $("#td_TaxName" + id)[0].innerHTML += labelTaxNameAndValue;
            $("#td_TaxAmount" + id)[0].innerHTML += labelTaxAmount;
            rowID++;
        });
        if (TotalSum > parseFloat($('.txtReceive').val())) {
            showMessage('please enter tax is less than Receive Amount', 'danger', '')
            $("#td_TaxName" + id).empty();
            $("#td_TaxAmount" + id).empty();
            var Receive = parseFloat($('.txtReceive').val()).toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 });
            $("#lblReceived" + id).text(Receive);
            $("#lblCalculateReceived").text(Receive);
            var button = ' <a href="#" title="Add Tax" id="btnAddTax" onclick="AddTax(this);"><i class="fa fa-plus "></i></a>';
            $("#td_TaxName" + id)[0].innerHTML = button;
            $("#td_TaxAmount" + id)[0].innerHTML = "";
        }
        else {
            TaxCalculate();
        }

    }
    else {

        var button = ' <a href="#" title="Add Tax" id="btnAddTax" onclick="AddTax(this);"><i class="fa fa-plus "></i></a>';
        $("#td_TaxName" + id)[0].innerHTML = button;
        $("#td_TaxAmount" + id)[0].innerHTML = "";
        TaxCalculate();
        //CalculateNetAmount();
    }
}
function TaxCalculate() {

    var length = $("#tblReceived tbody tr").length;
    var tr = $("#tblReceived tbody tr");
    id = tr.attr('id');
    var rowID = id.replace('row', '');
    id = $("#txtHidden").val();
    var TotalSum = 0.0;
    if ($(".TaxAmount").length != 0) {
        $(".TaxAmount").each(function () {
            SumTax = parseFloat($(".TaxAmount")[rowID].innerText.replace(/,/g, ''));
            TotalSum += SumTax;
            rowID++;
        });

        if ($("#txtReceived" + id).val() == "")
            $("#lblReceived" + id).text('0');
        else
            $("#lblReceived" + id).text($("#txtReceived" + id).val());

        var total = parseFloat($("#lblReceived" + id).text().replace(/,/g, '')) - TotalSum;
        $("#lblReceived" + id).html(total.toLocaleString());
        $("#lblCalculateReceived").html(total.toLocaleString());
        ChangeCustomerCredit();

    }
    else {
    }
}
function InvoiceDate_onchange() {
    $('#DueDate').val($('#InvoiceDate').val());
}
function DueDate_OnChange() {

    var dueDate = $("#DueDate").val();
    var InvoiceDate = $("#InvoiceDate").val();
    if (Date.parse(dueDate) >= Date.parse(InvoiceDate)) {

    }
    else {
        showMessage('Your Due Date is not Previous from InvoiceDate', 'danger');
        $("#DueDate").val(InvoiceDate);
    }
}
function ValidateSaleVoucher(txtUsername) {
    if ($("#ddlSelectCustomer").val() != '0') {
        $("#lblEror").text("");
    }
    else {

        $("#lblEror").text("select Customer");
        $("#ddlSelectCustomer")[0].focus();
        $('#ddlAddTax')[0].selectedIndex = 0;

        return false;
    }
    if ($("#txtInvoice").val().match(AlphaNumericRegex)) {
        $("#lblInvoiceEror").text("");

    }
    else {
        $("#lblInvoiceEror").text("enter valid invoice no");
        $("#txtInvoice")[0].focus();
        $('#ddlAddTax')[0].selectedIndex = 0;
        return false;
    }
    if ($("#InvoiceDate").val() != "") {
        $("#lblInvoiceDateEror").text("");
    }
    else {
        $("#lblInvoiceDateEror").text("enter invoice date");
        $("#InvoiceDate")[0].focus();
        $('#ddlAddTax')[0].selectedIndex = 0;
        return false;
    }
    if ($("#voucherno").val().match(AlphaNumericRegex)) {
        $("#lblVoucherNoEror").text("");
    }
    else {
        $("#lblVoucherNoEror").text("enter valid voucher no");
        $("#voucherno")[0].focus();
        $('#ddlAddTax')[0].selectedIndex = 0;
        return false;
    }
    if ($("#VoucherDate").val() != "") {
        $("#lblVoucherDateEror").text("");
        if ($("#tblSaleVoucherDetail tbody tr").length == 0) {
            showMessage('please Add Detail To Voucher', 'danger', '');
        }
        else
            ValidateAccount();


    }
    else {
        $("#lblVoucherDateEror").text("enter voucher date");
        $("#VoucherDate")[0].focus();
        $('#ddlAddTax')[0].selectedIndex = 0;
        return false;
    }

}
function ValidateAccount() {
    RowID = tr = $("#tblSaleVoucherDetail tbody tr")[0].getAttribute('id');
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
            $('#ddlAddTax')[0].selectedIndex = 0;
            return false;
        }
        rowNo++;
    });
    if (isValid)
        ValidateMemo();
}
function ValidateMemo() {
    RowID = tr = $("#tblSaleVoucherDetail tbody tr")[0].getAttribute('id');
    rowNo = RowID.replace('row', '');
    isValid = false;
    $(".memo").each(function () {
        if ($(this).val() != "") {
            isValid = true;
        }
        else {
            showMessage('please Enter Memo', 'danger', '');
            isValid = false;
            $('#ddlAddTax')[0].selectedIndex = 0;
            $("#txtMemo" + rowNo)[0].focus();
            return false;
        }
        rowNo++;
    });
    if (isValid)
        ValidateAmount();
}
function ValidateAmount() {
    RowID = tr = $("#tblSaleVoucherDetail tbody tr")[0].getAttribute('id');
    rowNo = RowID.replace('row', '');
    isValid = false;
    $(".txtAmount").each(function () {
        if ($(this).val().match(RegexForInteger)) {
            isValid = true;
        }
        else {
            showMessage('please Enter Amount', 'danger', '');
            isValid = false;
            $("#txtAmount" + rowNo).focus();
            $('#ddlAddTax')[0].selectedIndex = 0;
            return false;
        }
        rowNo++;
    });
    if (isValid) {
        if ($("#Product_Detail")[0].style.display != "none") {
            if (document.activeElement.id != "btnSave") {

            }
            else {
                if ($("#tab_ItemDetail tbody tr").length != 0) {


                    isValid = ValidateItem();
                }
                else {
                    showMessage('Add The Item Detail', 'warning', '');
                    isValid = false;
                }
            }

        }
    }
    if (isValid && document.activeElement.id == "btnSave") {

        if (parseFloat($("#lbltotalItem").text().replace(/,/g, '')) > parseFloat($("#lblTotal").text().replace(/,/g, ''))) {
            showMessage('Your Product  Amount is greater then Invoice Amount', 'warning', '');
            isValid = false;
            return false;
        }
        else
            show_confirm('');
    }
    else if (document.activeElement.id != "btnSave" && isValid) {
        AddRowSaleVoucher_OnTax();
    }
}
function ValidateItem() {
    RowID = tr = $("#tab_ItemDetail tbody tr")[0].getAttribute('id');
    rowNo = RowID.replace('row', '');

    isValid = false;
    $(".selectProduct").each(function () {
        if ($(this).val() != 0) {
            isValid = true;
        }
        else {
            showMessage('please select Item', 'danger', '');
            isValid = false;
            $("#ddlProduct" + rowNo)[0].focus();
            return false;
        }
        rowNo++

    });
    if (isValid)
        ValidateQtyByItem();
    return isValid;
}
function ValidateQtyByItem() {
    RowID = tr = $("#tab_ItemDetail tbody tr")[0].getAttribute('id');
    rowNo = RowID.replace('row', '');
    isValid = false;
    $(".Qty").each(function () {
        if ($(this).val().match(RegexForInteger)) {
            isValid = true;
        }
        else {
            showMessage('please Enter Quantity', 'danger', '');
            isValid = false;
            $("#txtQty" + rowNo)[0].focus();
            return false;
        }
        rowNo++;
    });
    if (isValid)
        return ValidateRateByItem();
    else
        return isValid;
}
function ValidateRateByItem() {
    RowID = tr = $("#tab_ItemDetail tbody tr")[0].getAttribute('id');
    rowNo = RowID.replace('row', '');
    isValid = false;
    $(".rate").each(function () {
        if ($(this).val().match(RegexForInteger)) {
            isValid = true;
        }
        else {
            showMessage('please Enter Rate', 'danger', '');
            isValid = false;
            $("#txtRate" + rowNo)[0].focus();
            return false;
        }
        rowNo++;
    });
    if (isValid)
        return ValidateAmountByItem();
    else
        return isValid;
}

function ValidateAmountByItem() {
    RowID = tr = $("#tab_ItemDetail tbody tr")[0].getAttribute('id');
    rowNo = RowID.replace('row', '');
    isValid = false;
    $(".txtAmountItem").each(function () {
        if ($(this).val().match(RegexForInteger)) {
            isValid = true;
        }
        else {
            showMessage('please Enter Amount', 'danger', '');
            isValid = false;
            $("#txtAmountItem" + rowNo)[0].focus();
            return false;
        }
        rowNo++;
    });
    return isValid;
    //if (isValid)
    //    //ValidateProjectByItem();
}
function ValidateProjectByItem() {
    RowID = tr = $("#tab_ItemDetail tbody tr")[0].getAttribute('id');
    rowNo = RowID.replace('row', '');

    isValid = false;
    $(".selectProjectOfItem").each(function () {
        if ($(this).val() != 0) {
            isValid = true;
        }
        else {
            showMessage('please select project', 'danger', '');
            isValid = false;
            $("#ddlProjectItem" + rowNo)[0].focus();
            return false;
        }
        rowNo++;
    });
    if (isValid)
        show_confirm('are you print this');
}
//End Of Item Detail Validation 
function ValidateSaleVoucherReceived(txtUsername) {

    if ($("#txtReceiveVoucher").val().match(AlphaNumericRegex)) {
        $("#lblReceiveVoucherEror").text("");
    }
    else {
        $("#lblReceiveVoucherEror").text("Enter Valid Voucher No");
        $("#txtReceiveVoucher")[0].focus();
        return false;
    }
    if ($("#di_UseCredit")[0].style.display != 'none') {
        if (($("#txtUseCustomerCredit").val().match(RegexForPositiveIncludeZero))) {

        }
        else {
            showMessage('Please Enter Valid Balace Amount', 'danger', '');
            $("#txtUseCustomerCredit")[0].focus();
            return false
        }

    }
    if ($("#VoucherDateReceived").val() != "") {
        $("#lblReceiveVoucherDateEror").text("");
        if ($("#tab_BankDetail tbody tr").length == 0) {
            if ($("#di_UseCredit")[0].style.display != 'none') {
                if (parseFloat($("#lblCustomerCredit").text().replace(/,/g, '')) == 0) {
                    SummeryData();
                    //show_confirm('Are You Sure Want To Print This');
                }
                else if (parseFloat($("#lblCustomerCredit").text().replace(/,/g, '')) < 0) {
                    showMessage('Your Balance Is Greater Then Invoice Amount', 'warning', '');
                }
                else if (parseFloat($("#lblCustomerCredit").text().replace(/,/g, '')) > 0) {
                    showMessage('Please Add Your Bank Detail', 'warning', '');
                }
            }
            else {
                if (parseFloat($("#lblCalculateReceived").text().replace(/,/g, '')) == 0) {
                    SummeryData();
                    //showMessage('please remove your bank detail', 'warning', '');
                }
                else if (parseFloat($("#lblCalculateReceived").text().replace(/,/g, '')) > 0) {
                    showMessage('please Add your bank detail', 'warning', '');
                }
            }
        }
        else {
            if ($("#di_UseCredit")[0].style.display != 'none') {
                if (parseFloat($("#lblCustomerCredit").text().replace(/,/g, '')) == 0) {
                    //showMessage('Please Remove The Cheque No', 'warning', '');
                    showMessage('remove all rows from bank detail', 'warning', '');
                }
                else
                    if (parseFloat($("#lblCustomerCredit").text().replace(/,/g, '')) < 0) {
                        showMessage('Your Balance Is Greater Then Invoice Amount', 'warning', '');
                    }
                    else if (parseFloat($("#lblCustomerCredit").text().replace(/,/g, '')) > 0) {
                        ValidateBank_BankDetail();
                    }
            }
            else {
                if (parseFloat($("#lblCalculateReceived").text().replace(/,/g, '')) == 0) {
                    showMessage('please remove your bank detail', 'warning', '')
                }
                else
                    ValidateBank_BankDetail();
            }

        }
    }
    else {
        $("#lblReceiveVoucherDateEror").text("Enter Receive Voucher Date");
        $("#VoucherDateReceived")[0].focus();
        return false;
    }
}
function ValidateBank_BankDetail() {
    RowID = tr = $("#tab_BankDetail tbody tr")[0].getAttribute('id');
    rowNo = RowID.replace('row', '');
    //
    isValid = false;
    $(".selectBank ").each(function () {
        if ($(this).val() != 0) {
            isValid = true;
        }
        else {
            showMessage('please select Bank', 'danger', '');
            isValid = false;
            $("#ddlBank" + rowNo)[0].focus();
            return false;
        }
        rowNo++

    });
    if (isValid)
        ValidateCheque_BankDetail()
}
function ValidateCheque_BankDetail() {
    RowID = tr = $("#tab_BankDetail tbody tr")[0].getAttribute('id');
    rowNo = RowID.replace('row', '');
    isValid = false;
    $(".chequeNo ").each(function () {
        if ($(this).val().match(AlphaNumericRegex)) {
            isValid = true;
        }
        else {
            showMessage('please Enter Valid Cheque No', 'danger', '');
            $("#txtChequeNo" + rowNo)[0].focus();
            isValid = false;
            return false;
        }
        rowNo++
    });
    if (isValid)
        ValidateChequeDate_BankDetail();
}
function ValidateChequeDate_BankDetail() {
    RowID = tr = $("#tab_BankDetail tbody tr")[0].getAttribute('id');
    rowNo = RowID.replace('row', '');
    isValid = false;
    $(".chkDate").each(function () {
        if ($(this).val() != "") {
            isValid = true;
        }
        else {
            showMessage('please select Date', 'danger', '');
            $("#txtChequeDate" + rowNo)[0].focus();
            isValid = false;
            return false;
        }
        rowNo++
    });
    if (isValid)
        ValidateChequeAmount_BankDetail();
}
function ValidateChequeAmount_BankDetail() {
    RowID = tr = $("#tab_BankDetail tbody tr")[0].getAttribute('id');
    rowNo = RowID.replace('row', '');
    isValid = false;
    $(".txtCheckAmount").each(function () {
        if ($(this).val().match(RegexForPositiveIncludeZero)) {
            isValid = true;
        }
        else {
            showMessage('please Enter Valid Amount', 'danger', '');
            $("#txtAmountBnk" + rowNo)[0].focus();
            isValid = false;
            return false;
        }
        rowNo++
    });
    if (isValid)
        ValidateChequeAmount_InvoiceAmount();
}
function ValidateChequeAmount_InvoiceAmount() {
    if ($("#di_UseCredit")[0].style.display == 'none') {
        if (parseFloat($("#lblCalculateReceived").text().replace(/,/g, '')) == parseFloat($("#lblCheckAmount").text().replace(/,/g, ''))) {
            SummeryData();

            //show_confirm('Are You Sure Want To Print This');
        }
        else
            showMessage('please enter cheque amount equal to invoice amount', 'danger', '');
    }
    else {


        if (parseFloat($("#lblCustomerCredit").text().replace(/,/g, '')) == parseFloat($("#lblCheckAmount").text().replace(/,/g, ''))) {
            SummeryData();
            //show_confirm('Are You Sure Want To Print This');
        }
        else
            showMessage('please enter cheque amount equal to invoice amount', 'danger', '');
    }
}
function useCustomerBalanceMax(event) {
    var x = event.key;
    if (parseFloat($("#lblCalculateReceived").text().replace(/,/g, '')) > parseFloat($("#lblBalance").text().replace(/,/g, '').replace('-', ''))) {

        if (parseFloat($("#txtUseCustomerCredit").val()) + x > parseFloat($("#lblBalance").text().replace(/,/g, '').replace('-', ''))) {
            showMessage('sorry Your Balance exceed!!', 'danger', '');
            event.preventDefault();
            return false;
        }
    }
    else {

        if (parseFloat($("#lblCalculateReceived").text().replace(/,/g, '')) < parseFloat($("#lblBalance").text().replace(/,/g, '').replace('-', ''))) {
            if (parseFloat($("#txtUseCustomerCredit").val()) + x > parseFloat($("#lblCalculateReceived").text().replace(/,/g, ''))) {
                showMessage('sorry Your Balance exceed From Invoice Amount!!', 'danger', '');
                event.preventDefault();
                return false;
            }
        }
    }
}
function AddRowSaleVoucher_OnTax() {
    var id = $("#tblSaleVoucherDetail tbody tr").length;
    row = '<tr id="row' + id + '" data-id="' + id + '" is_tax="true">';
    row += '<td data-name="sel"><div id="div_Class"><select id="ddlClass' + id + '" name="Class1" style="width:160px" class="form-control selectClass "><option value="0">Select</option><option value="1">Class1</option><option value="2">Class2</option><option value="3">Class3</option></select></div></td>';
    row += '<td data-name="sel"><div id="Acount"><select id="ddlAccountOnTax' + id + '" name="Account1" style="width:160px" class="form-control selectTaxAccount"><option value="' + $("#ddlAddTax option:selected").val() + '">' + $("#ddlAddTax option:selected").text() + '</select></div></td>';
    row += '<td data-name="td_Memo"><input type="text" name="Memo1" id="txtMemo' + id + '" class="form-control memo" /></td>';
    row += '<td data-name="td_Amount"><input type="number" name="txtAmount1" id="txtAmount' + id + '" class="form-control txtAmount" onkeyup="sumAmountAccount()" /></td>';
    row += '<td data-name="sel"><div id="td_project"><select id="ddlProject_SaleDetail' + id + '" name="Project1" style="width:160px" class="form-control selectProjectForSale"><option value="0">Select</option><option style="color: blue; font-weight: bold" value="-1">Add New Project</option><option value="1">Project1</option><option value="2">Project2</option><option value="3">Project3</option></select></div></td>';
    row += '<td data-name="del"><button type="button" class="btn btn-danger glyphicon row-remove" id="btnRemoveRowSaleVoucher' + id + '" onclick="removeSaleVoucherRow(this);" style="background-color: white; color: black; border: none;"><span aria-hidden="true">×</span></button></td>';
    row += '</tr>';
    $('#tblSaleVoucherDetail tbody').append(row);
    var tr = $('#tblSaleVoucherDetail tbody tr').closest('tr[is_tax="false"]');
    var prememoID = $('#tblSaleVoucherDetail tbody tr').closest('tr[is_tax="false"]')[tr.length - 1].getAttribute('id').replace('row', '');
    var curMemoID = $('#tblSaleVoucherDetail tbody tr').length - 1;
    var taxid = $('#tblSaleVoucherDetail tbody tr').length - 1;
    var taxName = $("#ddlAccountOnTax" + taxid).text();
    $("#txtMemo" + curMemoID).val('' + taxName + '-' + $("#txtMemo" + prememoID).val());

    //$("#curMemoID").val($("#prememoID"));
    $(".selectTaxAccount").select2();
    $('.selectClass').select2({}).on('select2:open', function () {
        var a = $(this).data('select2');
        if (!$('.select2-link').length) {
            a.$results.parents('.select2-results')
                    .prepend('<div class="select2-link"><a style="font-weight:bold;"> + Add New</a></div>')
                    .on('click', function (b) {
                        $(".selectClass").select2('close');
                        $('#AddClass').modal();
                    });
        }
    });
    $('.selectProjectForSale').select2({}).on('select2:open', function () {
        var a = $(this).data('select2');
        if (!$('.select2-link').length) {
            a.$results.parents('.select2-results')
                    .prepend('<div class="select2-link"><a style="font-weight:bold;"> + Add New</a></div>')
                    .on('click', function (b) {
                        $(".selectProjectForSale").select2('close');
                        $('#AddProject').modal();
                    });
        }
    });
    $("#ddlAddTax option:selected").attr('disabled', 'disabled')
    $('#select2-ddlAddTax-container')[0].innerText = '-Select-';
    $('#ddlAddTax')[0].selectedIndex = 0;
}
function AddRowToSaleVoucher_WithoutTax() {

    var id = $("#tblSaleVoucherDetail tbody tr").length;
    row = '<tr id="row' + id + '" data-id="' + id + '" is_tax="false">';
    row += '<td data-name="sel"><div id="div_Class"><select id="ddlClass' + id + '"style="width:160px;" name="Class1"  class="form-control selectClass "><option value="0">Select</option><option value="1">Class1</option><option value="2">Class2</option><option value="3">Class3</option></select></div></td>';
    row += '<td data-name="sel"><div id="Acount"><select id="ddlAccount' + id + '"style="width:160px;" name="Account1" class="form-control selectAccount"><option value="0">Select</option><option value="1">100 | Sale</option><option value="2">101 | Expense</option><option value="3">102 | Utilities</option></select></div></td>';
    row += '<td data-name="td_Memo"><input type="text" name="Memo1" id="txtMemo' + id + '" class="form-control memo" /></td>';
    row += '<td data-name="td_Amount"><input type="number" name="txtAmount1" id="txtAmount' + id + '"  class="form-control txtAmount" onkeyup="sumAmountAccount()"/></td>';
    row += '<td data-name="sel"><div id="td_project"><select id="ddlProject_SaleDetail' + id + '" style="width:160px;" name="Project1" class="form-control selectProjectForSale"><option value="0">Select</option><option value="1">Project1</option><option value="2">Project2</option><option value="3">Project3</option></select></div></td>';
    row += '<td data-name="del"><button type="button" class="btn btn-danger glyphicon row-remove" id="btnRemoveRowSaleVoucher' + id + '" onclick="removeSaleVoucherRow(this);" style="background-color: white; color: black; border: none;"><span aria-hidden="true">×</span></button></td>';
    row += '</tr>';
    $('#tblSaleVoucherDetail tbody').append(row);
    $("#ddlAddTax option").each(function () {
        $(this).removeAttr('disabled');
    })
    $('.selectClass').select2({}).on('select2:open', function () {
        var a = $(this).data('select2');
        if (!$('.select2-link').length) {
            a.$results.parents('.select2-results')
                    .prepend('<div class="select2-link"><a style="font-weight:bold;"> + Add New</a></div>')
                    .on('click', function (b) {
                        $(".selectClass").select2('close');
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
    $('.selectProjectForSale').select2({}).on('select2:open', function () {
        var a = $(this).data('select2');
        if (!$('.select2-link').length) {
            a.$results.parents('.select2-results')
                    .prepend('<div class="select2-link"><a style="font-weight:bold;"> + Add New</a></div>')
                    .on('click', function (b) {
                        $(".selectProjectForSale").select2('close');
                        $('#AddProject').modal();
                    });
        }
    });
    $("#tblSaleVoucherDetail tbody tr").find("td button.row-remove").on("click", function () {
        $(this).closest("tr").remove();
        sumAmountAccount();
    });
}
function SummeryData() {

    $("#lblSummeryInvoiceAmount").text($("#lbltotalInvoiceAmount").text());
    TotalDiscount();
    if (!TotalReceiveAmount())
        return;
    TotalTaxAmount();
    if ($('#di_UseCredit')[0].style.display != "none") {

        var Amount = $("#txtUseCustomerCredit").val();
        $("#lblSummeryAccountAmount").text(Amount.toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 }));
    }
    else
        $("#lblSummeryAccountAmount").text('0.00');
    $("#lblSummeryBankAmount").text($("#lblCheckAmount").text());
    $("#lblSummeryOutstandingAmount").text(parseFloat($("#lbltotalInvoiceAmount").text().replace(/,/g, '')) - parseFloat($("#lblSummeryTaxAmount").text().replace(/,/g, '')) - parseFloat($("#lblSummeryDiscountAmount").text().replace(/,/g, '')) - parseFloat($("#lblCalculateReceived").text().replace(/,/g, '')));

    $("#ReceivedSummery").modal();
    $('#btnSaveSummery').on('click', function () {
        show_confirm('');
    })
}
function TotalDiscount() {
    var DisCount = 0.00;
    $(".txtDiscount").each(function () {
        if ($(this).val() != '') {
            DisCount = parseFloat(DisCount) + parseFloat($(this).val());
        }
        else
            DisCount = parseFloat(DisCount) + 0
    });
    $("#lblSummeryDiscountAmount").text(DisCount.toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 }));
}
function TotalReceiveAmount() {
    var ReceiveAmount = 0.00;
    $(".txtReceive  ").each(function () {

        ReceiveAmount = parseFloat(ReceiveAmount) + parseFloat($(this).val())
    });
    if (isNaN(ReceiveAmount)) {
        showMessage('please enter Receive Amount', 'warning', '');
        return false;
    }

    $("#lblSummeryReceiveAmount").text(ReceiveAmount.toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 }));
    return true;
}
function TotalTaxAmount() {
    if ($('#tblReceived tbody').find('label[class="TaxAmount"]').length != 0) {
        var TaxAmount = 0.00;
        $('.TaxAmount').each(function () {
            TaxAmount = parseFloat(TaxAmount) + parseFloat($(this).text());
        })
        $("#lblSummeryTaxAmount").text(TaxAmount.toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 }));
    }
    else
        $("#lblSummeryTaxAmount").text('0.00');
}

function ValidateOpeningBalance() {
    if ($('#txtOpeningBalance').val() != '') {

        $("#CustomerAsOFdate").attr('disabled', false);
        $("#CustomerAsOFdate").css({ 'cssText': 'background: ' });
        $('#CustomerAsOFdate').next().show();
        $('#CustomerAsOFdate').val(GetTodayDate());
    }
    else {
        $("#CustomerAsOFdate").attr('disabled', 'disabled');
        $("#CustomerAsOFdate").css({ 'cssText': 'background: #dddddd !important' });
        $('#CustomerAsOFdate').val('');
        $('#CustomerAsOFdate').next().hide();
    }
}


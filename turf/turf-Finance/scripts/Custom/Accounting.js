$(document).ready(function () {
    $(".dropdown-toggle").dropdown();
   


    
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
 

   

    let simplepicker = new SimplePicker(".datePickStart");
    let simplepicker2 = new SimplePicker(".datePickEnd");
    let simplepicker3 = new SimplePicker(".AsOFDate");
    let simplepicker4 = new SimplePicker(".ReconcileStartDate");
    let simplepicker5 = new SimplePicker(".ReconcileEndDate");
    let simplepicker6 = new SimplePicker(".statementEndingDate");
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

    $("#AsOFDate").focus(function () {
        simplepicker3.open();
        simplepicker3.disableTimeSection();
        $("#AsOFDate").attr('readonly', 'true');
    });
    simplepicker3.on('submit', (date) => {
        $("#AsOFDate")[0].value = formatDate(date);
        $("#AsOFDate").prop('readonly', false);
    });
    simplepicker3.on('close', function () {

        $("#AsOFDate").removeAttr('readonly');
    });


    $("#ReconcileStartDate").focus(function () {
        simplepicker4.open();
        simplepicker4.disableTimeSection();
        $("#ReconcileStartDate").attr('readonly', 'true');
    });
    simplepicker4.on('submit', (date) => {
        $("#ReconcileStartDate")[0].value = formatDate(date);
        $("#ReconcileStartDate").prop('readonly', false);
    });
    simplepicker4.on('close', function () {

        $("#ReconcileStartDate").removeAttr('readonly');
    });
    $("#ReconcileEndDate").focus(function () {
        simplepicker5.open();
        simplepicker5.disableTimeSection();
        $("#ReconcileEndDate").attr('readonly', 'true');
    });
    simplepicker5.on('submit', (date) => {
        $("#ReconcileEndDate")[0].value = formatDate(date);
        $("#ReconcileEndDate").prop('readonly', false);
    });
    simplepicker5.on('close', function () {

        $("#ReconcileEndDate").removeAttr('readonly');
    });

    $("#statementEndingDate").focus(function () {
        simplepicker6.open();
        simplepicker6.disableTimeSection();
        $("#statementEndingDate").attr('readonly', 'true');
    });
    simplepicker6.on('submit', (date) => {
        $("#statementEndingDate")[0].value = formatDate(date);
        $("#statementEndingDate").prop('readonly', false);
    });
    simplepicker6.on('close', function () {

        $("#statementEndingDate").removeAttr('readonly');
    });


    $("#tblAccountList tbody").on('click', 'tr td:eq(1)', function () {
        $("#btnInActive").show();
        $("#btnEdit").show();
              
              $("#AddNewAccount").show();
              $("#ChartsOfAccount").hide();
              

                
          })
          //$("#ddlAccountType").select2();

          $("#ddlParentAccount").prop("disabled", true);
          $("#chkSubAccount").click(function () {

              if ($(this).is(":checked")) {

                  $("#ddlParentAccount").prop("disabled", false);
              } else {
                
                  
                  $("#ddlParentAccount").prop("disabled", true);
              }
          });

          $("#tblAccountList").DataTable({
              //columnDefs: [{
              //    targets: [1, 2, 3, 4],
              //    render: $.fn.dataTable.render.ellipsis(7)
              //}],
              pageLength: '4',
              "filter": true, // this is for disable filter (search box)
              "order": [[3, "desc"]],
              "searching":true,
              "pagingType": "full_numbers",
          });

          $("#tblReconcile").DataTable({
              columnDefs: [{
                  targets: [0,1, 2, 3, 4,5,6],
                  render: $.fn.dataTable.render.ellipsis(7)
              }],
              pageLength: '4',
              "filter": true, // this is for disable filter (search box)
              "order": [[3, "desc"]],
              "searching": true,
              "pagingType": "full_numbers",
          });

          $("#tblReconcileList").DataTable({
              //columnDefs: [{
              //    targets: [1, 2, 3, 4],
              //    render: $.fn.dataTable.render.ellipsis(7)
              //}],
              pageLength: '4',
              "filter": true, // this is for disable filter (search box)
              "order": [[3, "desc"]],
              "searching": true,
              "pagingType": "full_numbers",
          });
          $("#AddNewAccount").hide();
          
          $("#ReconcileAccount").hide();
          $("#Reconcile").hide();

})
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
function OpenAccountPage() {
    $("#btnInActive").hide();
    $("#btnEdit").hide();
    
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
    $("#ReconcileAccount").hide ();
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

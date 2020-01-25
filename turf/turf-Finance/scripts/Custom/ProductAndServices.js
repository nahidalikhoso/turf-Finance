
$(document).ready(function () {
    $(".select2").select2();

 
    $('.Catagory').select2({}).on('select2:open', function () {
        var a = $(this).data('select2');
        if (!$('.select2-link').length) {
            a.$results.parents('.select2-results')
                    .prepend('<div class="select2-link"><a style="font-weight:bold;"> + Add New</a></div>')
                    .on('click', function (b) {
                        $(".Catagory").select2('close');
                         $('#AddCatagory').modal();
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
    
    
          let simplepicker = new SimplePicker(".datePickStart");
          let simplepicker2 = new SimplePicker(".datePickEnd");
          let simplepicker3 = new SimplePicker(".AsOfDate");
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

          $("#AsOfDate").focus(function () {
              simplepicker3.open();
              simplepicker3.disableTimeSection();
              $("#AsOfDate").attr('readonly', 'true');
          });
          simplepicker3.on('submit', (date) => {
              $("#AsOfDate")[0].value = formatDate(date);
              $("#AsOfDate").prop('readonly', false);
          });
          simplepicker3.on('close', function () {

              $("#AsOfDate").removeAttr('readonly');
          });


          $('#tblProductAndServices tbody').on('click', 'tr td:eq(2)', function () {
          
              $('.nav-tabs a[href="#Inventory"]').tab('show');
              $("#btnEditInventory").show();
              $("#btnDeleteInventory").show();
              $('#ddlType').val(1).change()
              
          });
          $('#tblProductAndServices tbody').on('click', 'tr:eq(1) td:eq(2)', function () {

              $('.nav-tabs a[href="#Inventory"]').tab('show');
              $("#btnEditNonInventory").show();
              $("#btnDeleteNonInventory").show();
              $('#ddlType').val(2).change()

          });
          $('#tblProductAndServices tbody').on('click', 'tr:eq(2) td:eq(2)', function () {

              $('.nav-tabs a[href="#Inventory"]').tab('show');
              $("#btnEditService").show();
              $("#btnDeleteService").show();
              $('#ddlType').val(3).change()

          });


          $('#Add_NonInventory').hide();
          $('#Add_Services').hide();
          $('#Add_Inventory').hide();
          $("#tblProductAndServices").DataTable({ 

              columnDefs: [{
                  targets: [0, 1, 2, 3, 4, 5, 6, 7, , 8, 9],
                  render: $.fn.dataTable.render.ellipsis(7)
              }],
              pageLength: '4',
              "filter": true, // this is for disable filter (search box)
              "order": [[3, "desc"]],
              "pagingType": "full_numbers",
          });
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
     
function OnChangeType() {
    debugger
    dd = document.getElementById('ddlType');
    if (dd.selectedOptions[0].value == '0') {
        $('#Add_NonInventory').hide();
        $('#Add_Services').hide();
        $('#Add_Inventory').hide();
        //  $('#Add_Services').hide();
    }
    if (dd.selectedOptions[0].value == '1') {
        $('#Add_NonInventory').hide();
        $('#Add_Services').hide();
        $('#Add_Inventory').show();
        //  $('#Add_Services').hide();
    }
    else if (dd.selectedOptions[0].value == '2') {
        $('#Add_NonInventory').show();
        $('#Add_Services').hide();
        $('#Add_Inventory').hide();
    }
    else if (dd.selectedOptions[0].value == '3') {
        $('#Add_NonInventory').hide();
        $('#Add_Services').show();
        $('#Add_Inventory').hide();
    }

}

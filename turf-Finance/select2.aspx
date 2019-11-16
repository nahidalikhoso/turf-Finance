<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="select2.aspx.cs" Inherits="turf_Finance.select2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <script>
    $(document).ready(function (){
   var table = $('#example').DataTable({
      drawCallback: function(settings){
         var api = this.api();           
         // Initialize custom control
         initDataTableCtrl(api.table().container());
      },   
      responsive: {
         details: {
            renderer: function(api, rowIdx, columns){
               var $row_details = $.fn.DataTable.Responsive.defaults.details.renderer(api, rowIdx, columns);

               // Initialize custom control
               initDataTableCtrl($row_details);

               return $row_details;
            }
         }
      },
      columnDefs: [
         {
            targets: [1, 2, 3, 4, 5],
            render: function(data, type, row, meta){
               if(type === 'display'){
                  var api = new $.fn.dataTable.Api(meta.settings);
                  
                  var $el = $('input, select, textarea', api.cell({ row: meta.row, column: meta.col }).node());

                  var $html = $(data).wrap('<div/>').parent();

                  if($el.prop('tagName') === 'INPUT'){
                     $('input', $html).attr('value', $el.val());
                     if($el.prop('checked')){
                        $('input', $html).attr('checked', 'checked');
                     }
                  } else if ($el.prop('tagName') === 'TEXTAREA'){
                     $('textarea', $html).html($el.val());

                  } else if ($el.prop('tagName') === 'SELECT'){
                     $('option:selected', $html).removeAttr('selected');
                     $('option', $html).filter(function(){
                        return ($(this).attr('value') === $el.val());
                     }).attr('selected', 'selected');
                  }

                  data = $html.html();
               }

               return data;
            }
         }
      ]
   });

   // Update original input/select on change in child row
   $('#example tbody').on('keyup change', '.child input, .child select, .child textarea', function(e){
       var $el = $(this);
       var rowIdx = $el.closest('ul').data('dtr-index');
       var colIdx = $el.closest('li').data('dtr-index');
       var cell = table.cell({ row: rowIdx, column: colIdx }).node();
       
       // NOTE: trigger('change') is needed to make custom controls (such as Select2)
       // aware of the value change
       $('input, select, textarea', cell).val($el.val()).trigger('change');
       
       if($el.is(':checked')){ $('input', cell).prop('checked', true); }
   });
});

//
// Initializes jQuery Raty control
//
function initDataTableCtrl(container) {
    $('select', container).select2();
}
 </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h3><a href="http://www.gyrocode.com/articles/jquery-datatables-form-inputs-with-responsive-extension/">jQuery DataTables -  Responsive extension and form inputs <small>(Select2)</small></a></h3>
<a href="http://www.gyrocode.com/articles/jquery-datatables-form-inputs-with-responsive-extension/">See full article on Gyrocode.com</a>
<hr><br>

<table id="example" class="display" cellspacing="0" width="100%">
   <thead>
      <tr>
         <th>Name</th>
         <th>Age</th>
         <th>Position</th>
         <th>Office</th>
         <th>Selected</th>
         <th>Comments</th>
      </tr>
   </thead>
   <tfoot>
      <tr>
         <th>Name</th>
         <th>Age</th>
         <th>Position</th>
         <th>Office</th>
         <th>Selected</th>
         <th>Comments</th>
      </tr>
   </tfoot>
   <tbody>
      <tr>
         <td>Tiger Nixon</td>
         <td><input type="text" name="row-1-age" value="61"></td>
         <td><input type="text" name="row-1-position" value="System Architect"></td>
         <td><select size="1" name="row-1-office">
            <option value="Edinburgh" selected="selected">Edinburgh</option>
            <option value="London">London</option>
            <option value="New York">New York</option>
            <option value="San Francisco">San Francisco</option>
            <option value="Tokyo">Tokyo</option>
         </select></td>
         <td><input type="checkbox" name="row-1-selected" value="1"></td>
         <td><textarea name="row-1-comments" rows="3" cols="20"></textarea></td>
      </tr>
      <tr>
         <td>Garrett Winters</td>
         <td><input type="text" name="row-2-age" value="63"></td>
         <td><input type="text" name="row-2-position" value="Accountant"></td>
         <td><select size="1" name="row-2-office">
            <option value="Edinburgh">Edinburgh</option>
            <option value="London">London</option>
            <option value="New York">New York</option>
            <option value="San Francisco">San Francisco</option>
            <option value="Tokyo" selected="selected">Tokyo</option>
         </select></td>
         <td><input type="checkbox" name="row-2-selected" value="2"></td>
         <td><textarea name="row-2-comments" rows="3" cols="20"></textarea></td>
      </tr>
      <tr>
         <td>Ashton Cox</td>
         <td><input type="text" name="row-3-age" value="66"></td>
         <td><input type="text" name="row-3-position" value="Junior Technical Author"></td>
         <td><select size="1" name="row-3-office">
            <option value="Edinburgh">Edinburgh</option>
            <option value="London">London</option>
            <option value="New York">New York</option>
            <option value="San Francisco" selected="selected">San Francisco</option>
            <option value="Tokyo">Tokyo</option>
         </select></td>
         <td><input type="checkbox" name="row-3-selected" value="3"></td>
         <td><textarea name="row-3-comments" rows="3" cols="20"></textarea></td>
      </tr>
      <tr>
         <td>Cedric Kelly</td>
         <td><input type="text" name="row-4-age" value="22"></td>
         <td><input type="text" name="row-4-position" value="Senior Javascript Developer"></td>
         <td><select size="1" name="row-4-office">
            <option value="Edinburgh" selected="selected">Edinburgh</option>
            <option value="London">London</option>
            <option value="New York">New York</option>
            <option value="San Francisco">San Francisco</option>
            <option value="Tokyo">Tokyo</option>
         </select></td>
         <td><input type="checkbox" name="row-4-selected" value="4"></td>
         <td><textarea name="row-4-comments" rows="3" cols="20"></textarea></td>
      </tr>
      <tr>
         <td>Airi Satou</td>
         <td><input type="text" name="row-5-age" value="33"></td>
         <td><input type="text" name="row-5-position" value="Accountant"></td>
         <td><select size="1" name="row-5-office">
            <option value="Edinburgh">Edinburgh</option>
            <option value="London">London</option>
            <option value="New York">New York</option>
            <option value="San Francisco">San Francisco</option>
            <option value="Tokyo" selected="selected">Tokyo</option>
         </select></td>
         <td><input type="checkbox" name="row-5-selected" value="5"></td>
         <td><textarea name="row-5-comments" rows="3" cols="20"></textarea></td>
      </tr>
      <tr>
         <td>Brielle Williamson</td>
         <td><input type="text" name="row-6-age" value="61"></td>
         <td><input type="text" name="row-6-position" value="Integration Specialist"></td>
         <td><select size="1" name="row-6-office">
            <option value="Edinburgh">Edinburgh</option>
            <option value="London">London</option>
            <option value="New York" selected="selected">New York</option>
            <option value="San Francisco">San Francisco</option>
            <option value="Tokyo">Tokyo</option>
         </select></td>
         <td><input type="checkbox" name="row-6-selected" value="6"></td>
         <td><textarea name="row-6-comments" rows="3" cols="20"></textarea></td>
      </tr>
      <tr>
         <td>Herrod Chandler</td>
         <td><input type="text" name="row-7-age" value="59"></td>
         <td><input type="text" name="row-7-position" value="Sales Assistant"></td>
         <td><select size="1" name="row-7-office">
            <option value="Edinburgh">Edinburgh</option>
            <option value="London">London</option>
            <option value="New York">New York</option>
            <option value="San Francisco" selected="selected">San Francisco</option>
            <option value="Tokyo">Tokyo</option>
         </select></td>
         <td><input type="checkbox" name="row-7-selected" value="7"></td>
         <td><textarea name="row-7-comments" rows="3" cols="20"></textarea></td>
      </tr>
      <tr>
         <td>Rhona Davidson</td>
         <td><input type="text" name="row-8-age" value="55"></td>
         <td><input type="text" name="row-8-position" value="Integration Specialist"></td>
         <td><select size="1" name="row-8-office">
            <option value="Edinburgh">Edinburgh</option>
            <option value="London">London</option>
            <option value="New York">New York</option>
            <option value="San Francisco">San Francisco</option>
            <option value="Tokyo" selected="selected">Tokyo</option>
         </select></td>
         <td><input type="checkbox" name="row-8-selected" value="8"></td>
         <td><textarea name="row-8-comments" rows="3" cols="20"></textarea></td>
      </tr>
      <tr>
         <td>Colleen Hurst</td>
         <td><input type="text" name="row-9-age" value="39"></td>
         <td><input type="text" name="row-9-position" value="Javascript Developer"></td>
         <td><select size="1" name="row-9-office">
            <option value="Edinburgh">Edinburgh</option>
            <option value="London">London</option>
            <option value="New York">New York</option>
            <option value="San Francisco" selected="selected">San Francisco</option>
            <option value="Tokyo">Tokyo</option>
         </select></td>
         <td><input type="checkbox" name="row-9-selected" value="9"></td>
         <td><textarea name="row-9-comments" rows="3" cols="20"></textarea></td>
      </tr>
      <tr>
         <td>Sonya Frost</td>
         <td><input type="text" name="row-10-age" value="23"></td>
         <td><input type="text" name="row-10-position" value="Software Engineer"></td>
         <td><select size="1" name="row-10-office">
            <option value="Edinburgh" selected="selected">Edinburgh</option>
            <option value="London">London</option>
            <option value="New York">New York</option>
            <option value="San Francisco">San Francisco</option>
            <option value="Tokyo">Tokyo</option>
         </select></td>
         <td><input type="checkbox" name="row-10-selected" value="10"></td>
         <td><textarea name="row-10-comments" rows="3" cols="20"></textarea></td>
      </tr>
      <tr>
         <td>Jena Gaines</td>
         <td><input type="text" name="row-11-age" value="30"></td>
         <td><input type="text" name="row-11-position" value="Office Manager"></td>
         <td><select size="1" name="row-11-office">
            <option value="Edinburgh">Edinburgh</option>
            <option value="London" selected="selected">London</option>
            <option value="New York">New York</option>
            <option value="San Francisco">San Francisco</option>
            <option value="Tokyo">Tokyo</option>
         </select></td>
         <td><input type="checkbox" name="row-11-selected" value="11"></td>
         <td><textarea name="row-11-comments" rows="3" cols="20"></textarea></td>
      </tr>
      <tr>
         <td>Quinn Flynn</td>
         <td><input type="text" name="row-12-age" value="22"></td>
         <td><input type="text" name="row-12-position" value="Support Lead"></td>
         <td><select size="1" name="row-12-office">
            <option value="Edinburgh" selected="selected">Edinburgh</option>
            <option value="London">London</option>
            <option value="New York">New York</option>
            <option value="San Francisco">San Francisco</option>
            <option value="Tokyo">Tokyo</option>
         </select></td>
         <td><input type="checkbox" name="row-12-selected" value="12"></td>
         <td><textarea name="row-12-comments" rows="3" cols="20"></textarea></td>
      </tr>
   </tbody>
</table>

</asp:Content>

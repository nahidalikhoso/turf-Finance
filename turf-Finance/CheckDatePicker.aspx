<%@ Page Title="" Language="C#" MasterPageFile="~/CheckDateExample.Master" AutoEventWireup="true" CodeBehind="CheckDatePicker.aspx.cs" Inherits="turf_Finance.CheckDatePicker" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="assets/css/simplepicker.css" rel="stylesheet" />
     <script src="assets/js/simplepicker.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    
  
     <script>
         $(document).ready(function () {
             let simplepicker = new SimplePicker({
                 format: 'YYYY-mm-dd'

             });
             $("#datePick").focus(function () {
                 
                 simplepicker.open();
                 simplepicker.disableTimeSection();
              
                
             });
           
             simplepicker.on('submit', (date) => {
                 
                
                 $("#datePick")[0].value = formatDate(date);
                 console.log(date);
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
         });
         </script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
      <div class="col-md-2"><label class="Label">End Date:</label></div>
                                        <div class="col-md-3">
                                                <!--<input type="text" class="form-control border-input " placeholder="yyyy/mm/dd" id="datePick" />-->
                                            <div class="input-wrapper">
                                                <input type="text"  class="form-control border-input" id="datePick" />
                                                <label for="datePick" class="fa fa-calendar input-icon"></label>

                                            </div>
                                        </div>
</asp:Content>

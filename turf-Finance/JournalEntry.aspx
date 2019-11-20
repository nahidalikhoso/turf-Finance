<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="JournalEntry.aspx.cs" Inherits="turf_Finance.JournalEntry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/Custom/StyleSheet.css" rel="stylesheet" />
    <script src="scripts/Custom/JournalEntry.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
     <div id="JournalEntryList" class="wrapper">
        <ul class="nav nav-tabs">
            <li class="active"><a data-toggle="tab" href="#JournalEntry" style="font-weight:bold; ">Journal Entry List</a></li>
            <!--<li><a data-toggle="tab" href="#vendor" style="font-weight:bold;">Vendor</a></li>-->
        </ul>
        <div class="tab-content">
            <div id="JournalEntry" class="tab-pane fade in active">
                <div class="content">
                    <div class="container-fluid">
                        <div class="row" style="margin-top:23px">
                            <div class="col-md-12">
                                <div class="col-md-7">
                                    <div class="row">
                                         <div class="col-md-12">
                                          <div class="col-md-2  PaddingClass" style="width:16%">
                                        <label class="Label">Start Date:</label>
                                    </div>
                                    <div class="col-md-4 text-left PaddingClass">
                                        <div class="input-wrapper">
                                            <input type="text" placeholder="enter Start Date" class="form-control border-input" id="datePickStart" />
                                            <label for="datePickstart" class="fa fa-calendar input-icon datePickStart"></label>
                                        </div>
                                    </div>
                                    <div class="col-md-4   PaddingClass " style="width:16%">
                                        <label class="Label">End Date:</label>
                                    </div>
                                    <div class="col-md-4 PaddingClass">
                                        <div class="input-wrapper">
                                            <input type="text" placeholder="enter End Date" class="form-control border-input" id="datePickEnd" />
                                            <label for="datePickEnd" class="fa fa-calendar input-icon datePickEnd"></label>
                                        </div>
                                    </div>
                                    </div>
                                    </div>
                                   
                                    </div>
                                <div class="form-group col-md-5 text-right" >

                                    <button type="button" class="btn btn-success btn-fill">Import</button>
                                    <button type="button" class="btn btn-success btn-fill">Export</button>
                                    <button type="button" class="btn btn-success btn-fill">Print</button>
                                    <button type="button" id="btnAddNewInvoice" class="btn btn-success btn-fill" onclick="OpenJournalEntryVoucher();">Add New Journal</button>

                                </div>
                            </div>
                        </div>
                        <hr />
                        <div id="div_JournalEntry" class="row">
                            <div class="col-md-12">
                                <table id="tblJournalEntryList" class="display  table-bordered" style="border-top:hidden!important;border-right:none;border-left:none; width:100%">
                                    <thead>
                                        <tr style="border-top:hidden;">
                                            <th>Voucher No</th>
                                            <th>Voucher Date</th>
                                            <th>Narration </th>
                                            <th>Credit</th>
                                            <th>Debit</th>
                                            <th>Class</th>
                                            <th>Project</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Voucher No 1</td>
                                            <td>31 Aug 2019</td>
                                            <td>Accounts For Pre-Payments</td>
                                            <td></td>
                                            <td>1,000.00</td>
                                            <td>Class 1</td>
                                            <td>Project A</td>

                                        </tr>
                                        <tr>
                                            <td>Voucher No 2</td>
                                            <td>02 Sep 2019</td>
                                            <td>Accural for Pre-Payments</td>
                                            <td>2,000.00</td>
                                            <td></td>
                                            <td>Class 1</td>
                                            <td>Project A</td>

                                        </tr>

                                        <tr>
                                            <td>Voucher No 1</td>
                                            <td>01 Sep 2019</td>
                                            <td>Reversal:Accural for Pre-Payments</td>
                                            <td>1,000.00</td>
                                            <td></td>
                                            <td>Class 1</td>
                                            <td>Project A</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="JournalEntryVoucher" class="wrapper">
        <div class="content">
            <div class="container-fluid">

                <div class="header">
                    <div class="row">
                        <div class="col-md-8">
                            <h4 class="title">Journal Entry Voucher </h4>
                        </div>
                        <div class="col-md-4" style="padding-top:3%;">
                            <a id="CloseJournalVoucher" style="float:right;" onclick="show_confirm('Do You Want To Leave Without Saving')"><i class="fa fa-times fa-lg"></i></a>
                            <!--<button style="float:right" class="title" type="button"><i class="fa fa-times"></i></button>-->
                        </div>
                    </div>
                </div>
                <div><hr /></div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Voucher/Ref: No </label>
                                <input type="text" class="form-control border-input" />
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Voucher Date </label>
                                <%--<input type="date" id="VoucherDate" class="form-control border-input VoucherDate" />--%>
                                <div class="input-wrapper">
                                    <input type="text" placeholder="enter Voucher Date" class="form-control border-input " id="VoucherDate" />
                                    <label for="VoucherDate" class="fa fa-calendar input-icon VoucherDate"></label>
                                </div>

                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Narration </label>
                                <input type="text" class="form-control border-input" />
                            </div>
                        </div>
                        <div class="col-md-3">
                             <div class="form-group">
                                <label>Voucher Date </label>
                                <%--<input type="date" id="VoucherDate" class="form-control border-input VoucherDate" />--%>
                                <div class="input-wrapper">
                                    <input type="text" placeholder="enter AutoReverse Date" class="form-control border-input " id="AutoRevdate" />
                                    <label for="AutoRevdate" class="fa fa-calendar input-icon AutoRevdate"></label>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
                    <div class="container" style="width:100%;">
                        <div class="row clearfix">
                            <div class="col-md-12 table-responsive">
                                <table class="table display table-bordered table-hover table-sortable" id="tblJournalEntry">
                                    <thead>

                                        <tr>
                                            <th>
                                                Account
                                            </th>
                                            <th>
                                                Description
                                            </th>
                                            <th>
                                                Debit
                                            </th>
                                            <th>
                                                Credit
                                            </th>
                                            <th>
                                                Class
                                            </th>
                                            <th>
                                                Project
                                            </th>
                                            <th>
                                                Customer
                                            </th>
                                            <th>
                                                Remove
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr id='addr0' data-id="0" class="hidden">


                                            <td data-name="sel">
                                                <div id="Acount">
                                                    <select id="ddlAccount" name="Account0" class="form-control">
                                                        <option value="0">Select</option>
                                                        <option style="color:blue;font-weight:bold" value="-1">Add New Account </option>
                                                        <option value="1">Sale</option>
                                                        <option value="2">Expense</option>
                                                        <option value="3">PrePayment</option>
                                                    </select>
                                                </div>

                                            </td>
                                            <td data-name="Des">
                                                <input type="text" name='Des0' class="form-control" />
                                            </td>
                                            <td data-name="Debit">
                                                <input type="text" name='Debit0' class="form-control" />
                                            </td>
                                            <td data-name="Credit">
                                                <input type="text" name='Credit0' class="form-control" />
                                            </td>
                                            <td data-name="sel">
                                                <div id="Class">
                                                    <select id="ddlClass" name="Class0" class="form-control" onchange="ddAddClass();">
                                                        <option value="0">Select</option>
                                                        <option style="color:blue;font-weight:bold" value="-1">Add New Class</option>
                                                        <option value="1">Class1</option>
                                                        <option value="2">Class2</option>
                                                        <option value="3">Class3</option>
                                                    </select>

                                                </div>

                                            </td>
                                            <td data-name="sel">
                                                <select id="ddlProject" name="Project0" class="form-control">
                                                    <option value="0">Select</option>
                                                    <option style="color:blue;font-weight:bold" value="-1">Add New Project</option>
                                                    <option value="1">Project1</option>
                                                    <option value="2">Project2</option>
                                                    <option value="3">Project3</option>
                                                </select>
                                            </td>
                                            <td data-name="sel">
                                                <select id="ddlCustomer" name="Customer0" class="form-control">
                                                    <option value="0">Select</option>
                                                    <option style="color:blue;font-weight:bold" value="-1">Add New Customer</option>
                                                    <option value="1">Nahid</option>
                                                    <option value="2">Shahzaib</option>
                                                    <option value="3">Adnan</option>
                                                </select>
                                            </td>

                                            <td data-name="del">
                                                <button class='btn btn-danger glyphicon   row-remove' style="background-color:white;color:black;border:none;"><span aria-hidden="true">×</span></button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="col-md-3 text-right">
                                    <label>Total:</label>
                                </div>
                                <div class="col-md-2 text-center">
                                    <label>1,000.00</label>
                                </div>
                                <div class="col-md-2">
                                    <label>1,000.00</label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">

                                <a id="add_row" class="btn btn-primary  btn-fill  btn-sm btn-wd ">Add a new Line</a>
                                <a id="add_row" class="btn btn-primary  btn-fill  btn-sm btn-wd ">Clear All Lines</a>
                                <!--<button type="button" style="float:right" class="btn btn-info btn-fill btn-wd ">Save</button>-->
                            </div>
                            <!--<div class="col-md-2">
                                <button type="button" class="btn btn-info btn-fill ">Save</button>
                            </div>-->
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="container-fluid" style="padding-top: 3%;">
                        <div class="col-md-12">
                            <button type="button" style="float:right" class="btn btn-info btn-fill btn-sm btn-wd ">Save</button>

                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <div id="JournalEntryVoucherOnEdit" class="wrapper">
        <div class="content">
            <div class="container-fluid">

                <div class="header">
                    <div class="row">
                        <div class="col-md-8">
                            <h4 class="title">Journal Entry Voucher </h4>
                        </div>
                        <div class="col-md-4" style="padding-top:3%;">
                            <a id="CloseJournalVoucherOnEdit" style="float:right;" onclick="show_confirmOnEdit('Do You Want To Leave Without Saving')"><i class="fa fa-times fa-lg"></i></a>
                            <!--<button style="float:right" class="title" type="button"><i class="fa fa-times"></i></button>-->
                        </div>
                    </div>
                </div>
                <div><hr /></div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Voucher/Ref: No </label>
                                <input type="text" class="form-control border-input" />
                            </div>
                        </div>
                        <div class="col-md-3">
                             <div class="form-group">
                                <label>Voucher Date </label>
                                <%--<input type="date" id="VoucherDate" class="form-control border-input VoucherDate" />--%>
                                <div class="input-wrapper">
                                    <input type="text" placeholder="enter Voucher Date" class="form-control border-input " id="VoucherDateOnEdit" />
                                    <label for="VoucherDateOnEdit" class="fa fa-calendar input-icon VoucherDateOnEdit"></label>
                                </div>

                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Narration </label>
                                <input type="text" class="form-control border-input" />
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Journal Options </label>
                                <select id="ddlJournalOptions" name="Account0" class="form-control border-input select2">
                                    <option value="0">Select</option>
                                    <option value="1">Reverse</option>
                                    <option value="2">Delete</option>
                                    <option value="3">Copy</option>
                                    <option value="3">Edit</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
                    <div class="container" style="width:100%;">
                        <div class="row clearfix">
                            <div class="col-md-12 table-responsive">
                                <table class="table display table-bordered table-hover table-sortable" id="tblJournalEntryOnEdit">
                                    <thead>

                                        <tr>
                                            <th>
                                                Account
                                            </th>
                                            <th>
                                                Description
                                            </th>
                                            <th>
                                                Debit
                                            </th>
                                            <th>
                                                Credit
                                            </th>
                                            <th>
                                                Class
                                            </th>
                                            <th>
                                                Project
                                            </th>
                                            <th>
                                                Customer
                                            </th>
                                            <th>
                                                Remove
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr id='addrOnedit' data-id="0" class="hidden">


                                            <td data-name="sel">
                                                <div id="AcountOnEdit">
                                                    <select id="ddlAccountOnEdit" name="Account0" class="form-control">
                                                        <option value="0">Select</option>
                                                        <option style="color:blue;font-weight:bold" value="-1">Add New Account </option>
                                                        <option value="1">Sale</option>
                                                        <option value="2">Expense</option>
                                                        <option value="3">PrePayment</option>
                                                    </select>
                                                </div>

                                            </td>
                                            <td data-name="Des">
                                                <input type="text" name='Des0' class="form-control" />
                                            </td>
                                            <td data-name="Debit">
                                                <input type="text" name='Debit0' class="form-control" />
                                            </td>
                                            <td data-name="Credit">
                                                <input type="text" name='Credit0' class="form-control" />
                                            </td>
                                            <td data-name="sel">
                                                <div id="Class">
                                                    <select id="ddlClass" name="Class0" class="form-control" onchange="ddAddClass();">
                                                        <option value="0">Select</option>
                                                        <option style="color:blue;font-weight:bold" value="-1">Add New Class</option>
                                                        <option value="1">Class1</option>
                                                        <option value="2">Class2</option>
                                                        <option value="3">Class3</option>
                                                    </select>

                                                </div>

                                            </td>
                                            <td data-name="sel">
                                                <select id="ddlProjectonEdit" name="Project0" class="form-control">
                                                    <option value="0">Select</option>
                                                    <option style="color:blue;font-weight:bold" value="-1">Add New Project</option>
                                                    <option value="1">Project1</option>
                                                    <option value="2">Project2</option>
                                                    <option value="3">Project3</option>
                                                </select>
                                            </td>
                                            <td data-name="sel">
                                                <select id="ddlCustomeronEdit" name="Customer0" class="form-control">
                                                    <option value="0">Select</option>
                                                    <option style="color:blue;font-weight:bold" value="-1">Add New Customer</option>
                                                    <option value="1">Nahid</option>
                                                    <option value="2">Shahzaib</option>
                                                    <option value="3">Adnan</option>
                                                </select>
                                            </td>

                                            <td data-name="del">
                                                <button class='btn btn-danger glyphicon   row-remove' style="background-color:white;color:black;border:none;"><span aria-hidden="true">×</span></button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="col-md-3 text-right">
                                    <label>Total:</label>
                                </div>
                                <div class="col-md-2 text-center">
                                    <label>1,000.00</label>
                                </div>
                                <div class="col-md-2">
                                    <label>1,000.00</label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">

                                <a id="add_rowOnEdit" class="btn btn-primary  btn-fill  btn-sm btn-wd ">Add a new Line</a>
                                <a id="add_row" class="btn btn-primary  btn-fill  btn-sm btn-wd ">Clear All Lines</a>
                                <!--<button type="button" style="float:right" class="btn btn-info btn-fill btn-wd ">Save</button>-->
                            </div>
                            <!--<div class="col-md-2">
                                <button type="button" class="btn btn-info btn-fill ">Save</button>
                            </div>-->
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="container-fluid" style="padding-top: 3%;">
                        <div class="col-md-12">
                            <button type="button" style="float:right" class="btn btn-info btn-fill btn-sm btn-wd ">Save</button>

                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="modal" id="confirmModal" role="dialog" aria-labelledby="confirmModalLabel" aria-hidden="true" data-backdrop="false">
        <div class="vertical-alignment-helper">
            <div class="modal-dialog modal-sm vertical-align-center">
                <div class="modal-content">
                    <div class="modal-body">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="btn_close_modal_info"><span aria-hidden="true">&times;</span></button>
                        <div id="confirmContent" style="font-weight: normal;"></div>
                    </div>
                    <div class="modal-footer bg-warning text-center" id="footer_modal">
                        <button type="button" class="btn btn-primary btn_yes_confirm">Yes</button>
                        <button type="button" class="btn btn-primary btn_no_confirm" data-dismiss="modal" aria-label="Close">No</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

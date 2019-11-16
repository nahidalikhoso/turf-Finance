<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PettyCash.aspx.cs" Inherits="turf_Finance.PettyCash" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/Custom/StyleSheet.css" rel="stylesheet" />
    <script src="scripts/Custom/PettyCash.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <div id="PettyCashList" class="wrapper">
        <ul class="nav nav-tabs">
            <li class="active"><a data-toggle="tab" href="#home" style="font-weight: bold;">Petty Cash List</a></li>
        </ul>
        <div class="tab-content">
            <div id="home" class="tab-pane fade in active">
                <div class="content">
                    <div class="container-fluid">
                        <div class="row" style="margin-top: 23px">
                            <div class="col-md-12">
                                <div class="col-md-8">
                                    <div class="col-md-12">
                                        <div class="col-md-2 text-right PaddingClass">
                                            <label class="Label">Start Date:</label>
                                        </div>
                                        <div class="col-md-3 PaddingClass">
                                            <div class="input-wrapper">
                                                <input type="text" placeholder="enter Start Date" class="form-control border-input" id="datePickStart" />
                                                <label for="datePickstart" class="fa fa-calendar input-icon datePickStart"></label>
                                            </div>
                                        </div>
                                        <div class="col-md-2 text-right  PaddingClass ">
                                            <label class="Label">End Date:</label>
                                        </div>
                                        <div class="col-md-3 PaddingClass">
                                            <div class="input-wrapper">
                                                <input type="text" placeholder="enter End Date"  class="form-control border-input" id="datePickEnd" />
                                                <label for="datePickEnd" class="fa fa-calendar input-icon datePickEnd"></label>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <button type="button" class="btn btn-success btn-fill">Export</button>
                                    <button type="button" class="btn btn-success btn-fill">Print</button>
                                    <button type="button" id="btnAddNewInvoice" class="btn btn-success btn-fill" onclick="openPettyCashVoucher();">Add New Petty Cash</button>
                                </div>

                            </div>
                        </div>
                        <hr />
                        <div id="div_DemoGrid" class="row">
                            <div class="col-md-12">
                                <table id="demoGrid" class="display  table-bordered" style="border-top: hidden!important; border-right: none; border-left: none; width: 100%">
                                    <thead>
                                        <tr style="border-top: hidden;">
                                            <th>Voucher No</th>
                                            <th>Voucher Date</th>
                                            <th>Account </th>
                                            <th>Amount</th>
                                            <th>Memo</th>
                                            <th>Class</th>
                                            <th>Project</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Voucher No 1</td>
                                            <td>31 Aug 2019</td>
                                            <td>Tea</td>
                                            <td>150</td>
                                            <td>Take A tea In Office</td>
                                            <td>Class 1</td>
                                            <td>Project A</td>

                                        </tr>
                                        <tr>
                                            <td>Voucher No 2</td>
                                            <td>01 Sep 2019</td>
                                            <td>Lunch</td>
                                            <td>1,000.00</td>
                                            <td>Lunch in Office</td>
                                            <td>Class 2</td>
                                            <td>Project A</td>
                                        </tr>
                                        <tr>
                                            <td>Voucher No 3</td>
                                            <td>02 Sep 2019</td>
                                            <td>Tea</td>
                                            <td>300</td>
                                            <td>Take A tea In Office</td>
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
    <div id="PettyCashVoucher" class="wrapper">
        <div class="content">
            <div class="container-fluid">

                <div class="header">
                    <div class="row">
                        <div class="col-md-8">
                            <h4 class="title">Petty Cash Voucher </h4>
                        </div>
                        <div class="col-md-4" style="padding-top: 3%;">
                            <a id="ClosePettyCashVoucher" style="float: right;" onclick="show_confirm('Do You Want To Leave Without Saving')"><i class="fa fa-times fa-lg"></i></a>
                            <!--<button style="float:right" class="title" type="button"><i class="fa fa-times"></i></button>-->
                        </div>
                    </div>
                </div>
                <div>
                    <hr />
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Voucher No </label>
                                <input type="text" class="form-control border-input" />
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Voucher Date </label>
                                <div class="input-wrapper">
                                    <input type="text" placeholder="Enter Voucher Date" id="VoucherDate" class="form-control border-input " />
                                    <label for="VoucherDate" class="fa fa-calendar input-icon voucherDate"></label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
                    <div class="container" style="width: 100%;">
                        <div class="row clearfix">
                            <div class="col-md-12 table-responsive">
                                <table class="table display table-bordered table-hover table-sortable" id="tab_PettyCash">
                                    <thead>
                                        <tr>
                                            <th>Account
                                            </th>
                                            <th>Amount
                                            </th>
                                            <th>Memo
                                            </th>
                                            <th>Class
                                            </th>
                                            <th>Project
                                            </th>
                                            <th>Remove
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr id='addr0' data-id="0" class="hidden">
                                            <td data-name="sel">
                                                <div id="Acount">
                                                    <select id="AddTax" class="formControl important borderInput select ">
                                                        <option value="0">-Select-</option>
                                                        <!--<option style="color:blue;font-weight:bold" value="-1">Add New</option>-->
                                                        <option value="1">GST</option>
                                                        <option value="2">WHT</option>
                                                        <option value="3">Further GST</option>
                                                    </select>
                                                </div>
                                            </td>
                                            <td data-name="Amount">
                                                <input type="number" name='Amount0' class="form-control" />
                                            </td>
                                            <td data-name="Memo">
                                                <input type="text" name='Memo0' class="form-control" />
                                            </td>
                                            <td data-name="sel">
                                                <div id="Class">
                                                    <select id="ddlClass" name="Class0" class="form-control select" onchange="ddAddClass();">
                                                        <option value="0">Select</option>
                                                        <option value="1">Class1</option>
                                                        <option value="2">Class2</option>
                                                        <option value="3">Class3</option>
                                                    </select>

                                                </div>
                                            </td>
                                            <td data-name="sel">
                                                <div id="project">
                                                <select id="ddlProject" name="Project0" class="form-control select "  onchange="ddAddProject();">
                                                    <option value="0">Select</option>
                                                    <option value="1">Project1</option>
                                                    <option value="2">Project2</option>
                                                    <option value="3">Project3</option>
                                                </select>
                                                    </div>
                                            </td>
                                            <td data-name="del">
                                                <button class='btn btn-danger glyphicon   row-remove' style="background-color: white; color: black; border: none;"><span aria-hidden="true">×</span></button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">

                                <a id="add_row" class="btn btn-primary  btn-fill  btn-sm btn-wd ">Add a new Line</a>
                                <a id="ClearAll" class="btn btn-primary  btn-fill  btn-sm btn-wd ">Clear All Lines</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="container-fluid" style="padding-top: 3%;">
                        <div class="col-md-12 text-right">
                            <button type="button" id="btnEdit" class="btn btn-info btn-fill btn-sm btn-wd ">Edit</button>
                            <button type="button" id="btnDelete" class="btn btn-info btn-fill btn-sm btn-wd ">Delete</button>
                            <button type="button" id="btnSave" class="btn btn-info btn-fill btn-sm btn-wd ">Save</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="AddTaxModel" class="modal fade bd-example-modal-sm" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">New Tax</h4>
                </div>
                <div class="modal-body">

                    <div class="form-group">
                        <label>Tax </label>
                        <input type="text" style="width: 40%;" class="form-control border-input" />
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Save Changes</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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

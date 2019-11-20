<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Approvel.aspx.cs" Inherits="turf_Finance.Approvel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/Custom/StyleSheet.css" rel="stylesheet" />
    <script src="scripts/Custom/Approvel.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div id="div_ApprovelList" class="wrapper">
        <ul class="nav nav-tabs">
            <li class="active"><a data-toggle="tab" href="#ExpList" style="font-weight: bold;">Approve</a></li>
            <%--<li><a data-toggle="tab" href="#vendor" style="font-weight: bold;">Vendor</a></li>--%>
        </ul>
        <div class="tab-content">
            <div id="ListForApprovel" class="tab-pane fade in active">
                <div class="content">
                    <div class="container-fluid">
                        <div class="row" style="margin-top: 23px; margin-left: 5%">
                            <div class="col-md-12">
                                <div class="col-md-7">
                                    <div class="content">
                                        <div class="form-group">
                                            <div class="btn-group" role="group">
                                                <button id="btnAll" type="button" class="btn btn-primary  ">All</button>
                                                <button id="btnExpense" type="button" class="btn btn-primary " onclick="OpenExpenseList();">Expense</button>
                                                <button id="btnSale" type="button" class="btn btn-primary  ">Sale</button>
                                                <button id="btnJournalEntry" type="button" class="btn btn-primary">JournalEntry</button>
                                                <button id="btnBank" type="button" class="btn btn-primary  ">Bank</button>
                                                <button id="btnApproved" type="button" class="btn btn-primary ">Approved</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                                <div class="col-md-1">
                                                    <label class="Label">Vendor:</label>
                                                </div>
                                                <div class="col-md-2">
                                                    <select id="ddlVendor" style="width: 100%" class="form-control border-input selectVendorOrCustomer">
                                                        <option value="0">Select</option>
                                                        <%--<option style="color: blue; font-weight: bold" value="-1">Add New</option>--%>
                                                        <option value="1">Nahid</option>
                                                        <option value="2">Shakir</option>
                                                    </select>
                                                </div>
                                            </div>
                            </div>


                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="col-md-8">
                                    <div class="col-md-2 labelWidth PaddingClass">
                                        <label class="Label">Start Date:</label>
                                    </div>
                                    <div class="col-md-3 text-left PaddingClass">
                                        <div class="input-wrapper">
                                            <input type="text" placeholder="enter Start Date" class="form-control border-input" id="datePickStart" />
                                            <label for="datePickstart" class="fa fa-calendar input-icon datePickStart"></label>
                                        </div>
                                    </div>
                                    <div class="col-md-2 labelWidth  PaddingClass ">
                                        <label class="Label">End Date:</label>
                                    </div>
                                    <div class="col-md-3 PaddingClass">
                                        <div class="input-wrapper">
                                            <input type="text" placeholder="enter End Date" class="form-control border-input" id="datePickEnd" />
                                            <label for="datePickEnd" class="fa fa-calendar input-icon datePickEnd"></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group text-right">
                                        <button type="button" id="btnApprove" class="btn btn-success btn-fill" onclick="show_confirm('Do You Want To Approve That Invoice')">Approve</button>
                                        <button type="button" class="btn btn-success btn-fill">Export</button>
                                        <button type="button" class="btn btn-success btn-fill">Print</button>
                                    </div>
                                </div>
                                <div class="form-group">
                                </div>
                            </div>
                        </div>
                        <hr />
                        <div id="div_AllVoucherList" class="row">
                            <div class="col-md-12">
                                <table id="tblAllVoucherList" class="display  table-bordered" style="border-top: hidden!important; border-right: none; border-left: none; width: 100%">
                                    <thead>
                                        <tr style="border-top: hidden;">
                                            <th>Customer / Vendor</th>
                                            <th>Invoice No</th>
                                            <th>Invoice Date</th>
                                            <th>Voucher No</th>
                                            <th>Voucher Date</th>
                                            <th>Amount</th>
                                            <th>Action</th>
                                            <th>Memo</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Saad</td>
                                            <td>Invoice No 1</td>
                                            <td>31 Aug 2019</td>
                                            <td>Voucher No 1</td>
                                            <td>31 Aug 2019</td>
                                            <td>30,000.00</td>
                                            <td>Unpaid</td>
                                            <td>Electricity Bill Month of July 2019</td>

                                        </tr>
                                        <tr>
                                            <td>Shakir</td>
                                            <td>Invoice No 2</td>
                                            <td>31 Aug 2019</td>
                                            <td>Voucher No 2</td>
                                            <td>31 Aug 2019</td>
                                            <td>20,000.00</td>
                                            <td>Unpaid</td>
                                            <td>Internet Bill Month of July 2019</td>

                                        </tr>
                                        <tr>
                                            <td>Adnan</td>
                                            <td>Invoice No 3</td>
                                            <td>31 Aug 2019</td>
                                            <td>Payment Voucher No 3</td>
                                            <td>31 Aug 2019</td>
                                            <td>25,000.00</td>
                                            <td>Paid</td>
                                            <td>PTCL Bill Month of July 2019</td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>Adnan</td>
                                            <td>Invoice No 4</td>
                                            <td>31 Aug 2019</td>
                                            <td>Voucher No 4</td>
                                            <td>31 Aug 2019</td>
                                            <td>25,000.00</td>
                                            <td>Unpaid</td>
                                            <td>PTCL Bill Month of July 2019</td>

                                        </tr>
                                        <tr>
                                            <td>Adnan</td>
                                            <td>Invoice No 5</td>
                                            <td>31 Aug 2019</td>
                                            <td>Voucher No 5</td>
                                            <td>31 Aug 2019</td>
                                            <td>25,000.00</td>
                                            <td>Unpaid</td>
                                            <td>PTCL Bill Month of July 2019</td>

                                        </tr>
                                        <tr>
                                            <td>Adnan</td>
                                            <td>Invoice No 6</td>
                                            <td>31 Aug 2019</td>
                                            <td>Voucher No 6</td>
                                            <td>31 Aug 2019</td>
                                            <td>25,000.00</td>
                                            <td>Unpaid</td>
                                            <td>PTCL Bill Month of July 2019</td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div id="div_ExpenseList" class="row">
                            <div class="col-md-12">
                                <table id="tblExpenseList" class="display  table-bordered" style="border-top: hidden!important; border-right: none; border-left: none; width: 100%">
                                    <thead>
                                        <tr style="border-top: hidden;">
                                            <th>
                                                <input type="checkbox" /></th>
                                            <th>Vendor</th>
                                            <th>Invoice No</th>
                                            <th>Invoice Date</th>
                                            <th>Voucher No</th>
                                            <th>Voucher Date</th>
                                            <th>Invoice Amount</th>
                                            <th>Status</th>
                                            <th>Memo</th>


                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <input type="checkbox" /></td>
                                            <td>Saad</td>
                                            <td>Invoice No 1</td>
                                            <td>31 Aug 2019</td>
                                            <td>Voucher No 1</td>
                                            <td>31 Aug 2019</td>
                                            <td>30,000.00</td>
                                            <td>Unpaid</td>
                                            <td>Electricity Bill Month of July 2019</td>


                                        </tr>
                                        <tr>
                                            <td>
                                                <input type="checkbox" /></td>
                                            <td>Shakir</td>
                                            <td>Invoice No 2</td>
                                            <td>31 Aug 2019</td>
                                            <td>Voucher No 2</td>
                                            <td>31 Aug 2019</td>
                                            <td>20,000.00</td>
                                            <td>Unpaid</td>
                                            <td>Internet Bill Month of July 2019</td>

                                        </tr>
                                        <tr>
                                            <td>
                                                <input type="checkbox" /></td>
                                            <td>Adnan</td>
                                            <td>Invoice No 3</td>
                                            <td>31 Aug 2019</td>
                                            <td>Voucher No 3</td>
                                            <td>31 Aug 2019</td>
                                            <td>25,000.00</td>
                                            <td>Unpaid</td>
                                            <td>PTCL Bill Month of July 2019</td>

                                        </tr>
                                        <tr>
                                            <td>
                                                <input type="checkbox" /></td>
                                            <td>Adnan</td>
                                            <td>Invoice No 4</td>
                                            <td>31 Aug 2019</td>
                                            <td>Voucher No 4</td>
                                            <td>31 Aug 2019</td>
                                            <td>25,000.00</td>
                                            <td>Unpaid</td>
                                            <td>PTCL Bill Month of July 2019</td>

                                        </tr>
                                        <tr>
                                            <td>
                                                <input type="checkbox" /></td>
                                            <td>Adnan</td>
                                            <td>Invoice No 5</td>
                                            <td>31 Aug 2019</td>
                                            <td>Voucher No 5</td>
                                            <td>31 Aug 2019</td>
                                            <td>25,000.00</td>
                                            <td>Unpaid</td>
                                            <td>PTCL Bill Month of July 2019</td>

                                        </tr>
                                        <tr>
                                            <td>
                                                <input type="checkbox" /></td>
                                            <td>Adnan</td>
                                            <td>Invoice No 6</td>
                                            <td>31 Aug 2019</td>
                                            <td>Voucher No 6</td>
                                            <td>31 Aug 2019</td>
                                            <td>25,000.00</td>
                                            <td>Unpaid</td>
                                            <td>PTCL Bill Month of July 2019</td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="vendor" class="tab-pane fade">
                <div class="content" id="VendorList">
                    <div class="container-fluid">
                        <div class="row" style="margin-top: 23px;">
                            <div class="col-md-4">
                                <div class="container" style="width: 100%;">
                                    <div class="row">
                                        <div class="col-md-12 text-center">
                                            <div class="form-group">
                                                <button type="button" class="btn btn-success btn-wd btn-fill">Show InActive</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12" style="height: 41px;">
                                            <div class="form-group">
                                                <div class="col-md-3">
                                                    <label class="Label">Vendor:</label>
                                                </div>
                                                <div class="col-md-9">
                                                    <select id="ddSelectVendor" style="width: 100%" class="form-control border-input vendor">
                                                        <option value="0">Select</option>
                                                        <%--<option style="color: blue; font-weight: bold" value="-1">Add New</option>--%>
                                                        <option value="1">Nahid</option>
                                                        <option value="2">Shakir</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr />
                                    <div class="row clearfix">
                                        <div class="col-md-12 table-responsive">
                                            <table id="VendorBalance" class="display  table-bordered">
                                                <thead>
                                                    <tr style="border-top: hidden;">
                                                        <th>Vendor</th>
                                                        <th>Total Amount</th>
                                                        <th>Received Amount</th>
                                                        <th>Balance</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>Saad</td>
                                                        <td>23,500.00</td>
                                                        <td>0.00</td>
                                                        <td>23,500.00</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Saad</td>
                                                        <td>23,500.00</td>
                                                        <td>0.00</td>
                                                        <td>23,500.00</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Saad</td>
                                                        <td>23,500.00</td>
                                                        <td>0.00</td>
                                                        <td>23,500.00</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Saad</td>
                                                        <td>23,500.00</td>
                                                        <td>0.00</td>
                                                        <td>23,500.00</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Saad</td>
                                                        <td>23,500.00</td>
                                                        <td>0.00</td>
                                                        <td>23,500.00</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Saad</td>
                                                        <td>23,500.00</td>
                                                        <td>0.00</td>
                                                        <td>23,500.00</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="container" style="width: 100%;">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="col-md-6">
                                                <div class="form-group">

                                                    <button type="button" class="btn btn-success btn-wd btn-fill">Export</button>
                                                    <button type="button" class="btn btn-success btn-wd btn-fill">Print</button>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group text-right">

                                                    <button type="button" id="btnVendorPayment" class="btn btn-success btn-fill" onclick="VendorPaymentPage();">Payment</button>
                                                    <button type="button" class="btn btn-success  btn-fill" id="btnAddVendor" onclick="AddNewVendor();">Add New Vendor</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="col-md-2 labelWidth PaddingClass">
                                                <label class="Label">Start Date:</label>
                                            </div>
                                            <div class="col-md-4 text-left PaddingClass">
                                                <div class="input-wrapper">
                                                    <input type="text" placeholder="enter Start Date" class="form-control border-input" id="datePickStartVendorList" />
                                                    <label for="datePickStartVendorList" class="fa fa-calendar input-icon datePickStartVendorList"></label>
                                                </div>
                                            </div>
                                            <div class="col-md-2 labelWidth  PaddingClass ">
                                                <label class="Label">End Date:</label>
                                            </div>
                                            <div class="col-md-4 PaddingClass">
                                                <div class="input-wrapper">
                                                    <input type="text" placeholder="enter End Date" class="form-control border-input" id="datePickEndVendorList" />
                                                    <label for="datePickEndVendorList" class="fa fa-calendar input-icon datePickEndVendorList"></label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr />
                                    <div class="row clearfix">
                                        <div class="col-md-12 table-responsive">
                                            <div id="ExpenseList" class="row">
                                                <div class="col-md-12">
                                                    <table id="demoGridForVendorList" class="display  table-bordered" style="border-top: hidden!important; border-right: none; border-left: none; width: 100%">
                                                        <thead>
                                                            <tr style="border-top: hidden;">
                                                                <th>All
                                                                <input type="checkbox" /></th>
                                                                <th>Vendor</th>
                                                                <th>Invoice No</th>
                                                                <th>Invoice Date</th>
                                                                <th>Voucher No</th>
                                                                <th>Voucher Date</th>
                                                                <th>Invoice Amount</th>
                                                                <th>Status</th>
                                                                <th>Memo</th>
                                                                <th>Class</th>
                                                                <th>Project</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td>
                                                                    <input type="checkbox" /></td>
                                                                <td>Saad</td>
                                                                <td>Invoice No 1</td>
                                                                <td>31 Aug 2019</td>
                                                                <td>Voucher No 1</td>
                                                                <td>31 Aug 2019</td>
                                                                <td>30,000.00</td>
                                                                <td>UnPaid</td>
                                                                <td>Electricity Bill Month of July 2019</td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="checkbox" /></td>
                                                                <td>Shakir</td>
                                                                <td>Invoice No 2</td>
                                                                <td>31 Aug 2019</td>
                                                                <td>Voucher No 2</td>
                                                                <td>31 Aug 2019</td>
                                                                <td>20,000.00</td>
                                                                <td>UnPaid</td>
                                                                <td>Internet Bill Month of July 2019</td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="checkbox" /></td>
                                                                <td>Adnan</td>
                                                                <td>Invoice No 3</td>
                                                                <td>31 Aug 2019</td>
                                                                <td>Receive Voucher No 3</td>
                                                                <td>31 Aug 2019</td>
                                                                <td>25,000.00</td>
                                                                <td>Paid</td>
                                                                <td>PTCL Bill Month of July 2019</td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="checkbox" /></td>
                                                                <td>Adnan</td>
                                                                <td>Invoice No 4</td>
                                                                <td>31 Aug 2019</td>
                                                                <td>Voucher No 4</td>
                                                                <td>31 Aug 2019</td>
                                                                <td>25,000.00</td>
                                                                <td>UnPaid</td>
                                                                <td>KE Bill Month of Aug 2019</td>
                                                                <td></td>
                                                                <td></td>
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
                        <hr />
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

﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Expense.aspx.cs" Inherits="turf_Finance.Expense" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/Custom/StyleSheet.css" rel="stylesheet" />
    <script src="scripts/Custom/Expense.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div id="div_ExpList" class="wrapper">
        <ul class="nav nav-tabs">
            <li class="active"><a data-toggle="tab" href="#ExpList" style="font-weight: bold;">Expense List</a></li>
            <li><a data-toggle="tab" href="#vendor" style="font-weight: bold;">Vendor</a></li>
        </ul>
        <div class="tab-content">
            <div id="ExpList" class="tab-pane fade in active">
                <div class="content">
                    <div class="container-fluid">
                        <div class="row" style="margin-top: 23px">
                            <div class="col-md-12">
                                <div class="col-md-8">
                                    <div class="content">
                                        <div class="form-group">
                                            <div class="btn-group" role="group">
                                                <button id="btnAll" type="button" class="btn btn-primary btn-wd " onclick="AllVoucher();">All</button>
                                                <button id="btnPaid" type="button" class="btn btn-primary btn-wd  ">Paid</button>
                                                <button id="btnUnPaid" type="button" class="btn btn-primary btn-wd " onclick="AllUnPaidVoucher();">Unpaid</button>
                                                <button id="btnPartialPaid" type="button" class="btn btn-primary btn-wd ">Partial Paid</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 text-right">
                                    <button type="button" id="Modal" class="btn btn-info btn-fill" onclick="openExpenseVoucher()">Add New Invoice</button>
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
                                        <button type="button" id="btnPay" class="btn btn-success btn-fill" onclick="PaymentPage();">Pay</button>
                                        <button type="button" class="btn btn-success btn-fill">Export</button>
                                        <button type="button" class="btn btn-success btn-fill">Print</button>
                                    </div>
                                </div>
                                <div class="form-group">
                                </div>
                            </div>
                        </div>
                        <hr />
                        <div id="div_ExpenseVoucherList" class="row">
                            <div class="col-md-12">
                                <table id="tblExpenseVoucherList" class="display  table-bordered" style="border-top: hidden!important; border-right: none; border-left: none; width: 100%">
                                    <thead>
                                        <tr style="border-top: hidden;">
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
                                            <td>Saad</td>
                                            <td>Invoice No 1</td>
                                            <td>31 Aug 2019</td>
                                            <td>Voucher No 1</td>
                                            <td>31 Aug 2019</td>
                                            <td>30,000.00</td>
                                            <td>Unpaid</td>
                                            <td>Electricity Bill Month of July 2019</td>
                                            <td></td>
                                            <td></td>
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
                                            <td></td>
                                            <td></td>
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
                                            <td></td>
                                            <td></td>
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
                                            <td></td>
                                            <td></td>
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
                                            <td></td>
                                            <td></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div id="div_UnpaidVoucher" class="row">
                            <div class="col-md-12">
                                <table id="demoGridForUnpaid" class="display  table-bordered" style="border-top: hidden!important; border-right: none; border-left: none; width: 100%">
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
                                            <td>Unpaid</td>
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
                                            <td>Unpaid</td>
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
                                            <td>Voucher No 3</td>
                                            <td>31 Aug 2019</td>
                                            <td>25,000.00</td>
                                            <td>Unpaid</td>
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
                                            <td>Unpaid</td>
                                            <td>PTCL Bill Month of July 2019</td>
                                            <td></td>
                                            <td></td>
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
                                            <td></td>
                                            <td></td>
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
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <div class="col-md-3">
                                                    <label class="Label">Vendor:</label>
                                                </div>
                                                <div class="col-md-9">
                                                    <select id="ddSelectVendor" class="form-control border-input select">
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
    <div id="AddNewVendor" class="wrapper">
        <div class="content">
            <div class="container-fluid">

                <div class="header">
                    <div class="row">
                        <div class="col-md-8">
                            <h4 class="title">Vendor Information </h4>
                        </div>
                        <div class="col-md-4" style="padding-top: 3%;">
                            <a id="CloseCustomerInformationForm" style="float: right;" onclick="show_confirmVendorInformation('Do You Want To Leave Without Saving')"><i class="fa fa-times fa-lg"></i></a>
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
                                <label>Name</label>
                                <input type="text" class="form-control border-input" />
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Legal Entity</label>
                                <select class="form-control border-input">
                                    <option value="0">Select</option>
                                    <option value="-1" style="color: blue; font-weight: bold;">Add New</option>
                                    <option value="1">Company</option>
                                    <option value="2">Individual</option>
                                    <option value="3">AOP</option>

                                </select>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>NTN / CNIC</label>
                                <input type="text" class="form-control border-input" />
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>STRN</label>
                                <input type="text" class="form-control border-input" />
                            </div>
                        </div>

                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">

                        <div class="col-md-3">
                            <div class="form-group">
                                <label>ATL</label>
                                <input type="text" class="form-control border-input" />
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Contact No</label>
                                <input type="number" class="form-control border-input" />
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Tax Profile </label>
                                <!--discus with Shakir Bhai-->
                                <select class="form-control border-input">
                                    <option value="0">Select</option>
                                    <option value="1">Tax Inclusive</option>
                                    <option value="2">Tax Exclusive</option>
                                    <option value="3">No Tax</option>

                                </select>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Business Activity</label>
                                <input type="text" class="form-control border-input" />
                            </div>
                        </div>


                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Bank Account No</label>
                                <input type="text" class="form-control border-input" />
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Address</label>
                                <input type="text" class="form-control border-input" />
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>City</label>
                                <select class="form-control border-input">
                                    <option value="0">city</option>
                                    <option value="-1" style="color: blue; font-weight: bold;">Add New</option>
                                    <option value="1">Karachi</option>
                                    <option value="2">Hyderabad</option>
                                    <option value="3">Sukkur</option>
                                    <option value="4">LarKana</option>
                                    <option value="5">Moro</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Country</label>
                                <select class="form-control border-input">
                                    <option value="0">Country</option>
                                    <option value="-1" style="color: blue; font-weight: bold;">Add New</option>
                                    <option value="1">Pakistan</option>
                                    <option value="2">UK</option>
                                    <option value="3">Canada</option>
                                    <option value="4">Srilanka</option>
                                    <option value="5">China</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Opening Balance</label>
                                <input type="text" class="form-control border-input" />
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>As Of: </label>
                                <input type="Date" class="form-control border-input" />
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Account </label>
                                <select class="form-control border-input">
                                    <option value="0">Select</option>
                                    <option value="1">Sales</option>
                                    <option value="2">Expense</option>
                                    <option value="3">Interest Income</option>

                                </select>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Notes</label>
                                <input type="text" class="form-control border-input" />
                            </div>
                        </div>

                    </div>
                </div>

                <div class="row">
                    <div class="container-fluid" style="padding-top: 3%;">
                        <div class="col-md-12">

                            <button type="button" style="float: right" class="btn btn-info btn-fill btn-sm btn-wd ">Save</button>
                            <a style="float: right" class="btn btn-info btn-fill btn-sm btn-wd " href="https://e.fbr.gov.pk/esbn/Service.aspx?PID=lmPn%2fLtGhNykqPqtHCLZzg%3d%3d" target="_blank">Verify</a>

                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <div id="ExpenseVoucher" class="wrapper">
        <div class="content">
            <div class="container-fluid">

                <div class="header">
                    <div class="row">
                        <div class="col-md-8">
                            <h4 class="title">Expense Voucher </h4>
                        </div>
                        <div class="col-md-4" style="padding-top: 3%;">
                            <a id="CloseExpenseVoucher" style="float: right;" onclick="show_confirm('Do You Want To Leave Without Saving')"><i class="fa fa-times fa-lg"></i></a>
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
                                <label>From </label>
                                <select id="ddSelect" class="form-control border-input select" >
                                    <option value="0">Select</option>
                                    <%--<option style="color: blue; font-weight: bold" value="-1">Add New</option>--%>
                                    <option value="1">Nahid</option>
                                    <option value="2">Shakir</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Invoice No </label>
                                <input type="text" class="form-control border-input" />
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Invoice Date </label>
                                <%--<input type="date" id="InvoiceDate" class="form-control border-input InvoiceDate" />--%>
                                <div class="input-wrapper">
                                    <input type="text" placeholder="enter Invoice Date" class="form-control border-input " id="InvoiceDate" />
                                    <label for="InvoiceDate" class="fa fa-calendar input-icon InvoiceDate"></label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Due Date</label>
                                <%--<input type="date" id="DueDate" class="form-control border-input DueDate" />--%>
                                <div class="input-wrapper">
                                    <input type="text" placeholder="enter Due Date" class="form-control border-input " id="DueDate" />
                                    <label for="DueDate" class="fa fa-calendar input-icon DueDate"></label>
                                </div>
                            </div>
                        </div>
                    </div>
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
                                <%--<input type="date" id="VoucherDate" class="form-control border-input VoucherDate" />--%>
                                <div class="input-wrapper">
                                    <input type="text" placeholder="enter Voucher Date" class="form-control border-input " id="VoucherDate" />
                                    <label for="VoucherDate" class="fa fa-calendar input-icon VoucherDate"></label>
                                </div>

                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Tax </label>
                                <select id="ddlAddTax" class="form-control border-input select" style="width:100%;">
                                    <option value="0">-Select-</option>
                                    <!--<option style="color:blue;font-weight:bold" value="-1">Add New</option>-->
                                    <option value="1">GST</option>
                                    <option value="2">WHT</option>
                                    <option value="3">Further GST</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
                    <div class="container" style="width: 100%;">
                        <div class="row clearfix">
                            <div class="col-md-12 table-responsive">
                                <table class="table display table-bordered table-hover table-sortable" id="tab_logic">
                                    <thead>

                                        <tr>
                                            <th>Class
                                            </th>
                                            <th>Account
                                            </th>
                                            <th>Memo
                                            </th>
                                            <th>Amount
                                            </th>
                                            <th>Project
                                            </th>
                                            <th>Remove
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr id='row1' data-id="1" class="hidden">

                                            <td data-name="sel">
                                                <div id="div_Class">
                                                    <select id="ddlClass" name="Class1" style="width:100%" class="form-control select ">
                                                        <option value="0">Select</option>
                                                        
                                                        <option value="1">Class1</option>
                                                        <option value="2">Class2</option>
                                                        <option value="3">Class3</option>
                                                    </select>
                                                </div>

                                            </td>
                                            <td data-name="sel">
                                                <div id="Acount">
                                                    <select id="ddlAccount" name="Account1" class="form-control select">
                                                        <option value="0">Select</option>
                                                        <option style="color: blue; font-weight: bold" value="-1">Add New Account </option>
                                                        <option value="1">Sale</option>
                                                        <option value="2">Expense</option>
                                                        <option value="3">Utilities</option>
                                                    </select>
                                                </div>

                                            </td>
                                            <td data-name="td_Memo">
                                                <input type="text" name='Memo1' class="form-control memo" />
                                            </td>

                                            <td data-name="td_Amount">
                                                <input type="number" name='txtAmount1' class="form-control Amount" />
                                            </td>

                                            <td data-name="sel">
                                                <div id="td_project">
                                                    <select id="ddlProject" name="Project1" class="form-control select">
                                                        <option value="0">Select</option>
                                                        <option style="color: blue; font-weight: bold" value="-1">Add New Project</option>
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
                                <div class="col-md-7 text-right">
                                    <label>Total</label>
                                </div>
                                <div class="col-md-5 text-left">
                                    <label>10,000.00</label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">

                                <a id="add_rowAccountDetail" class="btn btn-primary  btn-fill  btn-sm btn-wd ">Add a new Line</a>
                                <a id="ClearAll" class="btn btn-primary  btn-fill  btn-sm btn-wd ">Clear All Lines</a>
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
                            <label id="lblItemDetail " class="btn-group" onclick="ShowItemDetailTable();">Item Detail</label>

                        </div>
                    </div>
                </div>
                <div class="row" id="Product_Detail">
                    <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
                    <div class="container" style="width: 100%;">
                        <div class="row clearfix">

                            <div class="col-md-12 table-responsive">
                                <table class="table display table-bordered table-hover table-sortable" id="tab_ItemDetail">
                                    <thead>

                                        <tr>
                                            <th>Product/Services
                                            </th>
                                            <th>Description
                                            </th>
                                            <th>Qty
                                            </th>
                                            <th>Rate
                                            </th>
                                            <th>Amount
                                            </th>
                                            <th>Project
                                            </th>
                                            <th>Remove
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr id='Itemaddr0' data-id="0" class="hidden">

                                            <td data-name="sel">
                                                <div id="Product">
                                                    <select id="ddlProduct" name="Product0" class="form-control select">
                                                        <option value="0">Select</option>
                                                        <option style="color: blue; font-weight: bold" value="-1">Add New</option>
                                                        <option value="1">Printer</option>
                                                        <option value="2">Laptop</option>
                                                        <option value="3">Era</option>
                                                    </select>

                                                </div>

                                            </td>
                                            <td data-name="Des">
                                                <div id="Des">
                                                    <input type="text" name='Desc0' class="form-control" />
                                                </div>

                                            </td>
                                            <td data-name="Qty">
                                                <input type="number" name='Qty0' class="form-control" />
                                            </td>

                                            <td data-name="Rate">
                                                <input type="number" name='Rate0' class="form-control" />
                                            </td>
                                            <td data-name="Amount">
                                                <input type="number" name='Amount0' class="form-control" />
                                            </td>

                                            <td data-name="sel">
                                                <div id="itemproject">
                                                    <select id="itemddlProject" name="Project0" class="form-control select">
                                                        <option value="0">Select</option>
                                                        <option style="color: blue; font-weight: bold" value="-1">Add New Project</option>
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
                                <div class="col-md-8 text-right">
                                    <label>Total</label>
                                </div>
                                <div class="col-md-4 text-left">
                                    <label>10,000.00</label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">

                                <a id="add_rowProduct" class="btn btn-primary btn-fill   btn-sm btn-wd ">Add a new Line</a>
                                <a id="ClearAllLinesProduct" class="btn btn-primary btn-fill   btn-sm  btn-wd">Clear All Lines</a>

                            </div>
                            <!--<div class="col-md-2">
                    <button type="button" class="btn btn-info btn-fill ">Save</button>
                </div>-->
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
    <div id="Payment" class="wrapper">
        <div class="content">
                <div class="container-fluid">
                    <div class="header">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="col-md-2">
                                    <h4 class="title">Payment </h4>
                                </div>
                                 <div class="col-md-6" style="padding-top: 3%;">

                            <label id="lblStatus" style="padding: 8px; border-radius: 50px;background:#23dd0a;">Paid <i class="ti-na"></i></label>
                        </div>
                                <div class="col-md-4 text-right" style="padding-top: 3%;">
                                    <a id="ClosePaymentVoucher" onclick="show_confirmPayment('Do You Want To Leave Without Saving')"><i class="fa fa-times fa-lg"></i></a>
                                    <!--<button style="float:right" class="title" type="button"><i class="fa fa-times"></i></button>-->
                                </div>
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
                                <input type="date" class="form-control border-input" />
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Tax </label>
                                <select id="AddTax" class="form-control border-input selectpicker" style="" data-live-search="true" onchange="ddChangeTax();">
                                    <option value="0">-Select-</option>
                                    <option style="color: blue; font-weight: bold" value="-1">Add New</option>
                                    <option value="1">GST</option>
                                    <option value="2">WHT</option>
                                    <option value="3">Further GST</option>
                                </select>
                            </div>
                        </div>

                    </div>
                </div>
                <div id="div_demoPayment" class="row">
                    <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
                    <div class="container" style="width: 100%;">
                        <div class="row clearfix">
                            <div class="col-md-12 table-responsive BalanceTable">
                                <table id="demoGridForVenderBalance" class="display  table-bordered BalanceTable">
                                    <thead>
                                        <tr style="border-top: hidden;">
                                            <th>Vendor</th>
                                            <th>Total Amount</th>
                                            <th>Paid Amount</th>
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
                                    </tbody>
                                </table>
                            </div>
                        </div>

                    </div>

                </div>
                <div id="div_Payment" class="row">
                    <div class="col-md-12">
                        <table id="demoGrid_Payment" class="display  table-bordered">
                            <thead>
                                <tr style="border-top: hidden;">
                                    <th>Invoice No</th>
                                    <th>Amount</th>
                                    <th>Discount</th>
                                    <th>Net Amount</th>
                                    <th>Amt To Pay</th>
                                    <th>Tax Account</th>
                                    <th>Tax Amount</th>
                                    <th>Payment</th>
                                    <th>Memo</th>
                                    <th>Remove</th>

                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Invoice No 1</td>
                                    <td>11,000.00</td>
                                    <td>
                                        <input type="text" class="form-control border-input col-md-1" placeholder="enter Discount" /></td>
                                    <td>10,500.00</td>
                                    <td>
                                        <input type="text" class="form-control border-input col-md-1" placeholder="enter Amt to Pay" /></td>
                                    <td>WHT</td>
                                    <td>
                                        <input type="text" class="form-control border-input col-md-1" placeholder="enter Tax Amount" /></td>
                                    <td>5,500.00</td>
                                    <td>
                                        <input type="text" class="form-control border-input col-md-2" />
                                    </td>
                                    <td>
                                        <button class='btn btn-danger glyphicon   row-remove' style="background-color: white; color: black; border: none;"><span aria-hidden="true">×</span></button></td>


                                </tr>
                                <!--<tr>
                                    <td>Shakir</td>
                                    <td>Invoice No 2</td>
                                    <td>31 Aug 2019</td>
                                    <td>Voucher No 2</td>
                                    <td>31 Aug 2019</td>
                                    <td>20,000.00</td>
                                    <td>Unpaid</td>
                                    <td>Internet Bill Month of July 2019</td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Adnan</td>
                                    <td>Invoice No 3</td>
                                    <td>31 Aug 2019</td>
                                    <td>Voucher No 3</td>
                                    <td>31 Aug 2019</td>
                                    <td>25,000.00</td>
                                    <td>Unpaid</td>
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
                                    <td></td>
                                    <td></td>
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
                                    <td></td>
                                    <td></td>
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
                                    <td></td>
                                    <td></td>
                                </tr>-->
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="row">
                    <div class="container" style="width: 100%">
                        <div class="col-md-6">
                            <div class="col-md-2">
                                <label>Total:</label>
                            </div>
                            <div class="col-md-2 text-right">
                                <label>11,000.00</label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="col-md-5 text-right">
                                <label>Total:</label>
                            </div>
                            <div class="col-md-1 text-right">
                                <label>5,500.00</label>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="row">
                    <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
                    <div class="container" style="width: 100%;">
                        <div class="row clearfix">
                            <div class="col-md-12 table-responsive">
                                <table class="table display table-bordered table-hover table-sortable" id="tab_BankDetail">
                                    <thead>

                                        <tr>
                                            <th>Bank
                                            </th>
                                            <th>Bank Balance
                                            </th>
                                            <th>Cheque No
                                            </th>
                                            <th>Cheque Date
                                            </th>
                                            <th>Cheque Amount
                                            </th>
                                            <th>Remove
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr id='addr0' data-id="0" class="hidden">

                                            <td data-name="sel">
                                                <div id="Bank">
                                                    <select name="Bank0" class="form-control">
                                                        <option value="0">Select</option>
                                                        <option value="-1" style="color: blue; font-weight: bold">Add New</option>
                                                        <option value="1">HBL</option>
                                                        <option value="2">Meezan</option>
                                                        <option value="3">Alfalah</option>
                                                    </select>
                                                </div>

                                            </td>

                                            <td data-name="BankBalance">
                                                <label>50,000.00</label>

                                            </td>

                                            <td data-name="chequeNo">
                                                <input type="text" name='Memo0' class="form-control" />
                                            </td>

                                            <td data-name="chequeDate">
                                                <input type="date" name='checqueDate' class="form-control" />
                                            </td>

                                            <td data-name="chequeAmount">
                                                <input type="number" class="form-control border-input" name="chequeAmount" />
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
                            <div class="col-md-6">

                                <a id="add_rowBankDetail" class="btn btn-primary  btn-fill  btn-wd btn-sm">Add a new Line</a>
                                <a id="ClearAllBankDetail" class="btn btn-primary  btn-fill  btn-wd btn-sm ">Clear All Lines</a>
                                <!--<button type="button" style="float:right" class="btn btn-info btn-fill btn-wd btn-sm">Save</button>-->
                            </div>
                            <div class="col-md-6">
                                <div class="col-md-5 text-right">
                                    <label>Total:</label>
                                </div>
                                <div class="col-md-4 text-right">
                                    <label>5,500.00</label>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="container-fluid" style="padding-top: 3%;">
                        <div class="col-md-12 text-right">
                            <button type="button" id="btnInActive" class="btn btn-info btn-fill btn-sm btn-wd ">InActive/Void</button>
                            <button type="button" id="btnEditPayment" class="btn btn-info btn-fill btn-sm btn-wd ">Edit</button>
                            <button type="button" id="btnDeletePayment" class="btn btn-info btn-fill btn-sm btn-wd ">Delete</button>
                            <button type="button" id="btnSavePayment" class="btn btn-info btn-fill btn-sm btn-wd ">Save</button>
                            

                        </div>
                    </div>
                </div>


             </div>
        </div>
    </div>
    <div id="AddVenderModel" class="modal fade bd-example-modal-sm" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">New Name</h4>
                </div>
                <div class="modal-body">

                    <div class="form-group">
                        <label>Name </label>
                        <input type="text" style="width: 40%;" class="form-control border-input">
                    </div>
                    <div class="form-group">
                        <label>Type </label>
                        <select id="type" class="form-control border-input" style="width: 40%;">
                            <option value="1">Vender</option>
                            <option value="2">Customer</option>
                        </select>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Save Changes</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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
                        <input type="text" style="width: 40%;" class="form-control border-input">
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
    
<%--<script type="text/javascript">
    $(function () {
        //Initialize Select2 Elements
        $(".select").select2();
    });
</script>--%>

</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Expense.aspx.cs" Inherits="turf_Finance.Expense" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/Custom/StyleSheet.css" rel="stylesheet" />
    <script src="scripts/Custom/Expense.js"></script>
    <style>
        .modalPrint {
            position: fixed;
            top: 191px;
            right: -479px;
            bottom: 14px;
            left: 546px;
            z-index: 1050;
            display: none;
            overflow: hidden;
            -webkit-overflow-scrolling: touch;
            outline: 0;
        }

        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        input[type=number] {
            text-align: right;
        }
    </style>
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
                                        <input id="startDate" placeholder=" Start Date" autocomplete="off" class="form-control border-input datepicker" />
                                    </div>
                                    <div class="col-md-2 labelWidth  PaddingClass ">
                                        <label class="Label">End Date:</label>
                                    </div>
                                    <div class="col-md-3 PaddingClass">
                                        <div class="input-wrapper">
                                            <input type="text" placeholder=" End Date" autocomplete="off" class="form-control border-input datepicker" id="datePickEnd" />

                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group text-right" style="margin-top:4px;">
                                        <button type="button" id="btnPay" class="btn btn-success btn-fill" onclick="PaymentPage();">Pay</button>
                                          <button type="button" id="Modal" class="btn btn-info btn-fill" onclick="openExpenseVoucher()">Add New Invoice</button>
                                   <%--     <button type="button" class="btn btn-success btn-fill">Export</button>
                                        <button type="button" class="btn btn-success btn-fill">Print</button>--%>
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
                                        <tr id="listrow0">
                                            <td>Saad</td>
                                            <td>Invoice No 1</td>
                                            <td>31 Aug 2019</td>
                                            <td> Expene Voucher No 1</td>
                                            <td>31 Aug 2019</td>
                                            <td>30,000.00</td>
                                            <td><p id="lblStatusInvoice0">Unpaid</p></td>
                                            <td>Electricity Bill Month of July 2019</td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr id="listrow1">
                                            <td>Shakir</td>
                                            <td>Invoice No 2</td>
                                            <td>31 Aug 2019</td>
                                            <td> Payment Voucher No 1</td>
                                            <td>31 Aug 2019</td>
                                            <td>20,000.00</td>
                                            <td><p id="lblStatusInvoice1">paid</p></td>
                                            <td>Internet Bill Month of July 2019</td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr id="listrow2">
                                            <td>Adnan</td>
                                            <td>Invoice No 3</td>
                                            <td>31 Aug 2019</td>
                                            <td>Payment Voucher No 3</td>
                                            <td>31 Aug 2019</td>
                                            <td>25,000.00</td>
                                            <td><p id="lblStatusInvoice2"> Partial Paid</p></td>
                                            <td>PTCL Bill Month of July 2019</td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr id="listrow3">
                                            <td>Adnan</td>
                                            <td>Invoice No 4</td>
                                            <td>31 Aug 2019</td>
                                            <td> Payment Voucher No 4</td>
                                            <td>31 Aug 2019</td>
                                            <td>25,000.00</td>
                                            <td><p id="lblStatusInvoice3"> Partial Paid</p></td>
                                            <td>PTCL Bill Month of July 2019</td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr id="listrow4">
                                            <td>Adnan</td>
                                            <td>Invoice No 5</td>
                                            <td>31 Aug 2019</td>
                                            <td> Expense Voucher No 5</td>
                                            <td>31 Aug 2019</td>
                                            <td>25,000.00</td>
                                            <td><p id="lblStatusInvoice4">Unpaid</p></td>
                                            <td>PTCL Bill Month of July 2019</td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr id="listrow5">
                                            <td>Adnan</td>
                                            <td>Invoice No 6</td>
                                            <td>31 Aug 2019</td>
                                            <td>Expense Voucher No 6</td>
                                            <td>31 Aug 2019</td>
                                            <td>25,000.00</td>
                                            <td><p id="lblStatusInvoice5">Unpaid</p></td>
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
                                <table id="tblListOfUnpaid" class="display  table-bordered" style="border-top: hidden!important; border-right: none; border-left: none; width: 100%">
                                    <thead>
                                        <tr style="border-top: hidden;">
                                            <th>
                                                <input type="checkbox" id="chkAll" /></th>
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
                                                    <input type="text" placeholder="Enter Start Date" class="form-control border-input datepicker" id="datePickStartVendorList" />
                                                </div>
                                            </div>
                                            <div class="col-md-2 labelWidth  PaddingClass ">
                                                <label class="Label">End Date:</label>
                                            </div>
                                            <div class="col-md-4 PaddingClass">
                                                <div class="input-wrapper">
                                                    <input type="text" placeholder="Enter End Date" class="form-control border-input datepicker" id="datePickEndVendorList" />

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
                                <input type="text" id="txtVendorName" class="form-control border-input" />
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Legal Entity</label>
                                <select id="ddlLegal" class="form-control border-input">
                                    <option value="0">Select</option>
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
                                <select id="ddlTaxProfile" class="form-control border-input">
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
                                <select id="ddlCity" class="form-control border-input ">
                                    <option value="0">city</option>
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
                                <select id="ddlCountry" class="form-control border-input ">
                                    <option value="0">Country</option>
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
                                <div class="input-wrapper">
                                    <input type="text" placeholder="Enter As of Date" class="form-control border-input datepicker " id="VendorAsOFdate" />

                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Account </label>
                                <select id="ddlVendorAccount" class="form-control border-input">
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
                        <div class="col-md-3">
                            <h4 class="title">Expense Voucher </h4>
                        </div>
                        <div class="col-md-5" style="padding-top: 3%;">

                            <label id="lblStatusOfExpenseVoucher" style="padding: 8px; border-radius: 50px; background: #23dd0a;">  <i class="ti-na"></i></label>
                        </div>
                        <div class="col-md-4" style="padding-top: 3%;">
                            <a id="CloseExpenseVoucher" style="float: right;" onclick="show_confirm_LeaveWithoutSavingExpenseVoucher('Do You Want To Leave Without Saving')"><i class="fa fa-times fa-lg"></i></a>
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
                                <select id="ddlSelectVendor" class="form-control border-input vendor" required="required">
                                    <option value="0">Select</option>
                                    <option value="1">100 | Nahid</option>
                                    <option value="2"> 1001 | Shakir</option>
                                </select>
                            </div>
                            <label id="lblEror" style="color: red"></label>
                        </div>

                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Invoice No </label>
                                <input type="text" id="txtInvoice" class="form-control border-input" required="required" />
                            </div>
                            <label id="lblInvoiceEror" style="color: red"></label>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Invoice Date </label>
                                <div class="input-wrapper">
                                    <input type="text" onchange="InvoiceDate_onchange();" placeholder="Enter Invoice Date" class="form-control border-input datepicker " id="InvoiceDate" />

                                </div>
                            </div>
                            <label id="lblInvoiceDateEror" style="color: red"></label>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Due Date</label>
                                <div class="input-wrapper">
                                    <input type="text" placeholder="Enter Due Date" onchange="DueDate_OnChange();" class="form-control border-input datepicker" id="DueDate" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Bill Ref / Voucher No </label>
                                <input type="text" id="voucherno" class="form-control border-input" required="required" />
                            </div>
                            <label id="lblVoucherNoEror" style="color: red"></label>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label> Bill / Voucher Date </label>
                                <div class="input-wrapper">
                                    <input type="text" placeholder="Enter Voucher Date" class="form-control border-input datepicker " id="VoucherDate" />

                                </div>
                            </div>
                            <label id="lblVoucherDateEror" style="color: red"></label>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Tax </label>
                                <select id="ddlAddTax" class="form-control border-input tax" style="width: 100%;">
                                    <option value="0">-Select-</option>
                                    <!--<option style="color:blue;font-weight:bold" value="-1">Add New</option>-->
                                    <option value="1">100 | GST</option>
                                    <option value="2"> 101 | WHT</option>
                                    <option value="3"> 102 |Further GST</option>
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
                                <table class="table display table-bordered table-hover table-sortable" id="tblExpenseVoucherDetail">
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
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12" id="lblTotalShow">
                                <div class="col-md-8 text-right">
                                    <label>Total</label>
                                </div>
                                <div class="col-md-4 text-left">
                                    <label id="lblTotal"></label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <a id="add_rowAccountDetail" class="btn btn-primary  btn-fill  btn-sm btn-wd ">Add a new Line</a>
                                <button type="button" id="ClearAll" class="btn btn-primary  btn-fill  btn-sm btn-wd " onclick="show_confirm_RemoveAllRowsFromExpenseVoucher('Are You Sure Want to Remove All Rows');">Clear All Lines</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="container-fluid" style="padding-top: 3%;">
                        <div class="col-md-12">
                            <label id="lblItemDetail " class="btn-group" onclick="ShowItemDetailTable();"><i class="fa fa-caret-down" style="padding: 10px;"></i>Item Detail</label>
                        </div>
                    </div>
                </div>
                <div class="row" id="Product_Detail">
                    <%--<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>--%>
                    <div class="container" style="width: 100%;">
                        <div class="row clearfix">
                            <div class="col-md-12 table-responsive">
                                <table class="table display table-bordered table-hover table-sortable" id="tab_ItemDetail">
                                    <thead>

                                        <tr>
                                            <th>Product
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
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12" id="div_TotalItemAmount">
                                <div class="col-md-8 text-right">
                                    <label>Total</label>
                                </div>
                                <div class="col-md-4 text-left">
                                    <label id="lbltotalItemAmount"></label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">

                                <a id="add_rowProduct" class="btn btn-primary btn-fill   btn-sm btn-wd ">Add a new Line</a>
                                <button id="ClearAllLinesProduct" type="button" class="btn btn-primary btn-fill   btn-sm  btn-wd" onclick="show_confirm_RemoveAllRowsFromItemDetail('Are You sure Want to Remove All Lines');">Clear All Lines</button>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="container-fluid" style="padding-top: 3%;">
                        <div class="col-md-12 text-right">
                            <button type="button" id="btnDuplicate" onclick="DuplicateExpenseVoucher();" class="btn btn-info btn-fill btn-sm btn-wd ">Duplicate</button>
                            <button type="button" id="btnEdit" onclick="EnableExpenseVoucher();" class="btn btn-info btn-fill btn-sm btn-wd ">Edit</button>
                            <button type="button" id="btnDelete" class="btn btn-info btn-fill btn-sm btn-wd ">Delete</button>
                            <button type="button" id="btnReturn" class="btn btn-info btn-fill btn-sm btn-wd ">Return</button>
                            <button type="button" id="btnSave" onclick="ValidateExpenseVoucher();" class="btn btn-info btn-fill btn-sm btn-wd ">Save</button><%--// onclick="show_confirm('Are you print This')"--%>
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

                                <label id="lblStatus" style="padding: 8px; border-radius: 50px; background: #23dd0a;"> <i class="ti-na"></i></label>
                            </div>
                            <div class="col-md-4 text-right" style="padding-top: 3%;">
                                <a id="ClosePaymentVoucher" onclick="show_confirm_LeaveWithoutSavingPayment('Do You Want To Leave Without Saving')"><i class="fa fa-times fa-lg"></i></a>
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
                                <label> Payment Voucher No </label>
                                <input type="text" id="txtPaymentVoucher" class="form-control border-input" />
                            </div>
                            <label id="lblPaymentVoucherEror" style="color: red"></label>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label> Payment Voucher Date </label>
                                <div class="input-wrapper">
                                    <input type="text" placeholder="Enter Voucher Date" class="form-control border-input datepicker" id="VoucherDatePayment" />
                                </div>
                            </div>
                            <label id="lblPaymentVoucherDateEror" style="color: red"></label>
                        </div>
                    </div>
                </div>
                <div id="div_demoPayment" class="row">
                    <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
                    <div class="container" style="width: 100%;">
                        <div class="row clearfix">
                            <div class="col-md-9 table-responsive ">
                                <table id="demoGridForVenderBalance" class="display  table-bordered ">
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
                                            <td>
                                                <label>Saad</label></td>
                                            <td>
                                                <label>23,500.00</label></td>
                                            <td>
                                                <label>34,000.00</label></td>
                                            <td>
                                                <label id="lblBalance">-10,500.00</label>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-md-1" style="margin-top: 3%">
                                <input type="checkbox" id="chkUseCredit" />
                            </div>
                        </div>
                    </div>
                </div>
                <div id="div_Payment" class="row">
                    <div class="col-md-12">
                        <table id="tblPayment" class="display  table-bordered">
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
                                <tr id="row0" data-id="0">
                                    <td>Invoice No 1</td>
                                    <td>
                                        <label id="lblInvoiceAmount" class="InvoiceAmount">11,500.00</label></td>
                                    <td>
                                        <input type="number" id="textAmount0" style="text-decoration: none;" class="form-control border-input txtDiscount" placeholder="Enter Discount " onkeyup="CalculateNetAmount();" /></td>
                                    <td>
                                        <label id="lblNetAmount"></label>
                                    </td>
                                    <td>
                                        <input type="text" id="txtPayment0" class="form-control border-input txtPayment " style="text-align:right" placeholder="Enter Amt to Pay" <%--onkeypress="CalculatePayment_OnKeypress(event);"--%> onkeyup="CalculatePayment_OnKeyUp(event);" /></td>
                                    <td id="td_TaxName0">
                                        <a href="#" title="Add Tax" id="btnAddTax" onclick="AddTax(this);"><i class="fa fa-plus "></i></a>
                                    </td>
                                    <td id="td_TaxAmount0"></td>
                                    <td style="text-align: center;">
                                        <label id="lblPayment0">0.00</label>
                                    </td>
                                    <td>
                                        <input type="text" id="txtMemo0" class="form-control border-input col-md-2" />
                                    </td>
                                    <td>
                                        <button type="button" id="btnRemovePayment0" onclick="removePaymentRow(this);" class='btn btn-danger   row-remove' ><span aria-hidden="true">×</span></button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="col-md-6">
                            <div class="col-md-1 ">
                                <label>Total:</label>
                            </div>
                            <div class="col-md-1 " style="margin-left: 17px;">
                                <label id="lbltotalInvoiceAmount">11,500.00</label>
                            </div>
                        </div>
                        <div class="col-md-6" id=>
                            <div class="col-md-12">
                                <div class="col-md-4 text-right ">
                                    <label>Total:</label>
                                </div>
                                <div class="col-md-2 text-right" style="padding-right: 0; padding-left: 9%;">
                                    <label id="lblCalculatePayment">0.00</label>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div id="di_UseCredit">
                    <div class="row">
                        <div class="col-md-8 text-right" style="padding-right: 9px;">
                            <label>Use Credit :</label>
                        </div>
                        <div class="col-md-4 text-right" id="UseCredit">
                            <div class="col-md-6 ">
                                <input type="number" id="txtUseVendorCredit" class="form-control" onkeyup="ChangeVendorCredit();" onkeypress="useVendorBalanceMax(event);" style="width: 64%; text-align: center; padding: 0 !important; height: auto !important" />
                            </div>


                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-8 text-right" style="padding-right: 9px;">
                            <label>outstanding :</label>
                        </div>
                        <div class="col-md-4 text-right" style="margin-left: -23px;">
                            <div class="col-md-6 text-center">
                                <label id="lblvendorCredit"></label>
                            </div>


                        </div>
                        <%--  <div class="col-md-12">
                        <div class="col-md-10 text-right " style="margin-left:-5%;" >
                            
                        </div>
                    </div>--%>
                    </div>
                </div>
                <div class="row">
                    <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
                    <div class="container" style="width: 100%;">
                        <div class="row clearfix">
                            <div class="col-md-12 table-responsive">
                                <table class="table display table-bordered table-hover table-sortable" id="tblBankDetail">
                                    <thead>

                                        <tr>
                                            <th>Bank
                                            </th>
                                            <th> Balance
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
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <a id="add_rowBankDetail" class="btn btn-primary  btn-fill  btn-wd btn-sm">Add a new Line</a>
                                <a id="ClearAllBankDetail" class="btn btn-primary  btn-fill  btn-wd btn-sm " onclick="show_confirm_RemoveAllRowsFromBankDetail('Are You Sure Want To Remove All Lines') ">Clear All Lines</a>
                            </div>
                            <div class="col-md-6" id="div_CalculateChequeAmount">
                                <div class="col-md-7 text-right">
                                    <label>Total:</label>
                                </div>
                                <div class="col-md-3 text-right">
                                    <label id="lblCheckAmount">0.00</label>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="container-fluid" style="padding-top: 3%;">
                        <div class="col-md-12 text-right">
                            <button type="button" id="btnInActive" class="btn btn-info btn-fill btn-sm btn-wd ">InActive/Void</button>
                            <button type="button" id="btnEditPayment" onclick="EnablePaymentVoucher();" class="btn btn-info btn-fill btn-sm btn-wd ">Edit</button>
                            <button type="button" id="btnDeletePayment" class="btn btn-info btn-fill btn-sm btn-wd ">Delete</button>
                            <button type="button" id="btnSavePayment" onclick=" ValidateExpenseVoucherPayment();" class="btn btn-info btn-fill btn-sm btn-wd ">Save</button>
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
                    <h4 class="modal-title">New Supplier</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class=" col-md-6 form-group">
                            <label>Name </label>
                            <input type="text" id="txtVendorNameModel" class="form-control border-input" />
                        </div>
                    </div>
                    <div class="row">
                        <div class=" col-md-2 form-group">
                            <a href="#" onclick="show_confirm_VendorDetail('');" style="font-weight: bold;">+ Details</a>
                        </div>
                    </div>

                    <%-- <div class="form-group">
                        <label>Type </label>
                        <select id="type" class="form-control border-input" style="width: 40%;">
                            <option value="1">Vender</option>
                            <option value="2">Customer</option>
                        </select>
                    </div>--%>
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
                    <div class="row">
                        <div class=" col-md-6 form-group">
                            <label>Tax </label>
                            <input type="text" class="form-control border-input" />
                        </div>
                    </div>
                    <div class="row">
                        <div class=" col-md-2 form-group">
                            <a href="#" onclick="show_confirm_AddTaxDetail('');" style="font-weight: bold;">+ Details</a>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Save Changes</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <div id="AddInventoryModal" class="modal fade bd-example-modal-sm" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Inventory</h4>
                </div>
                <div class="modal-body">
                       <div class="row">
                        <div class=" col-md-6 form-group">
                            <label>Type * </label>
                           <select class="form-control border-input select2" style="width:100%" id="ddlType" >
                                        <option value="0">Select</option>
                                        <option value="1">Inventory</option>
                                        <option value="2">Non Inventory</option>
                                        
                                    </select>
                        </div>
                    </div>
                      <div class="row">
                        <div class=" col-md-6 form-group">
                            <label>SKU ** </label>
                            <input type="text" class="form-control border-input" />
                        </div>
                    </div>
                    <div class="row">
                        <div class=" col-md-6 form-group">
                            <label>Name *  </label>
                            <input type="text" class="form-control border-input" />
                        </div>
                    </div>
                   
                    <div class="row">
                        <div class=" col-md-2 form-group">
                            <a href="#" onclick="show_confirm_AddProductAndServices('');" style="font-weight: bold;">+ Details</a>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Save Changes</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>



    <div id="AddTaxPayment" class="modal fade bd-example-modal-sm" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">New Tax</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="col-md-1">
                                <input type="hidden" id="txtHidden" value="" />
                                <label style="padding-top: 15%!important">Tax </label>
                            </div>
                            <div class="col-md-4">
                                <select id="AddTax1" style="width: 160px;" class="form-control border-input tax">
                                    <option value="0">-Select-</option>
                                    <option value="1">GST</option>
                                    <option value="2">WHT</option>
                                    <option value="3">Further GST</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <input type="number" id="txttaxAmount" class="form-control border-input" placeholder="Enter tax Amount" />
                            </div>
                            <div class="col-md-3 ">
                                <button type="button" id="btnAddTaxToPaymentList" onclick="AddTaxToTable();" class="btn btn-success btn-fill">Add</button>
                            </div>
                        </div>
                    </div>
                    <hr />
                    <div id="div_TaxPayment" class="row">
                        <div class="col-md-12">
                            <table id="tblTaxPayment" class="display table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Account
                                        </th>
                                        <th>Amount
                                        </th>
                                        <th>Remove
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btnSaveTaxOnPayment" onclick="SaveTaxOnInvoice();" class="btn btn-default" data-dismiss="modal">Save Changes</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <div id="AddLegalEntity" class="modal fade bd-example-modal-sm" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">New Legal Entity</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Name </label>
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
    <div id="AddCity" class="modal fade bd-example-modal-sm" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">New City</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Name </label>
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
    <div id="AddCountry" class="modal fade bd-example-modal-sm" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">New Country</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Name </label>
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
    <div id="AddClass" class="modal fade bd-example-modal-sm" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">New Class</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Name </label>
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
    <div id="AddAccount" class="modal fade bd-example-modal-sm" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">New Account</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class=" col-md-6 form-group">
                            <label>Name </label>
                            <input type="text" class="form-control border-input" />
                        </div>
                    </div>
                    <div class="row">
                        <div class=" col-md-2 form-group">
                            <a href="#" onclick="show_confirm_AddAccountDetail();" style="font-weight: bold;">+ Details</a>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Save Changes</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <div id="AddBank" class="modal fade bd-example-modal-sm" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">New Bank</h4>
                </div>
                <div class="modal-body">
                   <div class="row">
                        <div class=" col-md-6 form-group">
                            <label>Name </label>
                            <input type="text" class="form-control border-input" />
                        </div>
                    </div>
                    <div class="row">
                        <div class=" col-md-2 form-group">
                            <a href="#" onclick="show_confirm_AddAccountDetail();" style="font-weight: bold;">+ Details</a>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Save Changes</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <div id="AddProject" class="modal fade bd-example-modal-sm" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">New Project</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Name </label>
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
    <div id="ExpenseSummery" class="modal fade bd-example-modal-sm" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Payment Summery </h4>
                </div>
                <div class="modal-body">
                    <table id="btnTable" class=" table">
                        <tr>
                            <td><label> Total Invoice Amount</label> </td><td> <label id="lblSummeryInvoiceAmount" style="width:50%;text-align:right">0.00</label></td>
                        </tr>
                         <tr>
                            <td><label> Total Discount Amount</label> </td><td> <label id="lblSummeryDiscountAmount" style="width:50%;text-align:right">0.00</label></td>
                        </tr>
                         <tr>
                            <td><label> Total Pay Amount</label> </td><td> <label id="lblSummeryPayAmount" style="width:50%;text-align:right">0.00</label></td>
                        </tr>
                          <tr>
                            <td><label> Total Tax Amount</label> </td><td> <label id="lblSummeryTaxAmount" style="width:50%;text-align:right">0.00</label></td>
                        </tr>
                          <tr>
                            <td><label> Account</label> </td><td> <label id="lblSummeryAccountAmount" style="width:50%;text-align:right">0.00</label></td>
                        </tr>
                         <tr>
                            <td><label> Bank </label> </td><td> <label id="lblSummeryBankAmount" style="width:50%;text-align:right">0.00 </label></td>
                        </tr>
                        <tr>
                            <td><label> Outstanding </label> </td><td> <label id="lblSummeryOutstandingAmount" style="width:50%;text-align:right">0.00</label></td>
                        </tr>
                        


                    </table>
                    <%--<div class="row">
                        <div class="col-md-12">
                            <div class="col-md-6">
                                <label>Total Amount</label>
                            </div>
                            <div class="col-md-6">
                               
                            </div>
                        </div>
                    </div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btnSaveSummery" class="btn btn-default">Save Changes</button>
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
   
     <%--<div id="overlay" style="background-color:black;width:100%;height:100%;position:absolute;z-index:1000;opacity:0.6; visibility:hidden;text-align:center">
        <img id="imgLoading" src="assets/img/loading-31.gif" width="150" />
    </div>--%>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Bank.aspx.cs" Inherits="turf_Finance.Bank" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/Custom/StyleSheet.css" rel="stylesheet" />
    <script src="scripts/Custom/Bank.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div id="BankList" class="wrapper">
        <ul id="my_tab" class="nav nav-tabs">
            <li class="active"><a data-toggle="tab" href="#Tab_BankList" style="font-weight: bold;">Bank List</a></li>
            <li><a data-toggle="tab" href="#tabs_CashIn" style="font-weight: bold;">Cash In</a></li>
            <li><a data-toggle="tab" href="#tabs_CashOut" style="font-weight: bold;">Cash Out</a></li>
            <li><a data-toggle="tab" href="#tabs_BankTransfer" style="font-weight: bold;">Bank Transfer</a></li>
        </ul>
        <div class="tab-content" id="tabs">
            <div id="Tab_BankList" class="tab-pane fade in active">
                <div class="content" id="BankListTab">
                    <div class="container-fluid">

                        <div class="row" style="margin-top: 23px">
                            <div class="col-md-12">
                                <div class="col-md-9">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>Bank </label>
                                            <select id="ddBank" class="form-control border-input bank">
                                                <option value="1">HBL</option>
                                                <option value="2">Meezan Bank</option>
                                                <option value="3">Alfalah</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-md-3 ">
                                        <div class="form-group">
                                            <label>Start Date </label>
                                            <div class="input-wrapper">
                                                <input type="text" placeholder="enter End Date" class="form-control border-input" id="datePickStart" />
                                                <label for="datePickStart" class="fa fa-calendar input-icon datePickStart"></label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>End Date </label>
                                            <div class="input-wrapper">
                                                <input type="text" placeholder="enter End Date" class="form-control border-input" id="datePickEnd" />
                                                <label for="datePickEnd" class="fa fa-calendar input-icon datePickEnd"></label>
                                            </div>
                                        </div>
                                    </div>
                                </div>



                                <div class="col-md-3" style="margin-top: 2%">
                                    <div class="form-group text-right">
                                        <!--<button type="button" id="btnReceive" class="btn btn-success btn-fill" onclick="ReceivePage();">Receive</button>-->
                                        <button type="button" class="btn btn-success btn-fill">Export</button>
                                        <button type="button" class="btn btn-success btn-fill">Print</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr />
                        <div id="div_BankList" class="row">
                            <div class="col-md-12">
                                <table id="tblBankList" class="display  table-bordered" style="border-top: hidden!important; border-right: none; border-left: none; width: 100%">
                                    <thead>
                                        <tr style="border-top: hidden;">
                                            <th>Contacts</th>
                                            <th>Voucher No</th>
                                            <th>Voucher Date</th>
                                            <th>Cheque No</th>
                                            <th>Cheque Date</th>
                                            <th>Reconcilation</th>
                                            <th>Memo</th>
                                            <th>Cash In</th>
                                            <th>Cash Out</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <tr>
                                            <td>Shakir</td>
                                            <td>Receive Voucher No 1</td>
                                            <td>31 Aug 2019</td>
                                            <td>Cheque No 1</td>
                                            <td>5 sep 2019</td>
                                            <td>No</td>
                                            <td>Sale T-shirts </td>
                                            <td>10,500</td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>Saad</td>
                                            <td>Payment Voucher No 1</td>
                                            <td>31 Aug 2019</td>
                                            <td>Cheque No 1</td>
                                            <td>31 Aug 2019</td>
                                            <td>Yes</td>
                                            <td>Electricity bill Month of July 2019 </td>
                                            <td></td>
                                            <td>15,500</td>


                                        </tr>
                                        <tr>
                                            <td>FBR</td>
                                            <td>TaxPay Voucher No 1</td>
                                            <td>15 Sep 2019</td>
                                            <td>Cheque No 3</td>
                                            <td>5 sep 2019</td>
                                            <td>No</td>
                                            <td>Pay Tax to Govt: </td>
                                            <td></td>
                                            <td>5,000.00</td>
                                        </tr>

                                    </tbody>
                                </table>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div id="tabs_CashIn" class="tab-pane fade">
                <div class="content">
                    <div class="container-fluid">

                        <div class="row" style="margin-top: 23px;">
                            <div class="col-md-12">


                                <div class="form-group col-md-3">
                                    <label>Contacts</label>
                                    <select id="ddcontacts" style="width: 100%" class="form-control border-input Contacts">
                                        <option value="0">Select</option>
                                        <option value="1">Nahid</option>
                                        <option value="2">Shakir</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-3">
                                    <label>Receive Voucher</label>
                                    <input type="text" class="form-control border-input" />
                                </div>

                                <div class="form-group col-md-3">
                                    <label>Voucher Date</label>
                                    <div class="input-wrapper">
                                        <input type="text" placeholder="enter Voucher Date" class="form-control border-input " id="CashInVoucherDate" />
                                        <label for="CashInVoucherDate" class="fa fa-calendar input-icon CashInVoucherDate"></label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <hr />
                        <div class="row">
                            <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
                            <div class="container" style="width: 100%;">
                                <div class="row clearfix">
                                    <div class="col-md-12 table-responsive">
                                        <table class="table display table-bordered table-hover table-sortable" id="tab_CashIn">
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
                                                            <select id="ddlAccount" name="Account0" class="form-control">
                                                                <option value="0">Select</option>
                                                                <option style="color: blue; font-weight: bold" value="-1">Add New Account </option>
                                                                <option value="1">Sale</option>
                                                                <option value="2">Expense</option>
                                                                <option value="3">Utilities</option>
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
                                                            <select id="ddlClass" name="Class0" class="form-control" onchange="ddAddClass();">
                                                                <option value="0">Select</option>
                                                                <option style="color: blue; font-weight: bold" value="-1">Add New Class</option>
                                                                <option value="1">Class1</option>
                                                                <option value="2">Class2</option>
                                                                <option value="3">Class3</option>
                                                            </select>

                                                        </div>

                                                    </td>
                                                    <td data-name="sel">
                                                        <select id="ddlProject" name="Project0" class="form-control">
                                                            <option value="0">Select</option>
                                                            <option style="color: blue; font-weight: bold" value="-1">Add New Project</option>
                                                            <option value="1">Project1</option>
                                                            <option value="2">Project2</option>
                                                            <option value="3">Project3</option>
                                                        </select>
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
                                        <div class="col-md-3 text-right">
                                            <label>Total:</label>
                                        </div>
                                        <div class="col-md-2">
                                            <label>10,000.00</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">

                                        <a id="add_rowCashIn" class="btn btn-primary  btn-fill  btn-sm btn-wd ">Add a new Line</a>
                                        <a id="ClearAllCashIn" class="btn btn-primary  btn-fill  btn-sm btn-wd ">Clear All Lines</a>
                                        <!--<button type="button" style="float:right" class="btn btn-info btn-fill btn-wd ">Save</button>-->
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="row" style="margin-top: 23px;">
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
                                                    <th>Amount
                                                    </th>
                                                    <th>Remove
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr id='addr0' data-id="0" class="hidden">

                                                    <td data-name="sel">
                                                        <div id="Bank">
                                                            <select id="ddlBank" name="Bank0" class="form-control">
                                                                <option value="0">Select</option>
                                                                <option style="color: blue; font-weight: bold" value="-1">Add New Bank </option>
                                                                <option value="1">Meezan Bank</option>
                                                                <option value="2">HBL</option>
                                                                <option value="3">Alfala</option>
                                                            </select>
                                                        </div>

                                                    </td>
                                                    <td data-name="Balance">
                                                        <label>100,000.00</label>
                                                    </td>
                                                    <td data-name="ChequeNo">
                                                        <input type="text" name='ChequeNo0' class="form-control border-input" />
                                                    </td>

                                                    <td data-name="ChequeDate">
                                                        <input type="date" name='ChequeNo0' class="form-control border-input" />

                                                    </td>
                                                    <td data-name="Amount">
                                                        <input type="number" name='ChequeNo0' class="form-control border-input" />
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
                                        <div class="col-md-9 text-right">
                                            <label>Total:</label>
                                        </div>
                                        <div class="col-md-2">
                                            <label>10,000.00</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">

                                        <a id="add_rowBankDetail" class="btn btn-primary  btn-fill  btn-sm btn-wd ">Add a new Line</a>
                                        <a id="ClearAllBankDetail" class="btn btn-primary  btn-fill  btn-sm btn-wd ">Clear All Lines</a>
                                        <!--<button type="button" style="float:right" class="btn btn-info btn-fill btn-wd ">Save</button>-->
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="container-fluid" style="padding-top: 3%;">
                                <div class="col-md-12 text-right">
                                    <button type="button" id="btnEditCashIn" style="display: none" class="btn btn-info btn-fill btn-sm btn-wd ">Edit</button>
                                    <button type="button" id="btnDeleteCashIn" style="display: none" class="btn btn-info btn-fill btn-sm btn-wd ">Delete</button>
                                    <button type="button" id="btnInActiveCashIn" style="display: none" class="btn btn-info btn-fill btn-sm btn-wd ">Void/InActive</button>
                                    <button type="button" id="btnSaveCashIn" class="btn btn-info btn-fill btn-sm btn-wd ">Save</button>

                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div id="tabs_CashOut" class="tab-pane fade">
                <div class="content">
                    <div class="container-fluid">

                        <div class="row" style="margin-top: 23px;">
                            <div class="col-md-12">


                                <div class="form-group col-md-3">
                                    <label>Contacts</label>
                                    <select id="ddcontactsCashOut" style="width: 100%" class="form-control border-input Contacts">
                                        <option value="0">Select</option>
                                        <option value="1">Nahid</option>
                                        <option value="2">Shakir</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-3">
                                    <label>Payment Voucher</label>
                                    <input type="text" class="form-control border-input" />
                                </div>

                                <div class="form-group col-md-3">
                                    <label>Voucher Date</label>
                                    <div class="input-wrapper">
                                        <input type="text" placeholder="enter Voucher Date" class="form-control border-input " id="CashOutVoucherDate" />
                                        <label for="CashOutVoucherDate" class="fa fa-calendar input-icon CashOutVoucherDate"></label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <hr />
                        <div class="row">
                            <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
                            <div class="container" style="width: 100%;">
                                <div class="row clearfix">
                                    <div class="col-md-12 table-responsive">
                                        <table class="table display table-bordered table-hover table-sortable" id="tblCashOut">
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
                                                            <select id="ddlAcctCashOut" name="Account0" class="form-control">
                                                                <option value="0">Select</option>
                                                                <option style="color: blue; font-weight: bold" value="-1">Add New Account </option>
                                                                <option value="1">Sale</option>
                                                                <option value="2">Expense</option>
                                                                <option value="3">Utilities</option>
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
                                                            <select id="ddlClsCashOut" name="Class0" class="form-control" onchange="ddAddClass();">
                                                                <option value="0">Select</option>
                                                                <option style="color: blue; font-weight: bold" value="-1">Add New Class</option>
                                                                <option value="1">Class1</option>
                                                                <option value="2">Class2</option>
                                                                <option value="3">Class3</option>
                                                            </select>

                                                        </div>

                                                    </td>
                                                    <td data-name="sel">
                                                        <select id="ddlPrjtCashOut" name="Project0" class="form-control">
                                                            <option value="0">Select</option>
                                                            <option style="color: blue; font-weight: bold" value="-1">Add New Project</option>
                                                            <option value="1">Project1</option>
                                                            <option value="2">Project2</option>
                                                            <option value="3">Project3</option>
                                                        </select>
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
                                        <div class="col-md-3 text-right">
                                            <label>Total:</label>
                                        </div>
                                        <div class="col-md-2">
                                            <label>10,000.00</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">

                                        <a id="add_rowCashOut" class="btn btn-primary  btn-fill  btn-sm btn-wd ">Add a new Line</a>
                                        <a id="add_row" class="btn btn-primary  btn-fill  btn-sm btn-wd ">Clear All Lines</a>
                                        <!--<button type="button" style="float:right" class="btn btn-info btn-fill btn-wd ">Save</button>-->
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="row" style="margin-top: 23px;">
                            <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
                            <div class="container" style="width: 100%;">
                                <div class="row clearfix">
                                    <div class="col-md-12 table-responsive">
                                        <table class="table display table-bordered table-hover table-sortable" id="tab_BankDetailCashOut">
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
                                                    <th>Amount
                                                    </th>
                                                    <th>Remove
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr id='addr0' data-id="0" class="hidden">

                                                    <td data-name="sel">
                                                        <div id="Bank1">
                                                            <select id="ddlBankCashOut" name="Bank0" class="form-control">
                                                                <option value="0">Select</option>
                                                                <option style="color: blue; font-weight: bold" value="-1">Add New Bank </option>
                                                                <option value="1">Meezan Bank</option>
                                                                <option value="2">HBL</option>
                                                                <option value="3">Alfala</option>
                                                            </select>
                                                        </div>

                                                    </td>
                                                    <td data-name="Balance">
                                                        <label>100,000.00</label>
                                                    </td>
                                                    <td data-name="ChequeNo">
                                                        <input type="text" name='ChequeNo0' class="form-control border-input" />
                                                    </td>

                                                    <td data-name="ChequeDate">
                                                        <input type="date" name='ChequeNo0' class="form-control border-input" />

                                                    </td>
                                                    <td data-name="Amount">
                                                        <input type="number" name='ChequeNo0' class="form-control border-input" />
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
                                        <div class="col-md-9 text-right">
                                            <label>Total:</label>
                                        </div>
                                        <div class="col-md-2">
                                            <label>10,000.00</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">

                                        <a id="add_rowBankDetailCashOut" class="btn btn-primary  btn-fill  btn-sm btn-wd ">Add a new Line</a>
                                        <a id="ClearAllBankDetailCashOut" class="btn btn-primary  btn-fill  btn-sm btn-wd ">Clear All Lines</a>
                                        <!--<button type="button" style="float:right" class="btn btn-info btn-fill btn-wd ">Save</button>-->
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="container-fluid" style="padding-top: 3%;">
                                <div class="col-md-12 text-right">
                                    <button type="button" id="btnEditCashOut" style="display: none" class="btn btn-info btn-fill btn-sm btn-wd ">Edit</button>
                                    <button type="button" id="btnDeleteCashOut" style="display: none" class="btn btn-info btn-fill btn-sm btn-wd ">Delete</button>
                                    <button type="button" id="btnInActiveCashOut" style="display: none" class="btn btn-info btn-fill btn-sm btn-wd ">Void/InActive</button>
                                    <button type="button" id="btnSaveCashOut" class="btn btn-info btn-fill btn-sm btn-wd ">Save</button>

                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div id="tabs_BankTransfer" class="tab-pane fade">
                <div class="content">
                    <div class="container-fluid">

                        <div class="row" style="margin-top: 23px;">
                            <div class="col-md-12">
                                <div class="form-group col-md-3">
                                    <label>Payment Voucher</label>
                                    <input type="text" class="form-control border-input" />
                                </div>

                                <div class="form-group col-md-3">
                                    <label>Voucher Date</label>
                                    <div class="input-wrapper">
                                        <input type="text" placeholder="enter Voucher Date" class="form-control border-input " id="BankTransferVoucherDate" />
                                        <label for="BankTransferVoucherDate" class="fa fa-calendar input-icon BankTransferVoucherDate"></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">

                                <div class="form-group col-md-3">
                                    <label>Transfer Funds From</label>
                                    <select id="ddltransferFrom" style="width: 100%" class="form-control border-input bank">
                                        <option value="0">Select</option>
                                        <option value="1">Meezan Bank</option>
                                        <option value="2">HBL Bank</option>
                                        <option value="3">Alfalah Bank</option>
                                    </select>
                                </div>

                                <div class="form-group col-md-3">
                                    <label>Balance</label>
                                    <label class="form-control border-input text-center">200,000.00</label>
                                </div>



                                <div class="form-group col-md-3">
                                    <label>Transfer Funds To</label>
                                    <select id="ddltransferTo" style="width: 100%" class="form-control border-input bank">
                                        <option value="0">Select</option>
                                        <option style="color: blue; font-weight: bold" value="-1">Add New Bank </option>
                                        <option value="1">Meezan Bank</option>
                                        <option value="2">HBL Bank</option>
                                        <option value="3">Alfalah Bank</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-3">
                                    <label>Balance</label>
                                    <label class="form-control border-input text-center">50,000.00</label>
                                </div>

                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group col-md-3">
                                    <label>Transfer Amount</label>
                                    <input type="text" class="form-control border-input" />
                                </div>

                                <div class="form-group col-md-3">
                                    <label>Memo</label>
                                    <input type="text" class="form-control border-input" />
                                </div>
                            </div>
                        </div>

                        <hr />
                        <div class="row">
                            <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
                            <div class="container" style="width: 100%;">
                                <div class="row clearfix">
                                    <div class="col-md-12 table-responsive">
                                        <table class="table display table-bordered table-hover table-sortable" id="tblBankTransfer">
                                            <thead>

                                                <tr>
                                                    <th>Cheque N0
                                                    </th>
                                                    <th>Cheque Date
                                                    </th>
                                                    <th>Amount
                                                    </th>
                                                    <th>Remove
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr id='addr0' data-id="0" class="hidden">
                                                    <td data-name="ChequeNo">
                                                        <input type="text" name='chequeNo' class="form-control" />
                                                    </td>
                                                    <td data-name="ChequeDate">
                                                        <input type="date" name='chequeNo' class="form-control" />
                                                    </td>
                                                    <td data-name="Amount">
                                                        <input type="number" name='Amount0' class="form-control" />
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
                                            <label>Total:</label>
                                        </div>
                                        <div class="col-md-2">
                                            <label>10,000.00</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">

                                        <a id="add_rowBankTransfer" class="btn btn-primary  btn-fill  btn-sm btn-wd ">Add a new Line</a>
                                        <a id="ClearAllBankTransfer" class="btn btn-primary  btn-fill  btn-sm btn-wd ">Clear All Lines</a>
                                        <!--<button type="button" style="float:right" class="btn btn-info btn-fill btn-wd ">Save</button>-->
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="container-fluid" style="padding-top: 3%;">
                                <div class="col-md-12 text-right">
                                    <button type="button" id="btnEditBankTransfer" style="display: none" class="btn btn-info btn-fill btn-sm btn-wd ">Edit</button>
                                    <button type="button" id="btnDeleteBankTransfer" style="display: none" class="btn btn-info btn-fill btn-sm btn-wd ">Delete</button>
                                    <button type="button" id="btnInActiveBankTransfer" style="display: none" class="btn btn-info btn-fill btn-sm btn-wd ">Void/InActive</button>
                                    <button type="button" id="btnSaveBankTransfer" class="btn btn-info btn-fill btn-sm btn-wd ">Save</button>

                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>


        </div>
    </div>

    <div id="BankModal" class="modal fade bd-example-modal-sm" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">New Bank</h4>
                </div>
                <div class="modal-body">

                    <div class="form-group">
                        <label>Bank </label>
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
    <div id="AddCustomerModel" class="modal fade bd-example-modal-sm" role="dialog">
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

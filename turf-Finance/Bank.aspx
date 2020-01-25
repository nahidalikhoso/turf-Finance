<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Bank.aspx.cs" Inherits="turf_Finance.Bank" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/Custom/StyleSheet.css" rel="stylesheet" />
    <script src="scripts/Custom/Bank.js"></script>
    <style>
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

                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Bank </label>
                                        <select id="ddBank" class="form-control border-input bank">
                                            <option>Select</option>
                                            <option value="1">1000 | HBL</option>
                                            <option value="2">1001 | Meezan Bank</option>
                                            <option value="3">1002 | Alfalah</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-md-3 ">
                                    <div class="form-group">
                                        <label>Start Date </label>
                                        <div class="input-wrapper">
                                            <input type="text" placeholder="enter End Date" class="form-control border-input datepicker" id="txtStartDate" />

                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>End Date </label>
                                        <div class="input-wrapper">
                                            <input type="text" placeholder="enter End Date" class="form-control border-input datepicker" id="txtEndDate" />

                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3" style="margin-top: 3%;">
                                    <div class="form-group">

                                        <label> Balance :</label>
                                        <label>10,000.00</label>
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
                                            <th>Bank</th>
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
                                             <td>HBL</td>
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
                                            <td>Meezan</td>
                                            <td>Saad</td>
                                            <td>Payment Voucher No 1</td>
                                            <td>31 Aug 2019</td>
                                            <td>Cheque No 1</td>
                                            <td>31 Aug 2019</td>
                                            <td>Yes</td>
                                            <td>CashOut </td>
                                            <td></td>
                                            <td>15,500</td>


                                        </tr>
                                        <tr>
                                            <td>Alfallah</td>
                                            <td>FBR</td>
                                            <td>Payment Voucher No 2</td>
                                            <td>15 Sep 2019</td>
                                            <td>Cheque No 3</td>
                                            <td>5 sep 2019</td>
                                            <td>No</td>
                                            <td>Bank Transfer </td>
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

                                <div class="col-md-3">
                                    <div class="form-group ">
                                        <label>Contacts</label>
                                        <select id="ddcontacts" style="width: 100%" class="form-control border-input Contacts">
                                            <option value="0">Select</option>
                                            <option value="1">100 | Nahid</option>
                                            <option value="2">101 | Shakir </option>
                                        </select>
                                    </div>
                                    <label id="lblEror" style="color: red"></label>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Receive Voucher</label>
                                        <input type="text" id="txtVoucherCashIn" class="form-control border-input" />
                                    </div>
                                    <label id="lblVoucherNoEror" style="color: red"></label>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group ">
                                        <label>Voucher Date</label>
                                        <div class="input-wrapper">
                                            <input type="text" placeholder="enter Voucher Date" class="form-control border-input datepicker " id="txtCashInVoucherDate" />

                                        </div>
                                    </div>
                                    <label id="lblVoucherDateEror" style="color: red"></label>
                                </div>
                            </div>
                        </div>

                        <hr />
                        <div class="row">
                            <%--<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>--%>
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
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="row" id="TotalAmount">
                                    <div class="col-md-12">
                                        <div class="col-md-3 text-right">
                                            <label>Total:</label>
                                        </div>
                                        <div class="col-md-2">
                                            <label id="lblTotal">0.00</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">

                                        <a id="add_rowCashIn" class="btn btn-primary  btn-fill  btn-sm btn-wd ">Add a new Line</a>
                                        <a id="ClearAllCashIn" class="btn btn-primary  btn-fill  btn-sm btn-wd " onclick="show_confirm_RemoveAllRowsFromCashIn('Are You Sure Want To Remove All Lines')">Clear All Lines</a>
                                        <!--<button type="button" style="float:right" class="btn btn-info btn-fill btn-wd ">Save</button>-->
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="row" style="margin-top: 23px;">
                            <%--<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>--%>
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
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="row" id="lblShowChequeAmount">
                                    <div class="col-md-12">
                                        <div class="col-md-9 text-right">
                                            <label>Total:</label>
                                        </div>
                                        <div class="col-md-2">
                                            <label id="lblCheckAmount">0.00</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">

                                        <a id="add_rowBankDetail" class="btn btn-primary  btn-fill  btn-sm btn-wd ">Add a new Line</a>
                                        <a id="ClearAllBankDetail" class="btn btn-primary  btn-fill  btn-sm btn-wd " onclick="show_confirm_RemoveAllRowsFromBankDetail('Are You Sure Want To Remove All Lines')">Clear All Lines</a>
                                        <!--<button type="button" style="float:right" class="btn btn-info btn-fill btn-wd ">Save</button>-->
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="container-fluid" style="padding-top: 3%;">
                                <div class="col-md-12 text-right">
                                    <button type="button" id="btnEditCashIn" onclick="EnableCashInVoucher();" style="display: none" class="btn btn-info btn-fill btn-sm btn-wd ">Edit</button>
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

                                <div class="col-md-3">
                                    <div class="form-group ">
                                        <label>Contacts</label>
                                        <select id="ddcontactsCashOut" style="width: 100%" class="form-control border-input Contacts">
                                            <option value="0">Select</option>
                                            <option value="1">100 | Nahid</option>
                                            <option value="2">101 | Shakir</option>
                                        </select>
                                    </div>
                                    <label id="lblErorContactCashOut" style="color: red"></label>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group ">
                                        <label>Payment Voucher</label>
                                        <input type="text" id="txtCoshOutVoucher" class="form-control border-input" />
                                    </div>
                                    <label id="lblVoucherNoErorCashOut" style="color: red"></label>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group ">
                                        <label>Voucher Date</label>
                                        <div class="input-wrapper">
                                            <input type="text" placeholder="enter Voucher Date" class="form-control border-input datepicker" id="txtCashOutVoucherDate" />

                                        </div>
                                    </div>
                                    <label id="lblVoucherDateErorCashOut" style="color: red"></label>
                                </div>

                            </div>
                        </div>

                        <hr />
                        <div class="row">
                            <%--<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>--%>
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
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="row" id="div_ShowTotalAmount">
                                    <div class="col-md-12">
                                        <div class="col-md-3 text-right">
                                            <label>Total:</label>
                                        </div>
                                        <div class="col-md-2">
                                            <label id="lblTotalCashOunt">0.00</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">

                                        <a id="add_rowCashOut" class="btn btn-primary  btn-fill  btn-sm btn-wd ">Add a new Line</a>
                                        <a id="clearAllLinesCashOut" onclick="show_confirm_RemoveAllRowsFromCashOut();" class="btn btn-primary  btn-fill  btn-sm btn-wd ">Clear All Lines</a>
                                        <!--<button type="button" style="float:right" class="btn btn-info btn-fill btn-wd ">Save</button>-->
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="row" style="margin-top: 23px;">
                            <%--<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>--%>
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
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="row" id="lblShowChequeAmountCashOut">
                                    <div class="col-md-12">
                                        <div class="col-md-9 text-right">
                                            <label>Total:</label>
                                        </div>
                                        <div class="col-md-2">
                                            <label id="lblCheckAmountCashOut">0.00</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">

                                        <a id="add_rowBankDetailCashOut" class="btn btn-primary  btn-fill  btn-sm btn-wd ">Add a new Line</a>
                                        <a id="ClearAllBankDetailCashOut" onclick="show_confirm_RemoveAllRowsFromBankDetailCashOut();" class="btn btn-primary  btn-fill  btn-sm btn-wd ">Clear All Lines</a>
                                        <!--<button type="button" style="float:right" class="btn btn-info btn-fill btn-wd ">Save</button>-->
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="container-fluid" style="padding-top: 3%;">
                                <div class="col-md-12 text-right">
                                    <button type="button" id="btnEditCashOut" onclick="EnableCashOutVoucher();" style="display: none" class="btn btn-info btn-fill btn-sm btn-wd ">Edit</button>
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
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Payment Voucher</label>
                                        <input type="text" id="txtBankTransferVoucher" class="form-control border-input" />
                                    </div>
                                    <label id="lblErorBankTransferVoucher" style="color: red"></label>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group ">
                                        <label>Voucher Date</label>
                                        <div class="input-wrapper">
                                            <input type="text" placeholder="enter Voucher Date" class="form-control border-input datepicker " id="BankTransferVoucherDate" />
                                        </div>
                                    </div>
                                    <label id="lblErorBankTransferVoucherDate" style="color: red"></label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="col-md-3">
                                    <div class="form-group ">
                                        <label>Transfer Funds From</label>
                                        <select id="ddltransferFrom" style="width: 100%" class="form-control border-input bank">
                                            <option value="0">Select</option>
                                            <option value="1">100 | Meezan Bank</option>
                                            <option value="2">101 | HBL Bank</option>
                                            <option value="3">102 | Alfalah Bank</option>
                                        </select>
                                    </div>
                                    <label id="lblErorBankTransferTo" style="color: red"></label>
                                </div>
                                <div class="form-group col-md-2" style="margin-top: 3%">
                                    <label>Balance:</label>
                                    <label id="lblBankTransferBalance">20,000.00</label>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Transfer Funds To</label>
                                        <select id="ddltransferTo" style="width: 100%" class="form-control border-input bank">
                                            <option value="0">Select</option>
                                            <option value="1">100 | Meezan Bank</option>
                                            <option value="2">101 | HBL Bank</option>
                                            <option value="3">102 | Alfalah Bank</option>
                                        </select>
                                    </div>
                                      <label id="lblErorBankTransferFrom" style="color: red"></label>
                                </div>

                                <div class="form-group col-md-3" style="margin-top: 3%">
                                    <label>Balance</label>
                                    <label>50,000.00</label>
                                </div>

                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="col-md-3">
                                <div class="form-group ">
                                    <label>Transfer Amount</label>
                                    <input type="number" id="txtTransferAmount" onkeyup="ValidateTransferAmountToBalance();" class="form-control border-input" />
                                </div>
                                <label id="lblErorBankTransferAmount" style="color: red"></label>
                                    </div>
                                <div class="col-md-3">
                                <div class="form-group ">
                                    <label>Memo</label>
                                    <input type="text" id="txtMemoBankTransfer" class="form-control border-input" />
                                </div>
                                    <label id="lblErorBankTransferMemo" style="color: red"></label>
                                    </div>
                            </div>
                        </div>

                        <hr />
                        <div class="row">
                            <%--<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>--%>
                            <div class="container" style="width: 100%;">
                                <div class="row clearfix">
                                    <div class="col-md-12 table-responsive">
                                        <table class="table display table-bordered table-hover table-sortable" id="tblBankTransfer">
                                            <thead>

                                                <tr>
                                                    <th>Cheque No.
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
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="row" id="div_ShowTotalBankTransfer">
                                    <div class="col-md-12">
                                        <div class="col-md-9 text-right">
                                            <label>Total:</label>
                                        </div>
                                        <div class="col-md-2  text-center">
                                            <label id="lblTotalChequeAmount">0.00</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">

                                        <a id="add_rowBankTransfer" class="btn btn-primary  btn-fill  btn-sm btn-wd ">Add a new Line</a>
                                        <a id="ClearAllBankTransfer" onclick="show_confirm_RemoveAllRowsFromBankTransfer();" class="btn btn-primary  btn-fill  btn-sm btn-wd ">Clear All Lines</a>
                                        <!--<button type="button" style="float:right" class="btn btn-info btn-fill btn-wd ">Save</button>-->
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="container-fluid" style="padding-top: 3%;">
                                <div class="col-md-12 text-right">
                                    <button type="button" id="btnEditBankTransfer" onclick="EnableBankTransferVoucher();" style="display: none" class="btn btn-info btn-fill btn-sm btn-wd ">Edit</button>
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
                            <a href="#" onclick="OpenAccountDeatil();" style="font-weight: bold;">+ Details</a>
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
                        <input type="text" style="width: 40%;" class="form-control border-input" />
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
    <div id="AddAccount" class="modal fade bd-example-modal-sm" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">New Account</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Account </label>
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
                        <label>Project </label>
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
                        <label>Class </label>
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

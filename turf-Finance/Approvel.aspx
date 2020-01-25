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
                        <div class="row" style="margin-top: 23px;">
                            <div class="col-md-12">
                                <div class="col-md-8">

                                    <div class="form-group">
                                        <div class="btn-group" role="group">
                                            <%--<button id="btnAll" onclick="OpenAllList();" type="button" class="btn btn-primary  ">All</button>--%>
                                            <button id="btnExpense" type="button" class="btn btn-primary " onclick="OpenExpenseList();">Expense</button>
                                            <%--<button id="btnSale" type="button" class="btn btn-primary  ">Sale</button>--%>
                                            <button id="btnJournalEntry" onclick="OpenJournalEntryList();" type="button" class="btn btn-primary">JournalEntry</button>
                                            <button id="btnApprovedPayment" onclick="OpenPaymentList();" type="button" class="btn btn-primary  ">Payment</button>
                                            <button id="btnApproved" onclick="OpenAppRejList();" type="button" class="btn btn-primary ">Approved / Rejected</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="col-md-1   PaddingClass">
                                    <label class="Label">Start Date </label>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <div class="input-wrapper">
                                            <input type="text" placeholder="enter Start Date" class="form-control border-input datepicker" id="datePickStart" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-1 text-right  PaddingClass">
                                    <label class="Label">End Date </label>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <div class="input-wrapper">
                                            <input type="text" placeholder="enter End Date" class="form-control border-input datepicker" id="datePickEnd" />
                                        </div>
                                    </div>
                                </div>
                                <div id="div_ddlvendor">
                                    <div class="col-md-1  PaddingClass">
                                        <label class="Label ">Vendor:</label>
                                    </div>
                                    <div class="col-md-2 " style="padding-left:0px;">
                                        <div class="form-group">
                                            <select id="ddlVendor" style="width: 100%" class="form-control border-input selectVendorOrCustomer">
                                                <option value="0">Select</option>
                                                <option value="1">Nahid</option>
                                                <option value="2">Shakir</option>
                                            </select>

                                        </div>
                                    </div>
                                </div>
                              
                                 <div class="col-md-3 text-right " style="float:right" >
                                        <div class="form-group text-right">
                                            <button type="button" id="btnApprove" class="btn btn-success btn-fill " onclick="show_confirm_Approved();">Approve</button>
                                             <button type="button" id="btnRejected" class="btn btn-danger btn-fill" onclick="show_confirm_Reject();">Reject</button>
                                        </div>
                                    </div>
                            </div>
                        </div>
                        <hr />
                        <div id="div_ExpenseList" class="row">
                            <div class="col-md-12">
                                <table id="tblExpenseList" class="display  table-bordered" style="border-top: hidden!important; border-right: none; border-left: none; width: 100%">
                                    <thead>
                                        <tr style="border-top: hidden;">
                                            <th>
                                                <input type="checkbox" id="chkAllExpense" /></th>
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
                                        <tr id="listrow0">
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
                                        <tr id="listrow1">
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
                                        <tr id="listrow2">
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
                                        <tr id="listrow3">
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
                                        <tr id="listrow4">
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
                                        <tr id="listrow5">
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
                        <div id="div_JournalEntry" class="row">
                            <div class="col-md-12">
                                <table id="tblJournalEntryList" class="display  table-bordered" style="border-top: hidden!important; border-right: none; border-left: none; width: 100%">
                                    <thead>
                                        <tr style="border-top: hidden;">
                                            <th>
                                                <input type="checkbox" id="chkAllJournalEntry" /></th>
                                            <th>Voucher No</th>
                                            <th>Voucher Date</th>
                                            <th>Memo </th>
                                            <th>Credit</th>
                                            <th>Debit</th>
                                            <th>Class</th>
                                            <th>Project</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th>
                                                <input type="checkbox" /></th>
                                            <td>Voucher No 1</td>
                                            <td>31 Aug 2019</td>
                                            <td>Accounts For Pre-Payments</td>
                                            <td></td>
                                            <td>1,000.00</td>
                                            <td>Class 1</td>
                                            <td>Project A</td>

                                        </tr>
                                        <tr>
                                            <th>
                                                <input type="checkbox" /></th>
                                            <td>Voucher No 2</td>
                                            <td>02 Sep 2019</td>
                                            <td>Accural for Pre-Payments</td>
                                            <td>2,000.00</td>
                                            <td></td>
                                            <td>Class 1</td>
                                            <td>Project A</td>

                                        </tr>

                                        <tr>
                                            <th>
                                                <input type="checkbox" /></th>
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
                         <div id="div_Payment" class="row">
                            <div class="col-md-12">
                                <table id="tblPaymentList" class="display  table-bordered" style="border-top: hidden!important; border-right: none; border-left: none; width: 100%">
                                    <thead>
                                        <tr style="border-top: hidden;">
                                             <th>
                                                <input type="checkbox" id="chkAllPayment" /></th>
                                            <th>Voucher No</th>
                                            <th>Voucher Date</th>
                                            <th>Payment</th>
                                            <th>Paid With</th>
                                            <th>From</th>
                                            <th>To</th>
                                            <th>Type</th>
                                          
                                          
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <tr id="row0">
                                             <th>
                                                <input type="checkbox" /></th>
                                             <td>Voucher No 1</td>
                                            <td>31 Aug 2019</td>
                                            <td>15,000.00</td>
                                            <td>Credit,Cheque</td>
                                            <td></td>
                                            <td>Adnan</td>
                                            <td>Expense</td>
                                       
                                           
                                        </tr>
                                        <tr id="row1">
                                             <th>
                                                <input type="checkbox" /></th>
                                             <td>Voucher No 2</td>
                                            <td>1 jan 2020</td>
                                            <td>10,000.00</td>
                                            <td>Cheque</td>
                                            <td>Account</td>
                                            <td>Nahid</td>
                                            <td>Cashout</td>
                                         
                                           
                                        </tr>
                                        <tr id="row2">
                                             <th>
                                                <input type="checkbox" /></th>
                                             <td>Voucher No 3</td>
                                            <td>3 jan 2020</td>
                                            <td>30,000.00</td>
                                            <td>Cheque</td>
                                            <td>HBL</td>
                                            <td>Meezan</td>
                                            <td>Bank Transfer</td>
                                    
                                           
                                        </tr>
                                          <tr id="row3">
                                             <th>
                                                <input type="checkbox" /></th>
                                             <td>Voucher No 4</td>
                                            <td>4 jan 2020</td>
                                            <td>5,000.00</td>
                                            <td>Cheque</td>
                                            <td></td>
                                            <td></td>
                                            <td>Tax </td>
                                       
                                           
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div id="div_ApprovedOrRejected" class="row">
                            <div class="col-md-12">
                                <table id="tblAppRejList" class="display  table-bordered" style="border-top: hidden!important; border-right: none; border-left: none; width: 100%">
                                    <thead>
                                        <tr style="border-top: hidden;">
                                           
                                            <th>Voucher No</th>
                                            <th>Voucher Date</th>
                                            <th>Payment</th>
                                            <th>Paid With</th>
                                            <th>From</th>
                                            <th>To</th>
                                            <th>Type</th>
                                            <th>Status</th>
                                            <th>Company Name</th>
                                          
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <tr>
                                           
                                             <td>Voucher No 1</td>
                                            <td>31 Aug 2019</td>
                                            <td>15,000.00</td>
                                            <td>Credit,Cheque</td>
                                            <td></td>
                                            <td>Adnan</td>
                                            <td>Expense</td>
                                            <td>Approved </td>
                                            <td>Abc </td>
                                           
                                        </tr>
                                        <tr>
                                           
                                             <td>Voucher No 2</td>
                                            <td>1 jan 2020</td>
                                            <td>10,000.00</td>
                                            <td>Cheque</td>
                                            <td>Account</td>
                                            <td>Nahid</td>
                                            <td>Cashout</td>
                                            <td>Approved </td>
                                            <td>Turf </td>
                                        </tr>
                                        <tr>
                                          
                                             <td>Voucher No 3</td>
                                            <td>3 jan 2020</td>
                                            <td>30,000.00</td>
                                            <td>Cheque</td>
                                            <td>HBL</td>
                                            <td>Meezan</td>
                                            <td>Bank Transfer</td>
                                            <td>Rejected </td>
                                            <td>BIP </td>
                                        </tr>
                                          <tr>
                                         
                                             <td>Voucher No 4</td>
                                            <td>4 jan 2020</td>
                                            <td>5,000.00</td>
                                            <td>Cheque</td>
                                            <td></td>
                                            <td></td>
                                            <td>Tax </td>
                                            <td>Approved </td>
                                           <td>XYZ </td>
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

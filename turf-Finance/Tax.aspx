<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Tax.aspx.cs" Inherits="turf_Finance.Tax" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/Custom/StyleSheet.css" rel="stylesheet" />
    <script src="scripts/Custom/Tax.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div id="TaxList" class="wrapper">
        <ul class="nav nav-tabs">
            <li class="active"><a data-toggle="tab" href="#tabs_TaxList" style="font-weight: bold;">Tax List</a></li>
            <li><a data-toggle="tab" href="#tabs_tax" style="font-weight: bold;">Tax</a></li>
        </ul>
        <div class="tab-content">
            <div id="tabs_TaxList" class="tab-pane fade in active">
                <div class="content">
                    <div class="container-fluid">
                        <div class="row" style="margin-top: 23px">
                            <div class="col-md-12">
                                <div class="content">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <div class="btn-group" role="group">
                                                <button id="btnAll" type="button" class="btn btn-primary btn-wd " onclick="AllTaxVoucher();">All</button>
                                                <button id="btnUnPaid" type="button" class="btn btn-primary btn-wd " onclick="AllUnPaidTaxVoucher();">UnPaid</button>
                                                <button id="btnNotReceived" type="button" class="btn btn-primary btn-wd " onclick="AllNotReceivedTaxVoucher();">NotReceived</button>
                                                <button id="btnSettle" type="button" class="btn btn-primary btn-wd ">Settle</button>

                                                <button id="btnReceived" type="button" class="btn btn-primary btn-wd ">Received</button>
                                            </div>

                                        </div>
                                    </div>


                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="col-md-8">
                                    <div class="col-md-12">
                                        <div class="form-group col-md-4">
                                            <label class="Label">Start Date:</label>
                                            <div class="input-wrapper">
                                                <input type="text" placeholder="enter Start Date" id="datePickStart" class="form-control border-input datepicker"  />
                                                
                                            </div>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label class="Label">Start Date:</label>
                                            <div class="input-wrapper">
                                                <input type="text" placeholder="enter Start Date" class="form-control border-input" id="datePickEnd" />
                                                <label for="datePickEnd" class="fa fa-calendar input-icon datePickEnd"></label>
                                            </div>
                                        </div>



                                        <div class="form-group col-md-4">
                                            <label class="Label">Adjustable</label>
                                            <select id="ddlAdjustable" name="Adjustable" class="form-control border-input select2">
                                                <option value="0">Select</option>
                                                <option value="1">Adjustable</option>
                                                <option value="2">NonAdjustable</option>
                                            </select>
                                        </div>
                                    </div>

                                </div>


                                <div class="col-md-4" style="margin-top: 4%;">
                                    <div class="form-group text-right">
                                        <button type="button" id="btnReceive" class="btn btn-success btn-fill" onclick="ReceivePage();">Receive</button>
                                        <button type="button" id="btnPay" class="btn btn-success btn-fill" onclick="PaymentPage();">Pay</button>
                                        <button type="button" class="btn btn-success btn-fill">Export</button>
                                        <button type="button" class="btn btn-success btn-fill">Print</button>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <hr />
                        <div id="div_TaxList" class="row">
                            <div class="col-md-12">
                                <table id="tblTaxList" class="display  table-bordered" style="border-top: hidden!important; border-right: none; border-left: none; width: 100%">
                                    <thead>
                                        <tr style="border-top: hidden;">
                                            <th>Customer/Vendor</th>
                                            <th>Invoice No</th>
                                            <th>Invoice Date</th>
                                            <th>Voucher No</th>
                                            <th>Voucher Date</th>
                                            <th>Tax Account</th>
                                            <th>Tax Amount</th>
                                            <th>Status</th>
                                            <th>Memo</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Saad|| Vendor</td>
                                            <td>Invoice No 1</td>
                                            <td>31 Aug 2019</td>
                                            <td>Voucher No 1</td>
                                            <td>31 Aug 2019</td>
                                            <td>GST</td>
                                            <td>500</td>
                                            <td>UnPaid</td>
                                            <td>Electricity Bill Month of July 2019</td>


                                        </tr>
                                        <tr>

                                            <td>Shakir|| Vendor</td>
                                            <td>Invoice No 2</td>
                                            <td>31 Aug 2019</td>
                                            <td>Voucher No 2</td>
                                            <td>31 Aug 2019</td>
                                            <td>WHT</td>
                                            <td>500</td>
                                            <td>UnPaid</td>
                                            <td>Internet Bill Month of July 2019</td>

                                        </tr>
                                        <tr>

                                            <td>Shahzaib|| Customer</td>
                                            <td>Sale Invoice No 1</td>
                                            <td>31 Aug 2019</td>
                                            <td>Receive Voucher No 1</td>
                                            <td>31 Aug 2019</td>
                                            <td>Further GST</td>
                                            <td>1,000</td>
                                            <td>Not Received</td>
                                            <td>Cloths of Child</td>

                                        </tr>
                                        <tr>
                                            <td>Adnan|| Customer</td>
                                            <td>Sale Invoice No 2</td>
                                            <td>31 Aug 2019</td>
                                            <td>Receive Voucher No 3</td>
                                            <td>31 Aug 2019</td>
                                            <td>Further GST</td>
                                            <td>1,000</td>
                                            <td>Not Received</td>
                                            <td>Cloths of Ment</td>
                                        </tr>
                                        <tr>
                                            <td>Nahid|| Vender</td>
                                            <td>Invoice No 1</td>
                                            <td>31 Aug 2019</td>
                                            <td>Pay Voucher No 1</td>
                                            <td>31 Aug 2019</td>
                                            <td>Further GST</td>
                                            <td>1,000</td>
                                            <td>Not Received</td>
                                            <td>Purchase Laptop From Techno</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div id="div_UnpaidTaxList" class="row">
                            <div class="col-md-12">
                                <table id="tblUnpaidTaxList" class="display  table-bordered" style="border-top: hidden!important; border-right: none; border-left: none; width: 100%">
                                    <thead>
                                        <tr style="border-top: hidden;">
                                            <th>All
                                                <input type="checkbox" /></th>
                                            <th>Cust/Vendor</th>
                                            <th>Invoice No</th>
                                            <th>Invoice Date</th>
                                            <th>Voucher No</th>
                                            <th>Voucher Date</th>
                                            <th>Tax Account</th>
                                            <th>Tax Amount</th>
                                            <th>Status</th>
                                            <th>Memo</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <input type="checkbox" /></td>
                                            <td>Shakir|| Vendor</td>
                                            <td>Invoice No 2</td>
                                            <td>31 Aug 2019</td>
                                            <td>Voucher No 2</td>
                                            <td>31 Aug 2019</td>
                                            <td>WHT</td>
                                            <td>500</td>
                                            <td>UnPaid</td>
                                            <td>Internet Bill Month of July 2019</td>

                                        </tr>
                                        <tr>
                                            <td>
                                                <input type="checkbox" /></td>
                                            <td>Saad|| Vendor</td>
                                            <td>Invoice No 1</td>
                                            <td>31 Aug 2019</td>
                                            <td>Voucher No 1</td>
                                            <td>31 Aug 2019</td>
                                            <td>GST</td>
                                            <td>500</td>
                                            <td>UnPaid</td>
                                            <td>Electricity Bill Month of July 2019</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <input type="checkbox" /></td>
                                            <td>Saad|| Vendor</td>
                                            <td>Invoice No 1</td>
                                            <td>31 Aug 2019</td>
                                            <td>Voucher No 1</td>
                                            <td>31 Aug 2019</td>
                                            <td>GST</td>
                                            <td>500</td>
                                            <td>UnPaid</td>
                                            <td>Electricity Bill Month of July 2019</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div id="div_NotReceivedTaxList" class="row">
                            <div class="col-md-12">
                                <table id="tblNotReceivedTaxList" class="display  table-bordered" style="border-top: hidden!important; border-right: none; border-left: none; width: 100%">
                                    <thead>
                                        <tr style="border-top: hidden;">
                                            <th>All
                                                <input type="checkbox" /></th>
                                            <th>Cust/Vendor</th>
                                            <th>Invoice No</th>
                                            <th>Invoice Date</th>
                                            <th>Voucher No</th>
                                            <th>Voucher Date</th>
                                            <th>Tax Account</th>
                                            <th>Tax Amount</th>
                                            <th>Status</th>
                                            <th>Memo</th>

                                        </tr>
                                    </thead>
                                    <tbody>

                                        <tr>
                                            <td>
                                                <input type="checkbox" /></td>
                                            <td>Nahid|| Vender</td>
                                            <td>Invoice No 1</td>
                                            <td>31 Aug 2019</td>
                                            <td>Pay Voucher No 1</td>
                                            <td>31 Aug 2019</td>
                                            <td>Further GST</td>
                                            <td>1,000</td>
                                            <td>Not Received</td>
                                            <td>Purchase Laptop From Techno</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <input type="checkbox" /></td>
                                            <td>Shakir|| Cust</td>
                                            <td>Invoice No 2</td>
                                            <td>31 Aug 2019</td>
                                            <td>Voucher No 2</td>
                                            <td>31 Aug 2019</td>
                                            <td>WHT</td>
                                            <td>500</td>
                                            <td>Not Received</td>
                                            <td>Sale T-shirts</td>

                                        </tr>
                                        <tr>
                                            <td>
                                                <input type="checkbox" /></td>
                                            <td>Saad|| Customer</td>
                                            <td>Invoice No 1</td>
                                            <td>31 Aug 2019</td>
                                            <td>Voucher No 1</td>
                                            <td>31 Aug 2019</td>
                                            <td>GST</td>
                                            <td>500</td>
                                            <td>Not Received</td>
                                            <td>Sale Men Shirts</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="tabs_tax" class="tab-pane fade">
                <div class="content" id="Tax_List">
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
                                                <div class="col-md-7 ">
                                                    <select id="ddSelectTax" style="width: 100%" class="form-control border-input ">
                                                        <option value="0">Select Tax </option>
                                                        <option value="1">WHT</option>
                                                        <option value="2">GHT</option>
                                                    </select>
                                                </div>

                                                <div class="col-md-3 ">

                                                    <label class="Label">Adjustable:</label>


                                                </div>
                                                <div class="col-md-2" style="margin-top: 5px;">
                                                    <input type="checkbox" />
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <hr />
                                    <div class="row clearfix">
                                        <div class="col-md-12 table-responsive">
                                            <table id="TaxBalance" class="display  table-bordered" style="border-top: hidden!important; border-right: none; border-left: none;">
                                                <thead>
                                                    <tr style="border-top: hidden;">
                                                        <th>Tax Account</th>
                                                        <th>Balance</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>GST</td>
                                                        <td>1,000.00</td>
                                                    </tr>
                                                    <tr>
                                                        <td>WHT</td>
                                                        <td>1,000.0</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Further GST</td>
                                                        <td>500.00</td>
                                                    </tr>
                                                    <tr>
                                                        <td>GST</td>
                                                        <td>1,000.00</td>
                                                    </tr>
                                                    <tr>
                                                        <td>WHT</td>
                                                        <td>1,000.0</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Further GST</td>
                                                        <td>500.00</td>
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

                                                    <button type="button" id="btnTaxPayment" class="btn btn-success btn-fill" onclick="TaxPaymentPage();">Payment</button>
                                                    <button type="button" class="btn btn-primary  btn-fill" id="btnAddTax" onclick="AddNewTax();">Add New Tax</button>
                                                </div>
                                            </div>
                                        </div>

                                    </div>


                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <div class="col-md-2">
                                                    <label class="Label">Start Date:</label>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="input-wrapper">
                                                        <input type="text" placeholder="enter Start Date" class="form-control border-input" id="datePickStartTaxList" />
                                                        <label for="datePickStartTaxList" class="fa fa-calendar input-icon datePickStartTaxList"></label>
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <label class="Label">End Date:</label>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="input-wrapper">
                                                        <input type="text" placeholder="enter Start Date" class="form-control border-input" id="datePickEndTaxList" />
                                                        <label for="datePickEndTaxList" class="fa fa-calendar input-icon datePickEndTaxList"></label>
                                                    </div>
                                                </div>


                                            </div>
                                        </div>

                                    </div>


                                    <hr />
                                    <div class="row clearfix">
                                        <div class="col-md-12 table-responsive">
                                            <div id="div_TaxList" class="row">
                                                <div class="col-md-12">
                                                    <table id="demoGridForTaxList" class="display  table-bordered" style="border-top: hidden!important; border-right: none; border-left: none; width: 100%">
                                                        <thead>
                                                            <tr style="border-top: hidden;">
                                                                <th>All
                                                                    <input type="checkbox" /></th>
                                                                <th>Tax Account</th>
                                                                <th>Invoice No</th>
                                                                <th>Invoice Date</th>
                                                                <th>Voucher No</th>
                                                                <th>Voucher Date</th>
                                                                <th>Amount</th>
                                                                <th>Status</th>
                                                                <th>Memo</th>
                                                                <th>Contacts</th>

                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td>
                                                                    <input type="checkbox" /></td>
                                                                <td>GST</td>
                                                                <td>Invoice No 1</td>
                                                                <td>31 Aug 2019</td>
                                                                <td>Voucher No 1</td>
                                                                <td>31 Aug 2019</td>
                                                                <td>1,000.00</td>
                                                                <td>UnPaid</td>
                                                                <td>Electricity Bill Month of July 2019</td>
                                                                <td>Adnan</td>

                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="checkbox" /></td>
                                                                <td>WHT</td>
                                                                <td>Invoice No 2</td>
                                                                <td>31 Aug 2019</td>
                                                                <td>Voucher No 2</td>
                                                                <td>31 Aug 2019</td>
                                                                <td>15,000.00</td>
                                                                <td>UnPaid</td>
                                                                <td>Internet Bill Month of July 2019</td>
                                                                <td>Shakir</td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="checkbox" /></td>
                                                                <td>Further GST</td>
                                                                <td>Invoice No 3</td>
                                                                <td>31 Aug 2019</td>
                                                                <td>Receive Voucher No 3</td>
                                                                <td>31 Aug 2019</td>
                                                                <td>500</td>
                                                                <td>Paid</td>
                                                                <td>PTCL Bill Month of July 2019</td>
                                                                <td>Shahzaib</td>
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
    <div id="NewTaxRate" class="wrapper">
        <div class="content">
            <div class="container-fluid">

                <div class="header">
                    <div class="row">
                        <div class="col-md-8">
                            <h4 class="title">Add New Tax Rate</h4>
                        </div>
                        <div class="col-md-4 text-right" style="padding-top: 3%;">
                            <a id="CloseTaxVoucher"  onclick="show_confirmTaxRate('Do You Want To Leave Without Saving')"><i class="fa fa-times fa-lg"></i></a>
                            <!--<button style="float:right" class="title" type="button"><i class="fa fa-times"></i></button>-->
                        </div>
                    </div>
                </div>
                <div>
                    <hr />
                </div>
                <div class="row">
                    <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
                    <div class="container" style="width: 100%;">
                        <div class="row clearfix">
                            <div class="col-md-12 table-responsive">
                                <table class="table display table-bordered table-hover table-sortable" id="tblTaxRate">
                                    <thead>

                                        <tr>
                                            <th>Tax Component
                                            </th>
                                            <th>Tax Rate
                                            </th>
                                            <th>Compound
                                            </th>
                                            <th>Remove
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr id='addr0' data-id="0" class="hidden">

                                            <td data-name="TaxComponent">
                                                <div>
                                                <input type="text" name='Component0' class="form-control" />
                                                    </div>
                                            </td>

                                            <td data-name="TxRate">
                                                <div>
                                                <input type="number" name='TaxRate0' class="form-control" />
                                                    </div>
                                            </td>
                                            <td data-name="Compound"  class="form-control">
                                                <div>
                                                <input type="checkbox" name='TaxCompound' />
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
                            <div class="col-md-4">

                                <a id="add_rowTaxComponent" class="btn btn-primary  btn-fill  btn-sm btn-wd ">Add a Component</a>

                                <!--<button type="button" style="float:right" class="btn btn-info btn-fill btn-wd ">Save</button>-->
                            </div>
                             <div class="col-md-6">
                                <div class="col-md-3 ">
                                    <label>Total:</label>
                                </div>
                                <div class="col-md-3 ">
                                    <label>5,500.00</label>
                                </div>
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
                            <button type="button" style="float: right" class="btn btn-info btn-fill btn-sm btn-wd ">Save</button>

                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <div id="TaxPaymentVoucher" class="wrapper">
        <div class="content">
            <div class="container-fluid">

                <div class="header">
                    <div class="row">
                        <div class="col-md-8">
                            <h4 class="title">Tax Payment </h4>
                        </div>
                        <div class="col-md-4" style="padding-top: 3%;">
                            <a id="CloseExpenseVoucher" style="float: right;" onclick="show_confirmTaxPayment('Do You Want To Leave Without Saving')"><i class="fa fa-times fa-lg"></i></a>
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
                                <label>Tax Voucher No </label>
                                <input type="text" class="form-control border-input" />
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Tax Voucher Date </label>
                                <div class="input-wrapper">
                                    <input type="text" placeholder="enter Start Date" class="form-control border-input" id="datePickVoucherDate" />
                                    <label for="datePickVoucherDate" class="fa fa-calendar input-icon datePickVoucherDate"></label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="div_PaymentList" class="row">
                    <div class="col-md-12">
                        <table id="tblPayTaxList" class="display  table-bordered" style="border-top: hidden!important; border-right: none; border-left: none; width: 100%">
                            <thead>
                                <tr style="border-top: hidden;">

                                    <th>Invoice No</th>
                                    <th>Contacts</th>
                                    <th>Tax Account</th>
                                    <th>Tax Amount</th>
                                    <th>Memo</th>
                                    <th>Remove</th>

                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Invoice No2</td>
                                    <td>Shakir</td>
                                    <td>WHT</td>
                                    <td>500</td>
                                    <td>
                                        <input type="text" class="form-control " value="Internet Bill Month Of Aug 2019 " /></td>
                                    <td>
                                        <button class='btn btn-danger glyphicon   row-remove' style="background-color: white; color: black; border: none;"><span aria-hidden="true">×</span></button></td>


                                </tr>
                                <tr>
                                    <td>Invoice No2</td>
                                    <td>Shakir</td>
                                    <td>WHT</td>
                                    <td>500</td>
                                    <td>
                                        <input type="text" class="form-control " value="Ptcl Bill month Of Aug 2019" /></td>
                                    <td>
                                        <button class='btn btn-danger glyphicon   row-remove' style="background-color: white; color: black; border: none;"><span aria-hidden="true">×</span></button></td>

                                </tr>
                                <tr>

                                    <td>Invoice No2</td>
                                    <td>Shakir</td>
                                    <td>WHT</td>
                                    <td>500</td>
                                    <td>
                                        <input type="text" class="form-control " value="Electricity Bill month Of Aug 2019" /></td>
                                    <td>
                                        <button class='btn btn-danger glyphicon   row-remove' style="background-color: white; color: black; border: none;"><span aria-hidden="true">×</span></button></td>


                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="row">
                    <div class="container" style="width: 100%">
                        <div class="col-md-10 ">
                            <div class="col-md-6 text-right">
                                <label>Total:</label>
                            </div>
                            <div class="col-md-2 text-center">
                                <label>1,500.00</label>
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
                                <a id="add_row" class="btn btn-primary  btn-fill  btn-wd btn-sm ">Clear All Lines</a>
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
                            <button type="button" id="btnEditTaxPayment" class="btn btn-info btn-fill btn-sm btn-wd ">Edit</button>
                            <button type="button" id="btnDeleteTaxPayment" class="btn btn-info btn-fill btn-sm btn-wd ">Delete</button>
                            <button type="button" id="btnInActiveTaxPayment" class="btn btn-info btn-fill btn-sm btn-wd ">Void/InActive</button>
                            <button type="button" id="btnSaveTaxPayment" class="btn btn-info btn-fill btn-sm btn-wd ">Save</button>

                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <div id="TaxReceiveVoucher" class="wrapper">
        <div class="content">
            <div class="container-fluid">

                <div class="header">
                    <div class="row">
                        <div class="col-md-8">
                            <h4 class="title">Receive </h4>
                        </div>
                        <div class="col-md-4" style="padding-top: 3%;">
                            <a id="CloseReceiveVoucher" style="float: right;" onclick="show_confirmTaxReceive('Do You Want To Leave Without Saving')"><i class="fa fa-times fa-lg"></i></a>
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
                                <label>Tax Voucher No </label>
                                <input type="text" class="form-control border-input">
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Tax Voucher Date </label>
                                <input type="date" class="form-control border-input">
                            </div>
                        </div>
                    </div>
                </div>

                <div id="div_ReceiveList" class="row">
                    <div class="col-md-12">
                        <table id="tblReceiveTaxList" class="display  table-bordered" style="border-top: hidden!important; border-right: none; border-left: none; width: 100%">
                            <thead>
                                <tr style="border-top: hidden;">

                                    <th>Invoice No</th>
                                    <th>Contacts</th>
                                    <th>Tax Account</th>
                                    <th>Tax Amount</th>
                                    <th>Memo</th>
                                    <th>Remove</th>

                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Invoice No2</td>
                                    <td>Shakir</td>
                                    <td>WHT</td>
                                    <td>500</td>
                                    <td>
                                        <input type="text" class="form-control " value="Internet Bill Month Of Aug 2019 " /></td>
                                    <td>
                                        <button class='btn btn-danger glyphicon   row-remove' style="background-color: white; color: black; border: none;"><span aria-hidden="true">×</span></button></td>


                                </tr>
                                <tr>
                                    <td>Invoice No2</td>
                                    <td>Shakir</td>
                                    <td>WHT</td>
                                    <td>500</td>
                                    <td>
                                        <input type="text" class="form-control " value="Ptcl Bill month Of Aug 2019" /></td>
                                    <td>
                                        <button class='btn btn-danger glyphicon   row-remove' style="background-color: white; color: black; border: none;"><span aria-hidden="true">×</span></button></td>

                                </tr>
                                <tr>

                                    <td>Invoice No2</td>
                                    <td>Shakir</td>
                                    <td>WHT</td>
                                    <td>500</td>
                                    <td>
                                        <input type="text" class="form-control " value="Electricity Bill month Of Aug 2019" /></td>
                                    <td>
                                        <button class='btn btn-danger glyphicon   row-remove' style="background-color: white; color: black; border: none;"><span aria-hidden="true">×</span></button></td>


                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="row">
                    <div class="container" style="width: 100%">
                        <div class="col-md-10 ">
                            <div class="col-md-6 text-right">
                                <label>Total:</label>
                            </div>
                            <div class="col-md-2 text-center">
                                <label>1,500.00</label>
                            </div>
                        </div>

                    </div>

                </div>
                <div class="row">
                    <div class="container" style="width: 100%">
                        <div class="col-md-4 " style="margin-top: -2%">
                            <div class="form-group">
                                <label>Memo</label>
                                <textarea class="form-control border-input"></textarea>
                            </div>
                        </div>
                        <div class="col-md-8 text-right " style="margin-top: 2%">
                            <div class="form-group">
                                <button type="button" id="btnEditTaxReceived" class="btn btn-info btn-fill btn-sm btn-wd ">Edit</button>
                                <button type="button" id="btnDeleteTaxReceived" class="btn btn-info btn-fill btn-sm btn-wd ">Delete</button>
                                <button type="button" id="btnInActiveTaxReceived" class="btn btn-info btn-fill btn-sm btn-wd ">Void/InActive</button>
                                <button type="button" id="btnSaveTaxReceived" class="btn btn-info btn-fill btn-sm btn-wd ">Received</button>

                            </div>
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
</asp:Content>

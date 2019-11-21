<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Accounting.aspx.cs" Inherits="turf_Finance.Accounting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="assets/Custom/StyleSheet.css" rel="stylesheet" />
    <script src="scripts/Custom/Accounting.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div id="ChartsOfAccount" class="wrapper">
        <ul id="my_tab" class="nav nav-tabs">
            <li class="active"><a data-toggle="tab" href="#Charts_AccountList" style="font-weight: bold;">Charts Of Accounts</a></li>
            <li><a data-toggle="tab" href="#ReconcileList" style="font-weight: bold;">Reconcile</a></li>
        </ul>


        <div class="tab-content">
            <div id="Charts_AccountList" class="tab-pane fade in active">
                <div class="content">
                    <div class="container-fluid">
                        <div class="row" style="margin-top: 23px">
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

                                        <button type="button" class="btn btn-success btn-fill">Export</button>
                                        <button type="button" class="btn btn-success btn-fill">Print</button>
                                        <button type="button" id="btnAddNewAccount" class="btn btn-success btn-fill" onclick="OpenAccountPage();">Add New Account</button>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <hr />
                        <div id="div_AccountList" class="row">
                            <div class="col-md-12">
                                <table id="tblAccountList" class="display  table-bordered" style="border-top: hidden!important; border-right: none; border-left: none; width: 100%">
                                    <thead>
                                        <tr style="border-top: hidden;">
                                            <th>Name</th>
                                            <th>Type</th>
                                            <th>Detail Type</th>
                                            <th>Bank Balance</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Cash and cash equivalents</td>
                                            <td>Cash and cash equivalents</td>
                                            <td>Cash and cash equivalents</td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>Inventory</td>
                                            <td>Current Assets</td>
                                            <td>Inventory</td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>Sales</td>
                                            <td>Income</td>
                                            <td>Sales of Product InCome</td>
                                            <td></td>

                                        </tr>
                                        <tr>
                                            <td>Office Expense</td>
                                            <td>Expense</td>
                                            <td>Office/general administrative expenses </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>Office Expense</td>
                                            <td>Expense</td>
                                            <td>Office/general administrative expenses </td>
                                            <td></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="ReconcileList" class="tab-pane fade">
                <div class="content" id="Tax_List">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="col-md-8">
                                    <div class="form-group col-md-4">
                                        <label class="Label">Bank</label>
                                        <select id="ddlBankOn" class="form-control border-input bank " style="width: 100%">
                                            <option value="0">Select</option>
                                            <option value="1">Meezan Bank</option>
                                            <option value="2">HBL</option>
                                            <option value="3">Alfala</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label class="Label">Start Date:</label>
                                        <div class="input-wrapper">
                                            <input type="text" placeholder="enter Start Date" class="form-control border-input" id="ReconcileStartDate" />
                                            <label for="ReconcileStartDate" class="fa fa-calendar input-icon ReconcileStartDate"></label>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label class="Label">End Date:</label>
                                        <div class="input-wrapper">
                                            <input type="text" placeholder="enter Start Date" class="form-control border-input" id="ReconcileEndDate" />
                                            <label for="ReconcileEndDate" class="fa fa-calendar input-icon ReconcileEndDate"></label>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-4" style="margin-top: 4%;">
                                    <div class="form-group text-right">

                                        <button type="button" class="btn btn-success btn-fill">Export</button>
                                        <button type="button" class="btn btn-success btn-fill">Print</button>
                                        <button type="button" id="btnOpenReconcile" class="btn btn-success btn-fill" onclick="OpenReconcile();">Reconcile</button>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <hr />
                        <div id="div_ReconcileList" class="row">
                            <div class="col-md-12">
                                <table id="tblReconcileList" class="display  table-bordered" style="border-top: hidden!important; border-right: none; border-left: none; width: 100%">
                                    <thead>
                                        <tr style="border-top: hidden;">
                                            <th>Bank Name</th>
                                            <th>Reconcilation Date</th>
                                            <th>Difference</th>
                                            <th>Statement Ending Date</th>
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>HBL</td>
                                            <td>31 Aug 2019</td>
                                            <td>10,000.00</td>
                                            <td>13 sep 2019</td>
                                            <td></td>
                                            <td><a href="#">Delete</a></td>
                                        </tr>
                                        <tr>
                                            <td>Meezan</td>
                                            <td>05 Sep 2019</td>
                                            <td>0.00</td>
                                            <td>20 sep 2019</td>
                                            <td></td>
                                            <td><a href="#">Delete</a></td>
                                        </tr>
                                        <tr>
                                            <td>Alfalah</td>
                                            <td>20 Aug 2019</td>
                                            <td>5,000.00</td>
                                            <td>10 sep 2019</td>
                                            <td></td>
                                            <td><a href="#">Delete</a></td>

                                        </tr>
                                        <tr>
                                            <td>HBL1</td>
                                            <td>31 Aug 2019</td>
                                            <td>10,000.00</td>
                                            <td>13 sep 2019</td>
                                            <td></td>
                                            <td><a href="#">Delete</a></td>
                                        </tr>
                                        <tr>
                                            <td>Meezan2</td>
                                            <td>31 Aug 2019</td>
                                            <td>10,000.00</td>
                                            <td>13 sep 2019</td>
                                            <td></td>
                                            <td><a href="#">Delete</a></td>
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
    <div id="AddNewAccount" class="wrapper">
        <div class="content">
            <div class="container-fluid">

                <div class="header">
                    <div class="row">
                        <div class="col-md-8">
                            <h4 class="title">Account </h4>
                        </div>
                        <div class="col-md-4 text-right" style="padding-top: 3%;">
                            <a id="NewAccountForm" onclick="show_confirmAccount('Do You Want To Leave Without Saving')"><i class="fa fa-times fa-lg"></i></a>
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
                                <label>Account Type</label>

                                <select id="ddlAccountType" class="form-control border-input select2">
                                    <option value="0">Select</option>
                                    <optgroup label="Assets" class="form-control">
                                        <option value="1">Current Asset</option>
                                        <option value="2">Fixed Asset</option>
                                        <option value="3">Inventory</option>
                                    </optgroup>
                                    <optgroup label="Equity" class="form-control">
                                        <option value="4">Equity</option>

                                    </optgroup>

                                </select>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Code</label>
                                <input type="text" class="form-control border-input" />
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Name</label>
                                <input type="text" class="form-control border-input" />
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Description</label>
                                <input type="text" class="form-control border-input" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <!--<div class="col-md-3" style="margin-top:25px;">
                            <div class="form-group">
                                
                                
                            </div>
                        </div>-->
                        <div class="col-md-3">
                            <div class="form-group">
                                <input type="checkbox" id="chkSubAccount" />
                                <label>Is sub Account</label>

                                <select id="ddlParentAccount" class="form-control border-input select2">
                                    <option value="0">Enter Parent Account</option>
                                    <option value="1">Current Assets</option>
                                    <option value="2">Fixed Assets</option>
                                    <option value="3">Accounts Payable A/P</option>

                                    <option value="1">InCome</option>
                                    <option value="2">Expense</option>
                                    <option value="3">Owner's Equity</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Balance</label>
                                <input type="number" class="form-control border-input text-right" />
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>As of</label>
                                <div class="input-wrapper">
                                    <input type="text" placeholder="enter As of Date" class="form-control border-input" id="AsOFDate" />
                                    <label for="AsOFDate" class="fa fa-calendar input-icon AsOFDate"></label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="container-fluid" style="padding-top: 3%;">
                        <div class="col-md-12 text-right">

                            <button type="button" id="btnInActive" class="btn btn-info btn-fill btn-sm btn-wd ">InActive</button>
                            <button type="button" id="btnEdit" class="btn btn-info btn-fill btn-sm btn-wd ">Edit</button>
                            <button type="button" id="btnSave" class="btn btn-info btn-fill btn-sm btn-wd ">Save</button>

                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <div id="ReconcileAccount" class="wrapper">
        <div class="content">
            <div class="container-fluid">

                <div class="header">
                    <div class="row">
                        <div class="col-md-8">
                            <h4 class="title">Reconcile An Account </h4>
                        </div>
                        <div class="col-md-4 text-right" style="padding-top: 3%;">
                            <a id="NewAccountForm1" onclick="show_confirmReconcileAccount('Do You Want To Leave Without Saving')"><i class="fa fa-times fa-lg"></i></a>
                            <!--<button style="float:right" class="title" type="button"><i class="fa fa-times"></i></button>-->
                        </div>
                    </div>
                </div>
                <div>
                    <hr />
                </div>
                <div class="row">
                    <div class="col-md-12 ">
                        <div class="col-md-6">

                            <div class="form-group col-md">
                                <label>Which Account You Want To Reconcile</label>
                                <select id="ddlBank" name="Bank0" class="form-control border-input col-md-4 bank">
                                    <option value="0">Select</option>
                                    <option value="1">Meezan Bank</option>
                                    <option value="2">HBL</option>
                                    <option value="3">Alfalah</option>
                                </select>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="row" style="margin-top: 2%;">
                    <div class="col-md-12">
                        <div class="col-md-6">
                            <label>Enter the Following from your Statement</label>
                        </div>
                    </div>
                </div>
                <div class="row" style="margin-top: 2%;">
                    <div class="col-md-12">
                        <div class="col-md-2">
                            <div class="form-group">
                                <label>Begning Balance</label></br>
                                <label>0.00</label>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Statement Ending Balance</label>
                                <input type="number" class="form-control border-input text-right" />
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Statement Ending Date</label>
                                <div class="input-wrapper">
                                    <input type="text" placeholder="enter Statement Ending Date" class="form-control border-input" id="statementEndingDate" />
                                    <label for="statementEndingDate" class="fa fa-calendar input-icon statementEndingDate"></label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="container-fluid" style="padding-top: 3%;">
                        <div class="col-md-12">
                            <div class="col-md-6 text-center">
                                <button type="button" id="btnStartReconcile" class="btn btn-success btn-fill btn-sm btn-wd " onclick="StartReconcile();">Start Reconcilation</button>
                            </div>


                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <div id="Reconcile" class="wrapper">
        <div class="content">
            <div class="container-fluid">

                <div class="header">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="col-md-12">
                                <div class="col-md-3">
                                    <h4 class="title">Reconcile </h4>
                                </div>
                                <div class="col-md-9">
                                    <div class="form-group">
                                        <h4>Bank</h4>
                                        <label>Statement Ending Date: 13 sep 2019</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 text-right" style="margin-top: 3%;">
                            <div class="form-group">
                                <button type="button" id="btnAddBankCharge" class="btn btn-primary btn-fill btn-wd">Add Bank Charges</button>
                                <button type="button" id="btnEditInfo" class="btn btn-primary btn-fill btn-wd">Edit Info</button>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-primary  btn-fill btn-wd">Save For Later</button>
                                    <button type="button" class="btn btn-info btn-fill dropdown-toggle" data-toggle="dropdown">
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="#">Finish Now</a></li>
                                        <li><a href="#">Save For Later</a></li>
                                        <li><a href="#" onclick="ShowReconcileList();">Close Without Saving</a></li>
                                    </ul>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div>
                    <hr />
                </div>
                <div class="row">
                    <div class="col-md-9">
                        <div class="col-md-12" style="border-bottom: 2px solid">
                            <div class="col-md-5 form-group">
                                <h4>RS:3,000.00</h4>
                                <label>Statement Ending Balance</label>
                            </div>
                            <div class="col-md-1 text-center">
                                <h1>-</h1>
                            </div>
                            <div class="col-md-5 form-group text-right">
                                <h4>RS:3,000.00</h4>
                                <label>Cleared Balance</label>
                            </div>
                        </div>
                    </div>
                    <div class="col-m-3 text-center">
                        <div class="col-md-3 " style="border-left: 2px solid">
                            <h4>RS:3,000.00</h4>
                            <label>Difference</label>
                        </div>
                    </div>


                </div>
                <div class="row">
                    <div class="col-md-8">
                        <div class="col-md-12">
                            <div class="col-md-4 form-group">
                                <h4>RS:3,000.00</h4>
                                <label>Begining Balance</label>
                            </div>
                            <div class="col-md-1 text-center">
                                <h1>-</h1>
                            </div>
                            <div class="col-md-3 form-group text-right">
                                <h4>RS:0.00</h4>
                                <label>0 Payments</label>
                            </div>
                            <div class="col-md-1 text-center">
                                <h1>+</h1>
                            </div>
                            <div class="col-md-3 form-group text-right">
                                <h4>RS:0.00</h4>
                                <label>0 Deposits</label>
                            </div>
                        </div>
                    </div>


                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <div class="btn-group" role="group">
                                <button type="button" class="btn btn-primary">All</button>
                                <button type="button" class="btn btn-primary">Payments</button>
                                <button type="button" class="btn btn-primary">Deposits</button>
                            </div>
                        </div>
                    </div>
                </div>
                <hr />
                <div id="div_Reconcile" class="row">
                    <div class="col-md-12">
                        <table id="tblReconcile" class="display  table-bordered" style="border-top: hidden!important; border-right: none; border-left: none; width: 100%">
                            <thead>
                                <tr>
                                    <th>Voucher No</th>
                                    <th>Voucher Date</th>
                                    <th>Cheque No</th>
                                    <th>Cheque Date</th>
                                    <th>Account</th>
                                    <th>Payee</th>

                                    <th>Memo</th>
                                    <th>Payment</th>
                                    <th>Deposit</th>
                                    <th>CheckBox<input type="checkbox" /></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Payment Voucher 1</td>
                                    <td>31 Aug 2019</td>
                                    <td>Cheque No 1</td>
                                    <td>31 Aug 2019</td>
                                    <td>Utilities</td>

                                    <td>Saad</td>
                                    <td>KE Bill Month of July 2019</td>
                                    <td>10,500.00</td>
                                    <td></td>
                                    <td>
                                        <input type="checkbox" /></td>


                                </tr>
                                <tr>
                                    <td>Receive Voucher 1</td>
                                    <td>31 Aug 2019</td>
                                    <td>Cheque No 2</td>
                                    <td>31 Aug 2019</td>
                                    <td>Sale</td>

                                    <td>Adnan</td>
                                    <td>Sale T-Shirts</td>
                                    <td></td>
                                    <td>10,500.00</td>

                                    <td>
                                        <input type="checkbox" /></td>


                                </tr>
                                <tr>
                                    <td>Tax Payment Voucher 1</td>
                                    <td>31 Aug 2019</td>
                                    <td>Cheque No 3</td>
                                    <td>31 Aug 2019</td>
                                    <td>GST</td>

                                    <td>FBR</td>
                                    <td>Pay Tax to GOVT:</td>
                                    <td>10,500.00</td>
                                    <td></td>
                                    <td>
                                        <input type="checkbox" /></td>


                                </tr>
                            </tbody>
                        </table>
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
</asp:Content>

﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PettyCash.aspx.cs" Inherits="turf_Finance.PettyCash" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/Custom/StyleSheet.css" rel="stylesheet" />
    <script src="scripts/Custom/PettyCash.js"></script>
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
                                <div class="col-md-9">
                                    <div class="col-md-12">
                                        <div class="col-md-2 text-right PaddingClass">
                                            <label class="Label">Start Date:</label>
                                        </div>
                                        <div class="col-md-3 PaddingClass">
                                            <div class="input-wrapper">
                                                <input type="text" placeholder="enter Start Date" autocomplete="off" class="form-control border-input datepicker" id="datePickStart" />
                                            </div>
                                        </div>
                                        <div class="col-md-2 text-right  PaddingClass ">
                                            <label class="Label">End Date:</label>
                                        </div>
                                        <div class="col-md-3 PaddingClass">
                                            <div class="input-wrapper">
                                                <input type="text" onchange="EndDate_OnChange();" placeholder="enter End Date" autocomplete="off" class="form-control border-input datepicker" id="datePickEnd" />

                                            </div>
                                        </div>
                                         <div class="col-md-2 PaddingClass">
                                            <div class="input-wrapper">
                                                <button type="button" id="btnFetch" onclick=" GetPettyCashData();" class="btn btn-fill btn-success" >Fetch</button>

                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="col-md-3 text-right">

                                    <button type="button" id="btnAddNewPettyCash" class="btn btn-success btn-fill" onclick="openPettyCashVoucher();">Add</button>
                                </div>

                            </div>
                        </div>
                        <hr />
                        <div id="div_tbl_PettyCashList" class="row">
                            <div class="col-md-12">
                                <table id="tbl_PettyCashList" class="display  table-bordered" style="border-top: hidden!important; border-right: none; border-left: none; width: 100%">
                                    <thead>
                                        <tr style="border-top: hidden;">
                                            <th>Voucher No</th>
                                            <th>Voucher Date</th>
                                            <th>Account </th>
                                            <th>Amount</th>
                                            <th>Memo</th>
                                            <th class="headingClass">Class</th>
                                            <th class="headingProject">Project</th>
                                        </tr>
                                    </thead>
                                    <tbody>
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
                            <a id="ClosePettyCashVoucher" style="float: right;" onclick="show_confirm_LeaveWithoutSavingPettyCash('Do You Want To Leave Without Saving')"><i class="fa fa-times fa-lg"></i></a>
                            <!--<button style="float:right" class="title" type="button"><i class="fa fa-times"></i></button>-->
                        </div>
                    </div>
                </div>
                <div>
                    <hr />
                </div>
              
              <div class="row">
                    <input type="hidden" id="hdnPettyCashID" value="" />
                    <div class="col-md-12">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Voucher No </label>
                                <input type="text" id="txtVoucherNo" class="form-control border-input" />
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Voucher Date </label>
                                <div class="input-wrapper">
                                    <input type="text" placeholder="Enter Voucher Date" id="VoucherDate" class="form-control border-input datepicker  " />

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
                                <table class="table display table-bordered table-hover table-sortable" id="tab_PettyCash">
                                    <thead>
                                        <tr>
                                            <th class="headingAccount">Account
                                            </th>
                                            <th style="width: 20%">Amount
                                            </th>
                                            <th>Memo
                                            </th>
                                            <th class="headingClass">Class
                                            </th>
                                            <th class="headingProject">Project
                                            </th>
                                            <th style="width: 10%">Remove
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="row" id="div_totalAmount">

                            <div class="col-md-3 text-right">
                                <label>Total:</label>
                            </div>
                            <div class="col-md-2 text-center">
                                <label id="lblTotalAmount">0.00</label>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="col-md-5">
                                    <a id="add_row" class="btn btn-primary  btn-fill  btn-sm btn-wd ">Add a new Line</a>
                                    <button type="button" id="ClearAll" class="btn btn-primary  btn-fill  btn-sm btn-wd " onclick="show_confirm_RemoveAllRowsFromPettyCash()">Clear All Lines</button>
                                </div>
                                <div class="col-md-7 text-right">
                                    <button type="button" onclick="EnablePettyCashVoucher();" id="btnEdit" class="btn btn-info btn-fill btn-sm btn-wd ">Edit</button>
                                    <button type="button" id="btnDelete" class="btn btn-info btn-fill btn-sm btn-wd ">Delete</button>
                                    <button type="button" id="btnSave" class="btn btn-info btn-fill btn-sm btn-wd ">Save</button>
                                </div>


                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="container-fluid" style="padding-top: 3%;">
                        <div class="col-md-12 text-right">
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
    <div id="AddAccount" class="modal  modal-sm "  role="dialog">
        <div class="modal-dialog modal-sm ">
            <!-- Modal content-->
            <div class="modal-content ">
                <div class="modal-header  ">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">New Account</h4>
                </div>
                <div class="modal-body ">
                     <div class="row">
                        <div class="col-md-12">
                            <label>Code </label>
                        </div>
                    </div>
                    <div class="row" style="padding-top: 2%;">
                        <div class="col-md-12">
                            <input type="text" oninput="AlphaNumericOnly(this.id);" id="txtAccountCode" class="form-control border-input" />
                        </div>
                    </div>
                     <div class="row" style="padding-top: 2%;">
                        <div class="col-md-12">
                            <label>Name </label>
                        </div>
                    </div>
                    <div class="row" style="padding-top: 2%;">
                        <div class="col-md-12">
                            <input type="text" oninput="AlphaNumericOnly(this.id);"  id="txtAccountName" class="form-control border-input" />
                        </div>
                    </div>
                    <div class="row" style="padding-top: 9%;">
                        <div class=" col-md-6 ">
                            <a href="#" onclick="show_confirm_AddAccountDetail();" style="font-weight: bold;">+ Details</a>
                        </div>
                    </div>
                </div>
                <div class="modal-footer ">
                    <button type="button" id="btnSaveAccount" onclick="AddAccount();" class="btn btn-default" data-dismiss="modal">Save Changes</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <div id="AddClass" class="modal  modal-sm" role="dialog">
        <div class="modal-dialog modal-sm">
            <!-- Modal content-->
            <div class="modal-content ">
                <div class="modal-header modal-sm">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">New Class</h4>
                </div>
                <div class="modal-body modal-sm">
                    <div class="row">
                        <div class="col-md-12">
                            <label>Name :</label>
                        </div>
                    </div>
                    <div class="row" style="padding-top: 2%;">
                        <div class="col-md-12">
                            <input type="text" id="txtClassName" class="form-control border-input" />
                        </div>
                    </div>
                    <div class="row" style="padding-top: 2%;padding-bottom:2%">
                        <div class="col-md-12">
                            <span >
                                <input type="checkbox" onchange="OnchangeSubClass();" id="chkSubClass" /><label for="chkSubClass">IsSubClass</label></span>
                        </div>
                        
                    </div>
                    <div class="row" style="padding-top: 2%;">
                        <div class="col-md-12">
                            <select id="ddlSubClass" class="form-control selectSubClass "></select>
                        </div>
                    </div>

                </div>
                <div class="modal-footer modal-sm" style="padding-top:2%;">
                    <button type="button" id="btnSaveClass" onclick="AddClass();" class="btn btn-default" data-dismiss="modal">Save Changes</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>


</asp:Content>

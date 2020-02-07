<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ProductAndServices.aspx.cs" Inherits="turf_Finance.ProductAndServices" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/Custom/StyleSheet.css" rel="stylesheet" />
    <script src="scripts/Custom/ProductAndServices.js"></script>
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
    <div id="P_and_SList" class="wrapper">
        <ul id="my_tab" class="nav nav-tabs">
            <li class="active"><a data-toggle="tab" href="#P_S" style="font-weight: bold;">Product & Services</a></li>
            <li><a data-toggle="tab" href="#Inventory" style="font-weight: bold;">Add Inventory</a></li>
        </ul>
        <div class="tab-content" id="tabs">
            <div id="P_S" class="tab-pane fade in active">
                <div class="content" id="P_STab">
                    <div class="container-fluid">
                        <div id="div_ProductAndServices" style="margin-top: 2%;" class="row ">
                            <div class="col-md-12">
                                <div class="table-responsive">
                                    <table id="tblProductAndServices" class="display table-responsive  table-bordered">
                                        <thead>

                                            <tr style="border-top: hidden;">
                                                <th>SKU</th>
                                                <th>Name</th>
                                                <th>Type</th>
                                                <th>Status</th>
                                                <th>Desciption</th>
                                                <th>Category</th>
                                                <th>Qty On Hand</th>
                                                <th>Inventory Account</th>
                                                <th>Income Account</th>
                                                  <th>Expense Account</th>
                                                <th>Unit</th>
                                                <th>Rate</th>
                                                <th>Cost</th>
                                                <th>Supplier</th>
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
            <div id="Inventory" class="tab-pane fade">
                <div class="content" id="AddInventory">
                    <div class="container-fluid">
                        <div class="row" style="margin-top: 1%;">
                            <div class="col-md-12">
                                <div class="col-md-2 text-right">
                                    <label for="ddlType" style="margin-top: 6%">Select Type :</label>
                                </div>
                                <div class="col-md-3">
                                    <select class="form-control border-input select2" style="width: 100%" id="ddlType" onchange="OnChangeType();">
                                    </select>
                                </div>
                            </div>
                        </div>
                        <hr />
                        <div id="Div_ShowAll">
                            <div id="Add_Inventory" class="wrapper">
                                <div class="content">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="col-md-9">
                                                <input type="hidden" id="hdnProductAndSrvicesID" />
                                                <h4 class="title">Inventory </h4>
                                            </div>

                                        </div>

                                        <div>
                                            <hr />
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>SKU **</label>
                                                        <input type="text" id="txtSKU_Inventory" class="form-control border-input" />
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>Name *</label>
                                                        <input type="text" id="txtName_Inventory" class="form-control border-input" />
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>Description</label>
                                                        <input type="text" id="txtDesc_Inventory" class="form-control border-input" />
                                                    </div>
                                                </div>

                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>Category</label>
                                                        <select class="form-control border-input Category " style="width: 100%" id="ddlCategory_Inventory">
                                                        </select>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>Initial Qty On Hand</label>
                                                        <input type="number" onkeyup="ValidateInitialQtyOnHand();" id="txtInitialQTY_Inventory" class="form-control border-input" />
                                                    </div>
                                                </div>

                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>As Of Date </label>
                                                        <div class="input-wrapper">
                                                            <input type="text" id="txtAsOFDate_Inventory" placeholder="enter Start Date" class="form-control border-input datepicker" id="AsOfDate" />

                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>Inventory Asset Account * </label>
                                                        <select id="ddlAssetAccount_Inventory" style="width: 100%" class="form-control border-input Account">
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>Income Account</label>
                                                        <select id="ddlIncomeAccount_Inventory" style="width: 100%" class="form-control border-input Account">
                                                        </select>
                                                    </div>
                                                </div>


                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>Unit</label>
                                                        <input type="number" id="txtUnit_Inventory" class="form-control border-input" />
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>Sales Price / Rate</label>
                                                        <input type="number" id="txtRate_Inventory" class="form-control border-input" />
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>Cost</label>
                                                        <input type="number" id="txtCost_Inventory" class="form-control border-input" />
                                                    </div>
                                                </div>

                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>Preferred Supplier</label>
                                                        <select id="ddlSupplier_Inventory" style="width: 100%" class="form-control border-input vendor">
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>Picture</label>
                                                        <input type="file" id="txtImage_Inventory" class="form-control border-input" />
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>Optional</label>
                                                        <span class="form-control border-input">
                                                            <input type="checkbox" id="chkStatus_Inventory" />
                                                            <span>
                                                                <label for="chkStatus_Inventory"></label>
                                                                Active</span></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12 text-right">
                                                    <div class="form-group">
                                                        <button type="button" onclick="EnableInventory();" id="btnEditInventory" style="display: none" class="btn btn-info btn-fill btn-sm btn-wd ">Edit</button>
                                                        <button type="button" id="btnDeleteInventory" style="display: none" class="btn btn-info btn-fill btn-sm btn-wd ">Delete</button>
                                                        <button type="button" id="btnResetnventory" onclick="Reset_InventoryForm()" class="btn btn-info btn-fill btn-sm btn-wd ">Reset</button>
                                                        <button type="button" id="btnSaveInventory" onclick="ValidateInventory();" class="btn btn-info btn-fill btn-sm btn-wd ">Save</button>
                                                    </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div id="Add_NonInventory" class="wrapper">
                                <div class="content">
                                    <div class="container-fluid">


                                        <div class="row">
                                            <div class="col-md-8">
                                                <h4 class="title">Non-Inventory </h4>
                                            </div>
                                        </div>

                                        <div>
                                            <hr />
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>SKU **</label>
                                                        <input type="text" id="txtSKU_NonInventory" class="form-control border-input" />
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>Name *</label>
                                                        <input type="text" id="txtName_NonInventory" class="form-control border-input" />
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>Description</label>
                                                        <input type="text" id="txtDesc_NonInventory" class="form-control border-input" />
                                                    </div>
                                                </div>

                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>Category</label>
                                                        <select id="ddlCategory_NonInventory" style="width: 100%" class="form-control border-input Category">
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>Unit</label>
                                                        <input type="text" id="txtUnit_NonInventory" class="form-control border-input" />
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>Sales Price / Rate</label>
                                                        <input type="number" id="txtRate_NonInventory" class="form-control border-input" />
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>Cost</label>
                                                        <input type="number" id="txtCost_NonInventory" class="form-control border-input" />
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>Income Account</label>
                                                        <select id="ddlIncomeAccount_NonInventory" style="width: 100%" class="form-control border-input Account">
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>Expense Account</label>
                                                        <select id="ddlExpenseAccount_NonInventory" style="width: 100%" class="form-control border-input Account">
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>Preferred Supplier</label>
                                                        <select id="ddlSupplier_NonInventory" style="width: 100%" class="form-control border-input vendor">
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>Picture</label>
                                                        <input type="file" id="txtImage_NonInventory" class="form-control border-input" />
                                                    </div>
                                                </div>
                                                 <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>Status</label>
                                                        <span class="form-control border-input">
                                                            <input type="checkbox" id="chkStatus_NonInventory" />
                                                            <span>
                                                                <label for="chkStatus_NonInventory"></label>
                                                                Active</span></span>
                                                    </div>
                                                </div>



                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12 text-right">
                                                <div class="form-group">
                                                    <button type="button" style="display: none" onclick=" EnableNon_Inventory();" id="btnEditNonInventory" class="btn btn-info btn-fill btn-sm btn-wd ">Edit</button>
                                                    <button type="button" style="display: none" id="btnDeleteNonInventory" class="btn btn-info btn-fill btn-sm btn-wd ">Delete</button>
                                                    <button type="button" onclick="Reset_Non_InventoryForm();" id="btnResetNonInventory" class="btn btn-info btn-fill btn-sm btn-wd ">Reset</button>
                                                    <button type="button" id="btnSaveNonInventory" onclick="ValidateNonInventory();" class="btn btn-info btn-fill btn-sm btn-wd ">Save</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="Add_Services" class="wrapper">
                                <div class="content">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <h4 class="title">Services </h4>
                                            </div>
                                        </div>
                                        <div>
                                            <hr />
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>SKU **</label>
                                                        <input type="text" id="txtSKU_Services" class="form-control border-input" />
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>Name *</label>
                                                        <input type="text" id="txtName_Services" class="form-control border-input" />
                                                    </div>
                                                </div>

                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>Description</label>
                                                        <input type="text" id="txtDesc_Services" class="form-control border-input" />
                                                    </div>
                                                </div>

                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>Category</label>
                                                        <select id="ddlCategory_Services" style="width: 100%" class="form-control border-input Category">
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">

                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>Unit</label>
                                                        <input type="text" id="txtUnit_Services" class="form-control border-input" />
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>Sales Price / Rate</label>
                                                        <input type="number" id="txtRate_Services" class="form-control border-input" />
                                                    </div>
                                                </div>

                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>Cost</label>
                                                        <input type="number" id="txtCost_Services" class="form-control border-input" />
                                                    </div>
                                                </div>

                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>Income Account</label>
                                                        <select id="ddlIncomeAccount_Services" style="width: 100%" class="form-control border-input Account">
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>Expense Account</label>
                                                        <select id="ddlExpenseAccount_Services" style="width: 100%" class="form-control border-input Account">
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>Preferred Supplier</label>
                                                        <select id="ddlSupplier_Services" style="width: 100%" class="form-control border-input vendor">
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>Picture</label>
                                                        <input type="file" id="txtImage_Services" class="form-control border-input" />
                                                    </div>
                                                </div>
                                                  <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>Status</label>
                                                        <span class="form-control border-input">
                                                            <input type="checkbox" id="chkStatus_Services" />
                                                            <span>
                                                                <label for="chkStatus_Services"></label>
                                                                Active</span></span>
                                                    </div>
                                                </div>


                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12 text-right">

                                                <div class="form-group">
                                                    <button type="button" style="display: none" onclick="EnableServices();" id="btnEditService" class="btn btn-info btn-fill btn-sm btn-wd ">Edit</button>
                                                    <button type="button" style="display: none" id="btnDeleteService" class="btn btn-info btn-fill btn-sm btn-wd ">Delete</button>
                                                    <button type="button" onclick="ResetServiceForm() ;" id="btnResetService" class="btn btn-info btn-fill btn-sm btn-wd ">Reset</button>
                                                    <button type="button" id="btnSaveService" onclick="ValidateServices()" class="btn btn-info btn-fill btn-sm btn-wd ">Save</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>
    <div id="AddCategory" class="modal fade bd-example-modal-sm" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">New Category</h4>
                </div>
                <div class="modal-body">

                    <div class="form-group">
                        <label>Category </label>
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
    <div id="AddAccount" class="modal  modal-sm "  role="dialog">
        <div class="modal-dialog modal-sm ">
            <!-- Modal content-->
            <div class="modal-content ">
                <div class="modal-header  ">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">New Account</h4>
                </div>
                <div class="modal-body ">
                     <div class="row" >
                        <div class="col-md-12">
                            <label>Select Account Type </label>
                        </div>
                    </div>
                     <div class="row" style="padding-top: 2%;">
                        <div class="col-md-12">
                             <select id="ddlAcount" style="width: 100%" class="form-control border-input vendor"> </select>
                        </div>
                    </div>
                     <div class="row" style="padding-top: 5%;">
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
</asp:Content>

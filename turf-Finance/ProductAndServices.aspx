<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ProductAndServices.aspx.cs" Inherits="turf_Finance.ProductAndServices" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link href="assets/Custom/StyleSheet.css" rel="stylesheet" />
    <script src="scripts/Custom/ProductAndServices.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
        <div id="P_and_SList" class="wrapper">
        <ul id="my_tab" class="nav nav-tabs">
            <li class="active"><a data-toggle="tab" href="#P_S" style="font-weight:bold; ">Product & Services</a></li>
            <li><a data-toggle="tab" href="#Inventory" style="font-weight:bold;">Add Inventory</a></li>
        </ul>
        <div class="tab-content" id="tabs">
            <div id="P_S" class="tab-pane fade in active">
                <div class="content" id="P_STab">
                    <div class="container-fluid">
                        <div class="row" style="margin-top:2%;">
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
                                        <!--<button type="button" id="btnAddInVentory" class="btn btn-success btn-fill">Add New</button>-->
                                    </div>
                                </div>
                                <div class="form-group">
                                </div>
                            </div>
                        </div>
                        <hr />
                        <div id="div_ProductAndServices" class="row">
                            <div class="col-md-12">
                                <table id="tblProductAndServices" class="display  table-bordered" style="border-top:hidden!important;border-right:none;border-left:none; width:100%">
                                    <thead>
                                        <tr style="border-top:hidden;">
                                            <th>Name</th>
                                            <th>SKU</th>
                                            <th>Type</th>
                                            <th>Sales Desciption</th>
                                            <th>Income Account</th>
                                            <th>Expense Account</th>
                                            <th>Inventory Account</th>
                                            <th>Purchase Description</th>
                                            <th>Sales Price</th>
                                            <th>Cost</th>
                                            <th>Qty On Hand</th>
                                            <th>ReOrder Point</th>


                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Sales</td>
                                            <td>1234</td>
                                            <td>Inventory</td>
                                            <td>Sales Description</td>
                                            <td>Cost Of Sales</td>
                                            <td>Sales Of Product InCome</td>
                                            <td>Inventory Asset</td>
                                            <td>Purchase Description</td>
                                            <td>10,000.00</td>
                                            <td>9,000.00</td>
                                            <td>50</td>
                                            <td>0</td>

                                        </tr>
                                        <tr>
                                            <td>Sales</td>
                                            <td>1234</td>
                                            <td>Non Inventory</td>
                                            <td>Sales Description</td>
                                            <td>Cost Of Sales</td>
                                            <td>Sales Of Product InCome</td>
                                            <td>Inventory Asset</td>
                                            <td>Purchase Description</td>
                                            <td>10,000.00</td>
                                            <td>9,000.00</td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>Services</td>
                                            <td>1234</td>
                                            <td>Services</td>
                                            <td>Sales Description</td>
                                            <td>Cost Of Sales</td>
                                            <td>Sales Of Product InCome</td>
                                            <td>Inventory Asset</td>
                                            <td>Purchase Description</td>
                                            <td>10,000.00</td>
                                            <td>9,000.00</td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>Sales</td>
                                            <td>1234</td>
                                            <td>Non Inventory</td>
                                            <td>Sales Description</td>
                                            <td>Cost Of Sales</td>
                                            <td>Sales Of Product InCome</td>
                                            <td>Inventory Asset</td>
                                            <td>Purchase Description</td>
                                            <td>10,000.00</td>
                                            <td>9,000.00</td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>Sales</td>
                                            <td>1234</td>
                                            <td>Inventory</td>
                                            <td>Sales Description</td>
                                            <td>Cost Of Sales</td>
                                            <td>Sales Of Product InCome</td>
                                            <td>Inventory Asset</td>
                                            <td>Purchase Description</td>
                                            <td>10,000.00</td>
                                            <td>9,000.00</td>
                                            <td>50</td>
                                            <td>0</td>
                                        </tr>
                                        <tr>
                                            <td>Services</td>
                                            <td>1234</td>
                                            <td>Services</td>
                                            <td>Sales Description</td>
                                            <td>Cost Of Sales</td>
                                            <td>Sales Of Product InCome</td>
                                            <td>Inventory Asset</td>
                                            <td>Purchase Description</td>
                                            <td>10,000.00</td>
                                            <td>9,000.00</td>
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
            <div id="Inventory" class="tab-pane fade">
                <div class="content" id="AddInventory">
                    <div class="container-fluid">
                        <div class="row" style="margin-top:1%;">
                            <div class="col-md-12">
                                <div class="col-md-2 text-right">
                                    <label for="ddlType" style="margin-top:6%">Select Type :</label>
                                </div>
                                <div class="col-md-3">
                                    <select class="form-control border-input select2" style="width:100%" id="ddlType" onchange="OnChangeType();">
                                        <option value="0">Select</option>
                                        <option value="1">Inventory</option>
                                        <option value="2">Non Inventory</option>
                                        <option value="3">Services</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <hr />
                        <div id="Add_Inventory" class="wrapper">
                            <div class="content">
                                <div class="container-fluid">


                                    <div class="row">
                                        <div class="col-md-9">
                                            <h4 class="title">Inventory </h4>
                                        </div>

                                    </div>

                                    <div><hr /></div>
                                    <div class="row">
                                        <div class="col-md-12">
                                             <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>SKU **</label>
                                                    <input type="text" class="form-control border-input" />
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Name *</label>
                                                    <input type="text" class="form-control border-input" />
                                                </div>
                                            </div>
                                             <div class="col-md-3">
                                                <div class="form-group">
                                                    <label> Description</label>
                                                    <input type="text" class="form-control border-input" />
                                                </div>
                                            </div>
                                           
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Catagory</label>
                                                    <select class="form-control border-input Catagory " style="width:100%" id="ddlCatagory">
                                                        <option value="0">Select</option>
                                                        <option value="1">Catagery1</option>
                                                        <option value="2">Catagery2</option>
                                                        <option value="3">Catagery3</option>

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
                                                    <input type="number" class="form-control border-input" />
                                                </div>
                                            </div>

                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>As Of Date </label>
                                                     <div class="input-wrapper">
                                            <input type="text" placeholder="enter Start Date" class="form-control border-input" id="AsOfDate" />
                                            <label for="AsOfDate" class="fa fa-calendar input-icon AsOfDate"></label>
                                        </div>
                                                </div>
                                            </div>
                                          
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Inventory Asset Account * </label>
                                                    <select id="ddlAssetAccount" style="width:100%" class="form-control border-input Account">
                                                        <option value="0">Select</option>
                                                        <option value="1">Inventory</option>
                                                        <option value="2">Inventory Asset</option>


                                                    </select>
                                                </div>
                                            </div>
                                             <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Income Account</label>
                                                    <select id="ddlInComeAccount" style="width:100%" class="form-control border-input Account">
                                                        <option value="0">Select</option>
                                                        <option value="1">Sales of Product Income</option>
                                                        <option value="2">Sales</option>
                                                        <option value="3">UnCatagerized Income</option>


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
                                                    <input type="number" class="form-control border-input" />
                                                </div>
                                            </div>
                                              <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Sales Price / Rate</label>
                                                    <input type="number" class="form-control border-input" />
                                                </div>
                                            </div>


                                           
                                            <!--<div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Purchase Description</label>
                                                    <input type="text" class="form-control border-input" />
                                                </div>
                                            </div>-->
                                          
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Cost</label>
                                                    <input type="number" class="form-control border-input" />
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Preferred Supplier</label>
                                                    <select id="ddlSupplier" style="width:100%" class="form-control border-input vendor">
                                                        <option value="0">Select</option>
                                                        <option value="1">Expense</option>
                                                        <option value="2">Cost Of Sales</option>
                                                    </select>
                                                </div>
                                            </div>
                                           



                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                          
                                          
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label> Picture</label>
                                                    <input type="file" class="form-control border-input" />
                                                </div>
                                            </div>
                                            <div class="col-md-9 text-right " style="margin-top:4%">
                                                 <div class="form-group">
                                                    <button type="button" id="btnEditInventory" style="display:none"  class="btn btn-info btn-fill btn-sm btn-wd ">Edit</button>
                                                    <button type="button"id="btnDeleteInventory" style="display:none"  class="btn btn-info btn-fill btn-sm btn-wd ">Delete</button>
                                                    <button type="button" id="btnSaveInventory"  class="btn btn-info btn-fill btn-sm btn-wd ">Save</button>
                                                </div>
                                           
                                            </div>
                                      


                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12 text-right">
                                               
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

                                    <div><hr /></div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>SKU **</label>
                                                    <input type="text" class="form-control border-input" />
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Name *</label>
                                                    <input type="text" class="form-control border-input" />
                                                </div>
                                            </div>
                                               <div class="col-md-3">
                                                <div class="form-group">
                                                    <label> Description</label>
                                                    <input type="text" class="form-control border-input" />
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Catagory</label>
                                                    <select id="ddlCatagoryNonInventory" style="width:100%" class="form-control border-input Catagory">
                                                        <option value="0">Select</option>
                                                        <option value="1">Catagery1</option>
                                                        <option value="2">Catagery2</option>
                                                        <option value="3">Catagery3</option>

                                                    </select>
                                                </div>
                                            </div>
                                            <!--<div class="col-md-3">
                                                <div class="form-group">
                                                    <label> Sales Description </label>
                                                    <input type="text" class="form-control border-input" />
                                                </div>
                                            </div>-->

                                           
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                             <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Unit</label>
                                                    <input type="text" class="form-control border-input" />
                                                </div>
                                            </div>
                                             <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Sales Price / Rate</label>
                                                    <input type="number" class="form-control border-input" />
                                                </div>
                                            </div>
                                              <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Cost</label>
                                                    <input type="number" class="form-control border-input" />
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Income Account</label>
                                                    <select id="ddlAccountNonInventory" style="width:100%" class="form-control border-input Account">
                                                        <option value="0">Select</option>
                                                        <option value="1">Sales of Product Income</option>
                                                        <option value="2">Sales</option>
                                                        <option value="3">UnCatagerized Income</option>


                                                    </select>
                                                </div>
                                            </div>
                                            <!--<div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Purchase Description</label>
                                                    <input type="text" class="form-control border-input" />
                                                </div>
                                            </div>-->
                                           
                                          
                                         


                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Expense Account</label>
                                                    <select id="ddlExpenseAccountNonInv" style="width:100%"  class="form-control border-input Account">
                                                        <option value="0">Select</option>
                                                        <option value="1">Expense</option>
                                                        <option value="2">Cost Of Sales</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Preferred Supplier</label>
                                                    <select id="ddlSupplierNonInv" style="width:100%" class="form-control border-input vendor">
                                                        <option value="0">Select</option>
                                                        <option value="1">Nahid</option>
                                                        <option value="2">Shakir</option>
                                                        <option value="2">Saad</option>
                                                    </select>
                                                </div>
                                            </div>
                                           
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label> Picture</label>
                                                    <input type="file" class="form-control border-input" />
                                                </div>
                                            </div>
                                          


                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12 text-right">
                                                <div class="form-group">
                                                    <button type="button" style="display:none" id="btnEditNonInventory" class="btn btn-info btn-fill btn-sm btn-wd ">Edit</button>
                                                    <button type="button" style="display:none" id="btnDeleteNonInventory" class="btn btn-info btn-fill btn-sm btn-wd ">Delete</button>
                                                    <button type="button" id="btnSaveNonInventory" class="btn btn-info btn-fill btn-sm btn-wd ">Save</button>
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

                                    <div><hr /></div>
                                    <div class="row">
                                        <div class="col-md-12">
                                             <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>SKU **</label>
                                                    <input type="text" class="form-control border-input" />
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Name *</label>
                                                    <input type="text" class="form-control border-input" />
                                                </div>
                                            </div>

                                             <div class="col-md-3">
                                                <div class="form-group">
                                                    <label> Description</label>
                                                    <input type="text" class="form-control border-input" />
                                                </div>
                                            </div>
                                           
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Catagory</label>
                                                    <select id="ddlCatagoryService" style="width:100%" class="form-control border-input Catagory">
                                                        <option value="0">Select</option>
                                                        <option value="1">Catagery1</option>
                                                        <option value="2">Catagery2</option>
                                                        <option value="3">Catagery3</option>

                                                    </select>
                                                </div>
                                            </div>
                                            <!--<div class="col-md-3">
                                                <div class="form-group">
                                                    <label> Sales Description </label>
                                                    <input type="text" class="form-control border-input" />
                                                </div>
                                            </div>-->

                                           
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">

                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Unit</label>
                                                    <input type="text" class="form-control border-input" />
                                                </div>
                                            </div>
                                             <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Sales Price / Rate</label>
                                                    <input type="number" class="form-control border-input" />
                                                </div>
                                            </div>
                                                
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Cost</label>
                                                    <input type="number" class="form-control border-input" />
                                                </div>
                                            </div>
                                           
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Income Account</label>
                                                    <select id="ddlIncomeAccountService" style="width:100%" class="form-control border-input Account">
                                                        <option value="0">Select</option>
                                                        <option value="1">Sales of Product Income</option>
                                                        <option value="2">Sales</option>
                                                        <option value="3">UnCatagerized Income</option>


                                                    </select>
                                                </div>
                                            </div>
                                            <!--<div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Purchase Description</label>
                                                    <input type="text" class="form-control border-input" />
                                                </div>
                                            </div>-->
                                        


                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Expense Account</label>
                                                    <select id="ddlExpenseAccountService"style="width:100%" class="form-control border-input Account">
                                                        <option value="0">Select</option>
                                                        <option value="1">Expense</option>
                                                        <option value="2">Cost Of Sales</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Preferred Supplier</label>
                                                    <select id="ddlSupplierService" style="width:100%" class="form-control border-input vendor">
                                                        <option value="0">Select</option>
                                                        <option value="1">Shahzaib</option>
                                                        <option value="2">Adnan</option>
                                                         <option value="2">Saad</option>
                                                    </select>
                                                </div>
                                            </div>
                                        
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label> Picture</label>
                                                    <input type="file" class="form-control border-input" />
                                                </div>
                                            </div>
                                          


                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12 text-right">
                                          
                                                <div class="form-group">
                                                    <button type="button" style="display:none" id="btnEditService" class="btn btn-info btn-fill btn-sm btn-wd ">Edit</button>
                                                    <button type="button" style="display:none" id="btnDeleteService" class="btn btn-info btn-fill btn-sm btn-wd ">Delete</button>
                                                    <button type="button" id="btnSaveService" class="btn btn-info btn-fill btn-sm btn-wd ">Save</button>
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
    <div id="AddCatagory" class="modal fade bd-example-modal-sm" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">New Catagory</h4>
                </div>
                <div class="modal-body">

                    <div class="form-group">
                        <label>Catagory </label>
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

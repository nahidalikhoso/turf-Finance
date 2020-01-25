<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="turf_Finance.User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="scripts/Custom/User.js"></script>
    <link href="assets/Custom/StyleSheet.css" rel="stylesheet" />
    <script src="scripts/Custom/MyScript.js"></script>
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
    <div id="UserList" class="wrapper">
        <ul class="nav nav-tabs">
            <li class="active"><a data-toggle="tab" href="#home" style="font-weight: bold;">User</a></li>
        </ul>
        <div class="tab-content">
            <div id="home" class="tab-pane fade in active">
                <div class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12 text-right" style="margin-top: 23px;">
                                <button type="button" class="btn btn-success btn-fill" onclick="AddNewUser();" id="btnAddUser">Add User</button>
                            </div>
                        </div>
                        <hr />
                        <div id="div_UserList" class="row ">
                            <div class="col-md-12">
                                <table id="tblUserList" class="display  table-bordered" style="border-top: hidden!important; border-right: none; border-left: none; width: 100%">
                                    <thead>
                                        <tr style="border-top: hidden;">
                                            <th>User Name</th>
                                            <th>First Name</th>
                                            <th>Last Name</th>
                                            <th>Email</th>
                                            <th>CNIC</th>
                                            <th>Contact No</th>
                                            <th>Role</th>
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
    <input type="hidden" id="hdnUserID" value="" />
    <div id="AddNewUser" class="wrapper">
        <div class="content">
            <div class="container-fluid">
                <div class="header">
                    <div class="row">
                        <div class="col-md-10">
                            <h4 class="title">Add User</h4>
                        </div>
                        <div class="col-md-2 text-right" style="padding-top: 3%;">
                            <a id="closeUser" onclick="show_confirm_LeaveWithoutSavingUser('Do You Want To Leave Without Saving')"><i class="fa fa-times fa-lg"></i></a>
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
                                <label>User Name **</label>
                                <input type="text" id="txtUserName" class="form-control border-input" />
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>First Name </label>
                                <input type="text" id="txtFirstName" class="form-control border-input" />
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Last Name </label>
                                <input type="text" id="txtLastName" class="form-control border-input" />
                            </div>
                        </div>
                           <div class="col-md-3">
                            <div class="form-group">
                                <label>Contact No. *</label>
                                <input type="text" oninput="numberOnly(this.id);" id="txtCantactNo" maxlength="11" class="form-control border-input" />
                            </div>
                        </div>
                       
                       

                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Email **</label>
                                <input type="text" id="txtEmail" class="form-control border-input" />
                            </div>
                        </div>
                     
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>CNIC **</label>
                                <input type="text" id="txtCNIC" oninput="numberOnly(this.id);"  maxlength="13" class="form-control border-input" />
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Role*</label>
                                <select id="ddlUserRole" class="form-control border-input">
                                </select>
                            </div>
                        </div>
                         <div class="col-md-3">
                            <div class="form-group">
                                <label>Password *</label>
                                <input type="password" id="txtPassword" class="form-control border-input" />
                            </div>
                        </div>

                    </div>
                </div>
                <div class="row">
                    <div class="container-fluid" style="padding-top: 3%;">
                        <div class="col-md-12 text-right">
                            <button type="button" id="btnInActiveUser" class="btn btn-info btn-fill btn-sm btn-wd ">In Active</button>
                            <button type="button" id="btnActiveUser" class="btn btn-info btn-fill btn-sm btn-wd ">Active</button>
                            <button type="button" id="btnEditUser" onclick="EnableVendor();" class="btn btn-info btn-fill btn-sm btn-wd ">Edit</button>
                            <button type="button" id="btnSaveUser" onclick="ValidateUser();" class="btn btn-info btn-fill btn-sm btn-wd ">Save</button>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

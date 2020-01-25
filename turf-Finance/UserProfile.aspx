<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="turf_Finance.UserProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <script src="scripts/Custom/UserProfile.js"></script>
    <link href="assets/Custom/StyleSheet.css" rel="stylesheet" />
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
    <div id="UpdateUserProfile" class="wrapper">
        <div class="content">
            <div class="container-fluid">
                <div class="header">
                    <div class="row">
                        <div class="col-md-10">
                            <h4 class="title">Profile</h4>
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
                                <input type="text" id="txtUser" class="form-control border-input" />
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
                    </div>
                </div>
                <div class="row">
                    <div class="container-fluid" style="padding-top: 3%;">
                        <div class="col-md-12 text-right">
   
                            <button type="button" id="btnUpdateUser" onclick="ValidateUser();" class="btn btn-info btn-fill btn-sm btn-wd ">Update Profile</button>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

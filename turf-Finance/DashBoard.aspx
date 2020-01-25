<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="DashBoard.aspx.cs" Inherits="turf_Finance.DashBoard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="http://www.shieldui.com/shared/components/latest/css/light/all.min.css" />
<script type="text/javascript" src="http://www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>
    
    <script src="scripts/Dashboard.js"></script>
    <script>
        $(document).ready(function () {
            
    jQuery(function ($) {
        var data1 = [12, 3, 4, 2, ];
   
            
        $("#chart1").shieldChart({
            exportOptions: {
                image: false,
                print: false
            },
            
            dataSeries: [{
                seriesType: "bar",
                data: data1
            }],
            options: {
                scales: {
                    xAxes: [{
                        gridLines: {
                            offsetGridLines: true
                        }
                    }]
                }
            }

        });

       
    });
 

            $('#overlay').fadeOut();
        })

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content" style="background-color: #f4f3ef;">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-4">
                        <div class="card" style="padding: 2rem">

                            <div class="card-body  " style="border-radius: 10px; height: 25rem !important;">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="col-md-7" style="padding-left: 0px;">
                                            <h3 class="title link" style="font-size: 2rem; font-family: serif;">Profit & Loss</h3>
                                        </div>

                                        <div class="col-md-2" id="div_Duration">
                                            <div class="form-group">
                                                <div class="dropdown">
                                                    <button class="btn btn-sm   dropdown-toggle" id="btnJournalOption" type="button" data-toggle="dropdown">
                                                        Last Month
                                      <span class="caret"></span>
                                                    </button>
                                                    <ul class="dropdown-menu">
                                                        <li><a id="btnTLastThirty">Last 30 days</a></li>
                                                        <li><a id="btnThisMonth">This month</a></li>
                                                        <li><a id="btnThisQuarter">This quarter</a></li>
                                                        <li><a id="btnThisYear">This year</a></li>
                                                        <li><a id="btnLastMonth">Last month</a></li>
                                                        <li><a id="btnLastQuarter">Last quarter</a></li>
                                                        <li><a id="btnLastYear">Last year</a></li>

                                                    </ul>
                                                </div>
                                            </div>


                                        </div>

                                    </div>
                                </div>

                                    <h3 style="font-family: serif;">PRs-950</h3>
                                    <p style="font-family: serif;">NET INCOME FOR DECEMBER</p>
                                <div class="row">
                                    <div class="col-md-12" >
                                        <div class="col-md-2" style="padding:0px">
                                            <p style="font-family: serif;">PRs50 <br />Sales</p>
                                            
                                        </div>
                                        <div class="col-md-10">
                                            <div id="chart1" style="height: inherit; display: inline-block;background-color: #05a4b5;"></div>
                                        </div>
                                    </div>
                                </div>


                            </div>
                        </div>

                    </div>
                    <div class="col-md-4">
                        <div class="card">

                            <div class="card-body  " style="border-radius: 10px; height: 25rem !important;">
                                <div class="header">
                                    <h3 class="title link" style="font-size: 2rem; font-family: serif;">Bank</h3>
                                </div>
                                <hr />
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="col-md-4">
                                            <h5>HBL</h5>
                                        </div>
                                        <div class="col-md-6">
                                            <h5>50,000.00 PRs</h5>
                                        </div>
                                    </div>

                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="col-md-4">
                                            <h5>Meezan</h5>
                                        </div>
                                        <div class="col-md-6">
                                            <h5>30,000.00 PRs</h5>
                                        </div>
                                    </div>

                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="col-md-4">
                                            <h5>UBL</h5>
                                        </div>
                                        <div class="col-md-6">
                                            <h5>20,000.00 PRs</h5>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-4">
                        <div class="card ">
                            <div class="card-body " style="border-radius: 10px; height: 9rem !important;">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="col-md-4">
                                            <h4>Sale</h4>
                                        </div>
                                        <div class="col-md-6">
                                            <h4>70,000.00 RS</h4>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card ">
                            <div class="card-body  text-white bg-danger mb-3" style="border-radius: 10px; height: 9rem !important;">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="col-md-4">
                                            <h4>Tax </h4>
                                        </div>
                                        <div class="col-md-6">
                                            <h4>10,000.00 RS</h4>
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
</asp:Content>

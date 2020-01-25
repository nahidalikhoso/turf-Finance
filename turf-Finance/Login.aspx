<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="turf_Finance.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Animation library for notifications   -->
    <link href="assets/css/animate.min.css" rel="stylesheet" />
    <!--  Paper Dashboard core CSS    -->
    <link href="assets/css/paper-dashboard.css" rel="stylesheet" />
    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="assets/css/demo.css" rel="stylesheet" />
    <!--  Fonts and icons     -->
    <link href="assets/css/font-awesome.min.css" rel="stylesheet" />
    <link href="assets/css/fonts.css" rel="stylesheet" />
    <link href="assets/css/themify-icons.css" rel="stylesheet" />
    <link href="assets/css/LoginCustomCSS.css" rel="stylesheet" />
    <script src="assets/js/jquery-3.4.1.min.js"></script>
    <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="scripts/Custom/MyScript.js"></script>
        <!--  Checkbox, Radio & Switch Plugins -->
    <script src="assets/js/bootstrap-checkbox-radio.js"></script>
    <!--  Charts Plugin -->
    <script src="assets/js/chartist.min.js"></script>
    <!--  Notifications Plugin    -->
    <script src="assets/js/bootstrap-notify.js"></script>
    <!--  Google Maps Plugin    -->
    <script src="assets/js/googleapis.js"></script>
    <!-- Paper Dashboard Core javascript and methods for Demo purpose -->
    <script src="assets/js/paper-dashboard.js"></script>
    <!-- Paper Dashboard DEMO methods, don't include it in your project! -->
    <script src="assets/js/demo.js"></script>
    
    <script>
        $(document).ready(function () {
            localStorage.clear('URL');
        })
        function UserAuthentication() {
            var parameters = "?username=" + txtUserName.value + "&password=" + txtPassword.value;

            $.ajax({
                url: "http://localhost:20037/api/User/UserAuthentication" + parameters,
                type: "POST",
                success: function (APIResponse) {
                    
                    if (APIResponse) {
                        alldata = JSON.parse(APIResponse);
                        table1 =new Array() ;
                        table2 = new Array();
                        for (i = 0; i < alldata.length; i++) {
                            table1.push({
                                MenueCaption: alldata[i].MenueCaption,
                                Url: alldata[i].Url,
                                CssClass: alldata[i].CssClass,
                                ShowInMenue: alldata[i].ShowInMenue
                            });
                        }
                        table2.push({
                            UserName: alldata[0].UserName,
                            Email: alldata[0].Email,
                            Role: alldata[0].Role,
                            UserID: alldata[0].UserID,
                            RoleID: alldata[0].RoleID,
                            TenantID: '',
                            CompanyID: '',
                            SessionID:alldata[0].ID
                            
                        });
                        localStorage.setItem('data', JSON.stringify(table1));
                        localStorage.setItem('UserData', JSON.stringify(table2));
                        window.location.href = "DashBoard.aspx"; 
                    }
                    else
                        showMessage('Invalid User Name Or Password', 'warning', '');
                   
              
                }

            })
        }
    </script>
    <title></title>
    
</head>
<body>
    <div class="login-form">
        <form action="/examples/actions/confirmation.php" method="post">
            <div class="text-center" >
                <%--<img src="assets/img/finance.png" />--%>
                <img src="assets/img/finance%20Logo.png" style="height: 110px;   margin-top: -44px;" />
               </div>
            <hr />
            <h2 class="text-center">Sign In</h2>
            <div class="form-group">
                <div class="input-group">
                    <span class="input-group-addon" style=" border: 1px solid #CCC5B9 !important; background-color: #f4f3ef !important;"><i class="fa fa-user"></i></span>
                    <input type="text" class="form-control" placeholder="Username" id="txtUserName" required="required" />
                </div>
            </div>
            <div class="form-group">
                <div class="input-group">
                    <span class="input-group-addon" style=" border: 1px solid #CCC5B9 !important; background-color: #f4f3ef !important;"><i class="fa fa-lock"></i></span>
                    <input type="password" class="form-control" placeholder="Password" id="txtPassword" required="required" />
                </div>
            </div>
            <div class="form-group">
                <button type="button" onclick="UserAuthentication();" class="btn btn-primary btn-block">Log in</button>
            </div>
            <div class="clearfix">
                <label class="pull-left checkbox-inline">
                    <input type="checkbox" />
                    Remember me</label>
                <a href="#" class="pull-right">Forgot Password?</a>
            </div>
        </form>
        <p class="text-center small">Don't have an account! <a href="#">Sign up here</a>.</p>
    </div>
   
  
  
    
    
</body>
</html>

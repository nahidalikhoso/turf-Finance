$(document).ready(function () {
    debugger
    $('#overlay').fadeIn();
        $('#txtUser').attr('disabled', true);
        $('#txtUser').css({ 'cssText': 'background: #dddddd !important' });
        var Data = JSON.parse(localStorage.getItem('UserData'));
        $('#txtUser').val(Data[0].UserName);
        
    $('#overlay').fadeOut();
});
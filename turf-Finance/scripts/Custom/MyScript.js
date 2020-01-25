////////////////////////
$(document).on('focus', ':input', function () {
    $(this).attr('autocomplete', 'off');


});

////////////////////
var RgexforPositiveNumberWithoutZero = /^[1-9]\d*$/;
var EmailRegex = /^\b[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b$/i;
var phoneRegex = /\b[0-9]{11}\b/;
var AlphaRegex = /^[a-zA-Z ]+$/;
var DateRegex = /^\d{4}(\-)(((0)[0-9])|((1)[0-2]))(\-)([0-2][0-9]|(3)[0-1])$/i;
var CNICRegex = /^[0-9+]{13}$/;

var AlphaNumericRegex = /^[0-9a-zA-Z ]+$/;
var price = /^[1-9]{1}[0-9]{0,10}(?:\.[0-9]{1,2})?$/;
var AmountRegex = /^[1-9]{1}[0-9]{0,10}(?:\.[0-9]{1,2})?$/;
var RegexForInteger = /(^\d*\.?\d*[1-9]+\d*$)|(^[1-9]+\.?\d*$)/;

var RegexForPositiveIncludeZero = /(^\d*\.?\d*[0-9]+\d*$)|(^[0-9]+\.?\d*$)/;
//var UserCount = /(^\d*\.?\d*[1-9]+\d*$)|(^[1-9]+\.?\d*$)/;
function getUrlParameter(name) {
    name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
    var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
    var results = regex.exec(location.search);
    return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
};

function GetTodayDate() {
    var tdate = new Date();
    var dd = tdate.getDate(); //yields day
    var MM = tdate.toLocaleString('default', { month: 'short' }); //yields month
    var yyyy = tdate.getFullYear(); //yields year
    var currentDate = dd + "-" + (MM) + "-" + yyyy;

    return currentDate;
}
function GetLastDate() {
    var tdate = new Date();
    var OneMonthago = new Date();
    OneMonthago.setDate(OneMonthago.getDate() - 30);
    var dd = OneMonthago.getDate() ; //yields day
    var MM = OneMonthago.toLocaleString('default', { month: 'short' }); //yields month
    var yyyy = OneMonthago.getFullYear(); //yields year
    var currentDate = dd + "-" + (MM) + "-" + yyyy;

    return currentDate;
}

function ShowCard(cardID, callerID, location) {
    ;
    $('.cards').hide();
    $('#' + cardID).show();
    $('#frame1').removeAttr('src');
    $('#frame1').attr('src', location);
    $('.configItems').css('box-shadow', '');
   
}

function showMessage(msg, notitype, iconname) {
    //notitype: info, success, warning, danger
    $.notify({
        icon: iconname,
        message: msg,
    },
    {
        type: notitype,
        timer: 2000,
        placement: {
            from: 'top',
            align: 'center'
        }
    });
}
function DateFormat(inputDate) {

    if (inputDate == null)
        return inputDate;
    var d = new Date(inputDate);
    var day = d.getDate();
    var month = d.toLocaleString('default', { month: 'short' });
    //var month = d.getMonth() + 1;
    var year = d.getFullYear();
    if (day < 10) {
        day = "0" + day;
    }
    if (month < 10) {
        month = "0" + month;
    }
    var date = day + "-" + (month) + "-" + year;
    //var date = year + "-" + month + "-" + day;

    return date;
};
function DateFormatWithMinuts(inputDate) {

    if (inputDate == null)
        return inputDate;
    var d = new Date(inputDate);
    var day = d.getDate();
    var month = d.getMonth() + 1;
    var year = d.getFullYear();
    var hours = d.getHours();
    var minuts = d.getMinutes();
    var ampm = hours >= 12 ? 'pm' : 'am';

    if (day < 10) {
        day = "0" + day;
    }
    if (month < 10) {
        month = "0" + month;
    }
    var date = year + "-" + month + "-" + day + " " + hours + ":" + minuts + " " + ampm;

    return date;
};
function numberOnly(id) {
    // Get element by id which passed as parameter within HTML element event
    var element = document.getElementById(id);
    // Use numbers only pattern, from 0 to 9
    var regex = /[^0-9]/gi;
    // This removes any other character but numbers as entered by user
    element.value = element.value.replace(regex, "");
}
function AlphaNumericOnly(id) {
    var element = document.getElementById(id);
    var regex=/[^a-z0-9,. ]/gi;
    if (element.value.match(AlphaNumericRegex)) {
    }
    else
        element.value = element.value.replace(regex, '');
}
function PositiveNumer(id) {
    var element = document.getElementById(id);
    var regex = /^[1-9]\d*$ /gi;
    if (element.value.match(RgexforPositiveNumberWithoutZero)) {
    }
    else
        element.value = element.value.replace(regex, '');
}




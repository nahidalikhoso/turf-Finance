﻿////////////////////////





////////////////////

var EmailRegex = /^\b[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b$/i;
var phoneRegex = /\b[0-9]{11}\b/;
var AlphaRegex = /^[a-zA-Z ]+$/;
var DateRegex = /^\d{4}(\-)(((0)[0-9])|((1)[0-2]))(\-)([0-2][0-9]|(3)[0-1])$/i;

var AlphaNumericRegex = /^[0-9a-zA-Z ]+$/;
var price = /^[1-9]{1}[0-9]{0,10}(?:\.[0-9]{1,2})?$/;
var AmountRegex = /^[1-9]{1}[0-9]{0,10}(?:\.[0-9]{1,2})?$/;
var RegexForInteger = /(^\d*\.?\d*[1-9]+\d*$)|(^[1-9]+\.?\d*$)/;

var RegexForPositiveIncludeZero = /(^\d*\.?\d*[0-9]+\d*$)|(^[0-9]+\.?\d*$)/;
//var UserCount = /(^\d*\.?\d*[1-9]+\d*$)|(^[1-9]+\.?\d*$)/;

function ShowCard(cardID, callerID, location) {
    debugger;
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
        message: msg
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
    var month = d.getMonth() + 1;
    var year = d.getFullYear();
    if (day < 10) {
        day = "0" + day;
    }
    if (month < 10) {
        month = "0" + month;
    }
    var date = year + "-" + month + "-" + day;

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


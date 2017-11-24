

var d = new Date();
var day = d.getDate();
var month = d.getMonth();
var year = d.getFullYear();


var myDate = new Date(year, month, day);

$('.datepicker').datepicker({
  format: 'yyyy-mm-dd',
  startDate: myDate,
});

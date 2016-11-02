$(document).ready(function() {

  var array = ["2016-11-11","2016-12-11","2016-13-11"]

  $('#datepicker').datepicker({
   beforeShowDay: function(date){
       var string = jQuery.datepicker.formatDate('yy-dd-mm', date);
       return [ array.indexOf(string) == -1 ]
   }
  });

   $('#request_booking').click(function() {
     $('#input_date').attr('value', $('#datepicker').datepicker( "getDate"));
   });
});

$(document).ready(function() {

  var array = ["2016-11-14","2016-11-15","2016-11-16"]

  $('#datepicker').datepicker({
   beforeShowDay: function(date){
       var string = jQuery.datepicker.formatDate('yy-mm-dd', date);
       return [ array.indexOf(string) == -1 ]
   }
  });

   $('#request_booking').click(function() {
     $('#input_date').attr('value', $('#datepicker').val());
   });
});

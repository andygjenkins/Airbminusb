$(document).ready(function() {

   $.getJSON('/check_booked', function(unavailability) {
    var startAvailability = unavailability.startAvailability;
    var endAvailability = unavailability.endAvailability;
    var bookedDates = unavailability.bookedDates;

    console.log(bookedDates);

    var array = ["2016-11-11","2016-12-11","2016-13-11"]

    $('#datepicker').datepicker({
      dateFormat: 'yy-mm-dd',
      minDate: startAvailability,
      maxDate: endAvailability,
      beforeShowDay: function(date){
        var string = jQuery.datepicker.formatDate('yy-mm-dd', date);
        return [ bookedDates.indexOf(string) == -1 ]
    }
    });
  });

   $('#request_booking').click(function() {
     $('#input_date').attr('value', $('#datepicker').datepicker( "getDate"));
   });
});

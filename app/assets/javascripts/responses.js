$(document).ready(function () {

  if ( $('#target_has_been_called_false').is(':checked') ) {
    $('#response-yes').hide();
    $('#response-clarify').hide();
  }


  $('#target_has_been_called_false').click(function () {
    $('#response-yes').hide('fast');
    $('#response-clarify').hide('fast');
    $('#response-clarify :radio').prop('checked', false);
    $('#response-yes :radio').prop('checked', false);
  });

  $('#target_has_been_called_true').click(function () {
    $('#response-clarify').show('fast');
    $('#response-clarify :radio').prop('checked', false);
  });

  $('#talked-to-target').click(function () {
    $('#response-yes').show('fast');
  });
  $('#did-not-talk-to-target').click(function () {
    $('#response-yes').hide('fast');
  });
});

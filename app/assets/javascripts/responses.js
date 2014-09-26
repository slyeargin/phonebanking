$(document).ready(function () {
  $('#target_has_been_called_false').click(function () {
    $('#response-yes').hide('fast');
    $('#response-clarify').hide('fast');
    $('#response-clarify :radio').prop('checked', false);
    $('#response-yes :radio').prop('checked', false);
    $('#response-no').show('fast');
  });

  $('#target_has_been_called_true').click(function () {
    $('#response-no').hide('fast');
    $('#response-no :radio').prop('checked', false);
    $('#response-clarify').show('fast');
  });
  
  $('#talked-to-target').click(function () {
    $('#response-yes').show('fast');
  });
  $('#did-not-talk-to-target').click(function () {
    $('#response-yes').hide('fast');
  });
});

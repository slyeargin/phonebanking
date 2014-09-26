$(document).ready(function () {
  $('#target_has_been_called_false').click(function () {
    $('#response').hide('fast');
    $('#response :radio').prop('checked', false);
    // $('#response :radio').attr('disabled', true);
  });
  $('#target_has_been_called_true').click(function () {
    $('#response').show('fast');
    $('#response :radio').attr('enabled', true);
  });
});

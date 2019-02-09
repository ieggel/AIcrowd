Paloma.controller('ChallengeRules', {
  show: function(){
    $('#rules-accepted-checkbox').click(function(){
      if($(this).is(':checked')){
        $('#accept-challenge-rules-button').attr('disabled', false)
      }
      else{
        $('#accept-challenge-rules-button').attr('disabled', true)
      }
    })
  }
});
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

Paloma.controller('ParticipationTerms', {
  show: function(){
    $('#terms-accepted-checkbox').click(function(){
      if($(this).is(':checked')){
        $('#accept-participation-terms-button').attr('disabled', false)
      }
      else{
        $('#accept-participation-terms-button').attr('disabled', true)
      }
    })
  }
});
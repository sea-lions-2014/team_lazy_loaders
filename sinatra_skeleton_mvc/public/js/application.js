$(document).ready(function() {
  $('#questions').on("click", function(e){
    e.preventDefault
    var new_question = new element('#quest_num','#more_qs')
    new_question.add_new('/0/surveys/new/new')
  })
  $('#more_qs').on("click", '.add_choices', function(e){
    e.preventDefault
    var new_choice = new element('#choice_num' + this.id, '#more_choices' + this.id) 
    new_choice.add_new("/0/surveys/new/" + this.id + "/new")
  })
  function element(num_id, container_id) {
    this.add_new = add_new; 
    function add_new(url) {
      $.ajax({
        url: url,
        data: {num: $(num_id).val()},
        type: "post"
      }).done(function(new_question){
        container = $(container_id)
        container.empty()
        container.append(new_question)
      })
    }
  } 

  $('#survey').on("submit", function(e){
    e.preventDefault();
    $.ajax({
      type: 'post',
      url: document.url,
      data: $(this).serialize()
    }).done(function(errors){
      if (errors == "ok") {
        $(location).attr('href', '/thankyou')
      }
      else {
        var questions = errors.split(',')
        for (var i = 0; i < errors.length; i++){
          $('#errors').empty()
          $('#errors').append("You did not answer '" + questions[i] + "'")
        }
      }
    })
  })

})

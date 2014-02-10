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
    this.num_id = num_id;
    this.container_id = container_id;
  } 

  element.prototype.add_new = function (url) {
      num = this.num_id
      contain = this.container_id
      $.ajax({
        url: url,
        data: {num: $(num).val()},
        type: "post"
      }).done(function(new_question){
        container = $(contain)
        container.empty()
        container.append(new_question)
      })
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
          $('#errors').append("You did not answer '" + questions[i] + "'<br>")
        }
      }
    })
  })

  $('.delete').on("click", function(e){
    e.preventDefault()
    url = window.location.href + "/" + $(this).attr("id")
    $.ajax({
      type: 'delete',
      url: url
    }).done(function(id){
      console.log("#survey" + id)
      $("#survey" + id).remove()
    })
  })

})

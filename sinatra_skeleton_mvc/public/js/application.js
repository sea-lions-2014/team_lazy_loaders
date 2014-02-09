$(document).ready(function() {

  $('#questions').on("click", function(e){
    e.preventDefault
    var number = document.getElementById("question_num").value

    var container = document.getElementById("more_qs")


    for (i=0; i<number;i++){
      container.appendChild(document.createTextNode("Question " + (i+1)));
      var title = document.createElement("input");
      title.type = "text";
      title.name = "question" + i;
      container.appendChild(title);

      container.appendChild(document.createTextNode('Number of Choices'));
      var choice_num = document.createElement("input");
      choice_num.type = "text";
      choice_num.id = "choice_num" + i;
      container.appendChild(choice_num);

      var add_choice = document.createElement('a');
      console.log(add_choice)
      add_choice.id = i
      add_choice.className = "add_choices";
      add_choice.href = "#";
      add_choice.innerHTML= 'add choices'
      container.appendChild(add_choice);
      var more_choices = document.createElement('div')
      more_choices.id = "more_choices" + i
      container.appendChild(more_choices)

      container.appendChild(document.createElement("br"))
    }
  })

  $('#more_qs').on("click", '.add_choices', function(e){
    e.preventDefault
    console.log("triggered")
    var question_id = "choice_num" + this.id
    console.log(question_id)
    var number = document.getElementById(question_id).value
    var container = document.getElementById("more_choices" + this.id)

    for (i=0; i<number;i++){
      container.appendChild(document.createTextNode("Choice " + (i+1)));
      var title = document.createElement("input");
      title.type = "text";
      title.name = this.id + "choice" + i;
      container.appendChild(title);

      container.appendChild(document.createElement("br"))
    }
  })
})

      // function addFields(){
      //       // Number of inputs to create
      //       var number = document.getElementById("member").value;
      //       // Container <div> where dynamic content will be placed
      //       var container = document.getElementById("container");
      //       // Clear previous contents of the container
      //       while (container.hasChildNodes()) {
      //           container.removeChild(container.lastChild);
      //       }
      //       for (i=0;i<number;i++){
      //           // Append a node with a random text
      //           container.appendChild(document.createTextNode("Question " + (i+1)));
      //           // Create an <input> element, set its type and name attributes
      //           var input = document.createElement("input");
      //           input.type = "text";
      //           input.name = "question" + i;
      //           container.appendChild(input);
      //           // Append a line break
      //           container.appendChild(document.createElement("br"));
      //       }
      //   }



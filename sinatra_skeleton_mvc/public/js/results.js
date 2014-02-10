$( document ).ready(function() {
    var questions = $.map($('.q_text'), function(v,i){ return v.innerHTML})
    var get_data = function(value_type) {
      return $.map(questions, function(q,index){
        return { question: $.map($('.choice_text' + (index + 1)), function(choice, c_index){
          return {
            value: parseInt($('.' + (c_index+1) + value_type + (index+1))[0].innerHTML) ,
            label: choice.innerHTML
          }
        })}
      })
    }
    $('body').on("click", "#visualize", function(e){
      
      var survey = get_data('choice_count')
      for (var i = 0;i < survey.length;i++){
        var w = 300,                        //width
        h = 300,                            //height
        r = 150,                            //radius
        color = d3.scale.category20c();     //colors
        data = survey[i].question
        var vis = d3.select("#pie")
          .append("svg:svg")              //creates svg element
          .data([data])                   //gets the question data
            .attr("width", w)           //sets dimensions
            .attr("height", h)
            .attr("id", "svg" + i)
          .append("svg:g")                //makes a group to hold the chart
            .attr("transform", "translate(" + r + "," + r  + ")")    //move the center of the pie chart from 0, 0 to radius, radius
        var arc = d3.svg.arc()              //creates a path
          .outerRadius(r);

        var pie = d3.layout.pie()           //creates arc data
          .value(function(d) { return d.value; });    //gets the data element

        var arcs = vis.selectAll("g.slice")     //for every slice in the groups
          .data(pie)                          //get the data
          .enter()                            //create a group for every object in the data
            .append("svg:g")                //create a group for each slice
                .attr("class", "slice");    //set a class 

        arcs.append("svg:path")
          .attr("fill", function(d, i) { return color(i); } ) //sets color
          .attr("d", arc);                                    //slice the pie

        arcs.append("svg:text")                                     //label the slice
          .attr("transform", function(d) {                    //center the label
          d.innerRadius = 0;
          d.outerRadius = r;
          return "translate(" + arc.centroid(d) + ")";        //move the pie
          })
          .attr("text-anchor", "middle")                          //center the labels again
          .text(function(d, i) { return data[i].label; }); 
          
        d3.select("#pie").insert("h1", "#svg" + i).text(questions[i])
      }
    // all of the above is for creating populating pie charts
      var bar_survey = get_data('choice_num')

      for (var i = 0;i < bar_survey.length;i++){
        var data = bar_survey[i].question
        var values = $.map(data, function(c, i){
          return c.value
        })
        var labels = $.map(data, function(c, i){
          return c.label
        })
  
        $('#bar').append("<svg id='chart" + i + "'></svg>") //creates an svg canvas

        color = d3.scale.category20c(); //creates a range of colors
        var data = values; // this is a list of numbers

        var width = 600, //set your chart width
          barHeight = 40; //set your chart height

        var x = d3.scale.linear() // this sets the scale for the chart
          .domain([0, d3.max(values)]) //set range of numbers from 0 to maximum value in dataset
          .range([0, width]); // sets the range from 0 to the chart width

        var chart = d3.select("#chart" + i) // selects the canvas you jsut created
          .attr("width", width) // sets the width to the chart width
          .attr("height", barHeight * values.length); //sets the height to 100

        var bar = chart.selectAll("g") //prepares the canvas to be populated with g tags
          .data(values) //binds the data to g tags
          .enter().append("g") // creates placeholders for all the data elements and adds a g tag to the placeholder
          .attr("transform", function(d, i) { return "translate(0," + i * barHeight + ")"; }); // moves the g tags to their correct location in the chart

        bar.append("rect") // for each bar, adds a rectangle
          .attr("fill", function(d, i) { return color(i); } ) //colors the bar 
          .attr("width", x) // sets the width using the range and domain
          .attr("height", barHeight - 1); // sets the height to the bar height, 1 is the margin

        bar.append("text") // adds a text label
          .attr("x", function(d) { return x(d) - 100; })
          .attr("y", barHeight / 2)
          .attr("dy", ".35em")
          .text(function(d, i) { return labels[i]; }); //this label is from the labels data set

        bar.append("text")
          .attr("x", 0)
          .attr("y", barHeight / 2)
          .attr("dy", ".35em")
          .text(function(d, i) { return values[i]; }) // this label is from the values data set
            
        d3.select("#bar").insert("h1", "#chart" + i).text(questions[i]) // adds labels for the chart
  }
  /////////////////////////////////////////////////////// the above section is used to create bar charts
      $('#results').hide()
      $('#visualize').remove()

  })
// functions for toggling views
  $('body').on("click","#normalize", function(e){
      e.preventDefault()
      $('#charts').hide()
      $('#results').show()
      d3.select("#results").insert("button", "h3").text("Visualize!").attr("id","revert")
  })

  $('#results').on("click","#revert", function(e){
      e.preventDefault
      $('#charts').show()
      $('#results').hide()
      $('#revert').remove()   
  })

  $('#charts').on("click", "#bar_chart", function(e){
      e.preventDefault;
      $('#pie').hide()
      $('#bar').show()
  })

  $('#charts').on("click", "#pie_chart", function(e){
      e.preventDefault;
      $('#bar').hide()
      $('#pie').show()
  })

}); //document ready

$( document ).ready(function() {
    $('#visualize').on("click", function(e){
        var questions = $.map($('.q_text'), function(v,i){ return v.innerHTML})
        var survey = $.map(questions, function(q,index){
            return { question: $.map($('.choice_text' + (index + 1)), function(choice, c_index){
                return {
                    value: parseInt($('.' + (c_index+1) + 'choice_count' + (index+1))[0].innerHTML) ,
                    label: choice.innerHTML
                }
            }), name: q }
        })
    for (var i = 0;i<survey.length;i++){
        var w = 200,                        //width
        h = 200,                            //height
        r = 100,                            //radius
        color = d3.scale.category20c();     //colors
        data = survey[i].question
        var vis = d3.select("body")
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
                d3.select("body").insert("h1", "#svg" + i).text(questions[i])
            }
    $('#results').remove()
    })    
});

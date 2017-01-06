$.ajax({
    url: "http://localhost:3000/runs.json?limit=25"
}).done(function(data){
    for(var i = 0; i < data.length; i++){
        $(".runs").append("<li class=\"list-group-item\"><p>Data for run #"+data[i].run_id+"</p></li>");
    }
});

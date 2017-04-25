/*
Set up both the datepicker tabs with this
*/
$('#from_datepicker').datepicker()
$('#to_datepicker').datepicker()

$('#dateFilterButton').on('click',function(){
    var fromDate = $('#from_datepicker')[0].value;
    var toDate = $('#to_datepicker')[0].value;
    var queryString = "";
    if(fromDate != "" && toDate != ""){
        queryString = "statistics.json/?from_date="+encodeURI(fromDate)+"&to_date="+encodeURI(toDate);
    }   
    else{
        queryString = "statistics.json"
    } 
    $.get(queryString, function(gradeData){
        constructGradesGraph(gradeData);
    })
});

$(document).ready(
    $.get("statistics.json", function(gradeData){
        constructGradesGraph(gradeData);
    })
)

function constructGradesGraph(gradeData){
    console.log(gradeData)
    var labels = generateLabels(gradeData);
    var colors = generateColors(gradeData);
    var gradeCounts = getGradeCounts(labels, gradeData);
    var ctx = document.getElementById("gradesChart");
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: labels,
            datasets: [{
                label: 'Count for each grade',
                data: gradeCounts,
                backgroundColor: colors, 
                borderColor: colors,
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero:true
                    }
                }]
            }
        }
    });
}

function getGradeCounts(labels, gradeData){
    var counts = initCountArray(labels);
    var oysters = gradeData.allOysters;
    for(var i = 0; i < oysters.length; i++){
        var grade = oysters[i].grade;
        counts[labels.indexOf(grade)]++;
    }
    console.log(counts);
    return counts;
}

function initCountArray(labels){
    counts = [];
    for(var i = 0; i < labels.length; i++){
        counts.push(0)
    }
    return counts;
}

function generateLabels(gradeData){
    let grades = gradeData.grades; 
    labels = [];
    for(var i = 0; i < grades.length; i++){
        labels.push(grades[i].Full_name)
    }
    return labels;
}

function generateColors(gradeData){
    colors = [];
    availableColors = [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ];
    for(var i = 0; i < gradeData.grades.length; i++){
        var index = Math.round(Math.random() * (availableColors.length - 1));
        var color = availableColors[index]
        colors.push(color);
    }
    return colors;
}
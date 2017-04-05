/*
Set up both the datepicker tabs with this
*/
$('#from_datepicker').datepicker()
$('#to_datepicker').datepicker()

$(document).ready(
    $.get("statistics.json", function(gradeData){
        constructGradesGraph(gradeData);
    })
);

function constructGradesGraph(gradeData){
    console.log(gradeData)
    var colors = generateColors(gradeData);
    var ctx = document.getElementById("gradesChart");
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: generateLabels(gradeData),
            datasets: [{
                label: 'Count for each grade',
                data: getGradeCount(gradeData),
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

function getGradeCount(gradeData){
    counts = [];
    for(var i = 0; i < gradeData.grades.length; i++){
        counts.push(Math.random() * 100);
    }
    return counts;
}
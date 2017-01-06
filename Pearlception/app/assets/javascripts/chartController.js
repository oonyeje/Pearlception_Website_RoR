//--AJAX CODE--//
//This code will manage the request to the server
var ajaxChart = new XMLHttpRequest();
//--CHART DATA--//
var hash = {};
backgroundColors = [
    'rgba(255, 99, 132, 0.2)',
    'rgba(54, 162, 235, 0.2)',
    'rgba(255, 206, 86, 0.2)',
    'rgba(75, 192, 192, 0.2)',
    'rgba(153, 102, 255, 0.2)',
    'rgba(255, 159, 64, 0.2)'
];
borderColors = [
    'rgba(255,99,132,1)',
    'rgba(54, 162, 235, 1)',
    'rgba(255, 206, 86, 1)',
    'rgba(75, 192, 192, 1)',
    'rgba(153, 102, 255, 1)',
    'rgba(255, 159, 64, 1)'
];

//--AJAX REQUEST--//
var params = window.location.search.replace("?","").split("&");
date = params[0].split("=")[1];
ajaxChart.onreadystatechange = function(){
    var labels = [];
    var gradeCounts = [];
    var gradePercentages = [];
    hash = JSON.parse(ajaxChart.responseText);
    var counts = hash["counts"];
    var percentages = hash["percentages"];
    for(key in counts){
        labels.push(key);
        gradeCounts.push(counts[key]);
    }
    for(percentage in percentages){
        gradePercentages.push(percentages[percentage]);
    }
    createCountChart(labels,gradeCounts,
        backgroundColors.slice(0,labels.length),borderColors.slice(0,labels.length));
    createPercentageChart(labels, gradePercentages,
        backgroundColors.slice(0,labels.length),borderColors.slice(0,labels.length));
    console.log("Label count is "+labels.length);
};
ajaxChart.open("GET","http://localhost:8000/api/getStatsForRun/?key=cole&date="+date,true);
ajaxChart.send();

//--CHART CODE--//
//This is all the code to manage the chart
function createCountChart(myLabels,grades, backgrounds,borders){
    var ctx = document.getElementById("countChart");
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: myLabels,
            datasets: [{
                label: 'Count of each grade',
                data: grades,
                backgroundColor: backgrounds,
                borderColor: borders,
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
    ctx.style.backgroundColor="rgba(198, 198, 198,.3)";
}

/*
This function will create the percentage chart
*/
function createPercentageChart(labels, percentages, backgrounds, borders){
    console.log("Creating % chart");
    var ctx = document.getElementById("percentageChart");
    var chart = new Chart(ctx,{
        type: 'pie',
        data:{
            labels: labels,
            datasets: [{
                label: 'Percentage of each grade',
                data: percentages,
                backgroundColor: backgrounds,
                borderColor:borders,
                borderWidth: 1
            }]
        },
    });
    ctx.style.backgroundColor="rgba(198, 198, 198,.3)";
}

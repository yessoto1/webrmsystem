$(function() {
    new Chart(document.getElementById("chart2"),
        {
            "type":"bar",
            "data":{"labels":["January","February","March","April","May","June","July"],
            "datasets":[{
                            "label":"My First Dataset",
                            "data":[65,59,80,81,56,55,40],
                            "fill":false,
                            "backgroundColor":["rgba(255, 99, 132, 0.2)","rgba(255, 159, 64, 0.2)","rgba(255, 205, 86, 0.2)","rgba(75, 192, 192, 0.2)","rgba(54, 162, 235, 0.2)","rgba(153, 102, 255, 0.2)","rgba(201, 203, 207, 0.2)"],
                            "borderColor":["rgb(252, 75, 108)","rgb(255, 159, 64)","rgb(255, 178, 43)","rgb(38, 198, 218)","rgb(54, 162, 235)","rgb(153, 102, 255)","rgb(201, 203, 207)"],
                            "borderWidth":1}
                        ]},
            "options":{
                "scales":{"yAxes":[{"ticks":{"beginAtZero":true}}]}
            }
        });
    
    new Chart(document.getElementById("chart3"),
        {
            "type":"pie",
            "data":{"labels":["Red","Blue","Yellow"],
            "datasets":[{
                "label":"My First Dataset",
                "data":[300,50,100],
                "backgroundColor":["rgb(252, 75, 108)","rgb(30, 136, 229)","rgb(255, 178, 43)"]}
            ]}
        });
  
});